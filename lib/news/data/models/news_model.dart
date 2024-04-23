import '../../domin/entites/news.dart';

class NewsModel extends News {
  NewsModel(
      {required super.status,
      required super.totalResults,
      required super.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: List<ArticlesModel>.from(
            json['articles'].map((x) => ArticlesModel.fromJson(x))));
  }
}

class ArticlesModel extends Articles {
  ArticlesModel(
      {required super.content,
      required super.source,
      required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt});

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
        content: json['content'],
        source: json['source'] != null
            ? new SourceModel.fromJson(json['source'])
            : null,
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt']);
  }
}

class SourceModel extends Source {
  SourceModel({required super.id, required super.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
