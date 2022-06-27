import 'package:eyepetizer/util/cache_image.dart';
import 'package:eyepetizer/util/navigator_util.dart';
import 'package:eyepetizer/viewModel/home/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {
  final HomePageViewModel model;
  const BannerWidget({Key key,this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: model.bannerList.length ?? 0,
      autoplay: true,
      itemBuilder: (BuildContext context,int index){
        return Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: cachedNetworkImageProvider(
                      model.bannerList[index].data.cover.feed),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width-30,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                decoration: BoxDecoration(color: Colors.black12),
                child: Text(
                  model.bannerList[index].data.title,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        );
      },
      onTap: (index) {
        // print("点击了banner图。。$index}");
        toNamed("/detail", model.bannerList[index].data);
      },
      // banner 指示器
      pagination: new SwiperPagination(
        // 位置：右下角
        alignment: Alignment.bottomRight,
        // 指示器的样式
        builder: DotSwiperPaginationBuilder(
            size: 8,
            activeSize: 8,
            activeColor: Colors.white,
            color: Colors.white70),
      ),
    );
  }
}
