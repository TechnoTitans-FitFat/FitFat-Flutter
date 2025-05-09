class SearchHistory {
  final List<String> name;
  final List<String> title;

  SearchHistory({required this.name, required this.title});

  factory SearchHistory.fromJson(Map<String, dynamic> json) {
    return SearchHistory(
      name: List<String>.from(json['name']),
      title: List<String>.from(json['title']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
    };
  }
}
