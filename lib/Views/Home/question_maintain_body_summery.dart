import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/question_body_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionMaintainBodySummery extends StatefulWidget {
  QuestionMaintainBodySummery({Key? key}) : super(key: key);

  @override
  State<QuestionMaintainBodySummery> createState() =>
      _QuestionMaintainBodySummeryState();
}

class _QuestionMaintainBodySummeryState
    extends State<QuestionMaintainBodySummery> {
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextFormField(
                                controller: _height,
                                decoration: Utils.getDefaultTextInputDecoration(
                                    'Height (ft)',
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
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                      SizedBox(
                        height: 10.0,
                      ),
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
                                    Utils.goal!.goal_weight = 0;
                                    Utils.goal!.height =
                                        double.parse(_height.text);
                                    Utils.goal!.weight =
                                        double.parse(_weight.text);
                                    Routes(context: context)
                                        .navigate(QuestionBodyType());
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
