import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarMain extends StatefulWidget {
  late TabController tabController;
  AppbarMain({Key? key, required this.tabController}) : super(key: key);

  @override
  _AppbarMainState createState() => _AppbarMainState();
}

class _AppbarMainState extends State<AppbarMain> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Whatsapp'),
      // backgroundColor: Color(0xFF075E54),
      backgroundColor: Colors.teal[600],
      // actions: [Icon(Icons.search), Icon(Icons.more_vert)],
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        PopupMenuButton(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  child: Text("New Group"),
                  value: 123,
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                  value: 369,
                ),
                PopupMenuItem(
                  child: Text("Linked Devices"),
                  value: 767,
                ),
                PopupMenuItem(
                  child: Text("Starred Messages"),
                  value: 556,
                ),
                PopupMenuItem(
                  child: Text("Pyments"),
                  value: 999,
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                  value: 454,
                ),
              ];
            },
            onSelected: (value) {})
      ],
      bottom: TabBar(
        overlayColor: MaterialStateProperty.all(Colors.white),
        indicatorColor: Colors.white,
        controller: widget.tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.camera_alt),
          ),
          Tab(
            text: 'CHATS',
          ),
          Tab(
            text: 'STATUS',
          ),
          Tab(
            text: 'CALLS',
          ),
        ],
      ),
    );
  }
}
