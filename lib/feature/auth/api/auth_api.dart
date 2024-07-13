import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthApi {
  final SupabaseClient supabase = Supabase.instance.client;
  Future<User?> login(String email, String password) async {
    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        return response.user;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('❌ Error - AuthApi: login $e');
    }
    return null;
  }

  Future<User?> register(String email, String password) async {
    const maxRetries = 5;
    int retries = 0;
    int delay = 1000; // Start with a delay of 1 second

    while (retries < maxRetries) {
      try {
        final response =
            await supabase.auth.signUp(email: email, password: password);
        if (response.user != null) {
          // Successfully signed up
          print('Sign up successful');
          return response.user;
        } else {
          // Handle other errors
        }
      } catch (e) {
        if (e is AuthException && e.message == 'Email rate limit exceeded') {
          // Handle rate limit exceeded
          retries++;
          print('Rate limit exceeded, retrying in $delay ms...');
          // await Future.delayed(Duration(milliseconds: delay));
          delay *= 2; // Exponential backoff
        } else {
          // Handle other exceptions
          print('Error: ${e.toString()}');
        }
      }
    }

    print('Max retries reached, please try again later.');
    return null;
  }
}
