import 'package:bake_house/Admin/AdminComponents/ActionComonents.dart';
import 'package:bake_house/Admin/AdminComponents/MessageCard.dart';
import 'package:bake_house/Admin/Models/OrderModel.dart';
import 'package:bake_house/Admin/Providers/OrderBoxProvider.dart';
import 'package:bake_house/Admin/Services/FirebaseDatabase.dart';
import 'package:bake_house/Model/CartModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/MessageModel.dart';

class OrderDetailsBox extends StatefulWidget {
  OrderModel model;

  OrderDetailsBox(this.model);
  @override
  State<OrderDetailsBox> createState() => _OrderDetailsBoxState();
}

class _OrderDetailsBoxState extends State<OrderDetailsBox> {
  bool isChatFlag = false;
  TextEditingController messagecontroler = TextEditingController();
  var ref = FirebaseDatabase.instance.ref('Chats');
  @override
  void initState() {
    // TODO: implement initState
  }

  void starting() async {}

  List<MessageModel> sort(List<MessageModel> list) {
    MessageModel temp = MessageModel("", "", "", "", "");

    for (int i = 0; i < list.length; i++) {
      for (int j = i + 1; j < list.length; j++) {
        if (int.parse(list[i].MessagId) < int.parse(list[j].MessagId)) {
          temp = list[i];
          list[i] = list[j];
          list[j] = temp;
        }
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Text(
                context.read<OrderBoxProvider>().getOrderBoxFlag == false
                    ? widget.model.cakeName
                    : "chat with user",
                style: TextStyle(fontSize: 40),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    if (context.read<OrderBoxProvider>().getOrderBoxFlag == 0) {
                      setState(() {
                        isChatFlag = true;
                      });
                      context.read<OrderBoxProvider>().changeOrderBoxFlag(1);
                    } else {
                      setState(() {
                        isChatFlag = false;
                      });

                      context.read<OrderBoxProvider>().changeOrderBoxFlag(0);
                    }
                  },
                  child: const Icon(
                    Icons.message,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: 500,
              color: Colors.amber,
              child: Consumer<OrderBoxProvider>(
                builder: ((context, value, child) {
                  return value.orderBoxflag == 0
                      ? OrderDetailsCard()
                      : ChatCard();
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OrderDetailsCard() {

    Color itemColor=Colors.amber;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: itemColor,
                      height: 20,
                      child: const Text(
                        "Weight" ,
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: itemColor,
                      height: 20,
                      child: Text(
                      ":  "+  widget.model.weight.toString(),
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                       
                      color: itemColor,
                      height: 20,
                      child: const Text(
                        "Calories",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                    
                      color: itemColor,
                      height: 20,
                      child: Text(
                       ":  "+ widget.model.calories.toString(),
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      
                      color: itemColor,
                      height: 20,
                      child: const Text(
                        "Suagar Free",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: itemColor,
                      height: 20,
                      child: Text(
                       ":  "+ (widget.model.sugarfree == 1 ? "Yes" : "No"),
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: itemColor,
                      height: 20,
                      child: const Text(
                        "Eggless",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: itemColor,
                      height: 20,
                      child: Text(
                        ":  "+(widget.model.eggless == 1 ? "Yes" : "No"),
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: itemColor,
                      height: 20,
                      child: const Text(
                        "CakeWriting",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: itemColor,
                      height: 20,
                      child: Text(
                        ":  "+widget.model.writing,
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
           /* Image.network(
              widget.model.cakeImage != ""
                  ? widget.model.cakeImage + "3.png"
                  : "https://customercare.igloosoftware.com/.api2/api/v1/communities/10068556/previews/thumbnails/4fc20722-5368-e911-80d5-b82a72db46f2?width=680&height=680&crop=False",
              height: 200,
              width: 200,
            )*/
       
      const SizedBox(
          height: 50,
        ),
        ActionComponents(widget.model)
      ],
    );
  }

  ChatCard() {
    return Container(
      width: double.infinity,
      height: 350,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              child: StreamBuilder(
                stream: ref.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snap) {
                  if (snap.hasData) {
                    List<MessageModel> list = [];
                    MessageModel model = MessageModel("", "", "", "", "");
                    var m = {};
                    print(widget.model.userId.toString());
                    print("A" + widget.model.bakerId.toString());
                    var data = snap.data!.snapshot
                                .child(widget.model.userId.toString())
                                .child("A" + widget.model.bakerId.toString())
                                .value ==
                            null
                        ? m
                        : snap.data!.snapshot
                            .child(widget.model.userId.toString())
                            .child("A" + widget.model.bakerId.toString())
                            .value as Map;
                    String messageId = "";
                    String message = "";
                    String time = "";
                    String sender = "";
                    data.forEach((key, value) {
                      if (key != "count") {
                        messageId = value['messageId'].toString();
                        message = value['message'].toString();
                        time = value['time'].toString();
                        sender = value['sender'].toString();
                        model =
                            MessageModel(messageId, message, time, "", sender);
                        list.add(model);
                      }
                    });

                    list = sort(list);

                    return ListView.builder(
                        itemCount: list.length,
                        reverse: true,
                        itemBuilder: ((context, index) {
                          return MessageCard(list[index], list[index].sender);
                        }));
                  } else {
                    return Text("Lodaing");
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 220, 218, 218),
                          blurRadius: 5,
                          spreadRadius: 5)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: 330,
                        child: TextField(
                          controller: messagecontroler,
                          decoration: const InputDecoration(
                              hintText: "Enter the message",
                              border: InputBorder.none),
                        )),
                    GestureDetector(
                        onTap: () {
                          FireBaseDatabase().AddMessage(widget.model.userId,
                              messagecontroler.text, widget.model.bakerId);
                        },
                        child: const Icon(Icons.send_sharp))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
