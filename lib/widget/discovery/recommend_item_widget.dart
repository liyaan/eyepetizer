import 'package:eyepetizer/model/discovery/recommend_model.dart';
import 'package:eyepetizer/util/cache_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const VIDEO_TYPE = 'video';

class RecommendItemWidget extends StatelessWidget {
  final RecommendItem item;

  const RecommendItemWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.data.content.type == VIDEO_TYPE) {
        } else {}
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 图片展示
            _imageItem(context),
            // 文字简介
            _contentTextItem(),
            // 作者信息、点赞数
            _infoTextItem()
          ],
        ),
      ),
    );
  }

  _imageItem(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    var width = item.data.content.data.width == 0
        ? maxWidth
        : item.data.content.data.width;
    var height = item.data.content.data.height == 0
        ? maxWidth
        : item.data.content.data.height;
    Widget image = Stack(
      children: <Widget>[
        cacheImage(
          item.data.content.data.cover.feed,
          shape: BoxShape.rectangle,
          width: maxWidth,
          fit: BoxFit.cover,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          clearMemoryCacheWhenDispose: true,
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Offstage(
            offstage: item.data.content.data.urls != null &&
                item.data.content.data.urls.length == 1,
            child: Icon(
              item.data.content.type == VIDEO_TYPE
                  ? Icons.play_circle_outline
                  : Icons.photo_library,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
    return AspectRatio(
      aspectRatio: width / height,
      child: image,
    );
  }

  _contentTextItem() {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
      child: Text(
        item.data.content.data.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }

  _infoTextItem() {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 0, 6, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              PhysicalModel(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(12),
                child: cacheImage(
                  item.data.content.data.owner.avatar,
                  width: 24,
                  height: 24,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 80,
                child: Text(
                  item.data.content.data.owner.nickname,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                size: 14,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(
                  '${item.data.content.data.consumption.collectionCount}',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
