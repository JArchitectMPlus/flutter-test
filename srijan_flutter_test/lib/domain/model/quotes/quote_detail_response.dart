class QuotesDetailResponse {
  //String? _id;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  QuotesDetailResponse({
    //this._id,
    this.content,
    this.author,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified});

}