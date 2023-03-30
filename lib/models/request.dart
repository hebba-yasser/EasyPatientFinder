class request {
  String? uId;
  String? caseState;
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
  String? requeststatus;
  String? supervisorid;
  String? studentid;
  String? caseid;
  String? requestid;

  request({
    this.requestid,
    this.name,
    this.caseState,
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
    this.requeststatus,
    this.supervisorid,
    this.studentid,
    this.caseid,
  });
  request.fromjson(Map<String, dynamic> json) {
    requestid=json['requestid'];
    uId = json['uId'];
    caseState = json['caseState'];
     name = json['name'];
    image = json['image'];
    dateTime = json['dateTime'];
    patientName = json['patientName'];
    patientAge = json['patientAge'];
    gender = json['gender'];
    allergies = json['allergies'];
    currentMedications = json['currentMedications'];
    patientAddress = json['patientAddress'];
    patientPhone = json['patientPhone'];
    isDiabetes = json['isDiabetes'];
    isHypertension = json['isHypertension'];
    isCardiac = json['isCardiac'];
    isAllergies = json['isAllergies'];
    others = json['others'];
    category = json['category'];
    subCategory = json['subCategory'];
    level = json['level'];
    images = json['images'];
    camera = json['camera'];
    requeststatus = json['requeststatus'];
    supervisorid = json['supervisorid'];
    studentid = json['studentId'];
    caseid = json['caseid'];
  }
  Map<String, dynamic> tomap() {
    return {
      'requestid' :requestid,
      'name': name,
      'image': image,
      'caseState': caseState,
      'uId': uId,
      'dateTime': dateTime,
      'patientName': patientName,
      'patientAge': patientAge,
      'gender': gender,
      'currentMedications': currentMedications,
      'patientAddress': patientAddress,
      'patientPhone': patientPhone,
      'isDiabetes': isDiabetes,
      'isHypertension': isHypertension,
      'isCardiac': isCardiac,
      'isAllergies': isAllergies,
      'allergies': allergies,
      'others': others,
      'category': category,
      'subCategory': subCategory,
      'level': level,
      'images': images,
      'camera': camera,
      'requeststatus': requeststatus,
      'studentid': studentid,
      'supervisorid': supervisorid,
      'caseid': caseid,
    };
  }
}
