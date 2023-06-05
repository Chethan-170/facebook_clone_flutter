import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone_flutter/models/models.dart';
import 'package:facebook_clone_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(
                imageUrl: currentUser.imageUrl,
              ),
              const SizedBox(width: 8.0),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind?"),
                ),
              )
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          SizedBox(
            height: 44.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconLabelButton(
                  icon: Icons.videocam,
                  label: 'Live',
                  iconColor: Colors.red,
                  onPressed: () => print('Live'),
                ),
                const VerticalDivider(width: 8.0),
                IconLabelButton(
                  icon: Icons.photo_library,
                  label: 'Photo',
                  iconColor: Colors.green,
                  onPressed: () => print('Photo'),
                ),
                const VerticalDivider(width: 8.0),
                IconLabelButton(
                  icon: Icons.video_call,
                  label: 'Room',
                  iconColor: Colors.purpleAccent,
                  onPressed: () => print('Room'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
