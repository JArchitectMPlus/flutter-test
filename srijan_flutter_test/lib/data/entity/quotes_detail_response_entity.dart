import 'package:srijan_flutter_test/domain/mapper/base_layer_data_tranformer.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quote_detail_response.dart';

class QuotesDetailResponseEntity
    extends BaseLayerDataTransformer<QuotesDetailResponseEntity, QuotesDetailResponse> {
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  QuotesDetailResponseEntity(
      {
      this.content,
      this.author,
      this.tags,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified});

  QuotesDetailResponseEntity.fromJson(Map<String, dynamic> json) {

    content = json['content'];
    author = json['author'];
    authorSlug = json['authorSlug'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
    tags = List<String>.from(json["tags"].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = content;
    data['author'] = author;
    data['authorSlug'] = authorSlug;
    data['dateAdded'] = dateAdded;
    data['dateModified'] = dateModified;
    data['length'] = length;
    data['tags'] = List<dynamic>.from(tags!.map((x) => x));
    return data;
  }

  @override
  QuotesDetailResponse transform() => QuotesDetailResponse(
      content: content,
      author: author,
      authorSlug: authorSlug,
      dateAdded: dateAdded,
      dateModified: dateModified,
      length: length,
      tags: tags);
}
