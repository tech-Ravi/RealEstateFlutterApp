//TODO We can fetch property data from API
class Property {
  final String id;
  final String address;
  final String type; // "buy" or "rent"
  final double price;
  final String imageUrl;

  Property({required this.id, required this.address, required this.type, required this.price, required this.imageUrl});
}
