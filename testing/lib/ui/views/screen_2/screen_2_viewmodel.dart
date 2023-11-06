import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:testing/core/models/contact.dart';
import 'package:testing/core/services/contact_service.dart';

class Screen2ViewModel {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  DateTime? dob;

  late final Contact contact;

  final _contactService = ContactService();

  void init(Contact contact) {
    this.contact = contact;
    firstNameController.text = contact.firstName!;
    lastNameController.text = contact.lastName!;
    emailController.text = contact.email!;
    dob = parseDate(contact.dob);
  }

  void saveContact() {
    _contactService.saveContact(contact);
  }

  DateTime? parseDate(String? dateString) {
    if (dateString == null) {
      return null;
    }

    List<String> dateParts = dateString.split("/");
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);
    return DateTime(year, month, day);
  }
}
