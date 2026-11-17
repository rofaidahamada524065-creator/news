class Auth{
  final String Massege;
  final bool statuse;
  final UserModel? user;

  new({required this.Massege, required this.statuse,  this.user});
  factory Auth.fromjson(Map json){
    if(json["user"]==null){
      return Auth(Massege: json["message"], statuse: json["status"]);
    }
    else{
      return Auth(Massege: json["message"], statuse: json["status"],user: UserModel.fromjson(json["user"]));
    }
  }
}


class UserModel{
  final int id;
  final String name;
  final String email;
  final String password;
  final String phone;

  new({required this.id, required this.name, required this.email, required this.password, required this.phone});
  factory UserModel.fromjson(Map json){
    return UserModel(id: json["id"], name: json["name"], email: json["email"], password: json["password"], phone: json["phone"]);
  }
}