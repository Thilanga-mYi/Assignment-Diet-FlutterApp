import 'package:NutritionApplication/Controllers/AuthController.dart';
import 'package:NutritionApplication/Controllers/AuthValidator.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/dashboard.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Strings.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Views/Auth/RecoverPassword.dart';
import 'package:NutritionApplication/Views/Auth/Register.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  late AuthController _authController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(Utils.lightNavbar);

    _email.text = "aries@gmail.com";
    _password.text = "Aries@123";

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double spaceAround = 10.0;
    double fieldspaces = 15.0;
    double fieldspacesmid = 20.0;
    double fontsize = 12;

    _authController = AuthController();

    return SafeArea(
        child: Scaffold(
      backgroundColor: UtilColors.primaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: Utils.displaySize.width,
              height: Utils.displaySize.height,
              decoration: Utils.getGradientBackground(),
            ),
            SizedBox(
              width: Utils.displaySize.width,
              height: Utils.displaySize.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      visible: (Utils.displaySize.height < 1000) ? false : true,
                      child: Container(
                        padding: EdgeInsets.only(bottom: spaceAround),
                        width: Utils.displaySize.width * 0.35,
                        child: SizedBox(
                          child: Image.asset(UtilImages.logoPNG),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spaceAround, vertical: spaceAround),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Form(
                            key: _loginFormKey,
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
                                SizedBox(
                                  height: fieldspaces,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, bottom: 10.0),
                                    child: Text(
                                      UtilStrings.loginSubTitle.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w600,
                                          foreground: Paint()
                                            ..shader = Utils.getTextGradient()),
                                    ),
                                  ),
                                ),
                                const Divider(),
                                SizedBox(
                                  height: fieldspacesmid,
                                ),
                                TextFormField(
                                  controller: _email,
                                  decoration:
                                      Utils.getDefaultTextInputDecoration(
                                          'Email',
                                          Icon(
                                            Icons.email,
                                            color: UtilColors.greyColor
                                                .withOpacity(0.6),
                                          )),
                                  cursorColor: UtilColors.primaryColor,
                                  keyboardType: TextInputType.emailAddress,
                                  style: Utils.getprimaryFieldTextStyle(
                                      UtilColors.greyColor),
                                  validator: (value) {
                                    return AuthValidator.validateUsername(
                                        value!);
                                  },
                                ),
                                SizedBox(
                                  height: fieldspacesmid,
                                ),
                                TextFormField(
                                  controller: _password,
                                  decoration:
                                      Utils.getDefaultTextInputDecoration(
                                          'Password',
                                          Icon(Icons.lock,
                                              color: UtilColors.greyColor
                                                  .withOpacity(0.6))),
                                  cursorColor: UtilColors.primaryColor,
                                  obscureText: _obscurePassword,
                                  keyboardType: TextInputType.emailAddress,
                                  style: Utils.getprimaryFieldTextStyle(
                                      UtilColors.blackColor),
                                  validator: (value) {
                                    return AuthValidator.validatePassword(
                                        value!);
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _obscurePassword = true;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: fieldspaces,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 24.0,
                                      width: 24.0,
                                      child: Checkbox(
                                        value: _rememberMe,
                                        onChanged: (val) {
                                          setState(() {
                                            this._rememberMe = val!;
                                          });
                                        },
                                        activeColor: UtilColors.primaryColor,
                                        focusColor: Colors.red,
                                        checkColor: UtilColors.whiteColor,
                                        hoverColor: Colors.red,
                                        tristate: false,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _rememberMe = !this._rememberMe;
                                          });
                                        },
                                        child: Text(
                                          'Remember my credentials',
                                          style: TextStyle(fontSize: fontsize),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: fieldspaces,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        child: TextButton(
                                      child: Text(
                                        "LET'S START",
                                        style: GoogleFonts.openSans(),
                                      ),
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                UtilColors.whiteColor),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                UtilColors.primaryColor),
                                      ),
                                      // onPressed: () => {
                                      //   Routes(context: context)
                                      //       .navigate(Dashboard())
                                      // },
                                      onPressed: () async {
                                        if (_loginFormKey.currentState!
                                            .validate()) {
                                          FocusScope.of(context).unfocus();
                                          Utils.showLoader(context);

                                          try {
                                            await _authController
                                                .doLogin(
                                                    _email.text, _password.text)
                                                .then((value) {
                                              if (value == true) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            Dashboard()));
                                              }
                                            });
                                          } catch (e) {
                                            print(e.toString());
                                            Utils.hideLoaderCurrrent(context);
                                          }
                                        }
                                      },
                                    )),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const RecoverPassword())),
                                        child: const Text(
                                          'Recover Forget Password',
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: spaceAround,
                                ),
                                SizedBox(
                                  height: fieldspaces,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Register()));
                                    },
                                    child: Text(
                                      'No account yet, register today !',
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
