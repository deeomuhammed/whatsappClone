import 'package:flutter/material.dart';
import 'package:whatsapp/pages/calls.dart';
import 'package:whatsapp/pages/cam.dart';
import 'package:whatsapp/pages/chatpage.dart';
import 'package:whatsapp/pages/status.dart';
import 'package:whatsapp/widgets/appbar_main.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WhatsappHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WhatsappHome extends StatefulWidget {
  const WhatsappHome({Key? key}) : super(key: key);

  @override
  _WhatsappHomeState createState() => _WhatsappHomeState();
}

class _WhatsappHomeState extends State<WhatsappHome>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppbarMain(tabController: tabController),
        ),
        body: TabBarView(
          children: const [
            cam(),
            chatpage(),
            Status(),
            calls(),
          ],
          controller: tabController,
        ),
      ),
    );
  }
}
