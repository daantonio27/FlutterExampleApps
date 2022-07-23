class Repository {
  final int id;
  final String name;
  final String description;
  final String stars;

  const Repository({
    required this.id,
    required this.name,
    required this.description,
    required this.stars
  });

  


  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      stars: json['stargazers_count'],
    );
  }
}