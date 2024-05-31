import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_project/main.dart';
import 'package:nexteons_project/model/student_model.dart';
import 'package:nexteons_project/utils/constents.dart';

class CreateStudentController extends GetxController {
  final firstnameControl = TextEditingController();
  final mailControl = TextEditingController();
  final lastnameControl = TextEditingController();
  final uidControl = TextEditingController();
  final distControl = TextEditingController();
  final pinControl = TextEditingController();
  final phoneControl = TextEditingController();
  final countryControl = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void resetAll() {
    firstnameControl.clear();
    mailControl.clear();
    lastnameControl.clear();
    uidControl.clear();
    distControl.clear();
    pinControl.clear();
    phoneControl.clear();
    countryControl.clear();
  }

  void createStudent() {
    if (formkey.currentState!.validate()) {
      int phoneNumber = int.parse(phoneControl.text);
      int pincode = int.parse(pinControl.text);
      students.add(Student(
        firstname: firstnameControl.text,
        lastname: lastnameControl.text,
        email: mailControl.text,
        id: uidControl.text,
        district: distControl.text,
        phoneNumber: phoneNumber,
        pincode: pincode,
        country: countryControl.text,
      ));

      navigatorkey.currentContext!.go('/studentscreen');
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(
          "Failed To Add Data",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      ));
    }
  }
}
