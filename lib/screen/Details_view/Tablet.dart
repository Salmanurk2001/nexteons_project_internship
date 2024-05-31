import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_project/controller/login_contoller.dart';
import 'package:nexteons_project/main.dart';
import 'package:nexteons_project/screen/Details_view/details_card.dart';
import 'package:nexteons_project/screen/students/student_view/student_card.dart';

class TabletDetails extends StatelessWidget {
  final LoginController ctrl = Get.put(LoginController());
  final ValueNotifier<int> selectedTab = ValueNotifier<int>(0);

  TabletDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ctrl.logOut();
        },
        child: Icon(Icons.logout),
      ),
      body: Row(
        children: [
          Container(
            width: 323,
            color: Color(0xff49B1FC),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 33,
                    width: 215,
                    child: Image.asset("assets/images/img.png"),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xffffffff)),
                  ),
                  onPressed: () {
                    selectedTab.value = 0;
                  },
                  child: Text(
                    "Students",
                    style: TextStyle(color: Color(0xff000000)),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xffffffff)),
                  ),
                  onPressed: () {
                    selectedTab.value = 1;
                  },
                  child: Text(
                    "Teachers",
                    style: TextStyle(color: Color(0xff000000)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: selectedTab,
              builder: (context, value, child) {
                if (value == 0) {
                  return _buildStudentsUI(context);
                } else {
                  return _buildTeachersUI(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentsUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 25),
          child: Text(
            "NEW STUDENTS",
            style: TextStyle(
              fontSize: 35,
              color: Color(0xff000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 30),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: students.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              if (index == students.length) {
                return InkWell(
                  onTap: () {
                    context.go('/studentcreate');
                  },
                  child: Container(
                    height: 219,
                    width: 224,
                    color: Color(0xffF5F5F5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Color(0xff000000),
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text("Add New Student")
                      ],
                    ),
                  ),
                );
              } else {
                return Studentcard(
                  index: index,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTeachersUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 25),
          child: Text(
            "NEW TEACHERS",
            style: TextStyle(
              fontSize: 35,
              color: Color(0xff000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 30),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: teachers.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              if (index == teachers.length) {
                return InkWell(
                  onTap: () {
                    context.go('/teacherscreate');
                  },
                  child: Container(
                    height: 219,
                    width: 224,
                    color: Color(0xffF5F5F5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Color(0xff000000),
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text("Add New Teacher")
                      ],
                    ),
                  ),
                );
              } else {
                return TeachersCard(
                  index: index,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
