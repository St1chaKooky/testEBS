import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_ebs/domain/api/api.dart';
import 'package:test_ebs/models/products/response_product_model.dart';

part 'product_bloc_event.dart';
part 'product_bloc_state.dart';

class ProductBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  ProductBloc(this.api) : super(ProductBlocInitial()) {
    on<LoadProduct>((event, emit) async {
      final products = await api.getProduct();
      emit(ProductLoaded(products: products));
    });
  }
  final ApiProduct api;
}
