import 'package:bake_house/Admin/AdminComponents/AddCakePopUp.dart';
import 'package:bake_house/Admin/Database.dart';
import 'package:bake_house/Admin/Providers/PopUpProvider.dart';
import 'package:bake_house/Components/Itemcard.dart';
import 'package:bake_house/Model/ItemModel.dart';
import 'package:bake_house/Services/Database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCakePage extends StatefulWidget {
  @override
  State<MyCakePage> createState() => _MyCakePageState();
}

class _MyCakePageState extends State<MyCakePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  AdminDatabase database = AdminDatabase();

  bool PopUpSatate = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "My Cakes",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                    height: 600,
                    child: FutureBuilder(
                      future: AdminDatabase().getcakes(),
                      builder: ((context, AsyncSnapshot<List<ItemModel>> snap) {
                        if (snap.hasData) {
                          return GridView.builder(
                              itemCount: snap.data!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemBuilder: (context, index) {
                                return ItemCard(snap.data![index]);
                              });
                        } else {
                          return const Text("Loading");
                        }
                      }),
                    )),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              if (context.read<PopUpProvider>().GetStatus == true) {
                setState(() {
                  context.read<PopUpProvider>().setStatus(false);
                });
              } else {
                setState(() {
                  context.read<PopUpProvider>().setStatus(true);
                });
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(50),
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              child: Text(
                "+",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        ),
        Consumer<PopUpProvider>(
          builder: ((context, value, child) {
            if (value.GetStatus == true) {
              return AddCakePopPup();
            } else {
              return Container();
            }
          }),
        )
      ],
    );
  }
}
