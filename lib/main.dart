import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'feature/auth/phone_auth_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  final String url = dotenv.env['SUPABASE_URL']!;
  final String anonKey = dotenv.env['SUPABASE_ANON_KEY']!;
  await Supabase.initialize(url: url, anonKey: anonKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PhoneAuthScreen(),
      routes: <String, WidgetBuilder>{
        PhoneAuthScreen.routeName: (_) => const PhoneAuthScreen(),
      },
    );
  }
}
