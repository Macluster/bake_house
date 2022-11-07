import 'dart:convert';

import 'package:bake_house/Model/CartModel.dart';
import 'package:bake_house/Model/ItemModel.dart';
import 'package:bake_house/Model/CandlesModel.dart';
import 'package:bake_house/Model/ReviewModel.dart';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:bake_house/Config/config.dart';

class Databasehandler {
  var ipAdress = "";
  Databasehandler() {
    ipAdress = Configip;
  }

  Future<List<ItemModel>> getDataOfItem() async {
    ItemModel model = ItemModel("", "", "", "", 200, "", 5, "", 0);
    List<ItemModel> list = [];

    bool locatioDeniedflag = false;

    //Get the user Location

    Map<String, double>? locMap;

  

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      locatioDeniedflag = true;
  
    } else {
      //loc = Location();
      var position = await Geolocator.getCurrentPosition();

      locMap = {"lat": position.latitude, "long": position.longitude};

      
    }

    // print("valu ${locMap!["lat"].toString()}");

    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/GetDetails.php'),
        body: {
          "rad": 0.02.toString(),
          "lat": locatioDeniedflag == false
              ? locMap!['lat'].toString()
              : (0).toString(),
          "lon": locatioDeniedflag == false
              ? locMap!["long"].toString()
              : (0).toString()
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });
 
    // print("http request =" + result.body);
    //  print("map bval ${locMap['lat']}");
    var map = json.decode(result.body);
    // print(map);
    map.forEach((value) {
      //  print(value);


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

  Future<List<ReviewModel>> getReviewData(String id) async {
    ReviewModel model = ReviewModel("", "", 5, "");
    List<ReviewModel> list = [];
    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/GetReviews.php'),
        body: {
          "cakeId": id
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    var map = json.decode(result.body) as List;
    print(map);

    map.forEach((value) {
      model = ReviewModel(value['userName'], value['userDp'],
          int.parse(value['rating']), value['review']);
      list.add(model);
    });

    return list;
  }

  Future<List<CartModel>> getCart(String id) async {
    CartModel model = CartModel(1, "","",1, 1, 1, 1, 1, 1, 1, 0, "", "", "");
    List<CartModel> list = [];
    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/GetCart.php'),
        body: {
          "userId": id
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    var map = json.decode(result.body) as List;
   print(map);

    map.forEach((value) {
      print(value);
      model = CartModel(
         int.parse( value['cartId']),
         value['cakeName'],
         value['cakeImage'],

          int.parse(value['cakeId']),
         int.parse (value['bakerId']),
         int.parse (value['userId']),
          int.parse (value['weight']),
          int.parse (value['calories']),
         int.parse (value['eggless']),
         int.parse (value['sugarfree']),
         int.parse (value['candleId']),
          value['writing'],
          value['date'],
          value['time']);
      list.add(model);
    });
    print("list= ${list[0]}");

    return list;
  }

  addReview(String cakeId, String userId, int rating, String review) async {
    print(cakeId);

    print("userid in datafunc=" + userId);
    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/AddReview.php'),
        body: {
          "cakeId": cakeId,
          "userId": userId,
          "rating": rating.toString(),
          "review": review
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });
  }

  addOrder(
      String cakeId,
      String userId,
      double weight,
      double calories,
      bool eggless,
      bool sugarfree,
      String candleId,
      String writing,
      String date,
      String time) async {
    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/AddOders.php'),
        body: {
          "cakeId": cakeId.toString(),
          "userId": userId.toString(),
          "weight": weight.toString(),
          "calories": calories.toString(),
          "eggless": eggless == true ? 1.toString() : 0.toString(),
          "sugarfree": sugarfree == true ? 1.toString() : 0.toString(),
          "candleId": candleId.toString(),
          "writing": writing,
          "date": date,
          "time": time
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    print(result.body);
    if (result.body == "success") {
      return true;
    } else
      return false;
  }

  addToCart(
      String cakeId,
      String userId,
      double weight,
      double calories,
      bool eggless,
      bool sugarfree,
      String candleId,
      String writing,
      String date,
      String time) async {
    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/AddToCart.php'),
        body: {
          "cakeId": cakeId.toString(),
          "userId": userId.toString(),
          "weight": weight.toString(),
          "calories": calories.toString(),
          "eggless": eggless == true ? 1.toString() : 0.toString(),
          "sugarfree": sugarfree == true ? 1.toString() : 0.toString(),
          "candleId": candleId.toString(),
          "writing": writing,
          "date": date,
          "time": time
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    print(result.body);
    if (result.body == "success") {
      return true;
    } else
      return false;
  }

  Future<List<candleModel>> GetCandles() async {
    candleModel model = candleModel("", "", "", "", "");
    List<candleModel> list = [];

    var result = await http.post(
        Uri.parse('http://$ipAdress/bake_house/Server/GetCandles.php'),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    var map = json.decode(result.body) as List;

    map.forEach((element) {
      model = candleModel(
          element['candleId'],
          element['candleName'],
          element['candleType'],
          element['candlePrice'],
          element['candleImage']);
      list.add(model);
    });

    return list;
  }
}
