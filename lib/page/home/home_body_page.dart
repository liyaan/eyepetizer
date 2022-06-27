import 'package:eyepetizer/model/common_item.dart';
import 'package:eyepetizer/state/base_list_state.dart';
import 'package:eyepetizer/viewModel/home/home_page_viewmodel.dart';
import 'package:eyepetizer/widget/list_item_widget.dart';
import 'package:eyepetizer/widget/loading_state_widget.dart';
import 'package:eyepetizer/widget/provider_widget.dart';
import 'package:flutter/material.dart';

import '../../widget/home/banner_widget.dart';
const TEXT_HEADER_TYPE = 'textHeader';
class HomeBodyPage extends StatefulWidget {
  const HomeBodyPage({Key key}) : super(key: key);

  @override
  _HomeBodyPageState createState() => _HomeBodyPageState();
}

class _HomeBodyPageState
    extends BaseListState<Item,HomePageViewModel,HomeBodyPage>{



  @override
  Widget getContentChild(HomePageViewModel model) {
    return ListView.separated(
        itemCount: model.itemList.length,
        itemBuilder:(context,index){
          if(index == 0){
            return _banner(model);
          }else{
            if(model.itemList[index].type == TEXT_HEADER_TYPE){
              return _titleItem(model.itemList[index]);
            }
            return ListItemWidget(item:model.itemList[index]);
          }
        },
        separatorBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.fromLTRB(15,0,15,0),
            child: Divider(
              height: _divider(model.itemList[index].type,index)
                  ? 0
                  : 0.5,
              color: _divider(model.itemList[index].type,index)
                  ? Colors.transparent
                  : Color(0xffe6e6e6),
            ),
          );
        },
    );
  }

  @override
  HomePageViewModel get viewModel => HomePageViewModel();
  bool _divider(String type,int index) =>(type == TEXT_HEADER_TYPE || index == 0);
  _titleItem(Item item) {
    return Container(
      decoration: BoxDecoration(color: Colors.white24),
      padding: EdgeInsets.only(top: 15,bottom: 5),
      child: Center(
        child: Text(
          item.data.text,
          style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  _banner(model){
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 15, top: 15, right: 15),
      // ClipRRect:对子组件进行圆角裁剪
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: BannerWidget(model: model),
      ),
    );
  }
}
