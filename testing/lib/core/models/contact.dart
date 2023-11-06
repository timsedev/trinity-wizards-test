class Contact {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dob;

  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dob,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'dob': dob,
    };
  }
}
