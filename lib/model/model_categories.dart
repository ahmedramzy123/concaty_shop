class ModelCategories
{
  bool? status;
  ModelCategoriesData? data;
  ModelCategories.fromJson(Map<String,dynamic> json)
  {
    status =json["status"];
    data = ModelCategoriesData.fromJson(json["data"]);
  }
}
class ModelCategoriesData
{
  int? current_page;
  List<ModelData> data=[];
  String? first_page_url;
  int? from;
  int? last_page;
  String? last_page_url;
  ModelCategoriesData.fromJson(Map<String,dynamic> json)
  {
    current_page =json["current_page"];
    json["data"].froEach((element)
    {
      data.add(element);
    });
    first_page_url=json["first_page_url"];
  }
}
class ModelData{}