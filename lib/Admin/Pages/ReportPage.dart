import 'package:bake_house/Admin/AdminComponents/HighestOrderItemCard.dart';
import 'package:bake_house/Admin/AdminComponents/RecordsByDate.dart';
import 'package:bake_house/Admin/Database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Components/Itemcard.dart';
import '../../Model/ItemModel.dart';

class ReportPage extends StatefulWidget {
  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {


  int currentMenu=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: SizedBox(
            width: double.infinity,
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Reports Page",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                 const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                   
                     GestureDetector(
                      onTap: (){
                        setState(() {
                          currentMenu=0;
                        });
                      },
                       child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        color: currentMenu==0?Colors.amber:Colors.white,
                        child: Text("Most Ordered Cakes"),
                     
                                         ),
                     ),
                     GestureDetector(
                      onTap: (){
                        setState(() {
                          currentMenu=1;
                        });
                      },
                       child: Container(
                           alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        color: currentMenu==1?Colors.amber:Colors.white,
                        child: Text("Most Rated Cakes "),
                     
                                         ),
                     ),
                     GestureDetector(
                      
                      onTap: (){
                        setState(() {
                          currentMenu=2;
                        });
                      },
                       child: Container(
                           alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        color: currentMenu==2?Colors.amber:Colors.white,
                        child: Text("Records"),
                     
                                         ),
                     ),

                  ],),
                    const  SizedBox(height: 100,),
                  Row(
                    children: [
                      Text(
                        currentMenu==0?"Most odered Cakes":currentMenu==1?"Most Rated Cake":"Reports",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
              
                  currentMenu==0?HighestOrderdCake():currentMenu==1?MostOrderedCake():RecordsByDate()
                  
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }





 Widget HighestOrderdCake()
 {
  return Container(
                    height: 250,
                    child: FutureBuilder(
                        future: AdminDatabase().GetHeighestOrderedCake(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<ItemModel>> snap) {
                          if (snap.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snap.data!.length,
                                itemBuilder: (context, ind) {
                                  return HighesOrderItemCard(
                                      ItemModel(
                                          snap.data![ind].id,
                                          snap.data![ind].name,
                                          snap.data![ind].flavour,
                                          snap.data![ind].image,
                                          snap.data![ind].price,
                                          snap.data![ind].bakerId,
                                          snap.data![ind].rating,
                                          snap.data![ind].incredents,
                                          snap.data![ind].calories),
                                      int.parse(snap.data![ind].incredents),
                                      snap.data![ind].calories);
                                });
                          } else {
                            return const Text("Loading data");
                          }
                        }),
                  );
 } 


 Widget MostOrderedCake()
 {
  return   Container(
                    height: 250,
                    child: FutureBuilder(
                        future: AdminDatabase().GetHeighestOrderedCake(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<ItemModel>> snap) {
                          if (snap.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snap.data!.length,
                                itemBuilder: (context, ind) {
                                  return HighesOrderItemCard(
                                      ItemModel(
                                          snap.data![ind].id,
                                          snap.data![ind].name,
                                          snap.data![ind].flavour,
                                          snap.data![ind].image,
                                          snap.data![ind].price,
                                          snap.data![ind].bakerId,
                                          snap.data![ind].rating,
                                          snap.data![ind].incredents,
                                          snap.data![ind].calories),
                                      5,
                                      snap.data![ind].rating);
                                });
                          } else {
                            return const Text("Loading data");
                          }
                        }),
                  );
 }
}
