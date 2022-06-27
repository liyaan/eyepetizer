import 'package:extended_image/extended_image.dart';
import 'package:eyepetizer/http/http_manager.dart';
import 'package:eyepetizer/model/paging_model.dart';
import 'package:eyepetizer/util/toast_util.dart';
import 'package:eyepetizer/viewModel/base_change_notifier.dart';
import 'package:eyepetizer/widget/loading_state_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseListViewModel<T,M extends PagingModel<T>>
    extends BaseChangeNotifier{
  List<T> itemList = [];
  String nextPageUrl;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  String getUrl();
  M getModel(Map<String,dynamic> json);

  void getData(List<T> list){
    this.itemList = list;
  }
  void removeUselessData(List<T> list){}
  void doExtraAfterRefresh() {}
  String getNextUrl(M model){
    return model.nextPageUrl;
  }
  void refresh(){
    print("getUrl = ${getUrl()}");
    HttpManager.getData(
      getUrl(),
      success: (json){
        M model = getModel(json);
        removeUselessData(model.itemList);
        getData(model.itemList);
        viewState = ViewState.done;
        nextPageUrl = getNextUrl(model);
        refreshController.refreshCompleted();
        refreshController.footerMode.value = LoadStatus.canLoading;
        doExtraAfterRefresh();
      },
      fail: (e){
        ToastUtils.showError(e.toString());
        refreshController.refreshFailed();
        viewState = ViewState.error;
      },
      complete: () => notifyListeners(),
    );
  }
  Future<void> loadMore() async{
    if(nextPageUrl == null){
      refreshController.loadNoData();
      return;
    }
    HttpManager.getData(nextPageUrl,success: (json){
      M model = getModel(json);
      removeUselessData(model.itemList);
      itemList.addAll(model.itemList);
      nextPageUrl = getNextUrl(model);
      refreshController.loadComplete();
      notifyListeners();
    },
    fail: (e){
      ToastUtils.showError(e.toString());
      refreshController.loadFailed();
    });
  }
  //错误重试
  retry() {
    viewState = ViewState.loading;
    notifyListeners();
    refresh();
  }
}