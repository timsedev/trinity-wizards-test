import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:testing/core/models/contact.dart';

class ContactService {
  static final ContactService _instance = ContactService._internal();

  var contacts = <Contact>[];

  factory ContactService() {
    return _instance;
  }

  ContactService._internal();

  Future<void> fetchContacts() async {
    // response is a list of maps
    final String? response = await _loadDataFile();

    if (response == null) {
      return;
    }

    if (response.isEmpty) {
      return;
    }

    final List<dynamic> data = json.decode(response);

    contacts = data.map((contactMap) => Contact.fromJson(contactMap)).toList();
  }

  Future<void> saveContact(Contact updatedContact) async {
    final String? response = await _loadDataFile();

    if (response == null) {
      throw Exception('Unable to load data file');
    }

    // get existing contacts from data.json
    final List<dynamic> data = json.decode(response);
    final List<Contact> contacts =
        data.map((contactMap) => Contact.fromJson(contactMap)).toList();

    // get the existing contact
    final Contact existingContact = contacts.firstWhere(
      (c) => c.id == updatedContact.id,
    );

    // update the existing contact
    existingContact.firstName = updatedContact.firstName;
    existingContact.lastName = updatedContact.lastName;
    existingContact.email = updatedContact.email;
    existingContact.dob = updatedContact.dob;
  }

  Future<String?> _loadDataFile() async {
    try {
      return await rootBundle.loadString('assets/data.json');
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  DateTime? decodeDate(String? dateString) {
    if (dateString == null) {
      return null;
    }

    List<String> dateParts = dateString.split("/");
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);
    return DateTime(year, month, day);
  }

  String encodeDate(DateTime date) {
    int day = date.day;
    int month = date.month;
    int year = date.year;
    return '$day/$month/$year';
  }
}
