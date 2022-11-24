import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

import '../utils/platform_utils.dart';

export 'package:dio/dio.dart';

// 必须是顶层函数
dynamic _parseAndDecode(String response) {
  return jsonDecode(response);
}

Future parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    /// 初始化 加入app通用处理
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors.add(HeaderInterceptor());
    init();
  }

  void init();
}

/// 添加常用Header
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options,RequestInterceptorHandler handler) async {
    options.connectTimeout = 1000 * 45;
    options.receiveTimeout = 1000 * 45;
    options.connectTimeout = 5000;

    final appVersion = await PlatformUtils.getAppVersion();
    final version = {}
      ..addAll({
        'appVerison': appVersion,
      });
    options.headers['version'] = version;
    options.headers['platform'] = Platform.operatingSystem;
    handler.next(options);
  }
}

/// 子类需要重写
abstract class BaseResponseData {

  BaseResponseData({required this.code, this.message, this.data});

  BaseResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'] as int;
    message = json['message'] as String?;
    data = json['data'];
  }
  int code = 0;
  String? message;
  dynamic data;

  bool get success;

  @override
  String toString() {
    return 'BaseRespData{code: $code, message: $message, data: $data}';
  }
}


/// 接口的code没有返回为true的异常
class NotSuccessException implements Exception {

  NotSuccessException.fromRespData(BaseResponseData respData) {
    message = respData.message;
  }
  String? message;

  @override
  String toString() {
    return 'NotExpectedException{respData: $message}';
  }
}

/// 用于未登录等权限不够,需要跳转授权页面
class UnAuthorizedException implements Exception {
  const UnAuthorizedException();

  @override
  String toString() => 'UnAuthorizedException';
}

