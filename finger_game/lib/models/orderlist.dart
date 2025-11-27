  import 'package:finger_game/models/product.dart';
  import 'package:hive/hive.dart';
  part 'orderlist.g.dart';
  @HiveType(typeId: 1)
  class OrderList extends HiveObject {
    @HiveField(0)
    final String orderId;
    @HiveField(1)
    final List<Product> orderedProduct;
    @HiveField(2)
    final int totalAmount;
    @HiveField(3)
    final DateTime orderDate;

    OrderList({
      required this.orderId,
      required this.orderedProduct,
      required this.totalAmount,
      required this.orderDate,
    });
  }