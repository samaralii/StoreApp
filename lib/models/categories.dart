class ObjStatus {
  String status;
  ObjData data;

  ObjStatus({this.status, this.data});

  factory ObjStatus.fromJson(Map<String, dynamic> parsedJson) {
    return ObjStatus(
        status: parsedJson['status'],
        data: ObjData.fromJson(parsedJson['data']));
  }
}

class ObjData {
  List<ObjCategories> categories;

  ObjData.fromJson(Map<String, dynamic> parsedJson) {
    this.categories = [];
    final _catList = parsedJson['categories'];

    for (var item in _catList) {
      this.categories.add(ObjCategories.fromJson(item));
    }
  }
}

class ObjCategories {
  int id;
  String title;
  String image;
  List<Tags> tags;

  ObjCategories({
    this.id,
    this.title,
    this.image,
    this.tags,
  });

  ObjCategories.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.image = parsedJson['image'];
    final _tagList = parsedJson['tags'];

    this.tags = [];

    for (var item in _tagList) {
      tags.add(Tags.fromJson(item));
    }
  }
}

class Tags {
  int id;
  String title;

  Tags({this.id, this.title});

  factory Tags.fromJson(Map<String, dynamic> parsedJson) {
    return Tags(
      id: parsedJson['id'],
      title: parsedJson['title'],
    );
  }
}