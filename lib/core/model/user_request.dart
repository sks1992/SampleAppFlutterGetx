class UserRequest {
  UserRequest({
    required this.username,
    required this.email,
    required this.password,
  });
  late final String username;
  late final String email;
  late final String password;

  UserRequest.fromJson(Map<String, dynamic> json){
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}