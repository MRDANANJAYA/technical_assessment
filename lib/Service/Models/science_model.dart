
class ScienceModel {
  ScienceModel({
    this.category,
    this.data,
    this.success,
  });

  String? category;
  List<ScienceDatum>? data;
  bool? success;

  factory ScienceModel.fromJson(Map<String, dynamic> json) => ScienceModel(
    category: json["category"],
    data: List<ScienceDatum>.from(json["data"].map((x) => ScienceDatum.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
  };
}

class ScienceDatum {
  ScienceDatum({
    this.author,
    this.content,
    this.date,
    this.id,
    this.imageUrl,
    this.readMoreUrl,
    this.time,
    this.title,
    this.url,
  });

  String? author;
  String? content;
  String? date;
  String? id;
  String? imageUrl;
  String? readMoreUrl;
  String? time;
  String? title;
  String? url;

  factory ScienceDatum.fromJson(Map<String, dynamic> json) => ScienceDatum(
    author: json["author"],
    content: json["content"],
    date: json["date"],
    id: json["id"],
    imageUrl: json["imageUrl"],
    readMoreUrl: json["readMoreUrl"],
    time: json["time"],
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "content": content,
    "date": date,
    "id": id,
    "imageUrl": imageUrl,
    "readMoreUrl": readMoreUrl,
    "time": time,
    "title": title,
    "url": url,
  };
}
