import 'package:NutritionApplication/Controllers/GoalController.dart';
import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalList extends StatefulWidget {
  GoalList({Key? key}) : super(key: key);

  @override
  State<GoalList> createState() => GoalListState();
}

class GoalListState extends State<GoalList> {
  @override
  void initState() {
    // TODO: implement initState
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
          title: const Text(
            'Goal History',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: goalList,
            ),
          ),
        )));
  }

  List<Widget> goalList = [];

  Future<void> getData() async {
    print('IN');
    GoalController().getGoalList({
      'user': Utils.profileUser.id.toString(),
    }).then((value) {
      value.forEach((element) {
        goalList.add(getGoalListWidget(element));
      });
      setState(() {});
    });
  }

  getGoalListWidget(goalItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: getShadowForList(),
            borderRadius: BorderRadius.circular(5.0)),
        child: Row(
          children: [
            Expanded(
                flex: 0,
                child: goalItem['body_type'] == 1
                    ? Image.asset(
                        UtilImages.body_type1,
                        width: 75.0,
                      )
                    : goalItem['body_type'] == 2
                        ? Image.asset(
                            UtilImages.body_type2,
                            width: 75.0,
                          )
                        : goalItem['body_type'] == 3
                            ? Image.asset(
                                UtilImages.body_type3,
                                width: 75.0,
                              )
                            : SizedBox.shrink()),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          getGoal(Utils.profileUser.goal),
                          style: GoogleFonts.openSans(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        getGoalMessage(goalItem),
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  getShadowForList() {
    return <BoxShadow>[
      const BoxShadow(
          color: Colors.black12,
          spreadRadius: -5,
          blurRadius: 5,
          offset: Offset(0, 4))
    ];
  }

  getShadowForRoundedButton() {
    return <BoxShadow>[
      const BoxShadow(
          color: Colors.black12,
          spreadRadius: -2,
          blurRadius: 5,
          offset: Offset(0, 4))
    ];
  }

  String getGoal(goal) {
    switch (goal['goal_type_id']) {
      case 1:
        return 'Weight Gain';
      case 2:
        return 'Weight Loss';
      case 3:
        return 'Weight Maintain';
      case 4:
        return 'Special Medical Purpose';
      default:
        return '';
    }
  }

  String getGoalWeight(weight) {
    switch (weight) {
      case 1:
        return '0.5';
      case 2:
        return '1';
      case 3:
        return '2';
      default:
        return '';
    }
  }

  String getGoalMessage(goal) {
    print(goal);
    String result = '';
    switch (goal['goal_type_id']) {
      case 1:
        result = 'Started at ' +
            goal['weight'].toString() +
            'Kgs, Target to gain ' +
            getGoalWeight(goal['goal_weight']) +
            'Kgs within a week';
        break;
      case 2:
        result = 'Started at ' +
            goal['weight'].toString() +
            'Kgs, Target to loss ' +
            getGoalWeight(goal['goal_weight']) +
            'Kgs within a week';
        break;
      case 3:
        result = 'Started at ' +
            goal['weight'].toString() +
            'Kgs, Target to maintain with ' +
            goal['weight'].toString() +
            'Kgs in next week';
        break;
      case 4:
        result = 'Started to create diet plan for special medical purpose';
        break;
    }

    return result;
  }
}
