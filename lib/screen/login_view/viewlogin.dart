import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_project/controller/student_controller.dart';
import 'package:nexteons_project/screen/login_view/desktop.dart';
import 'package:nexteons_project/screen/login_view/mobile.dart';
import 'package:nexteons_project/screen/login_view/tablet.dart';
import 'package:nexteons_project/screen/login_view/responsive_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return Responsive_login(
      desktop: Desktoplogin(),
      tablet: Tabletlogin(),
      mobile: Mobilelogin(),
    );
  }
}
