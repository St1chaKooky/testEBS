import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_ebs/domain/api/api.dart';
import 'package:test_ebs/models/product_id/response_product_id.dart';

part 'id_product_event.dart';
part 'id_product_state.dart';

class IdProductBloc extends Bloc<IdProductEvent, IdProductState> {
  IdProductBloc(this.id) : super(IdProductInitial()) {
    on<LoadIdProduct>((event, emit) async {
      final productId = await ApiIdProduct(id: id).getProduct();
      emit(IdProductLoaded(productId: productId));
    });
  }

  int id;
}
