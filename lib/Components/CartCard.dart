import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/CartModel.dart';

class CartCard extends StatelessWidget
{

  CartModel model;
  CartCard(this.model);
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(

      padding: EdgeInsets.all(10),
      height: 130,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.network("${model.cakeImage}3.png",fit: BoxFit.cover,)),
                Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
      
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
              Text(model.cakeName, style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)
            ],),
            SizedBox(height: 10,),
             Row(children: [
              Text("Weight :", style: TextStyle(fontSize: 20,color: Colors.grey),),
              Text("${model.weight} Kg",style: TextStyle(fontSize: 20,color: Colors.grey))
            ],)
            ],),
          ),
        ),
          ],
        ),
      


        Icon(Icons.delete)
      
        
      ]),
      ),
    );
  }

}