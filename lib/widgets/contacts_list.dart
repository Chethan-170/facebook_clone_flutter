import 'package:facebook_clone_flutter/models/models.dart';
import 'package:facebook_clone_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Text(
              'Contacts',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            )),
            Icon(
              Icons.search,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 8.0),
            Icon(
              Icons.more_horiz,
              color: Colors.grey[600],
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              final User user = users[index];
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(user: user));
            },
          ),
        ),
      ]),
    );
  }
}
