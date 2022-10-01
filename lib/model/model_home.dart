class ModelHome
{
  bool? status;
  ModelData? data;
  ModelHome.fromJson(Map<String,dynamic> json)
  {
    status = json["status"];
    data = ModelData.fromJson(json["data"]);
  }
}
class ModelData
{
  List<ModelBanners> banners=[];
  List<ModelProducts> products=[];
  ModelData.fromJson(Map<String,dynamic> json)
  {
    json["banners"].forEach((element)
    {
      banners.add(ModelBanners.fromJson(element));
    });
    json["products"].forEach((element)
    {
      products.add(ModelProducts.fromJson(element));
    });
  }
}
class ModelBanners
{
  int? id;
  String? image;
  ModelBanners.fromJson(Map<String,dynamic> json)
  {
    id = json["id"];
    image = json["image"];
  }
}
class ModelProducts
{
  int? id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? in_favorites;
  bool? in_cart;
  ModelProducts.fromJson(Map<String,dynamic> json)
  {
    id = json["id"];
    price = json["price"];
    old_price = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    description = json["description"];
    in_favorites = json["in_favorites"];
    in_cart = json["in_cart"];
  }
}