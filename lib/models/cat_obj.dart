class CatStatus {
  String status;
  CatDataObj data;

  CatStatus({this.data, this.status});

  factory CatStatus.fromJson(Map<String, dynamic> parsedJson) {
    return CatStatus(
        status: parsedJson['status'],
        data: CatDataObj.fromJson(parsedJson['data']));
  }
}

class CatDataObj {
  List<CatObj> item;

  CatDataObj({this.item});

  CatDataObj.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['Item'];

    item = [];

    for (var i in list) {
      item.add(CatObj.fromJson(i));
    }
  }
}

class CatObj {
  int id;
  String title;
  int price;
  String image;

  CatObj(
      {this.id, this.title, this.price, this.image});

  factory CatObj.fromJson(Map<String, dynamic> parsedJson) {
    return CatObj(
      id: parsedJson['id'],
      title: parsedJson['title'],
      price: parsedJson['price'],
      image: parsedJson['image'],
    );
  }
}
