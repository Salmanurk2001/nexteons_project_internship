import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_project/model/data_model.dart';
import '../Api_Service/DataService_SynC.dart';

class Datacontroller extends GetxController {
  late TextEditingController namecontroller;
  late TextEditingController ratecontroller;
  var dataList = <DataModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    namecontroller = TextEditingController();
    ratecontroller = TextEditingController();
    getListData();
  }

  @override
  void onClose() {
    namecontroller.dispose();
    ratecontroller.dispose();
    super.onClose();
  }

  Future<void> getListData() async {
    try {
      isLoading.value = true;
      final response = await DataService().getData();
      if (response is List) {
        final data = response.map((e) => DataModel.fromJson(e)).toList();
        dataList.value = data;
      } else {
        print("Error: Expected a list but got ${response.runtimeType}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> postListData() async {
    final name = namecontroller.text;
    final rate = double.tryParse(ratecontroller.text);
    if (rate == null) {
      Get.snackbar("Error", "Invalid rate value");
      return;
    }
    try {
      await DataService().postData(name, rate);
      await getListData();
    } catch (e) {
      print("Error posting data: $e");
    }
  }

  Future<void> putListData(String id, String name, double rate) async {
    final name = namecontroller.text;
    final rate = double.tryParse(ratecontroller.text);
    if (rate == null) {
      Get.snackbar("Error", "Invalid rate value");
      return;
    }
    try {
      await DataService().putData(id, name, rate);
      Get.snackbar("Updated", "Data updated successfully");
      await getListData();
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  deleteListData(String id) async {
    try {
      await DataService().deleteData(id);
      Get.snackbar("Deleted", "Successfully deleted",
          backgroundColor: Colors.red);
      await getListData();
    } catch (e) {
      print("Error deleting data: $e");
    }
  }

  void showDialogBox(
      BuildContext context, String? id, String name, double rate) {
    if (id != null) {
      final existingData = dataList.firstWhere((data) => data.id == id);
      namecontroller.text = existingData.name!;
      ratecontroller.text = existingData.rate.toString();
    } else {
      namecontroller.clear();
      ratecontroller.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade300,
          title: Text(id == null ? "CREATE" : "UPDATE"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: ratecontroller,
                decoration: const InputDecoration(
                  labelText: 'Rate',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                namecontroller.clear();
                ratecontroller.clear();
                Navigator.pop(context);
              },
              child: const Text("CANCEL"),
            ),
            ElevatedButton(
              onPressed: () {
                if (id == null) {
                  postListData();
                } else {
                  putListData(id, name, rate);
                }
                namecontroller.clear();
                ratecontroller.clear();
                Navigator.pop(context);
              },
              child: Text(id == null ? "ADD" : "UPDATE"),
            ),
          ],
        );
      },
    );
  }
}
