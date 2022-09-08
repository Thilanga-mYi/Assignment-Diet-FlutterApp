import 'package:NutritionApplication/Controllers/AuthController.dart';
import 'package:NutritionApplication/Controllers/AuthValidator.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/dashboard.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Strings.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _mobile_number = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repassword = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;

  final AuthController _authController = AuthController();

  int selectedCard = 0;

  @override
  void initState() {
    _name.text = 'Admin';
    selectedCard = 1;
    _dob.text = '1996/09/14';
    _mobile_number.text = '0773447663';
    _email.text = 'aries@gmail.com';
    _password.text = 'Aries@123';
    _repassword.text = 'Aries@123';
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(Utils.darkNavbar);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double spaceAround = 10.0;
    double fieldspaces = 20.0;
    double fieldspacesmid = (Utils.displaySize.height < 1000) ? 5 : 20;
    double fieldspacesmax = 30.0;
    double fontsize = 12;

    // final AuthController authController = AuthController();

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Utils.displaySize.width,
          height: Utils.displaySize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: spaceAround, vertical: spaceAround),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                      key: _registerFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: fieldspaces,
                          ),
                          SizedBox(
                            height: Utils.displaySize.width * 0.3,
                            width: Utils.displaySize.width * 0.5,
                            child: Image.asset(UtilImages.logoPNG),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
                              child: Text(
                                UtilStrings.registrationSubTitle.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w600,
                                    foreground: Paint()
                                      ..shader = Utils.getTextGradient()),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: fieldspacesmid,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              controller: _name,
                              decoration: Utils.getDefaultTextInputDecoration(
                                  'Name',
                                  Icon(
                                    Icons.person,
                                    color:
                                        UtilColors.greyColor.withOpacity(0.6),
                                  )),
                              cursorColor: UtilColors.primaryColor,
                              keyboardType: TextInputType.name,
                              style: Utils.getprimaryFieldTextStyle(
                                  UtilColors.greyColor),
                              validator: (value) {
                                return AuthValidator.validateName(value!);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              controller: _dob,
                              decoration: Utils.getDefaultTextInputDecoration(
                                  'Date of Birth',
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color:
                                        UtilColors.greyColor.withOpacity(0.6),
                                  )),
                              cursorColor: UtilColors.primaryColor,
                              keyboardType: TextInputType.datetime,
                              style: Utils.getprimaryFieldTextStyle(
                                  UtilColors.greyColor),
                              validator: (value) {
                                return AuthValidator.validateName(value!);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              controller: _mobile_number,
                              decoration: Utils.getDefaultTextInputDecoration(
                                  'Mobile Number',
                                  Icon(
                                    Icons.send_to_mobile,
                                    color:
                                        UtilColors.greyColor.withOpacity(0.6),
                                  )),
                              cursorColor: UtilColors.primaryColor,
                              keyboardType: TextInputType.number,
                              style: Utils.getprimaryFieldTextStyle(
                                  UtilColors.greyColor),
                              validator: (value) {
                                return AuthValidator.validateMobile(value!);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              controller: _email,
                              decoration: Utils.getDefaultTextInputDecoration(
                                  'Email',
                                  Icon(
                                    Icons.email,
                                    color:
                                        UtilColors.greyColor.withOpacity(0.6),
                                  )),
                              cursorColor: UtilColors.primaryColor,
                              keyboardType: TextInputType.emailAddress,
                              style: Utils.getprimaryFieldTextStyle(
                                  UtilColors.greyColor),
                              validator: (value) {
                                return AuthValidator.validateUsername(value!);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              controller: _password,
                              decoration: Utils.getDefaultTextInputDecoration(
                                  'Password',
                                  Icon(Icons.lock,
                                      color: UtilColors.greyColor
                                          .withOpacity(0.6))),
                              cursorColor: UtilColors.primaryColor,
                              obscureText: _obscurePassword1,
                              keyboardType: TextInputType.text,
                              style: Utils.getprimaryFieldTextStyle(
                                  UtilColors.blackColor),
                              validator: (value) {
                                return AuthValidator.validatePassword(value!);
                              },
                              onChanged: (value) {
                                setState(() {
                                  _obscurePassword1 = true;
                                });
                              },
                            ),
                          ),
                          TextFormField(
                            controller: _repassword,
                            decoration: Utils.getDefaultTextInputDecoration(
                                'Retype Password',
                                Icon(Icons.lock,
                                    color:
                                        UtilColors.greyColor.withOpacity(0.6))),
                            cursorColor: UtilColors.primaryColor,
                            obscureText: _obscurePassword2,
                            keyboardType: TextInputType.text,
                            style: Utils.getprimaryFieldTextStyle(
                                UtilColors.blackColor),
                            validator: (value) {
                              return AuthValidator.validateRetypePassword(
                                  _password.text, value!);
                            },
                            onChanged: (value) {
                              setState(() {
                                _obscurePassword2 = true;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
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
                                              color: (selectedCard == 1)
                                                  ? UtilColors.primaryColor
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: (selectedCard == 1)
                                                      ? UtilColors.primaryColor
                                                      : UtilColors.greyColor),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Male',
                                                style: GoogleFonts.openSans(
                                                    color: (selectedCard == 1)
                                                        ? UtilColors.whiteColor
                                                        : UtilColors
                                                            .blackColor),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
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
                                              color: (selectedCard == 2)
                                                  ? UtilColors.primaryColor
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: (selectedCard == 2)
                                                      ? UtilColors.primaryColor
                                                      : UtilColors.greyColor),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Female',
                                                style: GoogleFonts.openSans(
                                                  color: (selectedCard == 2)
                                                      ? Colors.white
                                                      : UtilColors.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: fieldspaces,
                          ),
                          SizedBox(
                            child: FlatButton(
                              onPressed: () async {
                                if (_registerFormKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  Utils.showLoader(context);
                                  await _authController.doRegistration({
                                    'name': _name.text.toString(),
                                    'dob': _dob.text.toString(),
                                    'mobile_number':
                                        _mobile_number.text.toString(),
                                    'gender': selectedCard.toString(),
                                    'email': _email.text.toString(),
                                    'password': _password.text.toString(),
                                    'password_confirmation':
                                        _repassword.text.toString(),
                                  }).then((value) {
                                    Utils.hideLoaderCurrrent(context);
                                    if (value == true) {
                                      _registerFormKey.currentState!.reset();

                                      setState(() {
                                        _name.text = '';
                                        _dob.text = '';
                                        _mobile_number.text = '';
                                        selectedCard = 0;
                                        _email.text = '';
                                        _password.text = '';
                                        _repassword.text = '';
                                      });
                                    }
                                  });
                                }
                              },
                              child: const Text(
                                "REGISTER NOW",
                              ),
                              color: UtilColors.primaryColor,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Utils.buttonBorderRadius),
                                  side: BorderSide(
                                      color: UtilColors.secondaryColor)),
                              height: 42.0,
                            ),
                            width: Utils.displaySize.width,
                          ),
                          SizedBox(
                            height: fieldspacesmax,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Already have an account, Login now !',
                                style: TextStyle(fontSize: fontsize),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: fieldspaces,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
