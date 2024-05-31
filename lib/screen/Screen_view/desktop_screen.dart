import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nexteons_project/controller/student_controller.dart';
import 'package:nexteons_project/screen/students/create/validation/form_validatio.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  Errorvalidation validation = Errorvalidation();
  CreateStudentController controller = CreateStudentController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formkey,
        child: Row(children: [
          Container(
              color: Color(0xFF49B1FC),
              width: 323,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 450),
                child: Image.asset("assets/images/img.png"),
              )),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BASIC DETAILS",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "First Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                      "Email Address",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.mailControl,
                      validator: (value) => validation.email(value),
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 192, 181, 181),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "District",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                      "PinCode",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                      height: 5,
                    ),
                    Container(
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                controller.resetAll();
                              },
                              child: Text(
                                "Reset All",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Last Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                      "User ID",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                      "Phone no.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                      "Country",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Center(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromRGBO(73, 177, 252, 1))),
                              onPressed: () {
                                controller.createStudent();
                              },
                              child: Text(
                                "Save & Proceed",
                                style: TextStyle(color: Colors.white),
                              ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
