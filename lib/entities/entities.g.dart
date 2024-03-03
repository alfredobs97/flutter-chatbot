// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectIntentResponse _$DetectIntentResponseFromJson(
        Map<String, dynamic> json) =>
    DetectIntentResponse(
      responseId: json['responseId'] as String,
      queryResult:
          QueryResult.fromJson(json['queryResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetectIntentResponseToJson(
        DetectIntentResponse instance) =>
    <String, dynamic>{
      'responseId': instance.responseId,
      'queryResult': instance.queryResult,
    };

QueryResult _$QueryResultFromJson(Map<String, dynamic> json) => QueryResult(
      text: json['text'] as String,
      languageCode: json['languageCode'] as String,
      responseMessages: (json['responseMessages'] as List<dynamic>)
          .map((e) => ResponseMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage:
          CurrentPage.fromJson(json['currentPage'] as Map<String, dynamic>),
      intent: json['intent'] == null
          ? null
          : CurrentPage.fromJson(json['intent'] as Map<String, dynamic>),
      intentDetectionConfidence:
          (json['intentDetectionConfidence'] as num).toDouble(),
      match: Match.fromJson(json['match'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QueryResultToJson(QueryResult instance) =>
    <String, dynamic>{
      'text': instance.text,
      'languageCode': instance.languageCode,
      'responseMessages': instance.responseMessages,
      'currentPage': instance.currentPage,
      'intent': instance.intent,
      'intentDetectionConfidence': instance.intentDetectionConfidence,
      'match': instance.match,
    };

CurrentPage _$CurrentPageFromJson(Map<String, dynamic> json) => CurrentPage(
      name: json['name'] as String,
      displayName: json['displayName'] as String,
    );

Map<String, dynamic> _$CurrentPageToJson(CurrentPage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
    };

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
      intent: json['intent'] == null
          ? null
          : CurrentPage.fromJson(json['intent'] as Map<String, dynamic>),
      resolvedInput: json['resolvedInput'] as String?,
      matchType: json['matchType'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'intent': instance.intent,
      'resolvedInput': instance.resolvedInput,
      'matchType': instance.matchType,
      'confidence': instance.confidence,
    };

ResponseMessage _$ResponseMessageFromJson(Map<String, dynamic> json) =>
    ResponseMessage(
      text: json['text'] == null
          ? null
          : Text.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseMessageToJson(ResponseMessage instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

Text _$TextFromJson(Map<String, dynamic> json) => Text(
      text: (json['text'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TextToJson(Text instance) => <String, dynamic>{
      'text': instance.text,
    };

QueryInput _$QueryInputFromJson(Map<String, dynamic> json) => QueryInput(
      queryInput:
          QueryInputClass.fromJson(json['queryInput'] as Map<String, dynamic>),
      queryParams: json['queryParams'] == null
          ? null
          : QueryParams.fromJson(json['queryParams'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QueryInputToJson(QueryInput instance) =>
    <String, dynamic>{
      'queryInput': instance.queryInput,
      'queryParams': instance.queryParams,
    };

QueryInputClass _$QueryInputClassFromJson(Map<String, dynamic> json) =>
    QueryInputClass(
      text: InputText.fromJson(json['text'] as Map<String, dynamic>),
      languageCode: json['languageCode'] as String,
    );

Map<String, dynamic> _$QueryInputClassToJson(QueryInputClass instance) =>
    <String, dynamic>{
      'text': instance.text,
      'languageCode': instance.languageCode,
    };

QueryParams _$QueryParamsFromJson(Map<String, dynamic> json) => QueryParams(
      timeZone: json['timeZone'] as String,
    );

Map<String, dynamic> _$QueryParamsToJson(QueryParams instance) =>
    <String, dynamic>{
      'timeZone': instance.timeZone,
    };

InputText _$InputTextFromJson(Map<String, dynamic> json) => InputText(
      text: json['text'] as String,
    );

Map<String, dynamic> _$InputTextToJson(InputText instance) => <String, dynamic>{
      'text': instance.text,
    };
