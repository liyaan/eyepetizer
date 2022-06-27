import 'package:eyepetizer/model/common_item.dart';
import 'package:eyepetizer/util/cache_image.dart';
import 'package:eyepetizer/util/date_util.dart';
import 'package:eyepetizer/util/navigator_util.dart';
import 'package:eyepetizer/util/share_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotPageWidget extends StatelessWidget {
  final Item item;
  final bool showCategory;
  final bool showDivider;

  const HotPageWidget({Key key, this.item, this.showCategory = true,
    this.showDivider = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            toNamed("/detail", item.data);
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Stack(
              children: [
                _imageWidet(context),
                _imageSign(),
                _imageTime()
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Row(
            children: <Widget>[
              _authorHeaderImage(item),
              _videoDescription(),
              _shareButton(),
            ],
          ),
        ),
        Offstage(
          offstage: showDivider,
          child: Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Divider(
              height: 0.5,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageWidet(BuildContext context){
    return ClipRRect(
      child: Hero(tag: '${item.data.id}${item.data.time}',
        child: cacheImage(
          item.data.cover.feed,
          width: MediaQuery.of(context).size.width,
          height: 200,
        ),
      ),
      borderRadius: BorderRadius.circular(4),
    );
  }

  Widget _imageSign() {
    return Positioned(
        left: 15,
        top: 10,
        child: Opacity(
          opacity: showCategory ? 1.0 : 0.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(22),
            ),
            height: 44,
            width: 44,
            alignment: AlignmentDirectional.center,
            child: Text(
              item.data.category,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
    );
  }

  Widget _imageTime() {
    return Positioned(
        right: 15,
        bottom: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white54
            ),
            padding: EdgeInsets.all(5),
            child: Text(
              formatDateMsByMS(item.data.duration * 1000),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
    );
  }

  Widget _authorHeaderImage(Item item){
    return ClipOval(
      clipBehavior: Clip.antiAlias,
      child: cacheImage(
        _authorUrl(item),
        width:40,
        height: 40,
      ),
    );
  }
  Widget _videoDescription(){
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.data.title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                item.data.author == null
                    ? item.data.description
                    : item.data.author.name,
                style: TextStyle(
                  color: Color(0xff9a9a9a),
                  fontSize: 12,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  String _authorUrl(Item item){
    return item.data.author == null
        ? item.data.provider.icon : item.data.author.icon;
  }

  Widget _shareButton() {
    return IconButton(onPressed:(){
      share(item.data.title, item.data.playUrl);
    }, icon: Icon(Icons.share, color: Colors.black38));
  }
}
