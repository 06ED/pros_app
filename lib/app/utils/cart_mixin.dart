import 'dart:convert';

import 'package:nylo_framework/nylo_framework.dart';

import '../../config/storage_keys.dart';

mixin CartMixin {
  Future<Map<String, dynamic>> get cart async =>
      jsonDecode((await NyStorage.read(StorageKey.cart)) ?? "{}");
}
