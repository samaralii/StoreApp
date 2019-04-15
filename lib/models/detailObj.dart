class DetailObj {
  String status;
  DetailDataObj data;

  DetailObj({this.status, this.data});

  factory DetailObj.fromJson(Map<String, dynamic> parsedJson) {
    return DetailObj(
        status: parsedJson['status'],
        data: DetailDataObj.fromJson(parsedJson['data']));
  }
}

class DetailDataObj {
  DetailItemObj item;

  DetailDataObj({this.item});

  factory DetailDataObj.fromJson(Map<String, dynamic> parsedJson) {
    return DetailDataObj(item: DetailItemObj.fromJson(parsedJson['Item']));
  }
}

class DetailItemObj {
  String title;
  String description;
  int price;
  List<DetailImageObj> images;


  DetailItemObj({this.title, this.description, this.price});

 DetailItemObj.fromJson(Map<String, dynamic> parsedJson) {
    
      this.title = parsedJson['title'];
      this.description = parsedJson['description'];
      this.price = parsedJson['price'];
      this.images = [];
      var _imagesList = parsedJson['images'];

      for (var item in _imagesList) {
        images.add(DetailImageObj.fromJson(item)); 
      } 

  }
}

class DetailImageObj {
  String url;
  DetailImageObj({this.url});
  factory DetailImageObj.fromJson(Map<String, dynamic> parsedJson) {
    return DetailImageObj(
      url: parsedJson['url']
    );
  }
}
