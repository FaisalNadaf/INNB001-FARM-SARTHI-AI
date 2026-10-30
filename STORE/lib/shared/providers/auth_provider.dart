import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/auth_repository.dart';
import '../services/auth_local_service.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());
final authLocalServiceProvider = Provider((ref) => AuthLocalService());

class AuthState {
  final bool loading;
  final bool loggedIn;
  final String? token;
  final String? error;

  const AuthState({
    this.loading = false,
    this.loggedIn = false,
    this.token,
    this.error,
  });

  AuthState copyWith({
    bool? loading,
    bool? loggedIn,
    String? token,
    String? error,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      loggedIn: loggedIn ?? this.loggedIn,
      token: token ?? this.token,
      error: error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repo;
  final AuthLocalService _local;

  AuthNotifier(this._repo, this._local) : super(const AuthState());

  Future<void> restoreSession() async {
    final token = await _local.readToken();
    if (token != null && token.isNotEmpty) {
      state = state.copyWith(loggedIn: true, token: token);
    }
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(loading: true, error: null);
    try {
      final token = await _repo.login(email: email, password: password);
      await _local.saveToken(token);
      state = state.copyWith(loading: false, loggedIn: true, token: token);
      return true;
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    await _local.clear();
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.read(authRepositoryProvider),
    ref.read(authLocalServiceProvider),
  );
});
