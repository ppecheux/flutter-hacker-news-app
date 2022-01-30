class HackerNewsUser {
  String id;
  int created;
  int karma;
  String about;
  List<int> submitted;

  HackerNewsUser({this.id, this.created, this.karma, this.about});

  HackerNewsUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    karma = json['karma'];
    about = json['about'];
    submitted = json['submitted']?.cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this.created;
    data['karma'] = this.karma;
    data['id'] = this.id;
    data['about'] = this.about;
    data['submitted'] = this.submitted;
    return data;
  }
}
