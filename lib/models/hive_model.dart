import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveModel {
  int id;
  String name;
  String leading;
  String imge;
  double price;

  HiveModel({
    required this.id,
    required this.name,
    required this.leading,
    required this.imge,
    required this.price,
  }) {
    Hive.initFlutter();
  }
  void addProduct() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ProductAdapter());
    }
    var box = await Hive.openBox<ProductHive>('MyCart');

    // Получаем все продукты из корзины
    final productsInCart = box.values.toList();
    // Проверяем, есть ли уже такой продукт в корзине
    bool productExists = productsInCart.any((product) => product.id == id);
    if (!productExists) {
      final product = ProductHive(id, name, leading, imge, price);
      await box.add(product);
      print('Товар добавлен в корзину');
    } else {
      int indexOfProduct =
          productsInCart.indexWhere((product) => product.id == id);
      await box.deleteAt(indexOfProduct);
      print('Товар уже есть в корзине и был удален');
    }
    print(box.values);
    box.close();
  }
}

class ProductHive {
  int id;
  String name;
  String leading;
  String imge;
  double price;

  ProductHive(
    this.id,
    this.name,
    this.leading,
    this.imge,
    this.price,
  );
  @override
  String toString() =>
      "Id:$id ,Name: ${name},leading: ${leading},imge: ${imge},price: ${price},";
}

class ProductAdapter extends TypeAdapter<ProductHive> {
  @override
  final typeId = 0;

  @override
  ProductHive read(BinaryReader reader) {
    final id = reader.readInt();
    final name = reader.readString();
    final leading = reader.readString();
    final imge = reader.readString();
    final price = reader.readDouble();

    return ProductHive(
      id,
      name,
      leading,
      imge,
      price,
    );
  }

  @override
  void write(BinaryWriter writer, ProductHive obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.leading);
    writer.writeString(obj.imge);
    writer.writeDouble(obj.price);
  }
}
