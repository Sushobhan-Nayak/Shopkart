
class Item {
  final int id;
  final String title;
  final String imageUrl;
  final double ratings;
  final String cost;
  final String category;
  final List<String> specifications;

  Item({
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.ratings,
    required this.cost,
    required this.category,
    required this.specifications,
  });
}
