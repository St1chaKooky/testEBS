import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_ebs/domain/api/api.dart';
import 'package:test_ebs/models/catigories/response_catigories_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this.api) : super(CategoryInitial()) {
    on<LoadCategory>((event, emit) async {
      final categoryModel = await api.getCategories();
      emit(CategoryLoaded(categoryModel: categoryModel));
    });
  }
  final ApiCategories api;
}
