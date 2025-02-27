class InstructionsModel {
  final int order;
  final String text;

  InstructionsModel({
    required this.text,
    required this.order,
  });

  factory InstructionsModel.fromJson(Map<String, dynamic> json) {
    return InstructionsModel(
      text: json['text'],
      order: json['order'],
    );
  }
}
