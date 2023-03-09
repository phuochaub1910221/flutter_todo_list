import 'package:fltter_date/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/notifi_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
          children: [const Text("Theme data", style: TextStyle(fontSize: 30))]),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Dark Theme"
                  : "Activated Light Theme");
        },
        child: const Icon(
          Icons.nightlight_round,
          size: 30,
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        const Icon(
          Icons.person,
          size: 30,
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
