// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderlist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderListAdapter extends TypeAdapter<OrderList> {
  @override
  final int typeId = 1;

  @override
  OrderList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderList(
      orderId: fields[0] as String,
      orderedProduct: (fields[1] as List).cast<Product>(),
      totalAmount: fields[2] as int,
      orderDate: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, OrderList obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.orderId)
      ..writeByte(1)
      ..write(obj.orderedProduct)
      ..writeByte(2)
      ..write(obj.totalAmount)
      ..writeByte(3)
      ..write(obj.orderDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
