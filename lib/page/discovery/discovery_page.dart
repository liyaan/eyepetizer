import 'package:eyepetizer/config/string.dart';
import 'package:eyepetizer/page/discovery/recommend_page.dart';
import 'package:eyepetizer/page/discovery/topic_page.dart';
import 'package:eyepetizer/widget/app_bar.dart';
import 'package:eyepetizer/widget/tab_bar.dart';
import 'package:flutter/material.dart';

import 'category_page.dart';
import 'follow_page.dart';
import 'news_page.dart';

const TAB_LABEL = ['关注', '分类', '专题', '资讯', '推荐'];

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TAB_LABEL.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBar(
        LeoString.discovery,
        showBack: false,
        // TabBar 和 TabBarView 结合使用
        bottom: tabBar(
          // 与TabBarView 同一个 controller
          controller: _tabController,
          tabs: TAB_LABEL.map((String label) {
            return Tab(text: label);
          }).toList(),
        ),
      ),
      body: TabBarView(
        // 与TabBar 同一个 controller
        controller: _tabController,
        // 与标签个数一致
        children: <Widget>[
          FollowPage(),
          CategoryPage(),
          TopicPage(),
          NewsPage(),
          RecommendPage(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
