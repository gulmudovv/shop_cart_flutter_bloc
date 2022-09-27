import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart_flutter_bloc/screens/shop_cart_page.dart';

import '../model/bloc/product_bloc.dart';
import '../model/product_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 0, 53, 1),
        elevation: 1.1,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          "Ecommerce",
          style: TextStyle(letterSpacing: 1.2, fontSize: 22),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: 12, top: MediaQuery.of(context).size.height / 60),
            child: Stack(children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingCard())),
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 26,
                    )),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) => state is LoadingState ?
                    Container(): state is LoadedState?
                    Text(
                        state.items.length.toString(),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ):Text('0')

                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: FutureBuilder(
              future: Product.loadData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    //padding: EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width - 30,
                    height: MediaQuery.of(context).size.height - 50,
                    child: GridView.builder(
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.only(top: 5),
                        //shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3,
                            mainAxisExtent: 230),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildCard(
                              snapshot.data![index],
                              context);
                        }),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }

  Widget _buildCard(Product item, context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 3,
            )
          ],
          color: Colors.white,
        ),
        child: Column(children: [
          Container(
            //margin: EdgeInsets.only(top:5),
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(item.imagurl, scale: 3),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 5, left: 10),
              child: item.note!=''
                  ? Text(
                      "New",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  : Text(""),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "\$ ${item.discount_price.toString()}",
                            style: TextStyle(
                              color: Color.fromRGBO(1, 0, 53, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "\$ ${item.price.toString()}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        item.name,
                        style: TextStyle(
                            color: Color.fromRGBO(1, 0, 53, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<ProductBloc>(context).add(AddToCartEvent(item: item));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        //size: 10,
                        color: Color.fromRGBO(1, 0, 53, 1),
                      )),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
