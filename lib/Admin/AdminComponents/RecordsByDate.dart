import 'package:bake_house/Admin/Models/OrderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/ItemModel.dart';
import '../Database.dart';

class RecordsByDate extends StatefulWidget {
  RecordsByDate();
  @override
  State<RecordsByDate> createState() => _RecordsByDateState();
}

class _RecordsByDateState extends State<RecordsByDate> {
  String startDate = "Date";
  String endDate = "time";
  String sdate = "1/1/2000";
  String edate = "2/2/2050";

  DatePicker() async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 356)),
      lastDate: DateTime.now().add(Duration(days: 356)),
      builder: (context, child) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 450,
                width: 700,
                child: child,
              ),
            ),
          ],
        );
      },
    );
    setState(() {
      startDate = "${result!.day}/${result.month}/${result.year}";
    });
  }

  DatePicker2() async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 356)),
      lastDate: DateTime.now().add(Duration(days: 356)),
      builder: (context, child) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 450,
                width: 700,
                child: child,
              ),
            ),
          ],
        );
      },
    );
    setState(() {
      endDate = "${result!.day}/${result.month}/${result.year}";
    });
  }

  dateRangeHandler() {
    return Row(
      children: [
        Text(startDate),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            DatePicker();
          },
          child: Container(
            height: 30,
            width: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text("change Start Date"),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Text(endDate),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            DatePicker2();
          },
          child: Container(
            height: 30,
            width: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text("change End date"),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              sdate = startDate;
              edate = endDate;
            });
          },
          child: Container(
            height: 30,
            width: 100,
            color: Colors.red,
            alignment: Alignment.center,
            child: Text("submit"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          dateRangeHandler(),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 194, 189, 175),
                  height: 30,
                  width: 150,
                  child: Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 194, 189, 175),
                  height: 30,
                  width: 150,
                  child: Text("Date",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 194, 189, 175),
                  height: 30,
                  width: 150,
                  child: Text("Time",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 194, 189, 175),
                  height: 30,
                  width: 150,
                  child: Text("Location",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 194, 189, 175),
                  height: 30,
                  width: 150,
                  child: Text("Status",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 194, 189, 175),
                  height: 30,
                  width: 150,
                  child: Text("Writing",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Container(
              height: 600,
              child: FutureBuilder(
                future: AdminDatabase().GetOrdersByDate(sdate, edate),
                builder: ((context, AsyncSnapshot<List<OrderModel>> snap) {
                  if (snap.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snap.data!.length,
                        itemBuilder: (context, ind) {
                          return row(
                            snap.data![ind],
                          );
                        });
                  } else {
                    return const Text("Loading");
                  }
                }),
              )),
        ],
      ),
    );
  }

  row(OrderModel model) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            height: 30,
            width: 150,
            child: Text(model.cakeName),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            height: 30,
            width: 150,
            child: Text(model.date),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            height: 30,
            width: 150,
            child: Text(model.time),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            height: 30,
            width: 150,
            child: Text(model.location),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            height: 30,
            width: 150,
            child: Text(model.status),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            height: 30,
            width: 150,
            child: Text(model.writing),
          ),
        ),
      ],
    );
  }
}
