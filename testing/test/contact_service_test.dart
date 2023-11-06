// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:testing/core/services/contact_service.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   group('ContactService', () {
//     ContactService contactService;

//     setUp(() {
//       contactService = ContactService();
//     });

//     test('fetchContacts returns a list of contacts', () async {
//       final jsonString = '''
//         {
//           "contacts": [
//             {"name": "John Doe", "email": "johndoe@example.com"},
//             {"name": "Jane Smith", "email": "janesmith@example.com"}
//           ]
//         }
//       ''';
//       final expectedContacts = [
//         {"name": "John Doe", "email": "johndoe@example.com"},
//         {"name": "Jane Smith", "email": "janesmith@example.com"}
//       ];

//       // Mock the rootBundle.loadString method to return the test JSON string
//       const MethodChannel('plugins.flutter.io/path_provider')
//           .setMockMethodCallHandler((MethodCall methodCall) async {
//         return jsonString;
//       });

//       final contacts = await contactService.fetchContacts();

//       expect(contacts, expectedContacts);
//     });
//   });
// }
