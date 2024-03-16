import 'package:nylo_framework/nylo_framework.dart';

class BearerAuthInterceptor extends Interceptor {
  @override
  void onError(DioException dioException, ErrorInterceptorHandler handler) {
    handler.next(dioException);
  }
}
