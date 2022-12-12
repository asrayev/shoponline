
class Order {
  Order({
    this.orderId,
    this.productId,
    this.count,
    this.totalPrice,
    this.createdAt,
    this.userId,
    this.orderStatus,
  });

  int? orderId;
  int? productId;
  int? count;
  int? totalPrice;
  String? createdAt;
  int? userId;
  String? orderStatus;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    productId: json["product_id"],
    count: json["count"],
    totalPrice: json["total_price"],
    createdAt: json["created_at"],
    userId: json["user_id"],
    orderStatus: json["order_status"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "product_id": productId,
    "count": count,
    "total_price": totalPrice,
    "created_at": createdAt,
    "user_id": userId,
    "order_status": orderStatus,
  };
}
