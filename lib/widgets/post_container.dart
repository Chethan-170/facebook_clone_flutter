import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone_flutter/config/palette.dart';
import 'package:facebook_clone_flutter/models/models.dart';
import 'package:facebook_clone_flutter/widgets/profile_avatar.dart';
import 'package:facebook_clone_flutter/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(
          vertical: 5.0, horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: isDesktop
            ? const BoxDecoration(color: Colors.white, shape: BoxShape.circle)
            : const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(height: 8.0),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox(height: 8.0)
                      : const SizedBox.shrink()
                ],
              ),
            ),
            post.imageUrl != null
                ? CachedNetworkImage(imageUrl: (post.imageUrl)!)
                : const SizedBox.shrink(),
            _PostStats(post: post)
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ProfileAvatar(imageUrl: post.user.imageUrl),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.user.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '${post.timeAgo} • ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.0,
                      ),
                    ),
                    Icon(
                      Icons.public,
                      color: Colors.grey[600],
                      size: 12,
                    )
                  ],
                )
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  _PostStats({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.facebookBlue,
              ),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 12.0,
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(width: 8.0),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            )
          ]),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  size: 20.0,
                  color: Colors.grey[700],
                ),
                label: 'Like',
                onTap: () => print("Like"),
              ),
              _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  size: 20.0,
                  color: Colors.grey[700],
                ),
                label: 'Comments',
                onTap: () => print("Comments"),
              ),
              _PostButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  size: 25.0,
                  color: Colors.grey[700],
                ),
                label: 'Share',
                onTap: () => print("Share"),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  _PostButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            height: 28.0,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
