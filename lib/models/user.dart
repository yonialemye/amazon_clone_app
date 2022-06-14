class User {
  late final String sId;
  late final String name;
  late final String email;
  late final String password;
  late final String address;
  late final String type;

  User({
    required this.sId,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
  });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['address'] = address;
    data['type'] = type;
    return data;
  }
}
