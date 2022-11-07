import 'package:bake_house/Components/AlertForLogedIn.dart';
import 'package:bake_house/Components/RatingStarComponent.dart';
import 'package:bake_house/Services/Authentication.dart';
import 'package:bake_house/Services/Database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Provider/ItemDetailsPageProvider.dart';

class AddReviewPopUp extends StatefulWidget {
  String cakeId = "";

  int rating = 0;

  String review = "";
  AddReviewPopUp(String cakeId) {
    this.cakeId = cakeId;
    print("cakeId=" + cakeId);
  }

  @override
  State<AddReviewPopUp> createState() => _AddReviewPopUpState();
}

class _AddReviewPopUpState extends State<AddReviewPopUp> {
  String userID = "";
  init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userID = pref.getString('userId') as String;

    setState(() {});
  }

  @override
  void initState() {
    init();
  }

  RatingStartComponent ratingComp = RatingStartComponent(0, true);
  var reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        color: Colors.amber,
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(
              onTap: () {
                Provider.of<ItemDetailsPageProvider>(context, listen: false)
                    .changePopupVisibility(false);
              },
              child: const Align(
                  alignment: Alignment.centerRight, child: Icon(Icons.close)),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Add Review",
                  style: Theme.of(context).textTheme.headline6,
                )),
            const SizedBox(
              height: 70,
            ),
            const Text("Rate the Cake"),
            const SizedBox(
              height: 5,
            ),
            ratingComp,
            const SizedBox(
              height: 20,
            ),
            const Text("Please Add Some review"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: reviewController,
              decoration:
                  InputDecoration(filled: true, fillColor: Colors.white),
              maxLength: 100,
              maxLines: 5,
            ),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  print("UserID=" + userID + "asf");
                  Databasehandler handler = Databasehandler();
                  handler.addReview(widget.cakeId, userID, ratingComp.rating,
                      reviewController.text);

                  Provider.of<ItemDetailsPageProvider>(context, listen: false)
                      .changePopupVisibility(false);
                },
                child: Container(
                  height: 30,
                  width: 100,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Text("Submit"),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
