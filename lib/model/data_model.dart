// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  String? name;
  double? rate;
  String? id;

  DataModel({
    this.name,
    this.rate,
    this.id,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        name: json["_name"],
        rate: json["_rate"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_name": name,
        "_rate": rate,
        "_id": id,
      };
}
