import 'package:animations/animations.dart';
import 'package:eyepetizer/state/base_state.dart';
import 'package:eyepetizer/util/cache_image.dart';
import 'package:eyepetizer/viewModel/discovery/category_viewmodel.dart';
import 'package:flutter/material.dart';

import 'category_detail_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends BaseState<CategoryViewModel, CategoryPage> {
  @override
  Widget getContentChild(CategoryViewModel model) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Color(0xfff2f2f2)),
      child: GridView.builder(
        itemCount: model.list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 交叉轴方向的个数
          crossAxisCount: 2,
          // 主轴方向的间距
          mainAxisSpacing: 5,
          // 交叉轴方向的间距
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          // 一个容器，当点击时，它会增长到填满屏幕以显示新内容。
          return OpenContainer(
            // 过度动画时间设置
            // transitionDuration: Duration(milliseconds: 3000),
            // 默认显示的Widget
            closedBuilder: (context, action) {
              return _categoryImage(model, index);
            },
            // 点击打开的页面
            openBuilder: (context, action) {
              return CategoryDetailPage(categoryModel: model.list[index]);
            },
          );
        },
      ),
    );
  }

  Widget _categoryImage(CategoryViewModel model, int index) {
    // print("aaaaa ${model.list[index].bgPicture}");
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: cacheImage(model.list[index].bgPicture)),
        Center(
          child: Text(
            '#${model.list[index].name}',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
  @override
  CategoryViewModel get viewModel => CategoryViewModel();
  
}