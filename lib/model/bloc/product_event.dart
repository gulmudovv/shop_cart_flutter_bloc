part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}


class AddToCartEvent extends ProductEvent{
  Product item;
  AddToCartEvent({required this.item});

  @override
  // TODO: implement props
  List<Object?> get props => [item];
}

class ClearCartEvent extends ProductEvent{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeleteFromCartEvent extends ProductEvent{

  Product ?item;
  DeleteFromCartEvent({this.item});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}