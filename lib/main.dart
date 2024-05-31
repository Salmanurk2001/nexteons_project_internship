import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_project/controller/student_controller.dart';
import 'package:nexteons_project/model/student_model.dart';
import 'package:nexteons_project/model/teachers_model.dart';
import 'package:url_strategy/url_strategy.dart';

import 'screen/students/create/Gorouter/gorouter.dart';

RxList<Student> students = [
  Student(
    firstname: "Salman",
    lastname: "N",
    email: "abc123@gmail.com",
    id: "12345",
    district: "Kollam",
    phoneNumber: 1234567890,
    pincode: 123456,
    country: "India",
  ),
].obs;
RxList<Teachers> teachers = [
  Teachers(
    tfirstname: "Salman",
    tlastname: "N",
    temail: "efghij123@gmail.com",
    tid: "efgh123",
    tdistrict: "Kollam",
    tphoneNumber: 0987654321,
    tpincode: 654321,
    tcountry: "India",
  ),
].obs;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  Get.put(CreateStudentController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
