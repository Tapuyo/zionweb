import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetProductCountCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getProductCount',
      apiUrl:
          'https://isxrwikfznijgmlgvtws.supabase.co/rest/v1/rpc/get_product_count',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzeHJ3aWtmem5pamdtbGd2dHdzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM0MTQzMzksImV4cCI6MjA1ODk5MDMzOX0.s7f5LHiYzQofSLH8zgSM4Lz6OSY8p4QAA2TVs0eGUmY',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetWarehouseCountCall {
  static Future<ApiCallResponse> call({
    int? orderId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getWarehouseCount',
      apiUrl:
          'https://isxrwikfznijgmlgvtws.supabase.co/rest/v1/rpc/get_warehouse_count',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzeHJ3aWtmem5pamdtbGd2dHdzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM0MTQzMzksImV4cCI6MjA1ODk5MDMzOX0.s7f5LHiYzQofSLH8zgSM4Lz6OSY8p4QAA2TVs0eGUmY',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOrderSubtotalCall {
  static Future<ApiCallResponse> call({
    int? orderId,
  }) async {
    final ffApiRequestBody = '''
{
  "p_order_id": ${orderId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderSubtotal',
      apiUrl:
          'https://isxrwikfznijgmlgvtws.supabase.co/rest/v1/rpc/get_order_subtotal',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzeHJ3aWtmem5pamdtbGd2dHdzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM0MTQzMzksImV4cCI6MjA1ODk5MDMzOX0.s7f5LHiYzQofSLH8zgSM4Lz6OSY8p4QAA2TVs0eGUmY',
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
    );
  }

  static int? subtotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].subtotal''',
      ));
  static int? orderId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].order_id''',
      ));
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
