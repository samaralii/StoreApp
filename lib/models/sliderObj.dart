class SliderStatus {
  String status;
  SliderDataObj data;

  SliderStatus({this.data, this.status});

  factory SliderStatus.fromJson(Map<String, dynamic> parsedJson) {
    return SliderStatus(
        status: parsedJson['status'],
        data: SliderDataObj.fromJson(parsedJson['data']));
  }
}

class SliderDataObj {
  List<SliderObj> slider;

  SliderDataObj({this.slider});

  SliderDataObj.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['slider'];

    slider = [];

    for (var item in list) {
      slider.add(SliderObj.fromJson(item));
    }
  }
}

class SliderObj {
  int id;
  String title;
  String description;
  String image;
  int categoryId;

  SliderObj(
      {this.id, this.title, this.description, this.image, this.categoryId});

  factory SliderObj.fromJson(Map<String, dynamic> parsedJson) {
    return SliderObj(
      id: parsedJson['id'],
      title: parsedJson['title'],
      description: parsedJson['short_description'],
      image: parsedJson['image'],
      categoryId: parsedJson['category_id'],
    );
  }
}
