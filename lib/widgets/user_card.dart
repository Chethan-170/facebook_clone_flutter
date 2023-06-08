import 'package:facebook_clone_flutter/models/models.dart';
import 'package:facebook_clone_flutter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('user card'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6.0),
          Text(
            user.name,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(width: 6.0),
        ],
      ),
    );
  }
}
