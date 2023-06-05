import 'package:facebook_clone_flutter/config/palette.dart';
import 'package:facebook_clone_flutter/models/models.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            } else {
              return Container(
                margin: const EdgeInsets.all(2.0),
                height: 20.0,
                width: 20.0,
                color: Colors.red,
              );
            }
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
          side: BorderSide(
            width: 3.0,
            color: (Colors.blueAccent[100])!,
          ),
        ),
        side: BorderSide(
          width: 3.0,
          color: (Colors.blueAccent[100])!,
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          const Text("Create\nRoom")
        ],
      ),
    );
  }
}
