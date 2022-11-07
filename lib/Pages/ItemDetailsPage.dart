import 'dart:ui';

import 'package:bake_house/Model/ItemModel.dart';
import 'package:bake_house/Components/AddReviewPopup.dart';
import 'package:bake_house/Components/ReviewCard.dart';
import 'package:bake_house/Components/ItemPageTopFrame.dart';
import 'package:bake_house/Provider/ItemDetailsPageProvider.dart';
import 'package:bake_house/Services/Database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bake_house/Model/ReviewModel.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/Authentication.dart';
import '../Components/AlertForLogedIn.dart';

class ItemDetailPage extends StatefulWidget {
  ItemModel model = ItemModel("", "", "", "", 0, "", 0, "", 0);

  ItemDetailPage(this.model);
  @override
  State<ItemDetailPage> createState() => _ItemDetailPage();
}

class _ItemDetailPage extends State<ItemDetailPage> {
  Databasehandler dbb = Databasehandler();
  Color texthoverColors = Colors.black;
  double ReviewBoxLength = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => ItemDetailsPageProvider(),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemPageTopFrame(widget.model),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 1000,
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Review",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FutureBuilder(
                              future: dbb.getReviewData(widget.model.id),
                              builder: (context,
                                  AsyncSnapshot<List<ReviewModel>> snap) {
                                if (snap.hasData) {
                                  ReviewBoxLength = snap.data!.length * 100;

                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snap.data!.length,
                                      itemBuilder: (context, ind) {
                                        return ReviewCard(ReviewModel(
                                            snap.data![ind].userName,
                                            snap.data![ind].userDP,
                                            snap.data![ind].rating,
                                            snap.data![ind].review));
                                      });
                                } else {
                                  return const Text(" No reviews");
                                }
                              },
                            ),
                            MouseRegion(
                              onEnter: (event) {
                                texthoverColors = Colors.blue;
                                setState(() {});
                              },
                              onExit: (event) {
                                texthoverColors = Colors.black;
                                setState(() {});
                              },
                              child: GestureDetector(
                                onTap: () async {
                                  if (await Authentication().LoginChecker() ==
                                      true) {
                                    Provider.of<ItemDetailsPageProvider>(
                                            context,
                                            listen: false)
                                        .changePopupVisibility(true);
                                  } else {
                                    AlertForLoggedIn().ShowAlert(context);
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.all(40),
                                    height: 30,
                                    width: 140,
                                    color: Color.fromARGB(255, 167, 216, 255),
                                    child: Text(
                                      "Add your Review",
                                      style: TextStyle(color: texthoverColors),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Consumer<ItemDetailsPageProvider>(
              builder: ((context, value, child) {
                if (value.popUpVisible == true) {
                  return AddReviewPopUp(widget.model.id);
                } else {
                  return Container();
                }
              }),
            )
          ],
        );
      },
    ));
  }
}
