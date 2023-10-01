part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final ResponseCatigories categoryModel;

  CategoryLoaded({required this.categoryModel});
}
