import 'package:eyepetizer/model/common_item.dart';
import 'package:eyepetizer/state/base_list_state.dart';
import 'package:eyepetizer/viewModel/discovery/follow_viewmodel.dart';
import 'package:eyepetizer/widget/discovery/follow_item_widget.dart';
import 'package:flutter/material.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState
    extends BaseListState<Item, FollowViewModel, FollowPage> {
  @override
  Widget getContentChild(FollowViewModel model) => ListView.separated(
    separatorBuilder: (context, index) => Divider(height: 0.5),
    itemCount: model.itemList.length,
    itemBuilder: (context, index) {
      return FollowItemWidget(item: model.itemList[index]);
    },
  );

  @override
  FollowViewModel get viewModel => FollowViewModel();
}