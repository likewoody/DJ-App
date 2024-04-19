import 'package:dj_app/component/drawer.dart';
import 'package:dj_app/view/main_view_page.dart';
import 'package:flutter/material.dart';

import '../component/appbar.dart';
import 'hospital_map/hospital_map_page.dart';
import 'setting_page/setting_page.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {
  // --- Properties ---
  late TabController tabController;
  late String test;

  // initState
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    test = '11';
  }

  // dispose
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // --- Builder ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
      drawer: const DrawerComponent(),
      body: Center(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            MainViewPage(),
            Text('2222'),
            HospitalMap(),
            SettingPage(),
          ],
        ),
      ),
      bottomNavigationBar: TabBar(
        controller: tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.summarize),
          ),
          Tab(
            icon: Icon(Icons.local_hospital),
          ),
          Tab(
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
