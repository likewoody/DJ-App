import 'package:dj_app/component/drawer.dart';
import 'package:flutter/material.dart';

import '../component/appbar.dart';

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
      appBar: AppBarComponent(
        appBarTitle: '진단테스트',
      ),
      drawer: const DrawerComponent(),
      body: Center(
        child: TabBarView(
          controller: tabController,
          children: [
            Text('1111'),
            Text('2222'),
            Text('3333'),
            Text('4444'),
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
