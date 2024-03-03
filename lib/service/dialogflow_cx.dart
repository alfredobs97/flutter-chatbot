import 'dart:convert';
import 'package:flutter_chatbot/entities/entities.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';

class DialogFlowCx {
  late String _projectId;
  late String _sessionId;
  late String _bearerToken;
  final String _baseUrl = 'https://dialogflow.googleapis.com/v3';
  final String _locationId = 'global';
  final String _agentId = '71082b0b-fb39-4616-b9ad-2731a99fcdb8';

  DialogFlowCx();

  Future<DialogFlowCx> init() async {
    final jsonFile = await rootBundle.loadString('assets/credentials.json');
    final serviceAccountKeyJson = jsonDecode(jsonFile);

    final credentials = ServiceAccountCredentials.fromJson(serviceAccountKeyJson);
    final response = await Future.wait([
      PlatformDeviceId.getDeviceId,
      _getBearerToken(credentials),
    ]);

    _projectId = serviceAccountKeyJson['project_id'];
    _sessionId = response[0] ?? 'randomId';
    _bearerToken = response[1]!;

    return this;
  }

  Future<DetectIntentResponse> detectIntent(String userInput) async {
    final url = Uri.parse(
      '$_baseUrl/projects/$_projectId/locations/$_locationId/agents/$_agentId/sessions/$_sessionId:detectIntent',
    );
    final body = QueryInput(
      queryInput: QueryInputClass(
        text: InputText(text: userInput),
      ),
    );
    final response = await http.post(
      url,
      headers: _getAuthHeaders(),
      body: jsonEncode(body.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to detect intent: ${response.body}');
    }

    return DetectIntentResponse.fromJson(jsonDecode(response.body));
  }

  Map<String, String> _getAuthHeaders() {
    return {
      'Authorization': _bearerToken,
      'x-goog-user-project': _projectId,
      'Content-Type': 'application/json; charset=utf-8',
    };
  }

  Future<String> _getBearerToken(ServiceAccountCredentials credentials) async {
    final accessToken = await obtainAccessCredentialsViaServiceAccount(
      credentials,
      ['https://www.googleapis.com/auth/dialogflow'],
      http.Client(),
    );

    return 'Bearer ${accessToken.accessToken.data}';
  }
}
