import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_project/screen/Screen_view/responsive.dart';
import 'package:nexteons_project/controller/student_controller.dart';
import 'package:nexteons_project/screen/Screen_view/desktop_screen.dart';
import 'package:nexteons_project/screen/Screen_view/mobile_screen.dart';
import 'package:nexteons_project/screen/Screen_view/tablet_screen.dart';

class StudentsCreate extends StatefulWidget {
  const StudentsCreate({
    super.key,
  });

  @override
  State<StudentsCreate> createState() => _StudentsCreateState();
}

class _StudentsCreateState extends State<StudentsCreate> {
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
    return Responsive(
      desktop: DesktopScreen(),
      tablet: TabletScreen(),
      mobile: MobileScreen(),
    );
  }
}
