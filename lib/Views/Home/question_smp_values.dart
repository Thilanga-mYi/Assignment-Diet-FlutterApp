import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/question_body_summery.dart';
import 'package:NutritionApplication/Views/Home/question_drinkwater.dart';
import 'package:NutritionApplication/Views/Home/question_maintain_body_summery.dart';
import 'package:NutritionApplication/Views/Home/question_vegan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QUestionSmpValues extends StatefulWidget {
  QUestionSmpValues({Key? key}) : super(key: key);

  @override
  State<QUestionSmpValues> createState() => _QUestionSmpValuesState();
}

class _QUestionSmpValuesState extends State<QUestionSmpValues> {
  TextEditingController _diabetes = TextEditingController();
  TextEditingController _cholesterol = TextEditingController();
  TextEditingController _fatty_liver = TextEditingController();

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
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                      'Before you create Special Medical Goal, You must have your diabetes, cholesterol and fatty liver values.'),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 0,
                            child: Image.asset(
                              UtilImages.dd,
                              width: 75.0,
                            )),
                        Expanded(
                            flex: 0,
                            child: Image.asset(
                              UtilImages.dc,
                              width: 75.0,
                            )),
                        Expanded(
                            flex: 0,
                            child: Image.asset(
                              UtilImages.df,
                              width: 75.0,
                            )),
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'What is Your Diabetes Fasting Value',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _diabetes,
                          decoration: Utils.getDefaultTextInputDecoration(
                              'Fasting Diabetes Value',
                              Icon(
                                Icons.add,
                                color: UtilColors.whiteColor.withOpacity(0.6),
                              )),
                          cursorColor: UtilColors.primaryColor,
                          keyboardType: TextInputType.number,
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
                    'What is Your Cholesterol Value',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _cholesterol,
                          decoration: Utils.getDefaultTextInputDecoration(
                              'Cholesterol Value',
                              Icon(
                                Icons.add,
                                color: UtilColors.whiteColor.withOpacity(0.6),
                              )),
                          cursorColor: UtilColors.primaryColor,
                          keyboardType: TextInputType.number,
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
                    'What is Your Fatty Liver Value',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _fatty_liver,
                          decoration: Utils.getDefaultTextInputDecoration(
                              'Fatty Liver Value',
                              Icon(
                                Icons.add,
                                color: UtilColors.whiteColor.withOpacity(0.6),
                              )),
                          cursorColor: UtilColors.primaryColor,
                          keyboardType: TextInputType.number,
                          style: Utils.getprimaryFieldTextStyle(
                              UtilColors.greyColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20.0),
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
                            if (_diabetes.text == '' ||
                                _diabetes.text == null ||
                                _cholesterol.text == '' ||
                                _cholesterol.text == null ||
                                _fatty_liver == '' ||
                                _fatty_liver == null) {
                              Utils.showToast(
                                  'Valus can not be Null. Please Try Again');
                            } else {
                              Utils.goal!.diabetes =
                                  double.parse(_diabetes.text);
                              Utils.goal!.cholesterol =
                                  double.parse(_cholesterol.text);
                              Utils.goal!.fatty_liver =
                                  double.parse(_fatty_liver.text);
                              Routes(context: context)
                                  .navigate(QuestionMaintainBodySummery());
                            }
                          },
                        )))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
