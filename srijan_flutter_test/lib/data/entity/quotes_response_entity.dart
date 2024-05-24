import 'package:srijan_flutter_test/domain/mapper/base_layer_data_tranformer.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes_response.dart';

class QuotesResponseEntity
    extends BaseLayerDataTransformer<QuotesResponseEntity, QuotesResponse> {
  String? sId;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  QuotesResponseEntity(
      {this.sId,
      this.content,
      this.author,
      this.tags,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified});

  QuotesResponseEntity.fromJson(Map<String, dynamic> json) {
    sId = json['sId'];
    content = json['content'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sId'] = sId;
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
      sId: sId,
      content: content,
      author: author,
      authorSlug: authorSlug,
      dateAdded: dateAdded,
      dateModified: dateModified,
      length: length,
      tags: tags);
}
