import 'package:cactus_app/pages/home/entities/TabType.dart';
import 'package:cactus_app/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<BottomNavigationBarItem> tabs = List();
  int _selectedIndex = 0;
  List<Widget> _itemPagesTab = List();

  @override
  void initState() {
    //Init Tab
    _tabController = new TabController(length: 4, vsync: this);
    //Add tab
    TabType.values.forEach((element) {
      tabs.add(_addTab(element));
      _itemPagesTab.add(tabPage(element));
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: (_selectedIndex != TabType.MORE.index) ? _makeAprBar : null,
        body: IndexedStack(
          children: _itemPagesTab,
          index: _selectedIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          items: tabs,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.deepOrange[200],
          onTap: _onTabBottomItemClicked,
        ),
      ),
    );
  }

  BottomNavigationBarItem _addTab(TabType tabType) {
    return BottomNavigationBarItem(icon: Icon(tabIcon[tabType]), title: Text(tabTitle[tabType]));
  }

  void _onTabBottomItemClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _makeAprBar = AppbarCactus.cactusAppBar(Icons.search, () {
    //TODO open search screen
  });
}
