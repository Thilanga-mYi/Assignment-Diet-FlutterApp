import 'package:NutritionApplication/Models/Goal.dart';
import 'package:NutritionApplication/Models/Payment.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Strings.dart';
import 'package:NutritionApplication/Models/User.dart';
import 'package:NutritionApplication/Views/Widgets/PopUps/PopUpLoading.dart';

class Utils {
  //Fonts Start
  static double smallFonts = 10.0;
  static double xlFonts = 30.0;

  static Goal? goal = Goal();
  static Payment? payment = Payment();

  static String bmr = "0";
  static String tdee = "0";
  static String tdee_week = "0";
  static String drinking_water = "0";
  static int gender = 1;
  static int payment_status = 0;

  //Fonts End

  static late Size displaySize;
  static late User profileUser;

  static var loadingMessage;

  static var lightNavbar = SystemUiOverlayStyle.light.copyWith(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: UtilColors.blackColor,
      statusBarColor: UtilColors.primaryStatusBarColor);

  static var darkNavbar = SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: UtilColors.blackColor,
      statusBarColor: UtilColors.primaryStatusBarColor);

  //TextStyles
  static TextStyle getprimaryStyle(Color color) {
    return GoogleFonts.openSans(color: color);
  }

  static TextStyle getprimaryStyleSmall(Color color) {
    return GoogleFonts.openSans(color: color, fontSize: 13.0);
  }

  static TextStyle getprimaryBoldStyle(Color color) {
    return GoogleFonts.openSans(color: color, fontWeight: FontWeight.bold);
  }

  static TextStyle getprimaryFieldTextStyle(Color color) {
    return GoogleFonts.openSans(color: UtilColors.blackColor, fontSize: 13.0);
  }

  static TextStyle getprimaryFieldTextStylePopUp(Color color) {
    return GoogleFonts.openSans(color: UtilColors.primaryColor, fontSize: 13.0);
  }

  //TextFormField Styles

  static double borderRadius = 5.0;
  static double buttonBorderRadius = 5.0;

  static InputDecoration getDefaultTextInputDecoration(
      String label, Icon suffixIcon) {
    return InputDecoration(
        labelText: label,
        errorStyle: TextStyle(fontSize: 11, color: Colors.red),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        labelStyle: TextStyle(fontSize: 13.0, color: UtilColors.greyColor),
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: UtilColors.secondaryColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: UtilColors.primaryColor, width: 1),
        ));
  }

  static InputDecoration getDefaultDropDownInputDecoration(
      String label, Icon suffixIcon) {
    return InputDecoration(
        errorStyle: TextStyle(fontSize: 11, color: Colors.red),
        labelStyle: TextStyle(fontSize: 13.0, color: UtilColors.greyColor),
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: UtilColors.secondaryColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: UtilColors.primaryColor, width: 1),
        ));
  }

  //Loading Widgets

  static bool checkShowLoader = false;
  static late BuildContext parentLoadingContext;

  static Widget getListLoader() {
    return Wrap(
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: CircularProgressIndicator(),
        )
      ],
    );
  }

  static Widget getEmptyList() {
    return Center(
      child: AutoSizeText(
        UtilStrings.emptyList,
        style:
            GoogleFonts.openSans(fontSize: 15.0, color: UtilColors.blackColor),
      ),
    );
  }

  static Future showLoader(context) async {
    await showDialog(
      context: context,
      builder: (_) => PopUpLoading(),
    ).then((onValue) {
      parentLoadingContext = context;
      checkShowLoader = true;
    });
  }

  static Future showConfirmation(
    context,
  ) async {
    await showDialog(
      context: context,
      builder: (_) => PopUpLoading(),
    ).then((onValue) {
      parentLoadingContext = context;
      checkShowLoader = true;
    });
  }

  static Future showLoaderWithCustomMessage(context, message) async {
    Utils.loadingMessage = message;
    await showDialog(
      context: context,
      builder: (_) => PopUpLoading(),
    ).then((onValue) {
      parentLoadingContext = context;
      checkShowLoader = true;
    });
  }

  static Future hideLoader() async {
    if (checkShowLoader == true && parentLoadingContext != null) {
      Navigator.pop(parentLoadingContext);
      checkShowLoader = false;
      Utils.loadingMessage = null;
    }
  }

  static Future hideLoaderCurrrent(context) async {
    Navigator.pop(context);
    checkShowLoader = false;
  }

  //Toast Contents

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static getGradientBackground() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topRight,
      tileMode: TileMode.decal,
      end: Alignment.bottomLeft,
      colors: [
        UtilColors.primaryColor,
        UtilColors.secondaryColor,
      ],
    ));
  }

  static getTextGradient() {
    return LinearGradient(
      colors: <Color>[UtilColors.primaryColor, UtilColors.secondaryColor],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  }

  static getShadow() {
    return <BoxShadow>[
      const BoxShadow(
          color: Colors.black12,
          spreadRadius: -5,
          blurRadius: 5,
          offset: Offset(0, 4))
    ];
  }
}
