class APIRoutes {
  static String _baseRoute = 'http://192.168.1.85:8002/api/';

  static String getRoute(String key) {
    switch (key) {
      case 'REGISTER':
        key = "${_baseRoute}register";
        break;
      case 'LOGIN':
        key = '${_baseRoute}login';
        break;
      case 'ENROLL':
        key = '${_baseRoute}enroll';
        break;
      case 'GET_GOAL_DETAILS':
        key = '${_baseRoute}get_goal_details';
        break;
      case 'ENROLL_PAYMENT':
        key = '${_baseRoute}enroll_payment';
        break;
      case 'GET_MEAL_LIST':
        key = '${_baseRoute}mealitem/list';
        break;
      case 'GET_MEAL_VALUES':
        key = '${_baseRoute}goal/getMealValues';
        break;
      case 'ENROLL_MEAL_LIST':
        key = '${_baseRoute}mealitem/enroll';
        break;
      case 'GET_GOAL_HISTORY':
        key = '${_baseRoute}history';
        break;

      default:
    }

    return key;
  }
}
