
import 'package:eyepetizer/http/Url.dart';
import 'package:eyepetizer/http/http_manager.dart';
import 'package:eyepetizer/model/common_item.dart';
import 'package:eyepetizer/model/issue_model.dart';
import 'package:eyepetizer/util/toast_util.dart';
import 'package:eyepetizer/viewModel/base_change_notifier.dart';
import 'package:eyepetizer/widget/loading_state_widget.dart';

import '../base_list_viewmodel.dart';

class HotListViewModel extends BaseListViewModel<Item,Issue>{
  List<Item> itemList = [];
  String mUrl;
  HotListViewModel(this.mUrl);
  @override
  void getData(List<Item> list) {
     print("list.length ==  ${list.length}");
     itemList = list;
     print("itemList.length ==  ${itemList.length}");
     // itemList.clear();
     // itemList.add(Item());
  }
  @override
  void removeUselessData(List<Item> list) {
    list.removeWhere((element){
      return element.type == 'banner2';
    });
  }
  @override
  void doExtraAfterRefresh() async{
    await loadMore();
  }

  @override
  Issue getModel(Map<String, dynamic> json) => Issue.fromJson(json);

  @override
  String getUrl() => mUrl;
}