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
                    children: const [
                      Text(
                        "Most odered Cakes",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Container(
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
                  ),
                 const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Most Rated Cakes",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Container(
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
                  ),
                const  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: const [
                      Text(
                        "All records",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                const  SizedBox(
                    height: 30,
                  ),
                  RecordsByDate()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
