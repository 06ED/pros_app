import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pros_app/config/storage_keys.dart';
import '../controllers/controller.dart';
import '/app/models/appeal.dart';
import '/app/networking/appeal_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppealController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<List<Appeal>?> getAppeals() async =>
      await api<AppealApiService>((request) => request.fetchAppeals());

  Future<void> createAppeal(String body) async {
    return await api<AppealApiService>((request) => request.createAppeal(body));
  }
}
