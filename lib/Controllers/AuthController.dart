import 'dart:convert';

import 'package:NutritionApplication/Models/Utils/APIRoutes.dart';
import 'package:http/http.dart' as http;
import 'package:NutritionApplication/Models/User.dart';
import 'package:NutritionApplication/Models/Utils.dart';

class AuthController {
  Future<bool> doLogin(username, password) async {
    var response = await http.post(Uri.parse(APIRoutes.getRoute("LOGIN")),
        body: {'email': username, 'password': password});

    print(response.body);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      Utils.profileUser = User.fromJson(result);
    }
    return (response.statusCode == 200) ? true : false;
  }

  Future<bool> doRegistration(data) async {
    var response =
        await http.post(Uri.parse(APIRoutes.getRoute("REGISTER")), body: data);
    if (response.statusCode == 200) {
      Utils.showToast("Registration Success.");
    } else {
      print(response.statusCode);
    }
    return (response.statusCode == 200) ? true : false;
  }
}
