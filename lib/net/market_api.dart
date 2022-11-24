import 'package:flutter/foundation.dart';

import 'api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'https://vpioneer.infragrid.v.network/';
    // interceptors.add(PgyerApiInterceptor());
  }
}

/// App相关 API
class PgyerApiInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters['_api_key'] = '00f25cece8e201753872c268b5832df9';
    options.queryParameters['appKey'] = '0f7026d9c95933c7d0553628605b6ea4';
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final ResponseData respData =
        ResponseData.fromJson(response.data as Map<String, dynamic>);
    if (respData.success) {
      response.data = respData.data;
      return handler.resolve(response);
    } else {
      throw NotSuccessException.fromRespData(respData);
    }
  }
}

class ResponseData extends BaseResponseData {
  ResponseData.fromJson(Map<String, dynamic> json) : super.fromJson(json);
  @override
  bool get success => code == 0;

}
