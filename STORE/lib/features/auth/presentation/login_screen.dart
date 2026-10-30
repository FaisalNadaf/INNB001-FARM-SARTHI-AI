import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/validators.dart';
import '../../../routes/app_router.dart';
import '../../../shared/providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController(text: 'owner@farm.com');
  final _password = TextEditingController(text: '123456');

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final ok = await ref.read(authProvider.notifier).login(_email.text.trim(), _password.text.trim());
    if (!mounted) return;
    if (ok) context.go(AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 720,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.agriculture, size: 64),
                          SizedBox(height: 16),
                          Text(
                            'Digital commerce and service dashboard for verified agri stores',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Store Login', style: Theme.of(context).textTheme.headlineMedium),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _email,
                            validator: Validators.email,
                            decoration: const InputDecoration(labelText: 'Email'),
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            controller: _password,
                            obscureText: true,
                            validator: (v) => Validators.requiredField(v, field: 'Password'),
                            decoration: const InputDecoration(labelText: 'Password'),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: auth.loading ? null : _submit,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                child: Text(auth.loading ? 'Signing in...' : 'Login'),
                              ),
                            ),
                          ),
                          if (auth.error != null) ...[
                            const SizedBox(height: 12),
                            Text(auth.error!, style: const TextStyle(color: Colors.red)),
                          ]
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
