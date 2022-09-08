import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/dashboard.dart';
import 'package:NutritionApplication/Views/Home/mealtime.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Weekdays extends StatefulWidget {
  Weekdays({Key? key}) : super(key: key);

  @override
  State<Weekdays> createState() => _WeekdaysState();
}

class _WeekdaysState extends State<Weekdays> {
  final List _weekdays = getWeekDays();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UtilColors.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: GestureDetector(
          onTap: () => Routes(context: context).navigate(Dashboard()),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Weekdays',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: [for (var day in _weekdays) getWeekdayItem(day)],
              ),
            ],
          ),
        ),
      )),
    );
  }

  getWeekdayItem(day) {
    return GestureDetector(
      onTap: () => Routes(context: context).navigate(MealTime(day['id'])),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          width: Utils.displaySize.width / 4,
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: Utils.getShadow(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  day['weekday'],
                  style: GoogleFonts.openSans(),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.asset(
                    day['img_url'],
                    width: 75.0,
                  )),
            ],
          )),
    );
  }

  static List getWeekDays() {
    List records = [
      {'id': 1, 'weekday': 'ONE', 'img_url': UtilImages.one},
      {'id': 2, 'weekday': 'TWO', 'img_url': UtilImages.two},
      {'id': 3, 'weekday': 'THREE', 'img_url': UtilImages.three},
      {'id': 4, 'weekday': 'FOUR', 'img_url': UtilImages.four},
      {'id': 5, 'weekday': 'FIVE', 'img_url': UtilImages.five},
      {'id': 6, 'weekday': 'SIX', 'img_url': UtilImages.six},
      {'id': 7, 'weekday': 'SEVEN', 'img_url': UtilImages.seven},
    ];

    return records;
  }
}
