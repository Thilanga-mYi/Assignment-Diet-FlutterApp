import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/question_body_summery.dart';
import 'package:NutritionApplication/Views/Home/question_maintain_body_summery.dart';
import 'package:NutritionApplication/Views/Home/question_smp_values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionGoal extends StatefulWidget {
  QuestionGoal({Key? key}) : super(key: key);

  @override
  State<QuestionGoal> createState() => _QuestionGoalState();
}

class _QuestionGoalState extends State<QuestionGoal> {
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UtilColors.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Create New Goal',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "What is your Goal",
                  style: GoogleFonts.ubuntu(
                      color: UtilColors.blackColor,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w700),
                ),
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
                                  'Continue with Gain Weight Goal',
                                  style: GoogleFonts.openSans(
                                      color: (selectedCard == 1)
                                          ? UtilColors.primaryColor
                                          : UtilColors.blackColor,
                                      fontWeight: (selectedCard == 1)
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: 14.0),
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
                                  'Continue with Loss Weight Goal',
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
                                  height: 10.0,
                                ),
                                Text(
                                  'We recommend you to consult your physician before starting to follow any weight loss program',
                                  style: GoogleFonts.openSans(
                                      color: UtilColors.greyColor,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
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
                                  'Continue with Maintain Weight',
                                  style: GoogleFonts.openSans(
                                      color: (selectedCard == 3)
                                          ? UtilColors.primaryColor
                                          : UtilColors.blackColor,
                                      fontWeight: (selectedCard == 3)
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: 14.0),
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
                                  'Special Medical Purpose',
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
                                  height: 10.0,
                                ),
                                Text(
                                  'If having Diabetes, Cholesterol or Fatty Liver, we recommen to follow this goal',
                                  style: GoogleFonts.openSans(
                                      color: UtilColors.greyColor,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )),
                    )),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                        foregroundColor: MaterialStateProperty.all<Color>(
                            UtilColors.whiteColor),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            UtilColors.primaryColor),
                      ),
                      onPressed: () async {
                        Utils.goal!.goal_type_id = selectedCard;
                        if (selectedCard == 0) {
                          Utils.showToast('Please Select a Goal');
                        } else if (selectedCard == 1 || selectedCard == 2) {
                          Routes(context: context)
                              .navigate(QuestionBodySummery());
                        } else if (selectedCard == 3) {
                          Routes(context: context)
                              .navigate(QuestionMaintainBodySummery());
                        } else if (selectedCard == 4) {
                          Routes(context: context)
                              .navigate(QUestionSmpValues());
                        }
                      },
                    )))
          ],
        ),
      )),
    );
  }
}
