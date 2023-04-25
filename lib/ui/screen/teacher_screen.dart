import 'package:attendance_server/helper/dialog_helper.dart';
import 'package:attendance_server/provider/teacher.dart';
import 'package:attendance_server/ui/widget/custom_card.dart';
import 'package:attendance_server/ui/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherScreen extends StatefulWidget {

   const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  late TextEditingController courseController;

  @override
  void initState() {
    courseController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text(context
          .watch<TeacherProvider>()
          .teacher
          .name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (context
            .watch<TeacherProvider>()
            .teacher
            .courses
            .isEmpty)
            ? const Center(
          child:
          Text('no courses available for you , try add new course'),
        )
            : ListView(
            shrinkWrap: false,
            children: context
                .watch<TeacherProvider>()
                .teacher!
                .courses
                .map((e) => CustomCard(title: e.title))
                .toList()),
      ),
      floatingActionButton:
      FloatingActionButton(onPressed: ()=>addCourse(context), child: const Icon(Icons.add)),
    );
  }

  void addCourse(BuildContext context) {
    showMyDialog(context: context,
        title: 'Add Dialog',
        content: CustomTextField(label: 'course', controller: courseController),
      actions: [TextButton(onPressed: (){
        Navigator.pop(context);
        context.read<TeacherProvider>().addCourse(courseController.text);
      }, child:const Text('ok'))]

    );



  }

}
