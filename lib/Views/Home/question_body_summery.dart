import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/question_body_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionBodySummery extends StatefulWidget {
  QuestionBodySummery({Key? key}) : super(key: key);

  @override
  State<QuestionBodySummery> createState() => _QuestionBodySummeryState();
}

class _QuestionBodySummeryState extends State<QuestionBodySummery> {
  int selected_value = 0;

  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: Utils.displaySize.height - Utils.displaySize.height / 6,
          width: Utils.displaySize.width,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'How tall are you?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.5),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextFormField(
                                controller: _height,
                                decoration: Utils.getDefaultTextInputDecoration(
                                    'Height (cm)',
                                    Icon(
                                      Icons.add,
                                      color: UtilColors.whiteColor
                                          .withOpacity(0.6),
                                    )),
                                cursorColor: UtilColors.primaryColor,
                                keyboardType: TextInputType.emailAddress,
                                style: Utils.getprimaryFieldTextStyle(
                                    UtilColors.greyColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'How much do you weight',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'No need to solid value you can estimate and update later',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _weight,
                          decoration: Utils.getDefaultTextInputDecoration(
                              'Current Weight (Kg)',
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
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'Goal Loss Weight / Per Week',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'Select weekly target loss weight below.',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected_value = 1;
                            });
                          },
                          child: SizedBox(
                              width: Utils.displaySize.width * 0.8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: (selected_value == 1)
                                            ? UtilColors.primaryColor
                                            : UtilColors.greyColor),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '0.5 Kgs',
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold,
                                          color: (selected_value == 1)
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
                              selected_value = 2;
                            });
                          },
                          child: SizedBox(
                              width: Utils.displaySize.width * 0.8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: (selected_value == 2)
                                            ? UtilColors.primaryColor
                                            : UtilColors.greyColor),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '1 Kgs',
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        color: (selected_value == 2)
                                            ? UtilColors.primaryColor
                                            : UtilColors.blackColor,
                                      ),
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
                              selected_value = 3;
                            });
                          },
                          child: SizedBox(
                              width: Utils.displaySize.width * 0.8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: (selected_value == 3)
                                            ? UtilColors.primaryColor
                                            : UtilColors.greyColor),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '2 Kgs',
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        color: (selected_value == 3)
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
                  ),
                ),
                SizedBox(
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
                                    if (selected_value == 0 ||
                                        _height.text == '' ||
                                        _height.text == null ||
                                        _weight.text == '' ||
                                        _weight == null) {
                                      Utils.showToast(
                                          'Incorrect Data. Please Insert Correct Values');
                                    } else {
                                      Utils.goal!.goal_weight =
                                          selected_value.toDouble();
                                      Utils.goal!.height =
                                          double.parse(_height.text);
                                      Utils.goal!.weight =
                                          double.parse(_weight.text);
                                      Routes(context: context)
                                          .navigate(QuestionBodyType());
                                    }
                                  },
                                )),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
