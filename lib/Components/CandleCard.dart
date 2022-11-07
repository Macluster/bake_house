

import 'package:bake_house/Model/CandlesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CandlesCard extends StatelessWidget {
  candleModel model;
  CandlesCard(this.model);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Color.fromARGB(255, 172, 211, 243),
      backgroundImage: NetworkImage(model.candleImage),
    );
  }
}
