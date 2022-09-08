import 'package:NutritionApplication/Controllers/GoalController.dart';
import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Goal.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Payment.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/dashboard.dart';
import 'package:NutritionApplication/Views/Home/weekdays.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transaction extends StatefulWidget {
  Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  TextEditingController _slip = TextEditingController();

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
          'Payment',
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
                          UtilImages.transaction,
                          width: 120.0,
                          height: 120.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "Enter your slip number",
                          style: GoogleFonts.openSans(
                              color: UtilColors.blackColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _slip,
                          decoration: Utils.getDefaultTextInputDecoration(
                              'Enter your slip number',
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
                              "ADD PAYMENT",
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
                            onPressed: () async {
                              if (_slip.text == '' || _slip.text == null) {
                                Utils.showToast("Payment Slip Cannot be Null");
                              } else {
                                Utils.showLoader(context);
                                Utils.payment!.ref = _slip.text;
                                GoalController()
                                    .enrollPayment(Utils.payment!.toJson())
                                    .then((value) {
                                  Utils.payment = Payment();
                                  Utils.hideLoaderCurrrent(context);
                                  Routes(context: context)
                                      .navigate(Dashboard());
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
