import '/app/controllers/account_controller.dart';
import '/app/controllers/appeal_controller.dart';
import '/app/controllers/auth_controller.dart';
import '/app/controllers/menu_controller.dart';
import '/app/controllers/order_controller.dart';
import '/app/networking/appeal_api_service.dart';
import '/app/networking/menu_api_service.dart';
import '/app/networking/orders_api_service.dart';

import '/app/controllers/home_controller.dart';
import '/app/models/user.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Model Decoders
| -------------------------------------------------------------------------
| Model decoders are used in 'app/networking/' for morphing json payloads
| into Models.
|
| Learn more https://nylo.dev/docs/5.x/decoders#model-decoders
|--------------------------------------------------------------------------
*/

final Map<Type, dynamic> modelDecoders = {
  List<User>: (data) => List.from(data).map((json) => User.fromJson(json)).toList(),
  //
  User: (data) => User.fromJson(data),

  // User: (data) => User.fromJson(data),
};

/*
|--------------------------------------------------------------------------
| API Decoders
| -------------------------------------------------------------------------
| API decoders are used when you need to access an API service using the
| 'api' helper. E.g. api<MyApiService>((request) => request.fetchData());
|
| Learn more https://nylo.dev/docs/5.x/decoders#api-decoders
|--------------------------------------------------------------------------
*/

final Map<Type, NyApiService> apiDecoders = {
  MenuApiService: MenuApiService(),
  AppealApiService: AppealApiService(),
  OrdersApiService: OrdersApiService(),
};


/*
|--------------------------------------------------------------------------
| Controller Decoders
| -------------------------------------------------------------------------
| Controller are used in pages.
| E.g. NyPage<MyController>
|
| Learn more https://nylo.dev/docs/5.x/controllers#using-controllers-with-ny-page
|--------------------------------------------------------------------------
*/
final Map<Type, BaseController Function()> controllers = {
  HomeController: () => HomeController(),
  AppealController: () => AppealController(),
  MenuController: () => MenuController(),
  OrderController: () => OrderController(),
  AccountController: () => AccountController(),
  AuthController: () => AuthController(),
};

