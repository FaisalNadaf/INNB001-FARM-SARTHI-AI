import 'package:dio/dio.dart';

import '../../core/network/dio_client.dart';

class AuthRepository {
  final Dio _dio = DioClient.instance;

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });
      return res.data['access_token']?.toString() ?? 'demo-token';
    } catch (_) {
      return 'demo-token';
    }
  }
}
