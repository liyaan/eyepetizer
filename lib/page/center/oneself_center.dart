import 'package:eyepetizer/util/toast_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const List<String> list = ['我的消息','我的记录','我的缓存','观看记录','意见反馈'];
class OneSelfCenter extends StatelessWidget {
  const OneSelfCenter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      color: Colors.blueGrey,
      child: Column(
        children: <Widget>[
          _circleImage(),
          _userName(),
          _iconContent(),
          _divider(),
          _listWidget(),
        ],
      ),
    );
  }

//"images/ic_img_avatar.png",
  Widget _circleImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/ic_img_avatar.png'), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  Widget _userName() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "您好,欢迎使用",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _iconContent() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _icon('收藏', 'images/icon_like_grey.png'),
          ),
        SizedBox(
          width: 1,
          height: 35,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          ),
        ),
          Expanded(
            flex: 1,
            child: _icon('评论', 'images/icon_comment_grey.png'),
          ),
        ],
      ),
    );
  }

  Widget _icon(String content, String icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          content,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
  Widget _divider(){
    return Divider(
      color: Colors.grey,
      height: 30,
      thickness: 1,
      indent: 0,
      endIndent: 0,
    );
  }
  Widget _listWidget(){
    // return ListView.builder(
    //   shrinkWrap:true,
    //   itemCount: list.length,
    //   itemBuilder: (context,index){
    //     return InkWell(
    //       onTap: (){
    //         ToastUtils.showTip(list[index]);
    //       },
    //       child: Padding(
    //         padding: EdgeInsets.only(top: 15,bottom: 15),
    //         child: Text(
    //           list[index],
    //           style: TextStyle(color: Colors.white,fontSize: 16),
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     );
    //   },
    // );
    return ListView.separated(
        shrinkWrap:true,
        itemBuilder: (context,index){
          return InkWell(
                    onTap: (){
                      ToastUtils.showTip(list[index]);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,top: 15,bottom: 15),
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/ic_mine_selected.png',width: 30,height: 30,),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            list[index],
                            style: TextStyle(color: Colors.white,fontSize: 16),
                          ),
                        ],
                      )
                    ),
                  );
        },
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1.0, color: Colors.white60),
        itemCount: list.length);
  }
}
