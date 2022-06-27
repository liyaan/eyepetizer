import 'package:eyepetizer/model/common_item.dart';
import 'package:eyepetizer/model/discovery/category_model.dart';
import 'package:eyepetizer/state/base_list_state.dart';
import 'package:eyepetizer/util/cache_image.dart';
import 'package:eyepetizer/util/navigator_util.dart';
import 'package:eyepetizer/viewModel/discovery/category_detail_viewmodel.dart';
import 'package:eyepetizer/widget/list_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryDetailPage extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryDetailPage({Key key, this.categoryModel}) : super(key: key);

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState 
    extends BaseListState<Item, CategoryDetailViewModel, CategoryDetailPage> {
  @override
  void init() {
    // 设置不能下拉刷新
    enablePullDown = false;
  }
  @override
  Widget getContentChild(CategoryDetailViewModel model) {
    return CustomScrollView(
      slivers: [
        _sliverAppBar(),
        _sliverList(model),
      ],
    );
  }
  Widget _sliverAppBar() {
    return SliverAppBar(
      leading: GestureDetector(
        onTap: ()=>back(),
        child: Icon(Icons.arrow_back_ios),
      ),
      elevation: 0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: _flexibleSpace(),
    );
  }
  Widget _flexibleSpace() {
    return LayoutBuilder(
        builder: (context,constraints){
          changeExpendStatus(
            (MediaQuery.of(context).padding.top).toInt() + 56,
            constraints.biggest.height.toInt(),
          );
          return FlexibleSpaceBar(
            title: Text(
              widget.categoryModel.name,
              style: TextStyle(color: isExpend ? Colors.white : Colors.black),
            ),
            centerTitle: false,
            background: cacheImage(widget.categoryModel.headerImage),
          );
        },
    );
  }
  bool isExpend = true;

  void changeExpendStatus(int statusBarHeight, int offset) {
    if (offset > statusBarHeight && offset < 250) {
      if (!isExpend) {
        isExpend = true;
      }
    } else {
      if (isExpend) {
        isExpend = false;
      }
    }
  }
  Widget _sliverList(model) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return ListItemWidget(
              item: model.itemList[index],
              showCategory: false,
              showDivider: false);
        },
        childCount: model.itemList.length,
      ),
    );
  }
  @override
  CategoryDetailViewModel get viewModel => CategoryDetailViewModel(widget.categoryModel.id);
  
}
