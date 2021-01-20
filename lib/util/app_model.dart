import 'package:flutter/cupertino.dart';
import 'package:myapp/pages/default_page.dart';

class AppModel extends ChangeNotifier {
  Widget page;

  AppModel(){
    page = DefaultPage();
  }
  
  setPage(Widget page){
    this.page = page;
    notifyListeners();
  }
      
}
    
