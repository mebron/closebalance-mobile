import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/error/app_exception.dart';
import '../../core/theme/app_colors.dart';
import 'auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _keepSignedIn = true;
  bool _submitting = false;
  String? _formError;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _submitting = true;
      _formError = null;
    });
    try {
      await ref.read(authControllerProvider.notifier).login(
            email: _email.text.trim(),
            password: _password.text,
            keepSignedIn: _keepSignedIn,
          );
      // Navigation handled by the router redirect.
    } on AppException catch (e) {
      setState(() => _formError = e.message);
    } catch (_) {
      setState(() => _formError = 'Something went wrong. Please try again.');
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.headerGradient),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/icon-dark.webp', height: 64),
                        const SizedBox(height: 16),
                        const Text('Welcome back',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _email,
                          key: const Key('login_email'),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (v) => (v == null || !v.contains('@'))
                              ? 'Enter a valid email'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _password,
                          key: const Key('login_password'),
                          obscureText: true,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          validator: (v) =>
                              (v == null || v.isEmpty) ? 'Enter your password' : null,
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Keep me signed in'),
                          value: _keepSignedIn,
                          activeThumbColor: AppColors.green,
                          onChanged: (v) => setState(() => _keepSignedIn = v),
                        ),
                        if (_formError != null) ...[
                          const SizedBox(height: 8),
                          Text(_formError!,
                              style:
                                  const TextStyle(color: AppColors.danger)),
                        ],
                        const SizedBox(height: 16),
                        FilledButton(
                          onPressed: _submitting ? null : _submit,
                          child: _submitting
                              ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2, color: Colors.white))
                              : const Text('Sign in'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
