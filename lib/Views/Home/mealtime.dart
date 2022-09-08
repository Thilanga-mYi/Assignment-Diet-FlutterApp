import 'package:NutritionApplication/Models/Colors.dart';
import 'package:NutritionApplication/Models/Images.dart';
import 'package:NutritionApplication/Models/Utils.dart';
import 'package:NutritionApplication/Models/Utils/Routes.dart';
import 'package:NutritionApplication/Views/Home/dashboard.dart';
import 'package:NutritionApplication/Views/Home/mealitems_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class MealTime extends StatefulWidget {
  int day;

  MealTime(this.day, {Key? key}) : super(key: key);

  @override
  State<MealTime> createState() => _MealTimeState(day: day);
}

class _MealTimeState extends State<MealTime> {
  int day;

  _MealTimeState({required this.day});

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
          'Meals',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: SizedBox(
        width: Utils.displaySize.width,
        height: Utils.displaySize.height,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slidable(
            //   endActionPane: ActionPane(
            //     motion: ScrollMotion(),
            //     children: [
            //       Container(
            //         margin: const EdgeInsets.only(left: 10.0),
            //         padding: const EdgeInsets.all(17.5),
            //         decoration: BoxDecoration(
            //             color: Colors.red[400],
            //             boxShadow: Utils.getShadow(),
            //             borderRadius: BorderRadius.circular(100.0)),
            //         child: const Icon(
            //           Icons.refresh,
            //           size: 30,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ],
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 7.5),
            //     child: GestureDetector(
            //       onTap: () =>
            //           Routes(context: context).navigate(MealItemList(day, 1)),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 20.0, vertical: 5.0),
            //         child: Container(
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5.0),
            //               boxShadow: Utils.getShadow(),
            //               color: Colors.white),
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(
            //                 horizontal: 15.0, vertical: 15.0),
            //             child: Row(
            //               children: [
            //                 Expanded(
            //                     flex: 0,
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(right: 15.0),
            //                       child: Image.asset(
            //                         UtilImages.breakfast_icon,
            //                         width: 75.0,
            //                       ),
            //                     )),
            //                 Expanded(
            //                     flex: 1,
            //                     child: Column(
            //                       mainAxisAlignment: MainAxisAlignment.start,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.symmetric(
            //                               vertical: 2.5),
            //                           child: Text(
            //                             'Breakfast Meal',
            //                             style: GoogleFonts.openSans(
            //                                 fontSize: 16.0,
            //                                 fontWeight: FontWeight.bold),
            //                           ),
            //                         ),
            //                         Padding(
            //                             padding: const EdgeInsets.symmetric(
            //                                 vertical: 2.5, horizontal: 5.0),
            //                             child: Text(
            //                               'Click here to create meal plan for next 7 days',
            //                               style: GoogleFonts.openSans(),
            //                             ))
            //                       ],
            //                     )),
            //                 Expanded(
            //                     flex: 0,
            //                     child: Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 10.0),
            //                       child: Icon(
            //                         Icons.arrow_forward_ios_rounded,
            //                         color: UtilColors.primaryColor,
            //                       ),
            //                     ))
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () =>
                  Routes(context: context).navigate(MealItemList(day, 1)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: Utils.getShadow(),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Image.asset(
                                UtilImages.breakfast_icon,
                                width: 75.0,
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.5),
                                  child: Text(
                                    'Breakfast Meal',
                                    style: GoogleFonts.openSans(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.5, horizontal: 5.0),
                                    child: Text(
                                      'Click here to create meal plan for next 7 days',
                                      style: GoogleFonts.openSans(),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: UtilColors.primaryColor,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Routes(context: context).navigate(MealItemList(day, 2)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: Utils.getShadow(),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Image.asset(
                                UtilImages.lunch_icon,
                                width: 75.0,
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.5),
                                  child: Text(
                                    'Lunch Meal',
                                    style: GoogleFonts.openSans(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.5, horizontal: 5.0),
                                    child: Text(
                                      'Click here to create meal plan for next 7 days',
                                      style: GoogleFonts.openSans(),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: UtilColors.primaryColor,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Routes(context: context).navigate(MealItemList(day, 3)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: Utils.getShadow(),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Image.asset(
                                UtilImages.dinner_icon,
                                width: 75.0,
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.5),
                                  child: Text(
                                    'Dinner Meal',
                                    style: GoogleFonts.openSans(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.5, horizontal: 5.0),
                                    child: Text(
                                      'Click here to create meal plan for next 7 days',
                                      style: GoogleFonts.openSans(),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: UtilColors.primaryColor,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      )),
    );
  }
}
