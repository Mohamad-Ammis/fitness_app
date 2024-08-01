// ignore: file_names
class OrderModel {
  final num? id;
  final String? status;
  final num? totalPrics;
  final String? itemCount;
  final String? createdAt;
  final String? orderDate;

  OrderModel({
    required this.id,
    required this.status,
    required this.totalPrics,
    required this.itemCount,
    required this.createdAt,
    required this.orderDate,
  });
  factory OrderModel.fromJson(json) {
    return OrderModel(
        id: json['id'],
        status: json['status'],
        totalPrics: json['bill']['total'],
        itemCount: json['products'].length.toString(),
        createdAt: json['created_at'].toString().substring(0, 10),
        orderDate: json['order_date']);
  }
}
