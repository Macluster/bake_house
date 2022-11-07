class OrderModel {
  int orderId;
  String cakeName;
  String cakeImage;
  int cakeId;
  int bakerId;
  int userId;
  int weight;
  int calories;
  int eggless;
  int sugarfree;
  int candleId;
  String writing;
  String date;
  String time;
  String status;
  String location;

  OrderModel(
      this.orderId,
      this.cakeName,
      this.cakeImage,
      this.cakeId,
      this.bakerId,
      this.userId,
      this.weight,
      this.calories,
      this.eggless,
      this.sugarfree,
      this.candleId,
      this.writing,
      this.date,
      this.time,
      this.status,
      this.location);
}
