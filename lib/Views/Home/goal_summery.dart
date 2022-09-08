import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/dashboard.dart';
import 'package:NutritionApplication/Views/Home/transaction.dart';
import 'package:NutritionApplication/Views/Home/weekdays.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalSummery extends StatefulWidget {
  GoalSummery({Key? key}) : super(key: key);

  @override
  State<GoalSummery> createState() => _GoalSummeryState();
}

class _GoalSummeryState extends State<GoalSummery> {
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
          'Goal Insights & Result',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: SizedBox(
        height: Utils.displaySize.height,
        width: Utils.displaySize.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                      'Total Daily Exercise Expenditure (TDEE)',
                                      style: GoogleFonts.openSans(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  width: Utils.displaySize.height,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: Utils.getShadow(),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.5),
                                        child: Text(
                                          Utils.tdee.toString(),
                                          style: GoogleFonts.openSans(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.5),
                                        child: Text(
                                          'Calories / Per Day',
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  width: Utils.displaySize.height,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: Utils.getShadow(),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.5),
                                        child: Text(
                                          Utils.tdee_week.toString().toString(),
                                          style: GoogleFonts.openSans(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.5),
                                        child: Text(
                                          'Calories / Per Week',
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  width: Utils.displaySize.height,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: Utils.getShadow(),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.5),
                                        child: Text(
                                          Utils.drinking_water.toString() +
                                              ' L',
                                          style: GoogleFonts.openSans(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.5),
                                        child: Text(
                                          'Drinking Water Level',
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  Utils.gender == 1
                                      ? 'We always recommend you to drink more than 3.7 liters of water'
                                      : 'We always recommend you to drink more than 2.7 liters of water',
                                  style: GoogleFonts.openSans(
                                      color: UtilColors.primaryColor,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  width: Utils.displaySize.height,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: Utils.getShadow(),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                child: Image.asset(
                                                  UtilImages.bmr,
                                                  width: 75.0,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2.5),
                                                child: Text(
                                                  Utils.bmr.toString(),
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2.5),
                                                child: Text(
                                                  'Calories / Per Week',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      children: [
                        Utils.payment_status == 0
                            ? SizedBox(
                                width: double.infinity,
                                height: Utils.displaySize.height * 0.06,
                                child: TextButton(
                                    child: Text(
                                      "ENTER REFERENCE NO",
                                      style: GoogleFonts.openSans(
                                          fontSize: 15.0,
                                          color: UtilColors.whiteColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              UtilColors.whiteColor),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              UtilColors.primaryColor),
                                    ),
                                    onPressed: () => Routes(context: context)
                                        .navigate(Transaction())),
                              )
                            : SizedBox(
                                width: double.infinity,
                                height: Utils.displaySize.height * 0.06,
                                child: TextButton(
                                    child: Text(
                                      "GENERATE DIET PLAN",
                                      style: GoogleFonts.openSans(
                                          fontSize: 15.0,
                                          color: UtilColors.whiteColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              UtilColors.whiteColor),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              UtilColors.primaryColor),
                                    ),
                                    onPressed: () {
                                      Utils.profileUser
                                                  .goal['payment_status'] ==
                                              1
                                          ? Routes(context: context)
                                              .navigate(Weekdays())
                                          : Utils.showToast(
                                              "Payment approval is pending");
                                    }),
                              ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: Utils.displaySize.height * 0.06,
                          child: TextButton(
                              child: Text(
                                "BACK TO DASHBOARD",
                                style: GoogleFonts.openSans(
                                    fontSize: 15.0,
                                    color: UtilColors.primaryColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        UtilColors.primaryColor),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        UtilColors.whiteColor),
                              ),
                              onPressed: () => Routes(context: context)
                                  .navigate(Dashboard())),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
