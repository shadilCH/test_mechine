import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_mechine/common/shared_preference.dart';
import 'package:test_mechine/features/auth/screen/login_page.dart';
import 'package:test_mechine/features/auth/screen/profile_page.dart';

import '../controller/auth_controller.dart';

class Splashscreen extends ConsumerStatefulWidget {
  const Splashscreen({super.key});

  @override
  ConsumerState<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends ConsumerState<Splashscreen> {
  @override
  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 3));

    final name = await getsharedpreference("username");
    final password = await getsharedpreference("password");
    print(name);


    if (!mounted) return;

    if (name == null) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      ref.read(authControllerProvider.notifier).login(name, password!);
      final user = ref.read(authControllerProvider);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Welcome",style: TextStyle(
              fontSize: 20
            ),),
          )
        ],
      ),

    );
  }
}
