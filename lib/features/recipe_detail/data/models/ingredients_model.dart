class IngredientsModel {
  final int order;
  final String name;
  final String? amount;

  IngredientsModel({
    required this.order,
    required this.amount,
    required this.name,
  });

  factory IngredientsModel.fromJson(Map<String, dynamic> json){
    return IngredientsModel(
      order: json['order'],
      amount: json['amount'],
      name: json['name'],
    );
  }
}
