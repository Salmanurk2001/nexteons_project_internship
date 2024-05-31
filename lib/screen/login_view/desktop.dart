import 'package:flutter/material.dart';
import 'package:nexteons_project/screen/students/create/validation/form_validatio.dart';
import '../../controller/login_contoller.dart';

class Desktoplogin extends StatefulWidget {
  @override
  State<Desktoplogin> createState() => _DesktoploginState();
}

class _DesktoploginState extends State<Desktoplogin> {
  LoginController controller = LoginController();
  Errorvalidation validation = Errorvalidation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 600,
                width: 600,
                child: Image.asset(
                  'assets/images/image(1).png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Container(
                    height: 600,
                    width: 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        // SizedBox(height: 5.0),
                        Text(
                          'Login your account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Username or Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: controller.emailController,
                          validator: (value) => validation.username(value),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: controller.passwordController,
                          validator: (value) => validation.password(value),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forget Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        InkWell(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.getToken();
                              // Get.to(StudentScreen());
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 600,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text('Login'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
