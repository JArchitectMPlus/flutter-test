import 'package:srijan_flutter_test/domain/mapper/base_layer_data_tranformer.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quotes_response_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class QuotesResponseEntity
    extends BaseLayerDataTransformer<QuotesResponseEntity, Quotes> {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'author')
  final String? author;
  @JsonKey(name: 'tags')
  final List<String>? tags;
  @JsonKey(name: 'authorSlug')
  final String? authorSlug;
  @JsonKey(name: 'length')
  final int? length;
  @JsonKey(name: 'dateAdded')
  final String? dateAdded;
  @JsonKey(name: 'dateModified')
  final String? dateModified;
  
  QuotesResponseEntity(
      {this.id,
      this.content,
      this.author,
      this.tags,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified});

  factory QuotesResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$QuotesResponseEntityFromJson(json);

  static final tResponse = ([{"_id":"AeJkfzeXkGnI","content":"The most precious gift we can offer anyone is our attention. When mindfulness embraces those we love, they will bloom like flowers.","author":"Thích Nhất Hạnh","tags":["Famous Quotes"],"authorSlug":"thich-nhat-hanh","length":131,"dateAdded":"2019-11-16","dateModified":"2023-04-14"}] as List<dynamic>)
      .map((e) => QuotesResponseEntity.fromJson(e))
      .toList();

  Map<String, dynamic> toJson() => _$QuotesResponseEntityToJson(this);

  @override
  Quotes transform() => Quotes(
      id: id,
      content: content,
      author: author,
      authorSlug: authorSlug,
      dateAdded: dateAdded,
      dateModified: dateModified,
      length: length,
      tags: tags);
}
