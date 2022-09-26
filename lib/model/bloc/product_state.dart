part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}


class LoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends ProductState {

  List<Product> items;
  LoadedState({ required this.items});

  @override
  List<Object?> get props => [items];
}

class ClearState extends ProductState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FailedState extends ProductState {
  Error ?fail;
  FailedState({this.fail});

  @override
  List<Object> get props => [];
}
