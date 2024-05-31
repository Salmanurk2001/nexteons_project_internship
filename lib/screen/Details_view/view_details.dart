import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:nexteons_project/controller/teachers_controller.dart';
import 'package:nexteons_project/screen/Details_view/Desktop.dart';
import 'package:nexteons_project/screen/Details_view/Mobile.dart';
import 'package:nexteons_project/screen/Details_view/Tablet.dart';
import 'package:nexteons_project/screen/Details_view/responsive.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late CreateTeachersController controller;
  final String tag = DateTime.now().toString();

  @override
  void initState() {
    controller = Get.put(CreateTeachersController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<CreateTeachersController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveDetails(
      desktop: DesktopDetails(),
      mobile: MobileDetails(),
      tablet: TabletDetails(),
    );
  }
}
