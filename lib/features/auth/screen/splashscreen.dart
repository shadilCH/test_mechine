import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mechine/common/shared_preference.dart';
import 'package:test_mechine/features/auth/screen/login_page.dart';
import 'package:test_mechine/features/auth/screen/profile_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 3));

    final name = await getsharedpreference("username");
    print(name);

    if (!mounted) return; // 👈 Safe check to avoid calling Navigator if widget disposed

    if (name == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
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
