import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_process/app/presentations/controllers/account_controller.dart';

class SignUpView extends StatelessWidget {
  final AccountController accountController = Get.put(AccountController());

  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up View', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.black), // Warna teks hitam.
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.black), // Warna teks hitam.
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.black), // Warna teks hitam.
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> map = {
                  'userId': 'unique()',
                  'email': emailController.text,
                  'password': passwordController.text,
                  'name': nameController.text,
                };
                await accountController.createAccount(map);
              },
              child: Text('Create Account', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 54, 54, 54), 
    );
  }
}
