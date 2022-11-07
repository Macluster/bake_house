import 'package:bake_house/Components/CartCard.dart';
import 'package:bake_house/Services/Database.dart';
import 'package:flutter/material.dart';

import 'package:bake_house/Model/CartModel.dart';
class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          child: Column(
            children:   [
              Text("My Cart",style: TextStyle(fontSize: 33),),

              Container(height: 500,
              child: FutureBuilder(future: Databasehandler().getCart("4"),
              builder: (context, AsyncSnapshot<List<CartModel>> snap) {
               if(snap.hasData)
               {
              
                return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder:(context,ind){

                    return CartCard(snap.data![ind]);
                  });
               }
               else
               return Text("Loading");

              },
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
