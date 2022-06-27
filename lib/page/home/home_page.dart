import 'package:eyepetizer/config/string.dart';
import 'package:eyepetizer/widget/app_bar.dart';
import 'package:flutter/material.dart';

import 'home_body_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBar(
        LeoString.home,
        showBack: false,
      ),
      body: HomeBodyPage(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
