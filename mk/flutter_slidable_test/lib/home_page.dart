import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Slidable Test'),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.grey.shade300,
            child: Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () {
                    print('On StartActionPane Dismissed!');
                  },
                  motion: const BehindMotion(),
                ),
                children: [
                  SlidableAction(
                    flex: 1,
                    onPressed: (BuildContext context_) {
                      print('On Call Pressed!');
                    },
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.phone,
                    label: 'Call',
                  ),
                  SlidableAction(
                    flex: 1,
                    onPressed: (BuildContext context_) {
                      print('On Message Pressed!');
                    },
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    icon: Icons.message,
                    label: 'Message',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                key: const ValueKey(1),
                motion: const StretchMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () {
                    print('On EndActionPane Dismissed!');
                  },
                  motion: const InversedDrawerMotion(),
                ),
                children: [
                  SlidableAction(
                    flex: 1,
                    onPressed: (BuildContext context_) {
                      print('On Edit Pressed!');
                    },
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                  SlidableAction(
                    flex: 1,
                    onPressed: (BuildContext context_) {
                      print('On Delete Pressed!');
                    },
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: const ListTile(
                title: Text('Ian Choi'),
                subtitle: Text('ian choi'),
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
