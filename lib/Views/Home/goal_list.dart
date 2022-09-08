import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalList extends StatefulWidget {
  GoalList({Key? key}) : super(key: key);

  @override
  State<GoalList> createState() => GoalListState();
}

class GoalListState extends State<GoalList> {
  final List _staffList = getGoalList();

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
            'Assigned Goals',
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
              children: [
                for (var goalItem in _staffList) getGoalListWidget(goalItem)
                // getGoalListWidget(),
              ],
            ),
          ),
        )));
  }

  getGoalListWidget(goalItem) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          goalItem['transaction_status'] == 1
              ? GestureDetector(
                  onTap: () => Routes(context: context).navigate(Transaction()),
                  child: Container(
                    margin: const EdgeInsets.only(left: 15.0),
                    padding: const EdgeInsets.all(17.5),
                    decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        boxShadow: getShadowForRoundedButton(),
                        borderRadius: BorderRadius.circular(100.0)),
                    child: const Icon(
                      Icons.receipt,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            padding: const EdgeInsets.all(17.5),
            decoration: BoxDecoration(
                color: Colors.red[400],
                boxShadow: getShadowForRoundedButton(),
                borderRadius: BorderRadius.circular(100.0)),
            child: const Icon(
              Icons.delete_outline_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      child: Padding(
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
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: goalItem['goal_type'] != 4
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    goalItem['name'],
                                    style: GoogleFonts.openSans(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    goalItem['goal'],
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    goalItem['name'],
                                    style: GoogleFonts.openSans(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    goalItem['goal'],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Row(
                                    children: [
                                      goalItem['diabetes'] == 1
                                          ? Expanded(
                                              flex: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Image.asset(
                                                  UtilImages.dd,
                                                  width: 50.0,
                                                ),
                                              ))
                                          : const SizedBox.shrink(),
                                      goalItem['cholesterol'] == 1
                                          ? Expanded(
                                              flex: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Image.asset(
                                                  UtilImages.dc,
                                                  width: 50.0,
                                                ),
                                              ))
                                          : const SizedBox.shrink(),
                                      goalItem['fatty_liver'] == 1
                                          ? Expanded(
                                              flex: 0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Image.asset(
                                                  UtilImages.df,
                                                  width: 50.0,
                                                ),
                                              ))
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                )
                              ],
                            )))
            ],
          ),
        ),
      ),
    );
  }

  static List getGoalList() {
    List record = [
      {
        'id': 1,
        'goal_type': 4,
        'diabetes': 1,
        'cholesterol': 1,
        'fatty_liver': 1,
        'name': 'Special Medical Purpose',
        'goal':
            'Goal created as special medical pupose, Keep update with your Diabetes, Cholesterol and Fatty Liver Values',
        'body_type': 0,
        'activity_level': 0,
        'active_status': 2,
        'transaction_status': 2,
      },
      {
        'id': 1,
        'goal_type': 1,
        'diabetes': 0,
        'cholesterol': 0,
        'fatty_liver': 0,
        'name': 'Weight Loss',
        'goal': 'Started at 92Kgs, target to loss to 82 Kgs',
        'body_type': 3,
        'activity_level': 3,
        'active_status': 2,
        'transaction_status': 2,
      },
      {
        'id': 1,
        'goal_type': 3,
        'diabetes': 0,
        'cholesterol': 0,
        'fatty_liver': 0,
        'name': 'Weight Maintain',
        'goal': 'Started at 82Kgs, target to maintain to 82 Kgs',
        'body_type': 2,
        'activity_level': 4,
        'active_status': 2,
        'transaction_status': 2,
      },
    ];
    return record;
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
}
