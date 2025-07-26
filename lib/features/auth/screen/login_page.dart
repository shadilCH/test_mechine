import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_mechine/features/auth/screen/profile_page.dart';

import '../../../common/shared_preference.dart';
import '../../../main.dart';
import '../controller/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Text("Login User",style: TextStyle(
              fontSize: 30
            ),),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 350,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    labelText: "Username"
                  ),
                ),
              ),
            ),
            Container(
              width: 350,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    labelText: "Password"
                  ),
                ),
              ),
            ),
        Container(
          width: 200,
          child: ElevatedButton(
              onPressed: () async {
                print(usernameController.text);
                print(passwordController.text);
                ref.read(authControllerProvider.notifier).login(usernameController.text, passwordController.text);
                final user = ref.read(authControllerProvider);
                print(user);

                if(user != null){
                  print(user);

                    print("login successfully");
                    sharedpreference("username", user.username ?? '');
                    sharedpreference("password", passwordController.text ?? '');
                    sharedpreference("email", user.email ?? '');
                    sharedpreference("image", user.image ?? '');
                    sharedpreference("gender", user.gender ?? '');
                    sharedpreference("firstName", user.firstName ?? '');
                    sharedpreference("lastName", user.lastName ?? '');
                    sharedpreference("id", user.id?.toString() ?? '');
                    sharedpreference("accessToken", user.accessToken ?? '');
                    sharedpreference("refreshToken", user.refreshToken ?? '');



                }
                var name = await getsharedpreference("username");
                print(name);
                print("name");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));

              }, child: Text("Login",style: TextStyle(
              color: Colors.black
          ),)),
        )
          ],
        ),
      ),
    );
  }
}





