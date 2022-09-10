import 'package:NutritionApplication/Controllers/GoalController.dart';
import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Goal.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Auth/Login.dart';
import 'package:NutritionApplication/Views/Home/goal_list.dart';
import 'package:NutritionApplication/Views/Home/goal_summery.dart';
import 'package:NutritionApplication/Views/Home/question_goal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.bar_chart_rounded,
          color: UtilColors.primaryColor,
        ),
        backgroundColor: UtilColors.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Routes(context: context).navigateReplace(Login()),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.logout_rounded),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: Utils.getShadow(),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  'Welcome',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                    'Glad to see you again. Please refer below sections to reach your goal or set a new.'),
                              )
                            ],
                          )))),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () =>
                            Routes(context: context).navigate(QuestionGoal()),
                        child: (Utils.profileUser.goal == null)
                            ? Container(
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: Utils.getShadow(),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5.0),
                                        child: Icon(
                                          Icons.add,
                                          size: 36.0,
                                          color: UtilColors.primaryColor,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text('Create New Goal'),
                                      )
                                    ],
                                  ),
                                )))
                            : const SizedBox.shrink(),
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () =>
                            Routes(context: context).navigate(GoalList()),
                        child: Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: Utils.getShadow(),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: Icon(
                                      Icons.history,
                                      size: 36.0,
                                      color: UtilColors.primaryColor,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text('Goal History'),
                                  )
                                ],
                              ),
                            ))),
                      )),
                ],
              ),
              const SizedBox(height: 2.5),
              GestureDetector(
                onTap: () async {
                  Utils.showLoader(context);
                  await GoalController().getGoalDetails(
                      {'user': Utils.profileUser.id.toString()}).then((value) {
                    Utils.hideLoaderCurrrent(context);
                    Routes(context: context).navigate(GoalSummery());
                  });
                },
                child: (Utils.profileUser.goal != null)
                    ? Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: Utils.getShadow(),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Text(
                                            getGoal(Utils.profileUser.goal),
                                            style: GoogleFonts.openSans(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Text(
                                          getGoalMessage(
                                              Utils.profileUser.goal),
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 0,
                                                child: Icon(
                                                  Icons.do_not_disturb_on_sharp,
                                                  color: Utils.profileUser.goal[
                                                              'payment_status'] ==
                                                          1
                                                      ? Colors.greenAccent
                                                      : Colors.amberAccent,
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0),
                                                  child: Text(
                                                    Utils.profileUser.goal[
                                                                'payment_status'] ==
                                                            1
                                                        ? 'Payment Accepted'
                                                        : 'Payment Pending',
                                                    style: GoogleFonts.openSans(
                                                        fontSize: 12.0),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: UtilColors.primaryColor,
                                    ),
                                  ))
                            ],
                          ),
                        )))
                    : const SizedBox.shrink(),
              )
            ],
          ),
        ),
      )),
    );
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
