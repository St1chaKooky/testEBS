part of 'id_product_bloc.dart';

@immutable
sealed class IdProductState {}

final class IdProductInitial extends IdProductState {}

class IdProductLoaded extends IdProductState {
  final ResponseProductId productId;

  IdProductLoaded({required this.productId});
}
