import 'package:pros_app/app/controllers/cart_controller.dart';
import 'package:pros_app/app/models/appeal.dart';
import 'package:pros_app/app/models/dish.dart';
import 'package:pros_app/app/models/menu.dart';
import 'package:pros_app/app/networking/api_service.dart';
import 'package:pros_app/app/networking/dishes_api_service.dart';
import 'package:pros_app/app/networking/menu_api_service.dart';

import '/app/models/order.dart';
import '/app/models/category.dart';
import '/app/controllers/account_controller.dart';
import '/app/controllers/appeal_controller.dart';
import '/app/controllers/auth_controller.dart';
import '/app/controllers/menu_controller.dart';
import '/app/controllers/order_controller.dart';
import '/app/networking/appeal_api_service.dart';
import '/app/networking/categories_api_service.dart';
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
  // Model decoders
  User: (data) => User.fromJson(data),
  Appeal: (data) => Appeal.fromJson(data),
  Menu: (data) => Menu.fromJson(data),
  Dish: (data) => Dish.fromJson(data),

  // Model list decoders
  List<User>: (data) => List.from(data).map((json) => User.fromJson(json)).toList(),
  List<Appeal>: (data) => List.from(data).map((json) => Appeal.fromJson(json)).toList(),
  List<Category>: (data) => List.from(data).map((json) => Category.fromJson(json)).toList(),
  List<Order>: (data) => List.from(data).map((json) => Order.fromJson(json)).toList(),
  List<Dish>: (data) => List.from(data).map((json) => Dish.fromJson(json)).toList(),

  // Other decoders
  Null: (data) => null,
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
  CategoryApiService: CategoryApiService(),
  AppealApiService: AppealApiService(),
  OrdersApiService: OrdersApiService(),
  DishesApiService: DishesApiService(),
  MenuApiService: MenuApiService(),
  ApiService: ApiService(),
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
  CartController: () => CartController(),
};

