
import 'package:eyepetizer/http/Url.dart';
import 'package:eyepetizer/http/http_manager.dart';
import 'package:eyepetizer/model/hot/hot_tab_model.dart';
import 'package:eyepetizer/model/tab_info_model.dart';
import 'package:eyepetizer/util/toast_util.dart';
import 'package:eyepetizer/widget/loading_state_widget.dart';

import '../base_change_notifier.dart';
import '../base_viewmodel.dart';

class HotTabViewModel extends BaseViewModel{
  List<TabInfoItem> tabList = [];
  void refresh(){
    HttpManager.requestData('${Url.rankUrl}').then((result){
      tabList = HotTabModel.fromJson(result).tabInfo.tabList;
      viewState = ViewState.done;
      tabList.forEach((element) {
        print(element.name);
      });
    }).catchError((e){
      ToastUtils.showError(e.toString());
      viewState = ViewState.error;
    }).whenComplete(() => notifyListeners());
  }
  void retry() {
    viewState = ViewState.loading;
    notifyListeners();
    refresh();
  }
}