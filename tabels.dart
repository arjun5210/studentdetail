class student {
  final id;
  var name;

  var age;
  var classname;
  var address;

  student(
      {required this.name,
      required this.age,
      this.id,
      required this.classname,
      required this.address});

  static student mapof(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['age'] as String;
    final classname = map['classname'] as String;
    final address = map['address'] as String;

    return student(
      id: id,
      name: name,
      age: age,
      classname: classname,
      address: address,
    );
  }
}

class user {
  final id;
  var username;
  var password;

  user({required this.username, required this.password, this.id});

  static user mapof(Map<String, Object?> map) {
    final id = map['id'] as int;
    final username = map['usernamename'] as String;
    final password = map['pasword'] as String;

    return user(id: id, username: username, password: password);
  }
}
