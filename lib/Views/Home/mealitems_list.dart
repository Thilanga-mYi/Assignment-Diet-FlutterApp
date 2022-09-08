import 'dart:convert';

import 'package:NutritionApplication/Controllers/GoalController.dart';
import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealItemList extends StatefulWidget {
  int day;
  int meal_time;

  MealItemList(this.day, this.meal_time, {Key? key}) : super(key: key);

  @override
  State<MealItemList> createState() =>
      _MealItemListState(day: day, meal_time: meal_time);
}

class _MealItemListState extends State<MealItemList> {
  int day;
  int meal_time;

  double total_fat = 0;
  double total_carbs = 0;
  double total_protein = 0;
  List selectedList = [];

  bool performAddition = false;

  _MealItemListState({required this.day, required this.meal_time});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UtilColors.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: GestureDetector(
          onTap: () => Routes(context: context).back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
                onTap: () async {
                  doAddition();
                },
                child: const Icon(
                  Icons.add,
                  size: 32.0,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () async {
                Utils.showLoader(context);
                List<Map<String, String>> saveList = [];
                formEditingController.forEach((element) {
                  if (element['controller'].text.toString().isNotEmpty) {
                    saveList.add({
                      'id': element['id'].toString(),
                      'value': element['controller'].text
                    });
                  }
                });

                await GoalController().enrollMealList({
                  'user': Utils.profileUser.id.toString(),
                  'save': '1',
                  'day': day.toString(),
                  'meal_time': meal_time.toString(),
                  'data': jsonEncode(saveList)
                }).then((value) {
                  Utils.hideLoaderCurrrent(context);
                  Utils.showToast("Successfully Saved Meal Plan");
                  Navigator.pop(context);
                });
              },
              child: const Icon(
                Icons.done,
                size: 32.0,
              ),
            ),
          ),
        ],
        title: const Text(
          'Meal Items',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: SizedBox(
        width: Utils.displaySize.width,
        height: Utils.displaySize.height,
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                FutureBuilder<dynamic>(
                    future: GoalController().getMealValues({
                      'user': Utils.profileUser.id.toString(),
                      'day': day.toString(),
                      'meal_time': meal_time.toString()
                    }),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white,
                                      boxShadow: Utils.getShadow(),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Allocated',
                                            style: GoogleFonts.openSans(),
                                          ),
                                          Text(
                                            'Carbs',
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  total_carbs.toString(),
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15.0,
                                                      color: Colors.blue[300],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  '/',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15.0,
                                                      color: Colors.blue[600],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: Text(
                                                  snapshot
                                                      .data['recommended_carbs']
                                                      .toString(),
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15.0,
                                                      color: Colors.blue[600],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white,
                                      boxShadow: Utils.getShadow(),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Allocated',
                                            style: GoogleFonts.openSans(),
                                          ),
                                          Text(
                                            'Fat',
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  total_fat.toString(),
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15.0,
                                                      color: Colors.orange[300],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  '/',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15.0,
                                                      color: Colors.orange[800],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: Text(
                                                  snapshot
                                                      .data['recommended_fat']
                                                      .toString(),
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15.0,
                                                      color: Colors.orange[800],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white,
                                      boxShadow: Utils.getShadow(),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Allocated',
                                            style: GoogleFonts.openSans(),
                                          ),
                                          Text(
                                            'Protein',
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.0),
                                                child: Text(
                                                  total_protein.toString(),
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15.0,
                                                      color: Colors.red[200],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Text(
                                                  '/',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15.0,
                                                      color: Colors.red[600],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: Text(
                                                  snapshot.data[
                                                          'recommended_protein']
                                                      .toString(),
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15.0,
                                                      color: Colors.red[600],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: mealList,
                ),
              ],
            )),
      )),
    );
  }

  List<Widget> mealList = [];

  Future<void> getData() async {
    GoalController().getMealList({
      'user': Utils.profileUser.id.toString(),
      'meal_time': meal_time.toString(),
      'day': day.toString()
    }).then((value) {
      value.forEach((element) {
        mealList.add(getItemListWidget(element));
      });
      setState(() {
        doAddition();
      });
    });
  }

  Widget getItemListWidget(item) {
    TextEditingController _controller = TextEditingController();
    formEditingController.add({'id': item['id'], 'controller': _controller});

    _controller.text = item['value'].toString();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: _controller.text.isNotEmpty
                ? UtilColors.primaryColor
                : Colors.white,
            boxShadow: Utils.getShadow(),
            borderRadius: BorderRadius.circular(5.0)),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  item['name'].toString(),
                                  style: _controller.text.isNotEmpty
                                      ? GoogleFonts.openSans(
                                          color: UtilColors.whiteColor,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold)
                                      : GoogleFonts.openSans(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  width: Utils.displaySize.width,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: Utils.getShadow()),
                                  child: SizedBox(
                                    height: 30.0,
                                    width: 30.0,
                                    child: TextFormField(
                                      controller: _controller,
                                      decoration:
                                          Utils.getDefaultTextInputDecoration(
                                              _controller.text.isEmpty
                                                  ? 'grams'
                                                  : '',
                                              Icon(
                                                Icons.add,
                                                color: UtilColors.whiteColor
                                                    .withOpacity(0.6),
                                              )),
                                      cursorColor: Colors.black26,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ),
                            ))
                          ],
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                'Carbs : ' + item['carbs'].toString(),
                                style: _controller.text.isNotEmpty
                                    ? GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)
                                    : GoogleFonts.openSans(color: Colors.black),
                              )),
                              Expanded(
                                  child: Text('Fat : ' + item['fat'].toString(),
                                      style: _controller.text.isNotEmpty
                                          ? GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)
                                          : GoogleFonts.openSans(
                                              color: Colors.black))),
                              Expanded(
                                  child: Text(
                                      'Protein : ' + item['protein'].toString(),
                                      style: _controller.text.isNotEmpty
                                          ? GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)
                                          : GoogleFonts.openSans(
                                              color: Colors.black))),
                            ],
                          ),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  List<dynamic> formEditingController = [];

  void doAddition() async {
    Utils.showLoader(context);
    List<Map<String, String>> saveList = [];
    for (var element in formEditingController) {
      if (element['controller'].text.toString().isNotEmpty) {
        saveList.add({
          'id': element['id'].toString(),
          'value': element['controller'].text
        });
      }
    }
    await GoalController().enrollMealList({
      'user': Utils.profileUser.id.toString(),
      'day': day.toString(),
      'meal_time': meal_time.toString(),
      'data': jsonEncode(saveList)
    }).then((value) {
      Utils.hideLoaderCurrrent(context);
      setState(() {
        total_fat = double.parse(value['fat'].toString());
        total_carbs = double.parse(value['carbs'].toString());
        total_protein = double.parse(value['protein'].toString());
        Utils.showToast('Loading');
      });
    });
  }
}
