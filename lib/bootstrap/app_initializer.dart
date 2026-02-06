import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppInitializer {
  static Future<void> init() async {
    await Future.wait([_initStorage(), _initApi()]);
    await dotenv.load(fileName: '.env');
  }

  static Future<void> _initStorage() async {
    // Shared / Secure storage
  }

  static Future<void> _initApi() async {
    // Base url, interceptor, token
  }
}
