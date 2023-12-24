class PostsModel {
  int? id;
  String? startLoc;
  String? endLoc;
  String? image;
  bool? bookmarked;

  PostsModel(
      {this.id, this.startLoc, this.endLoc, this.image, this.bookmarked});

  PostsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startLoc = json['start_loc'];
    endLoc = json['end_loc'];
    image = json['image'];
    bookmarked = json['bookmarked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_loc'] = this.startLoc;
    data['end_loc'] = this.endLoc;
    data['image'] = this.image;
    data['bookmarked'] = this.bookmarked;
    return data;
  }
}
