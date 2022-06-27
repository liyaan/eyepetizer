import 'package:eyepetizer/config/color.dart';
import 'package:eyepetizer/config/string.dart';
import 'package:eyepetizer/model/discovery/topic_detail_model.dart';
import 'package:eyepetizer/util/cache_image.dart';
import 'package:eyepetizer/util/date_util.dart';
import 'package:eyepetizer/util/navigator_util.dart';
import 'package:eyepetizer/util/share_util.dart';
import 'package:eyepetizer/widget/expand_more_text_widget.dart';
import 'package:flutter/material.dart';

class TopicDetailItemWidget extends StatelessWidget {
  final TopicDetailItemData model;

  const TopicDetailItemWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> toNamed('/detail', model.data.content.data),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // author 介绍
          _author(),
          // 作品描述
          _description(),
          // 标签
          _tag(),
          // 视频图片
          _videoImage(context),
          // 视频状态
          _videoState(),
          // 分割线
          _divider(),
        ],
      ),
    );
  }

  Widget _author() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
          child: ClipOval(
            child: cacheImage(
              model.data.header.icon == null ? '' : model.data.header.icon,
              width: 45,
              height: 45,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.data.header.issuerName == null
                      ? ''
                      : model.data.header.issuerName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '${formatDateMsByYMD(model.data.header.time)}发布：',
                      style:
                      TextStyle(color: LeoColor.hitTextColor, fontSize: 12),
                    ),
                    Expanded(
                      child: Text(
                        model.data.content.data.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _description() {
    var textStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    );
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: ExpandMoreTextWidget(
        text:model.data.content.data.description,
        style: TextStyle(fontSize: 14, color: LeoColor.desTextColor),
        moreStyle: textStyle,
        lessStyle: textStyle,
      ),
    );
  }
  Widget _tag() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        children:_getTagWidgetList(model),
      ),
    );
  }
  List<Widget> _getTagWidgetList(TopicDetailItemData itemData) {
    List<Widget> widgetList = itemData.data.content.data.tags.map((tag){
      return Container(
        margin: EdgeInsets.only(right: 5),
        alignment: Alignment.center,
        height: 20,
        padding: EdgeInsets.only(left: 5,right: 5),
        decoration: BoxDecoration(
          color: LeoColor.tabBgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          tag.name,
          style: TextStyle(fontSize: 12, color: Colors.blue),
        ),
      );
    } ).toList();
    return widgetList.length>3 ? widgetList.sublist(0,3) : widgetList;
  }
  Widget _videoImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 20, 5),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            child: Hero(
                tag: '${model.data.content.data.id}${model.data.content.data.time}',
                child: cacheImage(
                  model.data.content.data.cover.feed,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                ),
                padding: EdgeInsets.all(5),
                child: Text(
                  formatDateMsByMS(model.data.content.data.duration * 1000),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _videoState() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _videoStateItem('${model.data.content.data.consumption.collectionCount}',
            Icons.favorite_border),
        _videoStateItem('${model.data.content.data.consumption.replyCount}',
            Icons.message),
        _videoStateItem(LeoString.collect_text,
            Icons.star_border),
        IconButton(
          icon: Icon(Icons.share, color: LeoColor.hitTextColor),
          onPressed: () => share(model.data.content.data.title,
              model.data.content.data.webUrl.forWeibo),
        ),
      ],
    );
  }
  Widget _divider() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Divider(
        height: 0.5,
      ),
    );
  }
  Widget _videoStateItem(String content,IconData icon){
    return Row(
      children: <Widget>[
        Icon(icon,size: 20,color: LeoColor.hitTextColor),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            content,
            style: TextStyle(fontSize: 12, color: LeoColor.hitTextColor),
          ),
        ),
      ],
    );
  }
}
