import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/app_validator.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_textformfield.dart';
import '../../core/widgets/password_textformfield.dart';
import 'api/auth_api.dart';
import 'api/user_api.dart';
import 'models/user_model.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});
  static const String routeName = '/phone-auth';

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Auth'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              controller: name,
              labelText: 'Name',
              hint: 'John Doe',
            ),
            CustomTextFormField(
              controller: email,
              labelText: 'Email',
              hint: 'username@mail.com',
              validator: (String? value) => AppValidator.email(value),
            ),
            PasswordTextFormField(
              controller: password,
              labelText: 'Password',
            ),
            const SizedBox(height: 32),
            CustomElevatedButton(
              title: 'Done',
              isLoading: isLoading,
              onTap: () async {
                // Add the code to login or register with email and password here
                final User? user = await AuthApi().register(
                  email.text.trim(),
                  password.text.trim(),
                );
                if (user != null) {
                  debugPrint('✅ User: ${user.email}');
                } else {
                  debugPrint('❌ Error: User is null');
                  return;
                }
                final UserModel userModel = UserModel(
                  uid: user.id,
                  name: name.text.trim(),
                  email: email.text.trim(),
                );
                final bool isCreated = await UserApi().createUser(userModel);
                if (isCreated) {
                  debugPrint('✅ User created: ${userModel.email}');
                } else {
                  debugPrint('❌ Error: User not created');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
