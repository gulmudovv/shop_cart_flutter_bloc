import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/bloc/product_bloc.dart';
import '../model/product_model.dart';



class ShoppingCard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.1,
        toolbarHeight: 70,
        title: Text("Shopping Cart",style: TextStyle(letterSpacing: 1.2, fontSize: 22),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<ProductBloc>(context).add(ClearCartEvent());
            },
            icon:  Icon(
                Icons.delete,
                color: Colors.white,
                size: 22,
              ),
          ),
        ],
        backgroundColor: Color.fromRGBO(1, 0, 53, 1),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [


          SizedBox(
            height: 110,
          ),

          Container(
            height: MediaQuery.of(context).size.height - 200,
            decoration: BoxDecoration(
              color: Color.fromRGBO(1, 0, 53, 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
              return ListView(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(left: 16, right: 16),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 480,
                    child: state is LoadingState?Center(child: CircularProgressIndicator(),)
                        :
                    state is LoadedState?ListView.builder(

                      itemCount:state.items.length,
                      itemBuilder: (context, index) {
                        var item = state.items[index];
                        return Padding(
                          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(item.imagurl),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 32,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "\$ ${item.discount_price.toString()}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Expanded(child: Container()),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: (){
                                  BlocProvider.of<ProductBloc>(context).add(DeleteFromCartEvent(item: item));

                                },
                                icon: Icon(
                                  Icons.delete_outlined,
                                  color: Colors.red,
                                  size: 28,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ):Align(
                        alignment:Alignment.topCenter,
                        child: Text("КОРЗИНА ПУСТА", style: TextStyle(color: Colors.white, fontSize: 22),)

                    ),

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.indigo,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Delivery",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$ ${_totalPrice(BlocProvider.of<ProductBloc>(context).cartProduct)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("FREE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.indigo,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text("Checkout",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            );
  },
)
          ),
        ],
      ),
    );
  }
int _totalPrice(List<Product> items){
    var summa=0;
    for(var item in items){
      summa+=item.discount_price;
    }
    return summa;
}

}
