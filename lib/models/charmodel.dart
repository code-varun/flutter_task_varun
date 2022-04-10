// To parse this JSON data, do
// //
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,
    this.betterCallSaulAppearance, id, userId, title, body,
  });

  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  Status? status;
  String? nickname;
  List<int>? appearance;
  String? portrayed;
  Category? category;
  List<int>? betterCallSaulAppearance;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        charId: json["char_id"] == null ? null : json["char_id"],
        name: json["name"] == null ? null : json["name"],
        birthday: json["birthday"] == null ? null : json["birthday"],
        occupation: json["occupation"] == null
            ? null
            : List<String>.from(json["occupation"].map((x) => x)),
        img: json["img"] == null ? null : json["img"],
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
        nickname: json["nickname"] == null ? null : json["nickname"],
        appearance: json["appearance"] == null
            ? null
            : List<int>.from(json["appearance"].map((x) => x)),
        portrayed: json["portrayed"] == null ? null : json["portrayed"],
        category: json["category"] == null
            ? null
            : categoryValues.map[json["category"]],
        betterCallSaulAppearance: json["better_call_saul_appearance"] == null
            ? null
            : List<int>.from(json["better_call_saul_appearance"].map((x) => x)),
      );

  get users => null;

  Map<String, dynamic> toJson() => {
        "char_id": charId == null ? null : charId,
        "name": name == null ? null : name,
        "birthday": birthday == null ? null : birthday,
        "occupation": occupation == null
            ? null
            : List<dynamic>.from(occupation!.map((x) => x)),
        "img": img == null ? null : img,
        "status": status == null ? null : statusValues.reverse[status],
        "nickname": nickname == null ? null : nickname,
        "appearance": appearance == null
            ? null
            : List<dynamic>.from(appearance!.map((x) => x)),
        "portrayed": portrayed == null ? null : portrayed,
        "category": category == null ? null : categoryValues.reverse[category],
        "better_call_saul_appearance": betterCallSaulAppearance == null
            ? null
            : List<dynamic>.from(betterCallSaulAppearance!.map((x) => x)),
      };

  void add(param0) {}
}

enum Category { BREAKING_BAD, BREAKING_BAD_BETTER_CALL_SAUL }

final categoryValues = EnumValues({
  "Breaking Bad": Category.BREAKING_BAD,
  "Breaking Bad, Better Call Saul": Category.BREAKING_BAD_BETTER_CALL_SAUL
});

enum Status { PRESUMED_DEAD, ALIVE, DECEASED }

final statusValues = EnumValues({
  "Alive": Status.ALIVE,
  "Deceased": Status.DECEASED,
  "Presumed dead": Status.PRESUMED_DEAD
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
