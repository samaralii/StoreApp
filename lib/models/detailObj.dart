
class DetailObj {
  String status;
  DetailDataObj data;

  DetailObj({this.status, this.data});

  factory DetailObj.fromJson(Map<String, dynamic> parsedJson) {
    return DetailObj(
        status: parsedJson['status'],
        data: DetailDataObj.fromJson(parsedJson['data']));
  }

  Map<String, dynamic> toJson() => {"status": status, "data": data};
}

class DetailDataObj {
  DetailItemObj item;

  DetailDataObj({this.item});

  factory DetailDataObj.fromJson(Map<String, dynamic> parsedJson) {
    return DetailDataObj(item: DetailItemObj.fromJson(parsedJson['Item']));
  }

  Map<String, dynamic> toJson() => {"Item": item};
}

class DetailItemObj {
  int qty = 1;
  String title;
  int id;
  String description;
  int price;
  List<DetailImageObj> images;
  List<DetailAttributeObj> attributes;

  DetailItemObj({this.title, this.description, this.price, this.id});

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "images": images,
        "attributes": attributes,
        "qty": qty,
        "id": id,
      };

  DetailItemObj.fromJson(Map<String, dynamic> parsedJson) {
    this.title = parsedJson['title'];
    this.qty = 1;
    this.description = parsedJson['description'];
    this.id = parsedJson['id'];
    this.price = parsedJson['price'];

    this.images = [];
    var _imagesList = parsedJson['images'];

    this.attributes = [];
    var _attrList = parsedJson['attributes'];

    for (var item in _imagesList) {
      images.add(DetailImageObj.fromJson(item));
    }

    for (var item in _attrList) {
      attributes.add(DetailAttributeObj.fromJson(item));
    }
  }
}

class DetailImageObj {
  String url;
  DetailImageObj({this.url});

  Map<String, dynamic> toJson() => {"url": url};

  factory DetailImageObj.fromJson(Map<String, dynamic> parsedJson) {
    return DetailImageObj(url: parsedJson['url']);
  }
}

class DetailAttributeObj {
  String name;
  String value;

  List<AttrObj> attr;

  DetailAttributeObj({this.name, this.value});

  Map<String, dynamic> toJson() => {"name": name, "value": value, "attr": attr};

  DetailAttributeObj.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    value = parsedJson['value'];
    attr = [];

    if (parsedJson['attr'] == null) {
      var list = value.split(',');

      for (var item in list) {
        attr.add(AttrObj(name: item, isSelected: false));
      }
    } else {
      for (var item in parsedJson['attr']) {
        attr.add(AttrObj.fromJson(item));
      }
    }
  }
}

class AttrObj {
  String name;
  bool isSelected;

  Map<String, dynamic> toJson() => {"name": name, "isSelected": isSelected};

  AttrObj({this.name, this.isSelected});

  factory AttrObj.fromJson(Map<String, dynamic> parsedJson) {
    return AttrObj(
      name: parsedJson['name'],
      isSelected: parsedJson['isSelected'],
    );
  }
}
