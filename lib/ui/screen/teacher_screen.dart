import 'package:attendance_server/provider/teacher.dart';
import 'package:attendance_server/ui/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(context.watch<TeacherProvider>().teacher!.name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (context.watch<TeacherProvider>().teacher.courses.isEmpty)
            ? const Center(
                child: Text('no courses available for you , try add new course'),
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
    );
  }
}
