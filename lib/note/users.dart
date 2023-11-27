//In here first we create the users json model
// To parse this JSON data, do
//

class Users {
  final int? usrId;
  final String usrMail;
  final String usrPassword;

  Users({
    this.usrId,
    required this.usrMail,
    required this.usrPassword,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    usrId: json["usrId"],
    usrMail: json["usrMail"],
    usrPassword: json["usrPassword"],
  );

  Map<String, dynamic> toMap() => {
    "usrId": usrId,
    "usrMail": usrMail,
    "usrPassword": usrPassword,
  };
}