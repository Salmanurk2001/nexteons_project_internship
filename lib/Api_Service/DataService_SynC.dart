import 'package:dio/dio.dart';

class DataService {
  Dio dio = Dio();

  static const String url = 'https://api.realestate.salonsyncs.com/graphql';
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjY2MzFkYTVkZTllZmEwYmQ4NGE4NjhmMiIsIl9mb3JjZUxvZ291dF8iOi0xLCJfZGV2aWNlX2lkXyI6IjY2NTA1MjNkNmY4YTQ3MGViMTQ3MTE5OCIsIl91c2VyVHlwZV8iOjAsIl9jcml0aWNhbEVkaXRDb3VudF8iOi0xLCJpYXQiOjE3MTY1Mzk5NjUsImV4cCI6MTcxNzQwMzk2NSwiYXVkIjoiNjYzMWRhNWRlOWVmYTBiZDg0YTg2OGYyIiwiaXNzIjoiTmV4dGVvbnMuY29tIn0.7lP49n4xPrY8DHQ76D-3H9IBlFTj01C6WS-mxgZCGQY";
  static const Map<String, String> headers = {
    "Authorization": "Bearer $token",
    "X-Tenant-Id": "RL0582",
  };

  getData() async {
    const String query = '''
    query List(\$filterOptions: ListDpiInput!) {
      DpiRate_List(FilterOptions: \$filterOptions) {
        list {
          _name
          _rate
          _id
        }
        totalCount
      }
    }
    ''';

    final Map<String, dynamic> variables = {
      "filterOptions": {
        "branchIds": "6631da5ce9efa0bd84a86852",
        "limit": -1,
        "skip": 0,
        "statusArray": [1]
      }
    };

    final Map<String, dynamic> payload = {
      'query': query,
      'variables': variables,
    };

    try {
      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: payload,
      );
      print('Response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final List<dynamic>? accessToken =
            response.data['data']['DpiRate_List']['list'];
        print('Access Token: $accessToken');
        return accessToken ?? [];
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }

  postData(String name, double rate) async {
    const String query = '''
    mutation DPI_Rate_Create(\$createDpiRateInput: CreateDpiRateInput!) {
      DPI_Rate_Create(createDpiRateInput: \$createDpiRateInput) {
        _id
      }
    }
    ''';

    final Map<String, dynamic> variables = {
      "createDpiRateInput": {
        "_branchId": "6631da5ce9efa0bd84a86852",
        "_name": name,
        "_rate": rate
      }
    };

    final Map<String, dynamic> payload = {
      'query': query,
      'variables': variables,
    };

    try {
      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: payload,
      );
      print('Response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final Map<String, dynamic>? result =
            response.data['data']['DPI_Rate_Create'];
        print('Post Result: $result');
        return result ?? {};
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }

  putData(String name, String id, double rate) async {
    const String query = '''
mutation DPI_Rate_Update(\$updateDpiRateInput: UpdateDpiRateInput!) {
  DPI_Rate_Update(updateDpiRateInput: \$updateDpiRateInput) {
    _id
  }
}
''';

    final Map<String, dynamic> variables = {
      "updateDpiRateInput": {
        "_branchId": "6631da5ce9efa0bd84a86852",
        "_editCount": -1,
        "_id": id,
        "_name": name,
        "_rate": rate
      }
    };

    final Map<String, dynamic> payload = {
      'query': query,
      'variables': variables,
    };

    try {
      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: payload,
      );
      if (response.statusCode == 200) {
        final data = response.data["data"]["DPI_Rate_Update"]["_id"];
        print(data);
        return data;
      } else {
        print('Error: ${response.statusCode}');

        return null;
      }
    } catch (e) {
      print("Error $e");
    }
    return null;
  }

  deleteData(String id) async {
    const String query = '''
   mutation DPI_Rate_StatusChange(\$statusChange: StatusChangeInput!) {
  DPI_Rate_StatusChange(statusChange: \$statusChange) {
    message
}
}
  ''';

    final Map<String, dynamic> variables = {
      "statusChange": {
        "_editCount": -1,
        "_logDescription": null,
        "_status": "DELETE",
        "ids": [id]
      }
    };

    final Map<String, dynamic> payload = {
      'query': query,
      'variables': variables,
    };

    try {
      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: payload,
      );
      if (response.statusCode == 200) {
        final data = response.data["data"]["DPI_Rate_StatusChange"]["message"];

        print(data);
        return data;
      } else {
        print('Error: ${response.statusCode}');

        return null;
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
