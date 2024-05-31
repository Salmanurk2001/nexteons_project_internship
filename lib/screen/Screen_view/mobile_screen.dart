// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nexteons_project/controller/student_controller.dart';
import 'package:nexteons_project/screen/students/create/validation/form_validatio.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  Errorvalidation validation = Errorvalidation();
  CreateStudentController controller = CreateStudentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF49B1FC),
        title: Image.asset("assets/images/img.png"),
      ),
      body: Form(
        key: controller.formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BASIC DETAILS",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "First Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.firstnameControl,
                        validator: (value) => validation.name(value),
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 192, 181, 181),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Last Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.lastnameControl,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 192, 181, 181),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email Address",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.mailControl,
                        validator: (value) => validation.email(value),
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 192, 181, 181),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "User ID",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.uidControl,
                        validator: (value) => validation.userid(value),
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 192, 181, 181),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "District",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.distControl,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 192, 181, 181),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Phone No.",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.phoneControl,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 192, 181, 181),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pincode",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.pinControl,
                        validator: (value) => validation.pincode(value),
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 192, 181, 181),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Country",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.countryControl,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 192, 181, 181),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFF49B1FC))),
                            onPressed: () {
                              controller.createStudent();
                            },
                            child: Text(
                              "Save & Proceed",
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            controller.resetAll();
                          },
                          child: Text(
                            "Reset All",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
