class LoginModel
{
  bool? status;
  String? message;
  ModelData? data;
  LoginModel({
    this.data,
    this.status,
    this.message
});
  LoginModel.fromJson(Map<String,dynamic> json)
  {
    status =json['status'];
    message =json['message'];
    data = ModelData.fromJson(json['data']);
  }
}
class ModelData
{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? token;
  ModelData(
  {
    this.id,
    this.name,
    this.email,
    this.phone,
    this.token
});
  ModelData.fromJson(Map<String,dynamic> json)
  {
    id =json['id'];
    name =json['name'];
    email =json['email'];
    phone =json['phone'];
    token =json['token'];
  }
}