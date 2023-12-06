import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_process/app/presentations/controllers/database_controller.dart';

class UsersView extends StatelessWidget {
  final DatabaseController databaseController = Get.put(DatabaseController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController umurController = TextEditingController();

  UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Name in Appwrite', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: umurController,
              decoration: InputDecoration(
                labelText: 'Enter your umur',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  Map<String, dynamic> data = {
                    'name': nameController.text,
                    'umur': umurController.text,
                  };
                  databaseController.storeUserName(data);
                } else {
                  Get.snackbar(
                    'Input Error',
                    'Name cannot be empty',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('Store Name', style: TextStyle(color: Colors.white)),
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
