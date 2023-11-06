import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart' show rootBundle;
import 'package:testing/core/models/contact.dart';

class ContactService {
  static final ContactService _instance = ContactService._internal();

  factory ContactService() {
    return _instance;
  }

  ContactService._internal();

  Future<List<Contact>> fetchContacts() async {
    var contacts = <Contact>[];

    // response is a list of maps
    final String response = await rootBundle.loadString('assets/data.json');

    if (response.isEmpty) {
      return contacts;
    }

    final List<dynamic> data = json.decode(response);

    contacts = data.map((contactMap) => Contact.fromJson(contactMap)).toList();

    return contacts;
  }
}
