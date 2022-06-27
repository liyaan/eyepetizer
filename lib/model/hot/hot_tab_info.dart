import 'hot_tab_list.dart';

class TabInfo {
  List<HotTabList> tabList;
  int defaultIdx;

  TabInfo({this.tabList, this.defaultIdx});

  TabInfo.fromJson(Map<String, dynamic> json) {
    if (json['tabList'] != null) {
      tabList = <HotTabList>[];
      json['tabList'].forEach((v) {
        tabList.add(new HotTabList.fromJson(v));
      });
    }
    defaultIdx = json['defaultIdx'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tabList != null) {
      data['tabList'] = this.tabList.map((v) => v.toJson()).toList();
    }
    data['defaultIdx'] = this.defaultIdx;
    return data;
  }
}