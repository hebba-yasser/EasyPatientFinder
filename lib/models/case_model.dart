/*
import 'dart:html';

class caseModel {
  String? uId;
  String? name;
  String? image;
  String? dateTime;
  String? patientName;
  String? patientAge;
  String? gender;
  String? patientAddress;
  String? patientPhone;
  bool? isDiabetes;
  bool? isHypertension;
  bool? isCardiac;
  bool? isAllergies;
  String? others;
  String? category;
  String? subCategory;
  String? level;
  List<File> images = [];

  caseModel({
    this.name,
    this.image,
    this.uId,
    this.dateTime,
    this.patientName,
    this.patientAge,
    this.gender,
    this.patientAddress,
    this.patientPhone,
    this.isDiabetes,
    this.isHypertension,
    this.isCardiac,
    this.others,
    this.category,
    this.subCategory,
    this.level,
    required this.images,
  });
  caseModel.fromjson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    image = json['image'];
    dateTime = json['dateTime'];
    patientName = json['patientName'];
    patientAge = json['patientAge'];
    gender = json['gender'];
    patientAddress = json['patientAddress'];
    patientPhone = json['patientPhone'];
    isDiabetes = json['isDiabetes'];
    isHypertension = json['isHypertension'];
    isCardiac = json['isCardiac'];
    others = json['others'];
    category = json['category'];
    subCategory = json['subCategory'];
    level = json['level'];
    images = json['images'];
  }
  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'image': image,
      'uId': uId,
      'dateTime': dateTime,
      'patientName': patientName,
      'patientAge': patientAge,
      'gender': gender,
      'patientAddress': patientAddress,
      'patientPhone': patientPhone,
      'isDiabetes': isDiabetes,
      'isHypertension': isHypertension,
      'isCardiac': isCardiac,
      'others': others,
      'category': category,
      'subCategory': subCategory,
      'level': level,
      'images': images,
    };
  }
}
*/
import 'dart:convert';
// import 'dart:html';

class caseModel {
  String? uId;
  String? name;
  String? image;
  String? dateTime;
  String? patientName;
  String? patientAge;
  String? currentMedications;
  String? gender;
  String? patientAddress;
  String? patientPhone;
  bool? isDiabetes;
  bool? isHypertension;
  bool? isCardiac;
  bool? isAllergies;
  String? others;
  String? category;
  String? subCategory;
  String? level;
  String? allergies;
  // List<File> images=[];
  String? images;
  String? camera;



  caseModel({
    this.name,
    this.image,
    this.uId,
    this.dateTime,
    this.patientName,
    this.patientAge,
    this.gender,
    this.allergies,
    this.currentMedications,
    this.patientAddress,
    this.patientPhone,
    this.isDiabetes,
    this.isHypertension,
    this.isCardiac,
    this.isAllergies,
    this.others,
    this.category,
    this.subCategory,
    this.level,
    this.images,
    this.camera,

  });
  caseModel.fromjson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    image = json['image'];
    dateTime = json['dateTime'];
    patientName = json['patientName'];
    patientAge = json['patientAge'];
    gender = json['gender'];
    allergies=json['allergies'];
    currentMedications=json['currentMedications'];
    patientAddress = json['patientAddress'];
    patientPhone = json['patientPhone'];
    isDiabetes = json['isDiabetes'];
    isHypertension = json['isHypertension'];
    isCardiac = json['isCardiac'];
    isAllergies=json['isAllergies'];
    others = json['others'];
    category = json['category'];
    subCategory = json['subCategory'];
    level = json['level'];
    images = json['images'];
    camera = json['camera'];

  }
  Map<String, dynamic> tomap() {
    return {
    'name': name,
    'image': image,
    'uId': uId,
    'dateTime': dateTime,
    'patientName': patientName,
    'patientAge': patientAge,
    'gender': gender,
    'currentMedications':currentMedications,
    'patientAddress': patientAddress,
    'patientPhone': patientPhone,
    'isDiabetes': isDiabetes,
    'isHypertension': isHypertension,
    'isCardiac': isCardiac,
    'isAllergies':isAllergies,
    'allergies':allergies,
    'others': others,
    'category': category,
    'subCategory': subCategory,
    'level': level,
    'images': images,
    'camera': camera,
    };
     }
}