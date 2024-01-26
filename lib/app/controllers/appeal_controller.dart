import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/controller.dart';
import 'package:flutter_app/app/models/appeal.dart';
import 'package:flutter_app/app/networking/appeal_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AppealController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<List<Appeal>?> getAppeals() async =>
      await api<AppealApiService>((request) => request.fetchMenu());
}
