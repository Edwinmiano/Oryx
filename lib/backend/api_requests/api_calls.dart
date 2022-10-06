import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RandomwordCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'randomword',
      apiUrl: 'https://api.api-ninjas.com/v1/randomword',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'PUbgTVKimi+Yggdt2fX/xg==mLfTuUPTLoVZq6qk',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic word(dynamic response) => getJsonField(
        response,
        r'''$.word''',
      );
}

class FactsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'facts',
      apiUrl: 'https://api.api-ninjas.com/v1/facts?limit=1',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'PUbgTVKimi+Yggdt2fX/xg==mLfTuUPTLoVZq6qk',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic fact(dynamic response) => getJsonField(
        response,
        r'''$[:].fact''',
      );
}

class RiddlesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Riddles',
      apiUrl: 'https://api.api-ninjas.com/v1/riddles',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'PUbgTVKimi+Yggdt2fX/xg==mLfTuUPTLoVZq6qk',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$[:].title''',
      );
  static dynamic question(dynamic response) => getJsonField(
        response,
        r'''$[:].question''',
      );
  static dynamic answer(dynamic response) => getJsonField(
        response,
        r'''$[:].answer''',
      );
}

class PasswordgeneratorCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'passwordgenerator',
      apiUrl: 'https://api.api-ninjas.com/v1/passwordgenerator?',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'PUbgTVKimi+Yggdt2fX/xg==mLfTuUPTLoVZq6qk',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic randompassword(dynamic response) => getJsonField(
        response,
        r'''$.random_password''',
      );
}

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
