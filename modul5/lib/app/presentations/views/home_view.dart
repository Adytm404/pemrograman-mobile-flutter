import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_process/app/presentations/controllers/client_controller.dart';

class HomeView extends GetView<ClientController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/signup');
              },
              child: const Text("Sign Up Page"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed('/users');
            //   },
            //   child: const Text("Users Page"),
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.black,
            //     onPrimary: Colors.white,
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed('/realtime');
            //   },
            //   child: const Text("Realtime Page"),
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.black,
            //     onPrimary: Colors.white,
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed('/storage');
            //   },
            //   child: const Text("Image Page"),
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.black,
            //     onPrimary: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 54, 54, 54), 
    );
  }
}
