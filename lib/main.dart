import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'feature/auth/phone_auth_screen.dart';
import 'feature/setup_state/setup_state_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  final String url = dotenv.env['SUPABASE_URL']!;
  final String anonKey = dotenv.env['SUPABASE_ANON_KEY']!;
  await Supabase.initialize(
    url: url,
    anonKey: anonKey,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final User? user = Supabase.instance.client.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: user == null ? const PhoneAuthScreen() : const SetupStateScreen(),
      routes: <String, WidgetBuilder>{
        PhoneAuthScreen.routeName: (_) => const PhoneAuthScreen(),
        SetupStateScreen.routeName: (_) => const SetupStateScreen(),
      },
    );
  }
}
