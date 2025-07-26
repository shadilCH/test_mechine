import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      appBar: AppBar(),
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




