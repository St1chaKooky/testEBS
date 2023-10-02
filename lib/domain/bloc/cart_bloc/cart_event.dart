part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class LoadCart extends CartEvent {}
