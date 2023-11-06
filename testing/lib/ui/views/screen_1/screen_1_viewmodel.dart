import 'package:flutter/material.dart';
import 'package:testing/core/models/contact.dart';
import 'package:testing/core/services/contact_service.dart';
import 'package:flutter/widgets.dart';
import 'package:testing/ui/views/screen_2/screen_2_view.dart';

class Screen1ViewModel {
  final _contactService = ContactService();
  bool isBusy = false;

  var contacts = <Contact>[];

  Future<void> onRefresh() async {}

  Future<void> fetchContacts() async {
    isBusy = true;
    contacts = await _contactService.fetchContacts();
    isBusy = false;
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
