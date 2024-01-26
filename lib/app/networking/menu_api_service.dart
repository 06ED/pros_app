import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/dish.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../config/decoders.dart';

class MenuApiService extends NyApiService {
  MenuApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => "${getEnv('API_BASE_URL')}/menu";

  Future<List<Dish>?> fetchMenu() async =>
      await network<List<Dish>>(request: (request) => request.get(""));
}
