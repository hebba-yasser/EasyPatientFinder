import 'dart:convert';
/*
class userModel{
  String ?name;
  String ?phone;
  String ?email;
  String ?studentId;
  String ?role;
  String ? image;
  String ? uId;
  String ?supername;
  String ?superid;

  userModel({
    this.name,
    this.phone,
    this.email,
    this.studentId,
    this.role,
    this.image,
    this.uId,
    this.superid,
    this.supername
});
  userModel.fromjson(Map<String,dynamic>json){
    name=json['name'];
    phone=json['phone'];
    studentId=json['studentId'];
   role=json['role'];
    image=json['image'];
    email=json['email'];
    uId=json['uId'];
    superid=json['superid'];
    supername=json['supername'];

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
      'supername':supername,
      'superid' :superid,
    };

  }

}*/
import 'dart:convert';

class userModel{
  String ?name;
  String ?phone;
  String ?email;
  String ?studentId;
  String ?role;
  String ? image;
  String ? uId;
  String ? supervisorName ;
  String ? supervisorId;

  userModel({
    this.name,
    this.phone,
    this.email,
    this.studentId,
    this.role,
    this.image,
    this.uId,
    this.supervisorName,
    this.supervisorId
  });
  userModel.fromjson(Map<String,dynamic>json){
    name=json['name'];
    phone=json['phone'];
    studentId=json['studentId'];
    role=json['role'];
    image=json['image'];
    email=json['email'];
    uId=json['uId'];
    supervisorName= json['supervisorName'];
    supervisorId=json['supervisorId'];

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
      'supervisorName':supervisorName,
      'supervisorId' : supervisorId
       };

     }

}
