import 'dart:convert';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/APIRoutes.dart';

import 'package:http/http.dart' as http;

class GoalController {
  Future<bool> enroll(data) async {
    var response =
        await http.post(Uri.parse(APIRoutes.getRoute("ENROLL")), body: data);

    print(response.body);

    Utils.bmr = '0';
    Utils.tdee = '0';
    Utils.tdee_week = '0';
    Utils.drinking_water = '0';
    Utils.payment_status = 0;

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);

      Utils.bmr = map['bmr'];
      Utils.tdee = map['tdee'];
      Utils.tdee_week = map['tdee_week'];
      Utils.drinking_water = map['drinking_water'];
      Utils.payment_status = map['payment_status'];
      Utils.gender = map['gender'];

      Utils.showToast('Successfully Enrolled');
    }
    return (response.statusCode == 200) ? true : false;
  }

  Future getGoalDetails(data) async {
    var response = await http
        .post(Uri.parse(APIRoutes.getRoute("GET_GOAL_DETAILS")), body: data);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      Utils.bmr = map['bmr'];
      Utils.tdee = map['tdee'];
      Utils.tdee_week = map['tdee_week'];
      Utils.drinking_water = map['drinking_water'];
      Utils.payment_status = map['payment_status'];
      Utils.gender = map['gender'];
    } else {
      Utils.showToast("No Data Found");
    }
    return (response.statusCode == 200) ? true : false;
  }

  Future enrollPayment(data) async {
    var response = await http
        .post(Uri.parse(APIRoutes.getRoute("ENROLL_PAYMENT")), body: data);

    if (response.statusCode == 200) {
      Utils.showToast("Successfully Saved Payment Referance");
    } else {
      Utils.showToast("No Data Found");
    }
  }

  Future<List<dynamic>> getMealList(data) async {
    List<dynamic> mealList = [];

    var response = await http
        .post(Uri.parse(APIRoutes.getRoute("GET_MEAL_LIST")), body: data);
    print(response.body);
    Map<String, dynamic> retriveList = jsonDecode(response.body);
    retriveList['meal_list'].forEach((value) {
      mealList.add(value);
    });
    return mealList;
  }

  Future<List<dynamic>> getGoalList(data) async {
    List<dynamic> goalList = [];

    var response = await http
        .post(Uri.parse(APIRoutes.getRoute("GET_GOAL_HISTORY")), body: data);

    print(response.body);

    Map<String, dynamic> retriveList = jsonDecode(response.body);
    retriveList['goal_list'].forEach((value) {
      goalList.add(value);
    });
    return goalList;
  }

  Future<dynamic> getMealValues(data) async {
    var response = await http
        .post(Uri.parse(APIRoutes.getRoute("GET_MEAL_VALUES")), body: data);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  Future<dynamic> enrollMealList(data) async {
    var response = await http
        .post(Uri.parse(APIRoutes.getRoute("ENROLL_MEAL_LIST")), body: data);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      Utils.showToast("Invalid Nutrition Values, Please Try Again...");
      return jsonDecode(response.body);
    } else {
      Utils.showToast("No Data Found");
    }
  }
}
