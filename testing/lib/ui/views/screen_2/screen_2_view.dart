import 'package:flutter/material.dart';
import 'package:testing/core/models/contact.dart';
import 'package:testing/ui/views/screen_2/screen_2_viewmodel.dart';

class Screen2View extends StatefulWidget {
  final Contact? contact;

  const Screen2View({required this.contact, Key? key}) : super(key: key);

  @override
  State<Screen2View> createState() => _Screen2ViewState();
}

class _Screen2ViewState extends State<Screen2View> {
  final _viewModel = Screen2ViewModel();

  @override
  void initState() {
    _viewModel.init(widget.contact!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        leadingWidth: 75,
        title: const Text('Edit Contact'),
        actions: [
          TextButton(
            onPressed: () async {
              if (_viewModel.formKey.currentState!.validate()) {
                // Save contact
                await _viewModel.saveContact();
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: Form(
        key: _viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 50,
            ),
            const SizedBox(height: 16),
            const Text('Main Information', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _viewModel.firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _viewModel.lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text('Sub Information', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _viewModel.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _viewModel.dob!,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    _viewModel.dob = pickedDate;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
