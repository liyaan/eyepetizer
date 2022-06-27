
import 'package:eyepetizer/http/Url.dart';
import 'package:eyepetizer/model/common_item.dart';
import 'package:eyepetizer/viewModel/base_list_viewmodel.dart';

class CategoryDetailViewModel extends BaseListViewModel<Item,Issue>{
  int categoryId;

  CategoryDetailViewModel(this.categoryId);
  @override
  String getUrl() {
    return Url.categoryVideoUrl +
        "id=$categoryId&udid=d2807c895f0348a180148c9dfa6f2feeac0781b5&deviceModel=Android";
  }
  @override
  String getNextUrl(Issue model) {
    return model.nextPageUrl +
        "&udid=d2807c895f0348a180148c9dfa6f2feeac0781b5&deviceModel=Android";
  }
  @override
  Issue getModel(Map<String, dynamic> json) {
    return Issue.fromJson(json);
  }


  
}