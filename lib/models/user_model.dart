import 'dart:convert';

class userModel{
  String ?name;
  String ?phone;
  String ?email;
  String ?studentId;
  String ?role;
  String ? image;
  String ? uId;

  userModel({
    this.name,
    this.phone,
    this.email,
    this.studentId,
    this.role,
    this.image,
    this.uId,
});
  userModel.fromjson(Map<String,dynamic>json){
    name=json['name'];
    phone=json['phone'];
    studentId=json['studentId'];
   role=json['role'];
    image=json['image'];
    email=json['email'];
    uId=json['uId'];

  }
  Map<String,dynamic>  tomap(){
    return{
    'name': name,
    'phone':phone,
    'studentId':studentId,
    'role':role,
    'image':image,
    'email':email,
      'uId':uId,
    };

  }

}
