import 'package:flutter/cupertino.dart';
import 'package:myapp/pages/default_page.dart';

class PageInfo {
  String titulo;
  Widget page;

  PageInfo({
    this.titulo,
    this.page,
  });



  @override
  String toString() => 'PageInfo(titulo: $titulo, page: $page)';
}

class AppModel extends ChangeNotifier {
  List<PageInfo> pages =[];

  PageInfo defaultPage = PageInfo(titulo: "Home", page: DefaultPage());

  AppModel(){
    pages.add(defaultPage);
  }
  
  setPage(PageInfo page ,{bool replace = false}){
    if(replace){
      clearAll();
    }
    if(page.titulo != "Home"){
    this.pages.add(page);
    }
    notifyListeners();
  }

  void pop() {
    pages.removeLast();
    notifyListeners();
  }

  void clearAll() {
      pages.clear();
      pages.add(defaultPage);
      notifyListeners();
  }

  void clearTo(int index) {
  pages.removeRange(index+1, pages.length);
  notifyListeners();
  }
      
}
    
