import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start My Community API Group Code

class MyCommunityAPIGroup {
  static String getBaseUrl() => 'https://api.mycommunity.dscoding.com.br';
  static Map<String, String> headers = {};
  static TopicsCall topicsCall = TopicsCall();
  static SignInCall signInCall = SignInCall();
  static SignUpCall signUpCall = SignUpCall();
  static TopicsMyCall topicsMyCall = TopicsMyCall();
  static TopicCreateCall topicCreateCall = TopicCreateCall();
  static MessageSendCall messageSendCall = MessageSendCall();
  static MessagesCall messagesCall = MessagesCall();
  static ProfileCall profileCall = ProfileCall();
  static TopicUpdateCall topicUpdateCall = TopicUpdateCall();
  static TopicClearCall topicClearCall = TopicClearCall();
  static MessageDeleteCall messageDeleteCall = MessageDeleteCall();
  static TopicUsersCall topicUsersCall = TopicUsersCall();
  static TopicUnsubscribeCall topicUnsubscribeCall = TopicUnsubscribeCall();
  static TopicSubscribeCall topicSubscribeCall = TopicSubscribeCall();
  static TopicDeleteCall topicDeleteCall = TopicDeleteCall();
  static TopicsAuthCall topicsAuthCall = TopicsAuthCall();

  static final interceptors = [
    AuthInterceptor(),
  ];
}

class TopicsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'Topics',
        apiUrl: '${baseUrl}/topics',
        callType: ApiCallType.GET,
        headers: {},
        params: {},
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class SignInCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'SignIn',
        apiUrl: '${baseUrl}/signin',
        callType: ApiCallType.POST,
        headers: {},
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class SignUpCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? name = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name":"${name}",
  "email": "${email}",
  "password": "${password}"
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'SignUp',
        apiUrl: '${baseUrl}/signup',
        callType: ApiCallType.POST,
        headers: {},
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class TopicsMyCall {
  Future<ApiCallResponse> call({
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TopicsMy',
        apiUrl: '${baseUrl}/topics/my',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {},
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class TopicCreateCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "description": "${description}"
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TopicCreate',
        apiUrl: '${baseUrl}/topic',
        callType: ApiCallType.POST,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class MessageSendCall {
  Future<ApiCallResponse> call({
    int? topicId,
    String? content = '',
    int? toSpecificUser,
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "topicId": ${topicId},
  "content": "${content}",
  "toSpecificUser": ${toSpecificUser}
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'MessageSend',
        apiUrl: '${baseUrl}/message',
        callType: ApiCallType.POST,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class MessagesCall {
  Future<ApiCallResponse> call({
    int? topicId,
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'Messages',
        apiUrl: '${baseUrl}/messages',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {
          'topicId': topicId,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class ProfileCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? name = '',
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}",
  "name": "${name}"
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'Profile',
        apiUrl: '${baseUrl}/profile',
        callType: ApiCallType.PUT,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class TopicUpdateCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? topicId = '',
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "description": "${description}",
  "topicId": "${topicId}"
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TopicUpdate',
        apiUrl: '${baseUrl}/topic',
        callType: ApiCallType.PATCH,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class TopicClearCall {
  Future<ApiCallResponse> call({
    String? auth = '',
    int? topicId,
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "topicId": ${topicId}
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TopicClear',
        apiUrl: '${baseUrl}/topic/clear',
        callType: ApiCallType.POST,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class MessageDeleteCall {
  Future<ApiCallResponse> call({
    int? messageId,
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'MessageDelete',
        apiUrl: '${baseUrl}/message',
        callType: ApiCallType.DELETE,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {
          'messageId': messageId,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class TopicUsersCall {
  Future<ApiCallResponse> call({
    int? topicId,
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TopicUsers',
        apiUrl: '${baseUrl}/topic/users',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {
          'topicId': topicId,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class TopicUnsubscribeCall {
  Future<ApiCallResponse> call({
    int? topicId,
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TopicUnsubscribe',
        apiUrl: '${baseUrl}/topic/unsubscribe',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {
          'topicId': topicId,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class TopicSubscribeCall {
  Future<ApiCallResponse> call({
    int? topicId,
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TopicSubscribe',
        apiUrl: '${baseUrl}/topic/subscribe',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {
          'topicId': topicId,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class TopicDeleteCall {
  Future<ApiCallResponse> call({
    int? topicId,
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TopicDelete',
        apiUrl: '${baseUrl}/topic',
        callType: ApiCallType.DELETE,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {
          'topicId': topicId,
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

class TopicsAuthCall {
  Future<ApiCallResponse> call({
    String? auth = '',
  }) async {
    final baseUrl = MyCommunityAPIGroup.getBaseUrl();

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'TopicsAuth',
        apiUrl: '${baseUrl}/topics/auth',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${auth}',
        },
        params: {},
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      MyCommunityAPIGroup.interceptors,
    );
  }
}

/// End My Community API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
