import 'package:srijan_flutter_test/domain/mapper/base_layer_data_tranformer.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes_response.dart';

class QuotesResponseEntity
    extends BaseLayerDataTransformer<QuotesResponseEntity, QuotesResponse> {
  String? id;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  QuotesResponseEntity(
      {this.id,
      this.content,
      this.author,
      this.tags,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified});

  QuotesResponseEntity.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    content = json['content'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['content'] = content;
    data['author'] = author;
    data['authorSlug'] = authorSlug;
    data['dateAdded'] = dateAdded;
    data['dateModified'] = dateModified;
    data['length'] = length;
    data['tags'] = tags;

    return data;
  }

  @override
  QuotesResponse transform() => QuotesResponse(
      id: id,
      content: content,
      author: author,
      authorSlug: authorSlug,
      dateAdded: dateAdded,
      dateModified: dateModified,
      length: length,
      tags: tags);
}
