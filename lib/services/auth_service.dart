import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<void> signUp(String email, String password, String name) async {
    await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );
  }

  Future<void> login(String email, String password) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  User? getCurrentUser() {
    return supabase.auth.currentUser;
  }
}
