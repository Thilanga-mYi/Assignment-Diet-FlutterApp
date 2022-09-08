import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/question_drinkwater.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionVegan extends StatefulWidget {
  QuestionVegan({Key? key}) : super(key: key);

  @override
  State<QuestionVegan> createState() => _QuestionVeganState();
}

class _QuestionVeganState extends State<QuestionVegan> {
  int SelectedValue = 0;

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
          child: SizedBox(
        width: Utils.displaySize.width,
        height: Utils.displaySize.height,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Text(
                      'What is yout prefered meal type. Please Select one from below'),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          SelectedValue = 1;
                        });
                      },
                      child: SizedBox(
                          width: Utils.displaySize.width * 0.8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (SelectedValue == 1)
                                        ? UtilColors.primaryColor
                                        : UtilColors.greyColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 0,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(
                                        Icons.eco,
                                        color: SelectedValue == 1
                                            ? UtilColors.primaryColor
                                            : Colors.black,
                                      ),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.5),
                                          child: Text(
                                            'Vegan + Milk',
                                            style: GoogleFonts.openSans(
                                                color: (SelectedValue == 1)
                                                    ? UtilColors.primaryColor
                                                    : UtilColors.blackColor,
                                                fontWeight: (SelectedValue == 1)
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                fontSize: 16.0),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          SelectedValue = 2;
                        });
                      },
                      child: SizedBox(
                          width: Utils.displaySize.width * 0.8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (SelectedValue == 2)
                                        ? UtilColors.primaryColor
                                        : UtilColors.greyColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.5),
                                    child: Text(
                                      'Vegan + Fish',
                                      style: GoogleFonts.openSans(
                                          color: (SelectedValue == 2)
                                              ? UtilColors.primaryColor
                                              : UtilColors.blackColor,
                                          fontWeight: (SelectedValue == 2)
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          fontSize: 16.0),
                                    )),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.symmetric(vertical: 2.5),
                                //   child: Text(
                                //     'Continue with Gain Weight Goal',
                                //     style: GoogleFonts.openSans(
                                //         color: (SelectedValue == 1)
                                //             ? UtilColors.primaryColor
                                //             : UtilColors.blackColor),
                                //   ),
                                // )
                              ],
                            ),
                          )),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          SelectedValue = 3;
                        });
                      },
                      child: SizedBox(
                          width: Utils.displaySize.width * 0.8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (SelectedValue == 3)
                                        ? UtilColors.primaryColor
                                        : UtilColors.greyColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.5),
                                    child: Text(
                                      'Vegan + Egg',
                                      style: GoogleFonts.openSans(
                                          color: (SelectedValue == 3)
                                              ? UtilColors.primaryColor
                                              : UtilColors.blackColor,
                                          fontWeight: (SelectedValue == 3)
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          fontSize: 16.0),
                                    )),
                              ],
                            ),
                          )),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          SelectedValue = 4;
                        });
                      },
                      child: SizedBox(
                          width: Utils.displaySize.width * 0.8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (SelectedValue == 4)
                                        ? UtilColors.primaryColor
                                        : UtilColors.greyColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.5),
                                    child: Text(
                                      'Vegan + Egg + Milk',
                                      style: GoogleFonts.openSans(
                                          color: (SelectedValue == 4)
                                              ? UtilColors.primaryColor
                                              : UtilColors.blackColor,
                                          fontWeight: (SelectedValue == 4)
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          fontSize: 16.0),
                                    )),
                              ],
                            ),
                          )),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          SelectedValue = 5;
                        });
                      },
                      child: SizedBox(
                          width: Utils.displaySize.width * 0.8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (SelectedValue == 5)
                                        ? UtilColors.primaryColor
                                        : UtilColors.greyColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.5),
                                    child: Text(
                                      'Non Vegan',
                                      style: GoogleFonts.openSans(
                                          color: (SelectedValue == 5)
                                              ? UtilColors.primaryColor
                                              : UtilColors.blackColor,
                                          fontWeight: (SelectedValue == 5)
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          fontSize: 16.0),
                                    )),
                              ],
                            ),
                          )),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
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
                          if (SelectedValue == 0) {
                            Utils.showToast('Please select a meal type');
                          } else {
                            Utils.goal!.vegi_type = SelectedValue;
                            Routes(context: context)
                                .navigate(QuestionDrinkWater());
                          }
                        },
                      )),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
