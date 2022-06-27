
import 'package:eyepetizer/http/Url.dart';
import 'package:eyepetizer/http/http_manager.dart';
import 'package:eyepetizer/model/common_item.dart';
import 'package:eyepetizer/model/issue_model.dart';
import 'package:eyepetizer/util/toast_util.dart';
import 'package:eyepetizer/viewModel/base_change_notifier.dart';
import 'package:eyepetizer/viewModel/base_list_viewmodel.dart';
import 'package:eyepetizer/widget/loading_state_widget.dart';

class HomePageViewModel extends BaseListViewModel<Item,IssueEntity>{
  List<Item> bannerList = [];

  @override
  IssueEntity getModel(Map<String, dynamic> json) => IssueEntity.fromJson(json);

  @override
  String getUrl() => Url.feedUrl;

  @override
  void getData(List<Item> list) {
    bannerList = list;
    itemList.clear();
    itemList.add(Item());
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
}