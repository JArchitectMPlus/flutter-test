class QuotesResponse{
  String? sId;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  QuotesResponse(
      {this.sId,
        this.content,
        this.author,
        this.tags,
        this.authorSlug,
        this.length,
        this.dateAdded,
        this.dateModified});

 /* QuotesResponse.fromJson(Map<String, dynamic> json) {
    sId = json['sId'];
    content = json['content'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sId'] = sId;
    data['content'] = content;
    data['author'] = author;
    return data;
  }*/

 /* @override
  QuotesResponse transform() {
    return QuotesResponse(
        sId: sId ,
        content: content,
        author:author
    );
  }*/

}