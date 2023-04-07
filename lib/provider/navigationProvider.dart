import 'package:events/models/navigation_item.dart';
import 'package:flutter/foundation.dart';

class NavigationProvider extends ChangeNotifier{
  NavigationItem _navigationItem = NavigationItem.home;
  NavigationItem get navigationItem => _navigationItem;
  void setNavigationItem(NavigationItem navigationItem){
    _navigationItem=navigationItem;
    notifyListeners();
  }
}