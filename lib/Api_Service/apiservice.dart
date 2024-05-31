import 'package:dio/dio.dart';

class ApiService {
  Future<String?> getData(String email, String password) async {
    Dio dio = Dio();
    const url = 'https://api.realestate.salonsyncs.com/graphql';
    const headers = {
      "X-Tenant-Id": "RL0582",
    };

    const query = '''
    query Auth_Login(\$loginData: LoginInput!) {
      Auth_Login(loginData: \$loginData) {
        accessToken
      }
    }
    ''';

    final variables = {
      'loginData': {
        '_deviceType': 0,
        '_email': email,
        // "developer.fayizalinp@gmail.com",
        '_password': password,
        //  "0RneWfb0",
        '_userType': 0,
        'deviceId': '',
        'deviceName': 'test',
        'deviceToken': 'test',
        'grant_type': 'password',
      },
    };

    final payload = {
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
        final data = response.data;
        print('Response data: $data');
        final accessToken = data['data']['Auth_Login']['accessToken'];
        print('Access Token: $accessToken');
        return accessToken;
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }
}
