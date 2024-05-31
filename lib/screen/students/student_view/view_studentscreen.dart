import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nexteons_project/controller/student_controller.dart';
import 'package:nexteons_project/screen/students/student_view/desktop_studentscreen.dart';
import 'package:nexteons_project/screen/students/student_view/mobile_studentscreen.dart';
import 'package:nexteons_project/screen/students/student_view/responsive.dart';
import 'package:nexteons_project/screen/students/student_view/tablet_studentscreen.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({
    super.key,
  });

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  late CreateStudentController controller;
  final String tag = DateTime.now().toString();

  @override
  void initState() {
    controller = Get.put(CreateStudentController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<CreateStudentController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive_student(
      desktop: desktop_studentscreen(),
      mobile: Mobile_studentscreen(),
      tablet: tablet_studentscreen(),
    );
  }
}
