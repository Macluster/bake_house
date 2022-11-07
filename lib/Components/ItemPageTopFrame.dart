import 'package:bake_house/Model/ItemModel.dart';
import 'package:bake_house/Pages/CustomisationPage.dart';
import 'package:bake_house/Components/RatingStarComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPageTopFrame extends StatelessWidget {
  ItemModel model = ItemModel("", "", "", "", 0, "", 0, "", 0);

  ItemPageTopFrame(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
     
   


      child: Column(children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.all(30),
            alignment: Alignment.center,
            height: 30,
            width: 100,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 133, 185, 228),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text("${model.price} Rs"),
          ),
        ),
        Stack(
         
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Transform.translate(
                offset: Offset(0, -200),
                child: Container(
                  height: 500,
                  width: 1500,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 167, 214, 236),
                        
                        Color.fromARGB(255, 236, 251, 220),
                        Color.fromARGB(255, 255, 255, 255),
                      ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.all(Radius.circular(600))),
                ),
              ),
            ),
           
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                    model.image + "3.png",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                    
               
                
                  ),
              
                Container(
                 width: 600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          model.name,
                          style: TextStyle(fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          model.flavour,
                          style: TextStyle(fontSize: 20,color: Colors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            width: 150,
                            child: RatingStartComponent(model.rating, false)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CustomisationPage(model)));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 140,
                            color: Colors.grey,
                            child: Text("Proceed to buy"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
               
              ],
            )
          ],
        )
      ]),
    );
  }
}
