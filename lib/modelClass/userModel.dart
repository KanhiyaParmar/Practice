class UserData {
  String? name;
  String? id;
  String? photourl;
  String? email;

  UserData({
    this.name,
    this.id,
    this.photourl,
    this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json["name"],
        id: json["id"],
        photourl: json["photourl"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "photourl": photourl,
        "email": email,
      };
}
