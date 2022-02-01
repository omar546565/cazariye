class ShopLoginModel
{
  late bool success;
  late String message;
  late int id;
  late String? name;
  late String? email;
  late String? phone;
  late String? image;
  late String? points;
  late String? credit;
  late String? token;
 /* late UserData data;*/

  ShopLoginModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    name = json['data']['name'];
    email = json['data']['email'];
    phone = json['data']['phone'];
    image = json['data']['image'];
    points = json['data']['points'];
    credit = json['data']['credit'];
    token = json['data']['token'];
  /*  data = (json['data'] != null ? UserData.fromJson(json['data']) : null)!;*/

  }
}
/*class UserData
{
late int id;
late String? name;
late String? email;
late String? phone;
late String? image;
late String? points;
late String? credit;
late String? token;

*//*UserData({
  required this.id,
  required this.name,
  required this.email,
  required this.phone,
  required this.image,
  required this.points,
  required this.credit,
  required this.token,
});*//*

UserData.fromJson(Map<String, dynamic> json){
 id = json['id'];
 name = json['name'];
 email = json['email'];
 phone = json['phone'];
 image = json['image'];
 points = json['points'];
 credit = json['credit'];
 token = json['token'];
 }
}*/


