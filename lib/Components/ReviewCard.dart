import 'package:bake_house/Components/RatingStarComponent.dart';
import 'package:bake_house/Model/ReviewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  ReviewModel model = ReviewModel("", "", 0, "");
  ReviewCard(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
   
     margin: EdgeInsets.only(bottom: 10),
     decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.all(Radius.circular(10))),
     
     
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.bing.com/th?id=OIP.00aB240RvJoffc9YCuBSewHaHG&w=185&h=160&c=8&rs=1&qlt=90&o=6&dpr=1.1&pid=3.1&rm=2')),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(model.userName),
                  const SizedBox(
                    width: 10,
                  ),
                  RatingStartComponent(model.rating, false)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                child: Text(model.review),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
