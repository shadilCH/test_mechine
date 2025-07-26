import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_mechine/features/auth/screen/login_page.dart';

import '../controller/auth_controller.dart';
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends ConsumerState<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authControllerProvider);
    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();

              // Remove only user-related keys
              await prefs.remove('username');
              await prefs.remove('email');
              await prefs.remove('image');
              await prefs.remove('gender');
              await prefs.remove('firstName');
              await prefs.remove('lastName');
              await prefs.remove('id');
              await prefs.remove('accessToken');
              await prefs.remove('refreshToken');
              Navigator.push(context, MaterialPageRoute(builder:(context) => LoginPage(),));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.brown,
                      backgroundImage: NetworkImage(user.image),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${user.firstName} ${user.lastName}"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




