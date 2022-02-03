class ConcernsModel {
  String? head;
  String? body;
  bool? selected;

  ConcernsModel({this.head, this.body, this.selected});

  ConcernsModel.fromJson(Map<String, dynamic> json) {
    head = json['head'];
    body = json['body'] ?? '';
    selected = json['selected'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['head'] = head;
    data['body'] = body;
    data['selected'] = selected;
    return data;
  }
}
