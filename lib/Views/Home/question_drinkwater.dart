import 'package:NutritionApplication/Controllers/GoalController.dart';
import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Goal.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/dashboard.dart';
import 'package:NutritionApplication/Views/Home/goal_summery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionDrinkWater extends StatefulWidget {
  QuestionDrinkWater({Key? key}) : super(key: key);

  @override
  State<QuestionDrinkWater> createState() => _QuestionDrinkWaterState();
}

class _QuestionDrinkWaterState extends State<QuestionDrinkWater> {
  TextEditingController _drink_water = TextEditingController();

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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        height: Utils.displaySize.height,
        width: Utils.displaySize.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Image.asset(
                          UtilImages.question_water_icon,
                          width: 140.0,
                          height: 140.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "Insert Daily Drink Water",
                          style: GoogleFonts.openSans(
                              color: UtilColors.blackColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _drink_water,
                          decoration: Utils.getDefaultTextInputDecoration(
                              'Insert your daily drink water (L)',
                              Icon(
                                Icons.add,
                                color: UtilColors.whiteColor.withOpacity(0.6),
                              )),
                          cursorColor: UtilColors.primaryColor,
                          keyboardType: TextInputType.emailAddress,
                          style: Utils.getprimaryFieldTextStyle(
                              UtilColors.greyColor),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: Utils.displaySize.height * 0.06,
                        child: TextButton(
                            child: Text(
                              "CREATE GOAL",
                              style: GoogleFonts.openSans(
                                  fontSize: 15.0,
                                  color: UtilColors.whiteColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  UtilColors.primaryColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  UtilColors.primaryColor),
                            ),
                            onPressed: () {
                              if (_drink_water.text == '' ||
                                  _drink_water == null) {
                                Utils.showToast(
                                    "Please add a Drink Water Value");
                              } else {
                                Utils.goal!.drink_water =
                                    double.parse(_drink_water.text);
                                Utils.showLoader(context);
                                GoalController()
                                    .enroll(Utils.goal!.toJson())
                                    .then((value) {
                                  Utils.goal = Goal();

                                  Utils.hideLoaderCurrrent(context);
                                  Routes(context: context)
                                      .navigate(GoalSummery());
                                });
                              }
                            }),
                      )
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
