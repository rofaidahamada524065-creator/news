class NewsModel {
  final List<data> datas;

  new({required this.datas});
  factory NewsModel.fromjson(Map json) {
    return NewsModel(
      datas: json["articles"].map<data>((item) => data.fromjson(item)).toList(),
    );
  }
}

class data {
  final String name;
  final String description;
  final String urlToImage;

  new({
    required this.name,
    required this.description,
    required this.urlToImage,
  });
  factory data.fromjson(Map json) {
    return data(
      name: json["source"]["name"] ?? "",
      description: json["description"] ?? "",
      urlToImage: json["urlToImage"] ?? "",
    );
  }
}
