class UserModel {
  String id;
  String name;
  String username;
  String email;
  String date;
  List<dynamic> stat;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.date,
    required this.stat,
  });
}
