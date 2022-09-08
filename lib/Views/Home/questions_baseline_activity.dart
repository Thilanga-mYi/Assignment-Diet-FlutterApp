import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/goal_summery.dart';
import 'package:NutritionApplication/Views/Home/question_disease_diabetes.dart';
import 'package:NutritionApplication/Views/Home/question_drinkwater.dart';
import 'package:NutritionApplication/Views/Home/question_vegan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionBaselineActivityLevel extends StatefulWidget {
  QuestionBaselineActivityLevel({Key? key}) : super(key: key);

  @override
  State<QuestionBaselineActivityLevel> createState() =>
      _QuestionBaselineActivityLevelState();
}

class _QuestionBaselineActivityLevelState
    extends State<QuestionBaselineActivityLevel> {
  int selectedCard = 0;

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
          'Create New Goal',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: Utils.displaySize.height,
          width: Utils.displaySize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'Whats is your baseline activity level ?',
                      style: GoogleFonts.ubuntu(
                          color: UtilColors.blackColor,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                    child: Text(
                      'Not including workouts-we count that seperatly',
                      style: GoogleFonts.openSans(
                          color: UtilColors.greyColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCard = 1;
                          });
                        },
                        child: SizedBox(
                            width: Utils.displaySize.width * 0.8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: (selectedCard == 1)
                                          ? UtilColors.primaryColor
                                          : UtilColors.greyColor),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Not Very Active',
                                    style: GoogleFonts.openSans(
                                        color: (selectedCard == 1)
                                            ? UtilColors.primaryColor
                                            : UtilColors.blackColor,
                                        fontWeight: (selectedCard == 1)
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        fontSize: 14.0),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Spend most of the day sitting (e.g., bankteller, desk job)',
                                    style: GoogleFonts.openSans(
                                        color: (selectedCard == 1)
                                            ? UtilColors.blackColor
                                            : UtilColors.greyColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.0),
                                  ),
                                ],
                              ),
                            )),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCard = 2;
                          });
                        },
                        child: SizedBox(
                            width: Utils.displaySize.width * 0.8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: (selectedCard == 2)
                                          ? UtilColors.primaryColor
                                          : UtilColors.greyColor),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lightly Active',
                                    style: GoogleFonts.openSans(
                                        color: (selectedCard == 2)
                                            ? UtilColors.primaryColor
                                            : UtilColors.blackColor,
                                        fontWeight: (selectedCard == 2)
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        fontSize: 14.0),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Spend a goofd part of the day on your feet (e.g., teacher, sales person)',
                                    style: GoogleFonts.openSans(
                                        color: (selectedCard == 2)
                                            ? UtilColors.blackColor
                                            : UtilColors.greyColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.0),
                                  ),
                                ],
                              ),
                            )),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCard = 3;
                          });
                        },
                        child: SizedBox(
                            width: Utils.displaySize.width * 0.8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: (selectedCard == 3)
                                          ? UtilColors.primaryColor
                                          : UtilColors.greyColor),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Moderately Active',
                                    style: GoogleFonts.openSans(
                                        color: (selectedCard == 3)
                                            ? UtilColors.primaryColor
                                            : UtilColors.blackColor,
                                        fontWeight: (selectedCard == 3)
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        fontSize: 14.0),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'moderate jobs and occupations/exercise/ sports 6-7 days/week',
                                    style: GoogleFonts.openSans(
                                        color: (selectedCard == 3)
                                            ? UtilColors.blackColor
                                            : UtilColors.greyColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.0),
                                  ),
                                ],
                              ),
                            )),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCard = 4;
                          });
                        },
                        child: SizedBox(
                            width: Utils.displaySize.width * 0.8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: (selectedCard == 4)
                                          ? UtilColors.primaryColor
                                          : UtilColors.greyColor),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Very Active',
                                    style: GoogleFonts.openSans(
                                        color: (selectedCard == 4)
                                            ? UtilColors.primaryColor
                                            : UtilColors.blackColor,
                                        fontWeight: (selectedCard == 4)
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        fontSize: 14.0),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Spend most of the day sone physical activity (e.g., food server, postal carrier)',
                                    style: GoogleFonts.openSans(
                                        color: (selectedCard == 4)
                                            ? UtilColors.blackColor
                                            : UtilColors.greyColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.0),
                                  ),
                                ],
                              ),
                            )),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCard = 5;
                          });
                        },
                        child: SizedBox(
                            width: Utils.displaySize.width * 0.8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: (selectedCard == 5)
                                          ? UtilColors.primaryColor
                                          : UtilColors.greyColor),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Extremely Active',
                                    style: GoogleFonts.openSans(
                                        color: (selectedCard == 5)
                                            ? UtilColors.primaryColor
                                            : UtilColors.blackColor,
                                        fontWeight: (selectedCard == 5)
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        fontSize: 14.0),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Spend a good part of the day doing heavy physical acrtivity (e.g., bike massenger, carpenter)',
                                    style: GoogleFonts.openSans(
                                        color: (selectedCard == 5)
                                            ? UtilColors.blackColor
                                            : UtilColors.greyColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.0),
                                  ),
                                ],
                              ),
                            )),
                      )),
                ],
              ),
              SizedBox(
                width: Utils.displaySize.width * 0.8,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: Utils.displaySize.height * 0.06,
                            child: TextButton(
                                child: Text(
                                  "NEXT",
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
                                  if (selectedCard == 0) {
                                    Utils.showToast(
                                        "Please Select a Baseline Activity");
                                  } else {
                                    Utils.goal!.activity_level = selectedCard;
                                    Routes(context: context)
                                        .navigate(QuestionVegan());
                                  }
                                }),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
