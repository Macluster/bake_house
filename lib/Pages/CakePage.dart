import 'package:bake_house/Components/Itemcard.dart';
import 'package:bake_house/Components/PermissionAlert.dart';

import 'package:bake_house/Services/Database.dart';

import 'package:flutter/cupertino.dart';
import 'package:bake_house/Model/ItemModel.dart';
import 'package:flutter/material.dart';

class CakePage extends StatefulWidget {
  @override
  State<CakePage> createState() => _CakePage();
}

class _CakePage extends State<CakePage> {
  Databasehandler dbb = Databasehandler();
  List<ItemModel> CakeList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Text("BEST SELLERS", style: Theme.of(context).textTheme.headline4),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 250,
          child: FutureBuilder(
              future: dbb.getDataOfItem(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<ItemModel>> snap) {
                if (snap.hasData) {
                  CakeList = snap.data!;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snap.data!.length,
                      itemBuilder: (context, ind) {
                        return ItemCard(ItemModel(
                            snap.data![ind].id,
                            snap.data![ind].name,
                            snap.data![ind].flavour,
                            snap.data![ind].image,
                            snap.data![ind].price,
                            snap.data![ind].bakerId,
                            snap.data![ind].rating,
                            snap.data![ind].incredents,
                            snap.data![ind].calories));
                      });
                } else {
                  return const Text("Loading data");
                }
              }),
        ),
        const SizedBox(
          height: 200,
        ),
        Container(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/bake-house-ee959.appspot.com/o/PremiumCakes%2Fmermaid.png?alt=media&token=5666d234-2a1f-4111-b5b3-b8969611c8f8',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 150,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 238, 222, 179),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40))),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 150,
                  child: Text("Premuim cake by Bake House",
                      style: Theme.of(context).textTheme.headline2),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
