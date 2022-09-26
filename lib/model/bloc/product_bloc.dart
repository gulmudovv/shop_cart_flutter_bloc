import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(): super(ProductInitialState());

  List<Product> cartProduct = [];

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async*{
    yield LoadingState();
    try{
      if(event is AddToCartEvent){
        if(!cartProduct.contains(event.item)){
          cartProduct.add(event.item);
        }
      }

      if(event is DeleteFromCartEvent){
        cartProduct.remove(event.item);
      }

      if(event is ClearCartEvent){
        cartProduct = [];
      }
      yield LoadedState(items: cartProduct);



    } catch (error){
      yield FailedState(fail: error as Error);

    }


  }

}
