class PostModel {
  List<Posts>? posts;

  PostModel({this.posts});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? title;
  String? body;
  Reactions? reactions;

  Posts(
      {
        this.title,
        this.body,
        this.reactions,
      });

  Posts.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    reactions = json['reactions'] != null
        ? new Reactions.fromJson(json['reactions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    if (this.reactions != null) {
      data['reactions'] = this.reactions!.toJson();
    }
    return data;
  }
}

class Reactions {
  int? likes;
  int? dislikes;

  Reactions({this.likes, this.dislikes});

  Reactions.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    dislikes = json['dislikes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    return data;
  }
}
