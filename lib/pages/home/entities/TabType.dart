import 'package:cactus_app/pages/about/about_page.dart';
import 'package:cactus_app/pages/blog/blog_page.dart';
import 'package:cactus_app/pages/cactusbranch/branch_page.dart';
import 'package:cactus_app/pages/map/map_page.dart';
import 'package:cactus_app/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabType { BLOG, CACTUS_TYPES, MAP, MORE }

const Map<TabType, IconData> tabIcon = {
  TabType.BLOG: Icons.description,
  TabType.CACTUS_TYPES: Icons.dialpad,
  TabType.MAP: Icons.map,
  TabType.MORE: Icons.more_horiz
};

const Map<TabType, String> tabTitle = {
  TabType.BLOG: StringUtils.tabTypeBlog,
  TabType.CACTUS_TYPES: StringUtils.tabTypeCactus,
  TabType.MAP: StringUtils.tabTypeMap,
  TabType.MORE: StringUtils.tabTypeMore,
};

// ignore: missing_return
Widget tabPage(TabType tabType) {
  switch (tabType) {
    case TabType.BLOG:
      return BlogPage();
    case TabType.CACTUS_TYPES:
      return BranchPage();
    case TabType.MAP:
      return MapPage();
    case TabType.MORE:
      return AboutPage();
  }
}
