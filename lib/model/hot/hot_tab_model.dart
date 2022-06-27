import '../tab_info_model.dart';

class HotTabModel {
  TabInfo tabInfo;

  HotTabModel({this.tabInfo});

  HotTabModel.fromJson(Map<String, dynamic> json) {
    tabInfo =
    json['tabInfo'] != null ? new TabInfo.fromJson(json['tabInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tabInfo != null) {
      data['tabInfo'] = this.tabInfo.toJson();
    }
    return data;
  }
}