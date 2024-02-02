import 'dart:developer';

import 'package:nylo_framework/nylo_framework.dart';

class BearerAuthInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(response.data.toString());
    handler.next(response);
  }

  @override
  void onError(DioException dioException, ErrorInterceptorHandler handler) {
    handler.next(dioException);
    log(dioException.response!.requestOptions.method);
    log(dioException.message!.toString());
    log(dioException.response!.realUri.toString());
  }
}
