import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slicing_ui_praktikum/app/modules/home/views/bottom_nav.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadImageFromPrefs();
  }

  Future<void> _loadImageFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image_path');

    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _saveImage(image.path);
    }
  }

  Future<void> _takePictureFromCamera() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      _saveImage(image.path);
    }
  }

  Future<void> _removeImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image_path');

    if (imagePath != null) {
      final File imageFile = File(imagePath);

      if (imageFile.existsSync()) {
        await imageFile.delete();
        setState(() {
          _image = null;
        });
        prefs.remove('profile_image_path');
      }
    }
  }

  Future<void> _saveImage(String imagePath) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = "profile_image.png";

    final savedImage = await File(imagePath).copy('${appDir.path}/$fileName');

    setState(() {
      _image = savedImage;
    });

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('profile_image_path', _image!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              if (_image != null)
                Image.file(
                  _image!,
                  width: 200,
                  height: 200,
                ),
              MaterialButton(
                onPressed: () {
                  _pickImageFromGallery().then((_) {
                    _loadImageFromPrefs(); 
                  });
                },
                color: Colors.black,
                child: Text(
                  "Pick from gallery",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _takePictureFromCamera().then((_) {
                    _loadImageFromPrefs(); 
                  });
                },
                color: Colors.black,
                child: Text(
                  "Take from camera",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              if (_image != null)
                MaterialButton(
                  onPressed: () {
                    _removeImage();
                  },
                  color: Colors.red,
                  child: Text(
                    "Remove Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppNav(),
    );
  }
}
