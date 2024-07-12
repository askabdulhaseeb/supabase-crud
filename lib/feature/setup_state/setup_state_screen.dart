import 'package:flutter/material.dart';

class SetupStateScreen extends StatefulWidget {
  const SetupStateScreen({super.key});

  @override
  State<SetupStateScreen> createState() => _SetupStateScreenState();
}

class _SetupStateScreenState extends State<SetupStateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add the code to initialize Supabase here
          },
          child: const Text('Initialize Supabase'),
        ),
      ),
    );
  }
}
