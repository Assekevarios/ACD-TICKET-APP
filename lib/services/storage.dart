import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class StorageService {
  Future<String?> read(String key, String value) async {
    return await storage.read(key: value);
  }

  Future<bool?> delete(String key) async {
    await storage.delete(key: key);
    return true;
  }

  Future<bool?> deleteAll() async {
    await storage.deleteAll();
    return true;
  }

  Future<bool?> write(String key, String value) async {
    await storage.write(key: key, value: value);
    return true;
  }
}
