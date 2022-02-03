class ChatModel {
  List<ChatHistory>? chatHistory;

  ChatModel({this.chatHistory});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json['chatHistory'] != null) {
      chatHistory = <ChatHistory>[];
      json['chatHistory'].forEach((v) {
        chatHistory!.add(ChatHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chatHistory != null) {
      data['chatHistory'] = chatHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatHistory {
  String? author;
  String? text;
  String? reaction;

  ChatHistory({this.author, this.text, this.reaction});

  ChatHistory.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    text = json['text'];
    reaction = json['reaction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['text'] = text;
    data['reaction'] = reaction;
    return data;
  }
}
