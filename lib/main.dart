import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart_flutter_bloc/screens/home_page.dart';

import 'model/bloc/product_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ProductBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Ecommerce',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      );

  }
}




