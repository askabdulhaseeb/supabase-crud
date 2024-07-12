import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthApi {
  final SupabaseClient supabase = Supabase.instance.client;
  Future<User?> login(String phone, String password) async {
    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
        email: phone,
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

  Future<User?> register(String phone, String password) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        phone: phone,
        password: password,
        channel: OtpChannel.sms,
      );

      if (res.user == null) {
        debugPrint('❌ Error - AuthApi: register ${res.hashCode}');
      } else {
        return res.user;
      }
    } catch (e) {
      debugPrint('❌ Error - AuthApi: register $e');
    }
    return null;
  }
}
