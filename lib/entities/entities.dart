import 'package:json_annotation/json_annotation.dart';

part 'entities.g.dart';

@JsonSerializable()
class DetectIntentResponse {
  final String responseId;
  final QueryResult queryResult;

  DetectIntentResponse({
    required this.responseId,
    required this.queryResult,
  });

  factory DetectIntentResponse.fromJson(Map<String, dynamic> json) => _$DetectIntentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DetectIntentResponseToJson(this);
}

@JsonSerializable()
class QueryResult {
  final String text;
  final String languageCode;
  final List<ResponseMessage> responseMessages;
  final CurrentPage currentPage;
  final CurrentPage? intent;
  final double intentDetectionConfidence;
  final Match match;

  QueryResult({
    required this.text,
    required this.languageCode,
    required this.responseMessages,
    required this.currentPage,
    this.intent,
    required this.intentDetectionConfidence,
    required this.match,
  });

  factory QueryResult.fromJson(Map<String, dynamic> json) => _$QueryResultFromJson(json);
  Map<String, dynamic> toJson() => _$QueryResultToJson(this);
}

@JsonSerializable()
class CurrentPage {
  final String name;
  final String displayName;

  CurrentPage({
    required this.name,
    required this.displayName,
  });

  factory CurrentPage.fromJson(Map<String, dynamic> json) => _$CurrentPageFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentPageToJson(this);
}

@JsonSerializable()
class Match {
  final CurrentPage? intent;
  final String? resolvedInput;
  final String? matchType;
  final double? confidence;

  Match({
    this.intent,
    this.resolvedInput,
    this.matchType,
    this.confidence,
  });

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
  Map<String, dynamic> toJson() => _$MatchToJson(this);
}

@JsonSerializable()
class ResponseMessage {
  final Text? text;

  ResponseMessage({
    this.text,
  });

  factory ResponseMessage.fromJson(Map<String, dynamic> json) => _$ResponseMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseMessageToJson(this);
}

@JsonSerializable()
class Text {
  final List<String> text;

  Text({
    required this.text,
  });

  factory Text.fromJson(Map<String, dynamic> json) => _$TextFromJson(json);
  Map<String, dynamic> toJson() => _$TextToJson(this);
}

@JsonSerializable()
class QueryInput {
  final QueryInputClass queryInput;
  final QueryParams? queryParams;

  QueryInput({
    required this.queryInput,
    this.queryParams,
  });

  factory QueryInput.fromJson(Map<String, dynamic> json) => _$QueryInputFromJson(json);
  Map<String, dynamic> toJson() => _$QueryInputToJson(this);
}

@JsonSerializable()
class QueryInputClass {
  final InputText text;
  final String languageCode;

  QueryInputClass({
    required this.text,
    this.languageCode = 'en',
  });

  factory QueryInputClass.fromJson(Map<String, dynamic> json) => _$QueryInputClassFromJson(json);
  Map<String, dynamic> toJson() => _$QueryInputClassToJson(this);
}

@JsonSerializable()
class QueryParams {
  final String timeZone;

  QueryParams({
    required this.timeZone,
  });

  factory QueryParams.fromJson(Map<String, dynamic> json) => _$QueryParamsFromJson(json);
  Map<String, dynamic> toJson() => _$QueryParamsToJson(this);
}

@JsonSerializable()
class InputText {
  final String text;

  InputText({
    required this.text,
  });

  factory InputText.fromJson(Map<String, dynamic> json) => _$InputTextFromJson(json);
  Map<String, dynamic> toJson() => _$InputTextToJson(this);
}
