import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_project/main.dart';
import 'package:nexteons_project/model/teachers_model.dart';
import 'package:nexteons_project/utils/constents.dart';

class CreateTeachersController extends GetxController {
  final tfirstnameControl = TextEditingController();
  final tmailControl = TextEditingController();
  final tlastnameControl = TextEditingController();
  final tuidControl = TextEditingController();
  final tdistControl = TextEditingController();
  final tpinControl = TextEditingController();
  final tphoneControl = TextEditingController();
  final tcountryControl = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void resetall() {
    tfirstnameControl.clear();
    tmailControl.clear();
    tlastnameControl.clear();
    tuidControl.clear();
    tdistControl.clear();
    tpinControl.clear();
    tphoneControl.clear();
    tcountryControl.clear();
  }

  void createTeachers() {
    if (formkey.currentState!.validate()) {
      int tphoneNumber = int.parse(tphoneControl.text);
      int tpincode = int.parse(tpinControl.text);
      teachers.add(Teachers(
        tfirstname: tfirstnameControl.text,
        tlastname: tlastnameControl.text,
        temail: tmailControl.text,
        tid: tuidControl.text,
        tdistrict: tdistControl.text,
        tphoneNumber: tphoneNumber,
        tpincode: tpincode,
        tcountry: tcountryControl.text,
      ));

      navigatorkey.currentContext!.go('/detailsscreen');
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
