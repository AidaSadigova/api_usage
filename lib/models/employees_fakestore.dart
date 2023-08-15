class FakeUsers {
  String? name;
  String? email;

  FakeUsers.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    email = json['email'];
  }
}
