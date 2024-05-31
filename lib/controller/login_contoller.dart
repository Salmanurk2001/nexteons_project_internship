import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_project/Api_Service/apiservice.dart';
import 'package:nexteons_project/utils/constents.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var accessToken = ''.obs;
  var isLoading = false.obs;

  getToken() async {
    isLoading.value = true;
    print('Fetching token for email: ${emailController.text}');
    var data = await ApiService()
        .getData(emailController.text, passwordController.text);
    if (data != null) {
      accessToken.value = data;
      print('Received Access Token: ${accessToken.value}');
      storeData(accessToken.value);
      navigatorkey.currentContext!.go('/detailsscreen');
    } else {
      print('Failed to retrieve access token');
    }
    isLoading.value = false;
  }

  storeData(String tokenData) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString("accessToken", tokenData);
    print('Stored Access Token: $tokenData');
  }

  logOut() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove("accessToken");
    accessToken.value = '';
    print('Logged out and removed access token');
    navigatorkey.currentContext!.go('/loginscreen');
  }
}
