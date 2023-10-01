import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_ebs/domain/api/api.dart';
import 'package:test_ebs/models/product_id/response_product_id.dart';

part 'id_product_event.dart';
part 'id_product_state.dart';

class IdProductSellBloc extends Bloc<IdProductEvent, IdProductState> {
  IdProductSellBloc() : super(IdProductInitial()) {
    on<LoadIdProduct>((event, emit) async {
      final listId = await ApiBestProduct().getProduct();
      final productIdList = await ApiIdBestProduct(listId: listId).getProduct();
      print(productIdList);
      emit(IdProductLoaded(productIdList: productIdList));
    });
  }
}
