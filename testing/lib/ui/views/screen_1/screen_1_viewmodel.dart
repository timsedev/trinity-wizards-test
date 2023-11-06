import 'package:testing/core/models/contact.dart';
import 'package:testing/core/services/contact_service.dart';

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
}
