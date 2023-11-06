class Model {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String dob;

  Model({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dob,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      dob: json['dob'],
    );
  }
}
