import 'package:NutritionApplication/Models/Utils.dart';

class Goal {
  int? id;
  int? goal_type_id;
  double? height;
  double? weight;
  double? goal_weight;
  int? body_type;
  int? activity_level;
  int? vegi_type;
  double? drink_water;
  double? diabetes;
  double? cholesterol;
  double? fatty_liver;

  Map toJson() => {
        'goal_type_id': goal_type_id.toString(),
        'height': height.toString(),
        'weight': weight.toString(),
        'goal_weight': goal_weight.toString(),
        'body_type': body_type.toString(),
        'activity_level': activity_level.toString(),
        'vegi_type': vegi_type.toString(),
        'drink_water': drink_water.toString(),
        'diabetes': diabetes.toString(),
        'cholesterol': cholesterol.toString(),
        'fatty_liver': fatty_liver.toString(),
        'user': Utils.profileUser.id.toString()
      };
}
