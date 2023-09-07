import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TokenCall {
  static Future<ApiCallResponse> call({
    int? amount,
    String? orderId = '',
    String? description = '',
    String? pan = '',
    String? holder = '',
    String? cvc = '',
    String? month = '',
    String? year = '',
    String? phone = '',
    String? panTo = '',
    String? holderTo = '',
    String? phoneTo = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'token',
      apiUrl: 'https://yetxxcard.pythonanywhere.com/make_encoded_api_call',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'Application/json',
      },
      params: {
        'amount': amount,
        'order_id': orderId,
        'description': description,
        'pan': pan,
        'holder': holder,
        'cvc': cvc,
        'month': month,
        'year': year,
        'phone': phone,
        'pan_to': panTo,
        'holder_to': holderTo,
        'phone_to': phoneTo,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic api(dynamic response) => getJsonField(
        response,
        r'''$.auth''',
      );
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static dynamic sign(dynamic response) => getJsonField(
        response,
        r'''$.sign''',
      );
  static dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
