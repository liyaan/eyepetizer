import 'package:eyepetizer/config/string.dart';
import 'package:eyepetizer/model/tab_info_model.dart';
import 'package:eyepetizer/page/hot/hot_tab_page.dart';
import 'package:eyepetizer/state/base_state.dart';
import 'package:eyepetizer/viewModel/hot/hot_tab_viewmodel.dart';
import 'package:eyepetizer/widget/app_bar.dart';
import 'package:eyepetizer/widget/tab_bar.dart';
import 'package:flutter/material.dart';

const TAB_LABEL = ['周排行', '月排行', '总排行'];
class HotPage extends StatefulWidget {
  const HotPage({Key key}) : super(key: key);

  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends BaseState<HotTabViewModel,HotPage>
    with SingleTickerProviderStateMixin{
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
  bool get wantKeepAlive => true;

  @override
  Widget getContentChild(HotTabViewModel model) {
    return Scaffold(
      appBar: appBar(
        LeoString.hot,
        showBack: false,
        bottom: tabBar(
          controller: _tabController,
          tabs: model.tabList.map((TabInfoItem label){
            return Tab(text: label.name,);
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  model.tabList.map((element) {
          return HotTabPage(url:element.apiUrl);
        }).toList(),
      ),
    );
  }

  @override
  HotTabViewModel get viewModel => HotTabViewModel();
}
