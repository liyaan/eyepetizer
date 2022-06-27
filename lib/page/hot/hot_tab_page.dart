import 'package:eyepetizer/model/common_item.dart';
import 'package:eyepetizer/model/hot/list/hot_list.dart';
import 'package:eyepetizer/state/base_list_state.dart';
import 'package:eyepetizer/viewModel/hot/hot_list_viewmodel.dart';
import 'package:eyepetizer/widget/hot/hot_page_widget.dart';
import 'package:flutter/material.dart';
class HotTabPage extends StatefulWidget {
  final String url;
  const HotTabPage({Key key,this.url}) : super(key: key);

  @override
  _HotTabPageState createState() => _HotTabPageState();
}

class _HotTabPageState extends BaseListState<Item,HotListViewModel,HotTabPage> {

  @override
  void init() {
    enablePullUp = false;
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget getContentChild(HotListViewModel model) => ListView.separated(
    separatorBuilder: (context, index) => Divider(height: 0.5),
    itemCount: model.itemList.length,
    itemBuilder: (context, index) {
      print('${model.itemList[index].id}');
      // HotPageWidget(item: model.itemList[index])
      return HotPageWidget(item: model.itemList[index]);
    },
  );

  @override
  HotListViewModel get viewModel => HotListViewModel(widget.url);
}
