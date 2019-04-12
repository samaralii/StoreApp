class ObjHome {
  String status;
  ObjData data;

  ObjHome({this.status, this.data});
  // ObjHome({this.status});

  factory ObjHome.fromJson(Map<String, dynamic> parsedJson) {
    return ObjHome(status: parsedJson['status'], data: ObjData.fromJson(parsedJson['data']));
  }
}

class ObjData {
  List<ObjPages> pages;

  ObjData({this.pages});

  ObjData.fromJson(Map<String, dynamic> parsedJson) {
    final _pagesList = parsedJson['pages'];
    this.pages = [];

    for (var item in _pagesList) {
      this.pages.add(ObjPages.fromJson(item));
    }
  }
}

class ObjPages {
  String title;
  List<ObjItems> items;

  ObjPages({this.title, this.items});

  ObjPages.fromJson(Map<String, dynamic> parsedJson) {
    this.title = parsedJson['title'];
    final _itemList = parsedJson['items'];

    this.items = [];

    for (var item in _itemList) {
      items.add(ObjItems.fromJson(item));
    }
  }
}

class ObjItems {
  int id;
  String itemTitle;
  String image;

  ObjItems({this.id, this.itemTitle, this.image});

  factory ObjItems.fromJson(Map<String, dynamic> parsedJson) {
    return ObjItems(
      id: parsedJson['id'],
      itemTitle: parsedJson['item_title'],
      image: parsedJson['image'],
    );
  }
}
