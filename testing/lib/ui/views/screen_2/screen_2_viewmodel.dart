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
    dob = _contactService.decodeDate(contact.dob);
  }

  Future<void> saveContact() async {
    contact.firstName = firstNameController.text;
    contact.lastName = lastNameController.text;
    contact.email = emailController.text;
    contact.dob = _contactService.encodeDate(dob!);
    await _contactService.saveContact(contact);
  }
}
