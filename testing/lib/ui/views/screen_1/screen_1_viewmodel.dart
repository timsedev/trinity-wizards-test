import 'package:flutter/material.dart';
import 'package:testing/core/models/contact.dart';
import 'package:testing/core/services/contact_service.dart';
import 'package:testing/ui/views/screen_2/screen_2_view.dart';

class Screen1ViewModel {
  final _contactService = ContactService();

  List<Contact> get contacts => _contactService.contacts;

  Future<void> onRefresh() async {
    await fetchContacts();
  }

  Future<void> fetchContacts() async {
    await _contactService.fetchContacts();
  }

  Future<void> navToScreen2(BuildContext context, int index) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Screen2View(contact: contacts[index]);
      }),
    );
  }
}
