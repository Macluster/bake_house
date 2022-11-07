import 'dart:convert';

import 'dart:typed_data';

import 'package:bake_house/Admin/Models/OrderModel.dart';
import 'package:bake_house/Model/CartModel.dart';
import 'package:bake_house/Model/ItemModel.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:bake_house/Config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDatabase {
  var ipAdress = "";

  AdminDatabase() {
    ipAdress = Configip;
  }

  void Startup() async {}

  Future<List<ItemModel>> getcakes() async {
    ItemModel model = ItemModel("", "", "", "", 200, "", 5, "", 0);
    List<ItemModel> list = [];

    var bakerId = "";
    SharedPreferences pref = await SharedPreferences.getInstance();
    bakerId = pref.getString("bakerId") as String;

    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/GetCakesAdmin.php'),
        body: {
          "bakerId": bakerId.toString()
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });
    print("http request =" + result.body);
    var map = json.decode(result.body);
    // print(map);
    map.forEach((value) {
      //  print(value);

      print("falvourt-=" + value['cakeId']);
      model = ItemModel(
          value['cakeId'],
          value['cakeName'],
          value['cakeFlavour'],
          value['cakeImage'],
          int.parse(value['cakePrice']),
          value['bakerId'],
          int.parse(value['cakeRating']),
          value['cakeIngredients'],
          int.parse(value['cakeCalories']));
      list.add(model);
    });

    return list;
  }

  addCakes(ItemModel model) async {
    print("timess");
    var result = await http.post(
        Uri.parse('http://localhost/bake_house/Server/AddCakes.php'),
        body: {
          "cakeId": model.id,
          "cakeName": model.name,
          "cakeFlavour": model.flavour,
          "bakerId": model.bakerId,
          "cakeImage": model.image,
          "cakePrice": model.price.toString(),
          "cakeRating": model.rating.toString(),
          "cakeIngredients": model.incredents,
          "cakeCalories": model.calories.toString()
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    print(result.body);
  }

  Future<List<OrderModel>> GetOrders() async {
    OrderModel model =
        OrderModel(1, "", "", 1, 1, 1, 1, 1, 1, 1, 0, "", "", "", "", "");
    List<OrderModel> list = [];

    var bakerId = "";
    SharedPreferences pref = await SharedPreferences.getInstance();
    bakerId = pref.getString("bakerId") as String;
    print("bakerId" + bakerId);

    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/GetOrders.php'),
        body: {
          "bakerId": bakerId.toString()
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    var map = json.decode(result.body) as List;

    map.forEach((value) {
      model = OrderModel(
        int.parse(value['orderId']),
        value['cakeName'],
        value['cakeImage'],
        int.parse(value['cakeId']),
        int.parse(value['bakerId']),
        int.parse(value['userId']),
        double.parse(value['weight']).toInt(),
        int.parse(value['calories']),
        int.parse(value['eggless']),
        int.parse(value['sugarfree']),
        int.parse(value['candleId']),
        value['writing'],
        value['date'],
        value['time'],
        value['status'],
        value['location'],
      );
      list.add(model);
    });

    return list;
  }

  Future<List<OrderModel>> GetOrdersByDate(String sdate, String edate) async {
    OrderModel model =
        OrderModel(1, "", "", 1, 1, 1, 1, 1, 1, 1, 0, "", "", "", "", "");
    List<OrderModel> list = [];

    var bakerId = "";
    SharedPreferences pref = await SharedPreferences.getInstance();
    bakerId = pref.getString("bakerId") as String;
    print("bakerId" + bakerId);

    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/GetOrdersByDate.php'),
        body: {
          "bakerId": bakerId.toString(),
          "sdate": sdate,
          "edate": edate
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    var map = json.decode(result.body) as List;

    map.forEach((value) {
      model = OrderModel(
        int.parse(value['orderId']),
        value['cakeName'],
        value['cakeImage'],
        int.parse(value['cakeId']),
        int.parse(value['bakerId']),
        int.parse(value['userId']),
        double.parse(value['weight']).toInt(),
        int.parse(value['calories']),
        int.parse(value['eggless']),
        int.parse(value['sugarfree']),
        int.parse(value['candleId']),
        value['writing'],
        value['date'],
        value['time'],
        value['status'],
        value['location'],
      );
      list.add(model);
    });

    return list;
  }

  updateOrders(String time, String date, String flag, String userId) async {
    print("timess");
    var result = await http.post(
        Uri.parse('http://localhost/bake_house/Server/UpdateOrders.php'),
        body: {
          "time": time.toString(),
          "date": date.toString(),
          "flag": flag.toString(),
          "orderId": userId.toString(),
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    print(result.body);
  }

  uploadFile(
      String path, String cakename, String bakerId, String imageName) async {
    print("value of name  and bakerid =" + cakename + ":" + bakerId);
    var result = await http.post(
        Uri.parse('http://localhost/bake_house/Server/uploadImage.php'),
        body: {
          "folderName": cakename,
          "image": path,
          "bakerId": bakerId,
          "imageName": imageName
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    print("result=" + result.body);
  }

  Future<List<ItemModel>> GetHeighestOrderedCake() async {
    ItemModel model = ItemModel("", "", "", "", 200, "", 5, "", 0);
    List<ItemModel> list = [];

    var bakerId = "";
    SharedPreferences pref = await SharedPreferences.getInstance();
    bakerId = pref.getString("bakerId") as String;

    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/HighestOrderedCakes.php'),
        body: {
          "bakerId": bakerId.toString()
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });
    print("http request =" + result.body);
    var map = json.decode(result.body);
    // print(map);
    map.forEach((value) {
      //  print(value);

      print("falvourt-=" + value['cakeId']);
      model = ItemModel(
          value['cakeId'],
          value['cakeName'],
          value['cakeFlavour'],
          value['cakeImage'],
          int.parse(value['cakePrice']),
          value['bakerId'],
          int.parse(value['cakeRating']),
          value['cakeIngredients'],
          int.parse(value['cakeCalories']));
      list.add(model);
    });

    return list;
  }
}
