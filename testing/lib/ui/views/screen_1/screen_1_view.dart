import 'package:flutter/material.dart';
import 'package:testing/core/models/contact.dart';
import 'package:testing/ui/views/screen_1/screen_1_viewmodel.dart';

class Screen1View extends StatefulWidget {
  const Screen1View({super.key});

  @override
  State<Screen1View> createState() => _Screen1ViewState();
}

class _Screen1ViewState extends State<Screen1View> {
  final _viewModel = Screen1ViewModel();

  Future? contactFuture;

  @override
  void initState() {
    contactFuture = _viewModel.fetchContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: contactFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SingleChildScrollView(
              child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: _viewModel.contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async =>
                        await _viewModel.navToScreen2(context, index),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(
                              '${_viewModel.contacts[index].firstName} ${_viewModel.contacts[index].lastName}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
