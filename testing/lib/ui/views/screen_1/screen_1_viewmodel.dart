import 'package:testing/core/services/contact_service.dart';

class Screen1ViewModel {
  final _contactService = ContactService();
  bool isBusy = false;

  Future<void> onRefresh() async {}

  Future<void> fetchContacts() async {
    isBusy = true;
    await _contactService.fetchContacts();
    isBusy = false;
  }
}
