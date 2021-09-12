class User {
  String? email;
  String? username;
  String? name;
  UserProfile profile = UserProfile();
  User();
  User.fromJson(json) {
    print(json);
    email = json['email'];
    username = json['username'];
    name = json['name'];
    profile = json['profile'] != null
        ? UserProfile.fromjson(json['profile'])
        : UserProfile();
  }
}

class UserProfile {
  String? address;
  String? phone;
  bool isCompleted = false;

  UserProfile();
  UserProfile.fromjson(json) {
    address = json['address'];
    phone = json['phone'];
    isCompleted = json['is_completed'];
  }
}
