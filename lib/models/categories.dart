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

  ObjCategories({
    this.id,
    this.title,
    this.image,
  });

  factory ObjCategories.fromJson(Map<String, dynamic> parsedJson) {
    return ObjCategories(
      id: parsedJson['id'],
      title: parsedJson['title'],
      image: parsedJson['image'],
    );
  }
}
