import 'package:go_router/go_router.dart';
import 'package:nexteons_project/screen/Details_view/details_screen.dart';
import 'package:nexteons_project/screen/login_view/viewlogin.dart';
import 'package:nexteons_project/screen/Screen_view/View_studentdetails.dart';
import 'package:nexteons_project/screen/Details_view/view_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/constents.dart';
import '../../student_view/view_studentscreen.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorkey,
  redirect: (context, state) async {
    if (await isTokenStored() == false) {
      return '/loginscreen';
    } else {
      return null;
    }
  },
  initialLocation: '/loginscreen',
  routes: [
    GoRoute(
      path: '/loginscreen',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/studentcreate',
      builder: (context, state) => StudentsCreate(),
    ),
    GoRoute(
      path: '/studentscreen',
      builder: (context, state) => StudentsScreen(),
    ),
    GoRoute(
      path: '/teacherscreate',
      builder: (context, state) => TeachersCreate(),
    ),
    GoRoute(
      path: '/detailsscreen',
      builder: (context, state) => DetailsScreen(),
    ),
  ],
);
Future<bool> isTokenStored() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String? accessToken = preferences.getString("accessToken");
  print(accessToken);
  return accessToken != null;
}
