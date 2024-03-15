import 'dart:developer';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../../../bootstrap/helpers.dart';
import '../../../../config/storage_keys.dart';

class BearerAuthInterceptor extends Interceptor {
  @override
  void onError(DioException dioException, ErrorInterceptorHandler handler) {
    handler.next(dioException);
  }
}
