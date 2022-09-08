class User {
  final int id;
  final String name;
  final String dob;
  final String mobile_number;
  var gender;
  var goal;

  User(this.id, this.name, this.dob, this.mobile_number, this.gender,this.goal);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        dob = json['dob'],
        mobile_number = json['mobile_number'],
        goal = json['goal'],
        gender = json['gender'];
}
