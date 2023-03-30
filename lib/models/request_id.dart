class requestModel {
  String? requeststatus;
  String? supervisorid;
  String? studentid;
  String? caseid;

  requestModel({
    this.requeststatus,
    this.supervisorid,
    this.studentid,
    this.caseid,
  });
  requestModel.fromjson(Map<String, dynamic> json) {
    requeststatus = json['requeststatus'];
    supervisorid = json['supervisorid'];
    studentid = json['studentId'];
    caseid = json['caseid'];
  }
  Map<String, dynamic> tomap() {
    return {
      'requeststatus': requeststatus,
      'studentid': studentid,
      'supervisorid': supervisorid,
      'caseid': caseid,

    };
  }
}
