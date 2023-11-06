class Contact {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;

  Contact({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
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

  // for testing purposes
  @override
  String toString() {
    return 'Contact{id: $id, firstName: $firstName, lastName: $lastName, email: $email, dob: $dob}';
  }
}
