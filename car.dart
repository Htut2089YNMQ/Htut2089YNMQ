class Car {
  final String model;
  final String name;
  final double purchasePrice;
  final double sellingPrice;
  final String category;
  final int year;

  Car({
    required this.model,
    required this.name,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.category,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'name': name,
      'purchasePrice': purchasePrice,
      'sellingPrice': sellingPrice,
      'category': category,
      'year': year,
    };
  }

  static Car fromMap(Map<String, dynamic> map) {
    return Car(
      model: map['model'],
      name: map['name'],
      purchasePrice: map['purchasePrice'],
      sellingPrice: map['sellingPrice'],
      category: map['category'],
      year: map['year'],
    );
  }
}
