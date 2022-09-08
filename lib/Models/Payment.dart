import 'package:NutritionApplication/Models/Utils.dart';

class Payment {
  int? id;
  String? ref;
  int? user;

  Map toJson() => {
        'ref': ref.toString(),
        'user': Utils.profileUser.id.toString(),
      };
}
