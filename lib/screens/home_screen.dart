import 'package:facebook_clone_flutter/config/palette.dart';
import 'package:facebook_clone_flutter/data/data.dart';
import 'package:facebook_clone_flutter/models/models.dart';
import 'package:facebook_clone_flutter/widgets/responsive.dart';
import 'package:facebook_clone_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30,
              onPressed: () {
                print('search');
              },
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30,
              onPressed: () {
                print('messenger');
              },
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 5.0),
          sliver: SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers)),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
          sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories)),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          final Post post = posts[index];
          return PostContainer(post: post);
        }, childCount: posts.length))
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenDesktop({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.orange,
          ),
        ),
        const Spacer(),
        Container(
          width: 600,
          // padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: CustomScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0, 10.0),
                sliver: SliverToBoxAdapter(
                    child: Stories(currentUser: currentUser, stories: stories)),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 5.0),
                sliver:
                    SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers)),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              }, childCount: posts.length))
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
