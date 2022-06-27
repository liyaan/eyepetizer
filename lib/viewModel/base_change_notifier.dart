import 'package:eyepetizer/widget/loading_state_widget.dart';
import 'package:flutter/material.dart';

class BaseChangeNotifier with ChangeNotifier{
  ViewState viewState = ViewState.loading;
  bool _dispose = false;
  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
  @override
  void notifyListeners() {
    if(!_dispose){
      super.notifyListeners();
    }
  }
}