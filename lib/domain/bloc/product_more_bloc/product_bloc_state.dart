part of 'product_bloc_bloc.dart';

@immutable
sealed class ProductBlocState {}

class ProductBlocInitial extends ProductBlocState {}

class ProductLoaded extends ProductBlocState {
  final ResponseProduct products;

  ProductLoaded({required this.products});
}
