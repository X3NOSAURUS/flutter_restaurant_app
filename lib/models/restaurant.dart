class Restaurant {
  final String name;
  final String description;

  Restaurant({
    required this.name,
    required this.description,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    String getDescription(List<dynamic> descriptionList) {
      if (descriptionList.isNotEmpty) {
        var firstDescription = descriptionList[0];
        if (firstDescription['children'] != null && firstDescription['children'].isNotEmpty) {
          return firstDescription['children'][0]['text'] ?? 'No description';
        }
      }
      return 'No description';
    }

    return Restaurant(
      name: json['attributes']['Name'] ?? 'No name',
      description: getDescription(json['attributes']['Description']),
    );
  }
}
