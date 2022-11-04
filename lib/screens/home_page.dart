import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/cart_bloc.dart';
import 'package:test_bloc/screens/widget/product_list.dart';
import 'package:test_bloc/state/state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String routeName = "/";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: Scaffold(
        appBar: AppBar(
          title:Text("Shoping"),
          actions:<Widget> [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextButton.icon(
                    onPressed: (() => print("Cart Button Icon")), 
                    icon: Icon(Icons.shopping_cart), 
                    key: Key("cart"), 
                    label: Text("Cart"), ),
                  ),
                BlocBuilder<CartBloc,CartState>(
                  builder: ((context, cartState) {
                    List<int> cartItem = cartState.cartItem;

                    return Positioned(
                      left: 30,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red
                        ),
                        child: Text(
                          "$cartItem.length",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),


                      )
                    );
                    
                  }) )
              ],
            ),

          ],),
      body: ProductList(),
      ),

    );
  }
}
