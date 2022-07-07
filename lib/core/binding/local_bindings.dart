import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageBindings {
  final storage = const FlutterSecureStorage();

  Future<void> writeValue({required String key, dynamic value}) {
    return storage.write(key: key, value: value);
  }

  void deleteValue(String key) async {
    storage.delete(key: key);
  }

  Future<String> readValue(String key) async {
    String? value = await storage.read(key: key);
    return value ?? "";
  }

  void deleteAll() async {
    storage.deleteAll();
  }

  Future readAll() async {
    Map<String, String> value = await storage.readAll();
    return value;
  }
}

class LocalStorage {
  //singleton instance
  static LocalStorage sharedInstance = LocalStorage._internal();

  factory LocalStorage() {
    return sharedInstance;
  }

  LocalStorageBindings localStorageBindings = LocalStorageBindings();

  LocalStorage._internal();

  void writeValue({required String key, dynamic value}) {
    localStorageBindings.writeValue(key: key, value: value);
  }

  void deleteValue(String key) async {
    localStorageBindings.deleteValue(key);
  }

  Future<String> readValue(String key) async {
    return await localStorageBindings.readValue(key);
  }

  void deleteAll() async {
    localStorageBindings.deleteAll();
  }

  Future readAll() async {
    return await localStorageBindings.readAll();
  }
}
