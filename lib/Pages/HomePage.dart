import 'package:bake_house/Components/Itemcard.dart';
import 'package:bake_house/Model/ItemModel.dart';
import 'package:bake_house/Pages/CakePage.dart';
import 'package:bake_house/Pages/LoginPage.dart';
import 'package:bake_house/Pages/SignUpPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                  
                    
                    children: [
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                     
                          
                          
                          children: [

                           SizedBox(height: 40,),
                            Container(
                             
                              width: 170,
                              child: Text(
                                "FROM OUR OVEN TO YOUR DOOR STEPS",
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                          
                              width: 200,
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          
                          ],
                        ),
                      
                     
                          Align(
                            alignment: Alignment.centerRight,
                            child: Transform.translate(
                              offset: const Offset(100, 0),
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 219, 184, 86),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(275))),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Transform.translate(
                                offset: Offset(20, 30),
                                child: Image.asset("assets/Images/img1.png",height: 200,width: 200,)),
                          ),
                      
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(
                            Icons.bakery_dining,
                            size: 40,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.cake,
                            size: 40,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.cookie,
                            size: 40,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CakePage()
                ],
              ),
            )),
      ),
    );
  }
}
