import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_textformfield.dart';
import 'api/auth_api.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Auth Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              controller: phoneController,
              hint: 'Phone',
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: passwordController,
              hint: 'Password',
            ),
            const SizedBox(height: 32),
            CustomElevatedButton(
              title: 'Done',
              isLoading: false,
              onTap: () async {
                // Add the code to login or register with phone and password here
                final User? user = await AuthApi().register(
                  phoneController.text.trim(),
                  passwordController.text.trim(),
                );

                if (user != null) {
                  debugPrint('✅ User: ${user.email}');
                } else {
                  debugPrint('❌ Error: User is null');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
