import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final storage = FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await storage.write(key: 'securityKey', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'securityKey');
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'securityKey');
  }
}
