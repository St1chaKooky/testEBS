import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:test_ebs/models/hive_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadCart>((event, emit) async {
      Hive.initFlutter();
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(ProductAdapter());
      }
      var box = await Hive.openBox<ProductHive>('MyCart');
      final productsInCart = box.values.toList();
      final products = productsInCart;
      emit(CartLoaded(products: products));
    });
  }
}
