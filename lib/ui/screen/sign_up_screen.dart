import 'package:attendance_server/provider/teacher.dart';
import 'package:attendance_server/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController controllerName;

  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey=GlobalKey<FormState>();
    controllerName = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
          children: [
              CustomTextField(
                  label: 'name',
                  controller: controllerName,
                  validator: validator,
                  typeKeyboard: TextInputType.name),
              ElevatedButton(onPressed: onSign, child: const Text('sign up'))
          ],
        ),
            )),
      ),
    );
  }

  void onSign() {
    if(formKey.currentState?.validate()??false){
      context.read<TeacherProvider>().setName(controllerName.text);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false,
      );
    }
  }

  String? validator(String? value) =>
      (value?.isEmpty ?? true) ? 'field is Empty' : null;
}
