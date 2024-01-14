import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = new FlutterSecureStorage();

  writeSecureData(String key, String value) async {
    try {
      await storage.write(key: key, value: value);
    } catch (e) {
      print(e);
    }
  }

  readSecureData(String key) async {
    try {
      String value = await storage.read(key: key) ?? 'No data found!';
      print('Data read: $value');
      return;
    } catch (e) {
      print(e);
    }
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }
}
