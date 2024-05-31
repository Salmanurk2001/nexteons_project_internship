import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_project/controller/login_contoller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:nexteons_project/model/data_model.dart';
import '../../../controller/data_controller.dart';

class SyncFusionDataList extends StatelessWidget {
  final Datacontroller dataController;
  final LoginController loginController;

  const SyncFusionDataList({
    Key? key,
    required this.dataController,
    required this.loginController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      padding: const EdgeInsets.only(top: 58, left: 63, right: 61, bottom: 46),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            Obx(
              () {
                return dataController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : _buildDataGrid(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Detail List",
          style: TextStyle(fontSize: 25),
        ),
        ElevatedButton(
          onPressed: () {
            _showAddStudentDialog(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text("ADD", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  void _showAddStudentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Student"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: dataController.namecontroller,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: dataController.ratecontroller,
                decoration: const InputDecoration(
                  labelText: 'Rate',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  dataController.postListData();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "ADD",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDataGrid(BuildContext context) {
    return Center(
      child: SfDataGrid(
        source: DataSource(
          dataList: dataController.dataList,
          controller: dataController,
          context: context,
        ),
        columns: [
          GridColumn(
            columnName: 'id',
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text('ID'),
            ),
          ),
          GridColumn(
            columnName: 'name',
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text('Name'),
            ),
          ),
          GridColumn(
            columnName: 'rate',
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Rate',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: 'edit',
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text('Edit'),
            ),
          ),
          GridColumn(
            columnName: 'delete',
            label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'Delete',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DataSource extends DataGridSource {
  final Datacontroller controller;
  final BuildContext context;

  DataSource({
    required List<DataModel> dataList,
    required this.controller,
    required this.context,
  }) {
    _dataGridRows = dataList.map<DataGridRow>((dataModel) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: dataModel.id),
        DataGridCell<String>(columnName: 'name', value: dataModel.name),
        DataGridCell<double>(columnName: 'rate', value: dataModel.rate),
        DataGridCell<Widget>(
          columnName: 'edit',
          value: IconButton(
            icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
            onPressed: () {
              controller.showDialogBox(context, dataModel.id,
                  dataModel.name ?? "", dataModel.rate ?? 0);
            },
          ),
        ),
        DataGridCell<Widget>(
          columnName: 'delete',
          value: IconButton(
            icon: const Icon(Icons.delete, size: 20, color: Colors.red),
            onPressed: () {
              controller.deleteListData(dataModel.id ?? "null");
            },
          ),
        ),
      ]);
    }).toList();
  }

  List<DataGridRow> _dataGridRows = [];

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Text(row.getCells()[0].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Text(row.getCells()[1].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Text(row.getCells()[2].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: row.getCells()[3].value,
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: row.getCells()[4].value,
      ),
    ]);
  }
}
