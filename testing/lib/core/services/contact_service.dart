import 'dart:developer';
import 'package:flutter/services.dart' show rootBundle;

class ContactService {
  static final ContactService _instance = ContactService._internal();

  factory ContactService() {
    return _instance;
  }

  ContactService._internal();

  Future<void> fetchContacts() async {
    final String response = await rootBundle.loadString('assets/data.json');
    log(response);
  }
}
