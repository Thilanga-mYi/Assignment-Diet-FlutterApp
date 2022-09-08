import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/question_drinkwater.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionDiseaseFattyLiver extends StatefulWidget {
  QuestionDiseaseFattyLiver({Key? key}) : super(key: key);

  @override
  State<QuestionDiseaseFattyLiver> createState() =>
      _QuestionDiseaseFattyLiverState();
}

class _QuestionDiseaseFattyLiverState extends State<QuestionDiseaseFattyLiver> {
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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        height: Utils.displaySize.height,
        width: Utils.displaySize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Image.asset(
                        UtilImages.df,
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        "Insert your Fatty Liver Value",
                        style: GoogleFonts.ubuntu(
                            color: UtilColors.blackColor,
                            fontSize: 19.0,
                            fontWeight: FontWeight.w700),
                      ),
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
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Yes',
                                        style: GoogleFonts.openSans(
                                            color: (selectedCard == 1)
                                                ? UtilColors.primaryColor
                                                : UtilColors.blackColor),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
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
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'No',
                                        style: GoogleFonts.openSans(
                                          color: (selectedCard == 2)
                                              ? UtilColors.primaryColor
                                              : UtilColors.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              width: Utils.displaySize.width * 0.8,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
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
                                // Utils.goal!.fatty_liver = selectedCard;
                                Routes(context: context)
                                    .navigate(QuestionDrinkWater());
                              }),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
