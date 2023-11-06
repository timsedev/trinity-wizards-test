import 'package:flutter/material.dart';
import 'package:testing/ui/views/screen_1/screen_1_viewmodel.dart';

class Screen1View extends StatefulWidget {
  const Screen1View({super.key});

  @override
  State<Screen1View> createState() => _Screen1ViewState();
}

class _Screen1ViewState extends State<Screen1View> {
  final _viewModel = Screen1ViewModel();

  @override
  void initState() {
    _viewModel.fetchContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        title: Text('Contacts'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(),
    );
  }
}
