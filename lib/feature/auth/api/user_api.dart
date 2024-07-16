import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/user_model.dart';

class UserApi {
  Future<UserEntity?> getUser(String id) async {
    final SupabaseClient supabase = Supabase.instance.client;
    final List<Map<String, dynamic>> resp =
        await supabase.from('users').select().eq('uid', id).limit(1);
    if (resp.isNotEmpty) {
      return UserModel.fromJson(resp.first);
    } else {
      debugPrint('❌ Error - UserApi: getUser');
    }
    return null;
  }

  Future<bool> updateUser(UserModel user) async {
    final SupabaseClient supabase = Supabase.instance.client;
    try {
      await supabase.from('users').update(user.toJson()).eq('uid', user.uid);
      return true;
    } catch (e) {
      debugPrint('❌ Error - UserApi: updateUser $e');
      return false;
    }
  }

  Future<bool> createUser(UserModel user) async {
    // Call API
    final SupabaseClient supabase = Supabase.instance.client;
    try {
      await supabase.from('users').insert(user.toJson());
      return true;
    } catch (e) {
      debugPrint('❌ Error - UserApi: createUser $e');
      return false;
    }
  }
}
