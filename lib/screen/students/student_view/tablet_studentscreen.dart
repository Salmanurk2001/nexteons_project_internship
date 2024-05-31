import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_project/main.dart';
import 'package:nexteons_project/screen/students/student_view/student_card.dart';

class tablet_studentscreen extends StatelessWidget {
  const tablet_studentscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff49B1FC),
        title: Image.asset("assets/images/img.png"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
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
                SizedBox(height: 90),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: students.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      if (index == students.length) {
                        return InkWell(
                          onTap: () {
                            context.go('/studentcreate');
                          },
                          child: Container(
                            height: 100,
                            width: 200,
                            color: Color.fromARGB(255, 192, 181, 181),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outline,
                                  color: Color(0xff000000),
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text("Add New Student")
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Studentcard(index: index);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
