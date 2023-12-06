import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:note_keep/helpers/database_helper.dart';
import 'package:note_keep/providers/todo_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late TodoProvider todoProvider;
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  File? _selectedImage;

  @override
  void initState() {
    todoProvider = Provider.of<TodoProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 128, 158, 186),
        title: const Text("Add Activities"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Title",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter title";
                  }
                  return null;
                },
                onSaved: (newValue) => _title = newValue ?? "Title",
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Description",
                ),
                onSaved: (newValue) => _description = newValue ?? "description",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                        if (_selectedImage != null) {
                          await DatabaseHelper.instance.uploadImageToAppwrite(_selectedImage! as File);
                        }


                      bool result = await DatabaseHelper.instance.createTodo(
                        title: _title,
                        description: _description,
                      );

                      if (result) {
                        getData();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Added todo successfully"),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  }
                  Navigator.pop(context);
                },
                child: const Text("Add Todo"),
              ),
              ElevatedButton(
                onPressed: _selectImage,
                child: const Text("Select Image"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getData() async {
    await todoProvider.getTodo();
  }

    Future<void> _selectImage() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? result = await _picker.pickImage(source: ImageSource.gallery);
      if (result != null) {
        setState(() {
          _selectedImage = File as File?;
        });
      }
    }

}
