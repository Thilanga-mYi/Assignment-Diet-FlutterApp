import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/questions_baseline_activity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionBodyType extends StatefulWidget {
  QuestionBodyType({Key? key}) : super(key: key);

  @override
  State<QuestionBodyType> createState() => _QuestionBodyTypeState();
}

class _QuestionBodyTypeState extends State<QuestionBodyType> {
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
          child: SizedBox(
        height: Utils.displaySize.height - Utils.displaySize.height / 4.5,
        width: Utils.displaySize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "Select Body Summery",
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
                                color: Colors.white,
                                border: Border.all(
                                    color: (selectedCard == 1)
                                        ? UtilColors.primaryColor
                                        : UtilColors.greyColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 0,
                                        child:
                                            Image.asset(UtilImages.body_type1)),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Ectomorph",
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 19.0,
                                                fontWeight: FontWeight.w700,
                                                color: (selectedCard == 1)
                                                    ? UtilColors.primaryColor
                                                    : UtilColors.blackColor),
                                          ),
                                          Text(
                                            'Lean and long, fast metabolism',
                                            style: GoogleFonts.openSans(
                                                color: (selectedCard == 1)
                                                    ? UtilColors.primaryColor
                                                    : UtilColors.blackColor),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
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
                          selectedCard = 2;
                        });
                      },
                      child: SizedBox(
                          width: Utils.displaySize.width * 0.8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: (selectedCard == 2)
                                        ? UtilColors.primaryColor
                                        : UtilColors.greyColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 0,
                                        child:
                                            Image.asset(UtilImages.body_type2)),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mesomorph",
                                            style: GoogleFonts.ubuntu(
                                                color: (selectedCard == 2)
                                                    ? UtilColors.primaryColor
                                                    : UtilColors.blackColor,
                                                fontSize: 19.0,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            'Muscular and well-built, average metabolism',
                                            style: GoogleFonts.openSans(
                                                color: (selectedCard == 2)
                                                    ? UtilColors.primaryColor
                                                    : UtilColors.blackColor),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
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
                          selectedCard = 3;
                        });
                      },
                      child: SizedBox(
                          width: Utils.displaySize.width * 0.8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: (selectedCard == 3)
                                        ? UtilColors.primaryColor
                                        : UtilColors.greyColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 0,
                                        child:
                                            Image.asset(UtilImages.body_type3)),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Ectomorph",
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 19.0,
                                                fontWeight: FontWeight.w700,
                                                color: (selectedCard == 3)
                                                    ? UtilColors.primaryColor
                                                    : UtilColors.blackColor),
                                          ),
                                          Text(
                                            'Soft and round, slow metabolism',
                                            style: GoogleFonts.openSans(
                                                color: (selectedCard == 3)
                                                    ? UtilColors.primaryColor
                                                    : UtilColors.blackColor),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
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
                      onPressed: () {
                        if (selectedCard == 0) {
                          Utils.showToast("Please Select a Body Type");
                        } else {
                          Utils.goal!.body_type = selectedCard;
                          Routes(context: context)
                              .navigate(QuestionBaselineActivityLevel());
                        }
                      })),
            )
          ],
        ),
      )),
    );
  }
}
