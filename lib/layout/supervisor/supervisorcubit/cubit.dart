/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/supervisor/supervisorcubit/states.dart';
import 'package:project/models/user_model.dart';
import 'package:project/modules/supervisor/Home_screen.dart';
import 'package:project/modules/supervisor/requests_screen.dart';

import '../../../modules/doctor/home_screen.dart';
import '../../../modules/supervisor/doctors_list.dart';
import '../../../modules/supervisor/profile.dart';
import '../../../shared/components/constants.dart';
class supervisorLayoutcubit extends Cubit<supervisorLayoutstates> {
   supervisorLayoutcubit() :super (intialstate());

   static supervisorLayoutcubit get(context) => BlocProvider.of(context);
   int currentIndex = 0;
   List<Widget> superbottomScreens = [
     supervisorHomeScreen(),
     doctorsScreen(),
     requestScreen(),
     supervisorProfileScreen(),
   ];
   void changebottomsupervisor(int index){
      currentIndex=index;
      emit(changeBottomNavstate());
   }
userModel ?model;
   void getUserData() {
     emit( supervisorGetuserLoadingState());

     FirebaseFirestore.instance.collection('users').doc(UID).get().then((value) {
       print(value.data());
      model = userModel.fromjson(value.data()!);
       emit(supervisorGetuserSucessState());
     }).catchError((error) {
       print(error.toString());
       emit(supervisorGetuserErrorState(error.toString()));
     });
   }
   List<QueryDocumentSnapshot<Object?>> db =[];
   List<userModel> doctors =[];
   void getAllDoctors() {
     emit( supervisorGetAllDoctorsLoadingState());
     FirebaseFirestore.instance
         .collection('users')
         .where('role', isEqualTo: 'Doctor')
         .get()
         .then((QuerySnapshot querySnapshot) {

         doctors=querySnapshot.docs.map((e)=>
         userModel.fromjson(e.data() as Map<String,dynamic>)).toList();
         emit( supervisorGetAllDoctorsSucessState());
     }).catchError((error){
       emit( supervisorGetAllDoctorsErrorState(error.toString()));
     });
   }
}
*/
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/layout/supervisor/supervisorcubit/states.dart';
import 'package:project/models/request.dart';
import 'package:project/models/request_id.dart';
import 'package:project/models/user_model.dart';
import 'package:project/modules/loginscreen/loginScreen.dart';
import 'package:project/modules/supervisor/Home_screen.dart';
import 'package:project/modules/supervisor/requests_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:alert_dialog/alert_dialog.dart';

import '../../../models/case_model.dart';
import '../../../modules/supervisor/doctors_list.dart';
import '../../../modules/supervisor/profile.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';

class supervisorLayoutcubit extends Cubit<supervisorLayoutstates> {
  supervisorLayoutcubit() : super(intialstate());

  static supervisorLayoutcubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> superbottomScreens = [
    supervisorHomeScreen(),
    doctorsScreen(),
    requestScreen(),
    supervisorProfileScreen(),
  ];
  // get function
  void changebottomsupervisor(int index) {
    if (index == 3) {
      getSupervisorData();
    }
    currentIndex = index;
    emit(changeBottomNavstate());
  }

  userModel? supervisormodel;
  void getSupervisorData() {
    emit(supervisorGetuserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(UID).get().then((value) {
      print(value.data());
      supervisormodel = userModel.fromjson(value.data()!);
      emit(supervisorGetuserSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(supervisorGetuserErrorState(error.toString()));
    });
  }

  // List<QueryDocumentSnapshot<Object?>> db =[];
  List<userModel> doctors = [];
  void getAllDoctors() {
    FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'Doctor')
        .snapshots()
        .listen((event) {
      doctors = [];

      event.docs.forEach((element) {
        doctors.add(userModel.fromjson(element.data()));
      });

      emit(supervisorGetAllDoctorsSucessState());
    });
  }
  /*
  void getAllDoctors() {
    emit( supervisorGetAllDoctorsLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'Doctor')
        .get()
        .then((QuerySnapshot querySnapshot) {

      doctors=querySnapshot.docs.map((e)=>
          userModel.fromjson(e.data() as Map<String,dynamic>)).toList();
      emit( supervisorGetAllDoctorsSucessState());
    }).catchError((error){
      emit( supervisorGetAllDoctorsErrorState(error.toString()));
    });
  }*/

  File? supervisorProfileImage;
  var picker = ImagePicker();
  Future<void> getSupervisorImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      supervisorProfileImage = File(pickedFile.path);
      emit(supervisorProfileImagePickedSucessState());
    } else {
      print('No Image Selected.');
      emit(supervisorProfileImagePickedErrorState());
    }
  }

  // update function
  void uploadSupervisorProfileImage({
    required String name,
    required String phone,
    required String email,
  }) async {
    emit(supervisorUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'users/${Uri.file(supervisorProfileImage!.path).pathSegments.last}')
        .putFile(supervisorProfileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateSupervisorData(
            name: name, phone: phone, email: email, image: value);
      }).catchError((error) {
        emit(supervisorUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(supervisorUploadProfileImageErrorState());
    });
  }

  void updateSupervisorData({
    required String name,
    required String phone,
    required String email,
    String? image,
  }) {
    userModel model = userModel(
      email: email,
      name: name,
      phone: phone,
      studentId: supervisormodel?.studentId,
      image: image ?? supervisormodel?.image,
      role: supervisormodel?.role,
      uId: supervisormodel?.uId,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(UID)
        .update(model.tomap())
        .then((value) {
      getSupervisorData();
    }).catchError((error) {
      emit(supervisorUpdateErrorState());
    });
  }

  // delete function
  void deleteSupervisorData() {
    emit(supervisorDeleteLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(UID)
        .delete()
        .then((value) {
      emit(supervisorDeleteSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(supervisorDeleteErrorState(error.toString()));
    });
  }

  // delete message
  deleteAlertResult(bool isYes, BuildContext context) {
    if (isYes) {
      deleteSupervisorData();
      showtoast(
          text: 'Account Deleted Successfully', state: toaststates.SUCCESS);
      navigate(context, loginScreen());
      print('deleted');
    } else {
      Navigator.pop(context);
    }
  }

  deleteAlertDialog(BuildContext context, String title, String description) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            title,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(description),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => deleteAlertResult(false, context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () => deleteAlertResult(true, context),
              child: Text(
                'Delete',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

// suffix icon
  IconData suffix = IconBroken.Show;
  bool hidepass = true;
  void changepassvisibility() {
    hidepass = !hidepass;
    suffix = hidepass ? IconBroken.Show : IconBroken.Hide;
    emit(chagePassvisibilitystate());
  }

//change password function
  var auth = FirebaseAuth.instance;
  var currentSupervisoruser = FirebaseAuth.instance.currentUser;
  void changePassword({email, oldPassword, newPassword}) async {
    emit(supervisorChangePasswordLoadingState());
    var cred = EmailAuthProvider.credential(
        email: currentSupervisoruser!.email!, password: oldPassword);
    await currentSupervisoruser
        ?.reauthenticateWithCredential(cred)
        .then((value) {
      currentSupervisoruser?.updatePassword(newPassword);
      emit(supervisorChangePasswordSucessState());
    }).catchError((error) {
      emit(supervisorChangePasswordErrorState());
    });
  }

  List<caseModel> supervisorCases = [];

  void supervisorGetCases() {
    FirebaseFirestore.instance
        .collection('cases')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      supervisorCases = [];
      event.docs.forEach((element) {
        supervisorCases.add(caseModel.fromjson(element.data()));
      });
      emit(supervisorGetCasesSucessState());
    });
  }

  caseModel? supervisorClickcase;
  void supervisorGetCase(String uidpost) {
    emit(supervisorGetuserLoadingState());
    FirebaseFirestore.instance
        .collection('cases')
        .doc(uidpost)
        .get()
        .then((value) {
      print(value.data());
      supervisorClickcase = caseModel.fromjson(value.data()!);
      emit(supervisorGetClickedCaseSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(supervisorGetClickedCaseErrorState(error.toString()));
    });
  }

  List<caseModel> casesperdoctor = [];
  void supervisorGetCasesPerDoctor(String doctoruid) {
    FirebaseFirestore.instance
        .collection('cases')
        .where('uId', isEqualTo: doctoruid)
        .snapshots()
        .listen((event) {
      casesperdoctor = [];
      event.docs.forEach((element) {
        casesperdoctor.add(caseModel.fromjson(element.data()));
      });
      emit(supervisorGetCasesPerDoctorSucessState());
    });
  }

  List<userModel> supervisorStudents = [];
  void getSupervisorStudents() {
    FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'student')
        .where('supervisorId', isEqualTo: UID)
        .snapshots()
        .listen((event) {
      supervisorStudents = [];

      event.docs.forEach((element) {
        supervisorStudents.add(userModel.fromjson(element.data()));
      });

      emit(supervisorAllSupervisorStudentsSucessState());
    });
  }

  List<request> requestedCases = [];
  void getRequestedCases() {
    FirebaseFirestore.instance
        .collection('requests')
        .where('supervisorid', isEqualTo: UID)
    .where('requeststatus', isEqualTo: 'pending')
        .snapshots()
        .listen((event) {
      requestedCases = [];

      event.docs.forEach((element) {
        print(element.data());
        requestedCases.add(request.fromjson(element.data()));
          getstudentRequestedCases(element['studentid']);
      });  print(requestedCases);
      emit(supervisorGetRequestsSucessState());
    });
  }
  List<userModel> studentRequestedCases = [];
  void getstudentRequestedCases(String studentId) {
    emit(supervisorGetStudentRequestedCasesDataLoadingState());
    studentRequestedCases = [];
    FirebaseFirestore.instance
        .collection('users')
        .where('uId', isEqualTo: studentId)
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        studentRequestedCases.add(userModel.fromjson(element.data()));
      });
      emit(supervisorGetStudentRequestedCasesDataSucessState());
    });
  }
  void updateRequest(
      {
        required String requeststatus,
        required String supervisorid,
        required String studentid,
        required  String caseid,
        required String  requestid,
        required String dateTime,
        required String patientName,
        required String patientAge,
        required String name,
        required String uId,
        required String image,
        required String gender,
        required String patientAddress,
        required String patientPhone,
        required String currentMedications,
        bool? isDiabetes,
        bool? isHypertension,
        bool? isCardiac,
        bool? isAllergies,
        String? allergies,
        required String? others,
        required String category,
        required String subCategory,
        required String level,
        required String images,
        required String caseState,
      }){   request model = request(
    caseid: caseid,
    requeststatus: requeststatus,
    studentid: studentid,
    requestid :requestid,
    supervisorid: supervisorid ,
    caseState:caseState,
    uId:  uId,
    name:  name,
    image: image,
    dateTime: dateTime,
    patientName: patientName,
    patientAge: patientAge,
    gender: gender,
    patientAddress: patientAddress,
    patientPhone: patientPhone,
    currentMedications: currentMedications,
    isDiabetes: isDiabetes,
    isHypertension: isHypertension,
    isCardiac: isCardiac,
    isAllergies:isAllergies,
    allergies: allergies,
    images: images,
    others: others,
    category: category,
    subCategory: subCategory,
    level: level,
    //images: images??'',
  );

  FirebaseFirestore.instance
      .collection('requests')
        .doc(requestid)
        .update(model.tomap())
      .then((value){
    emit(supervisorUpdateRequestedCasesDataSucessState());
  })
      .catchError((onError){
    emit(supervisorUpdateRequestedCasesDataErrorState(onError));
  });
  }

/*
//worrrrrrrrk
  List<caseModel> requestedCases = [];
  void getRequestedCases() {
    FirebaseFirestore.instance
        .collection('requests')
        .where('supervisorid', isEqualTo: UID)
        .snapshots()
        .listen((event) {
      requestedCases = [];

      event.docs.forEach((element) {
        requestedCases.add(caseModel.fromjson(element.data()));
        if(state is  supervisorGetStudentRequestedCasesDataLoadingState && state is supervisorGetRequestedCasesDataLoadingState){

        }else {
          getstudentRequestedCases(element['studentid']);
          getCaseData(element['caseid']);
        }

      });
      emit(supervisorGetRequestsSucessState());
    });
  }

  List<userModel> studentRequestedCases = [];
  void getstudentRequestedCases(String studentId) {
    emit(supervisorGetStudentRequestedCasesDataLoadingState());
    studentRequestedCases = [];
    FirebaseFirestore.instance
        .collection('users')
        .where('uId', isEqualTo: studentId)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        studentRequestedCases.add(userModel.fromjson(element.data()));
      });
      emit(supervisorGetStudentRequestedCasesDataSucessState());
    }).catchError((error) {
      emit(supervisorGetStudentRequestedCasesDataErrorState(error));
    });
  }

  List<caseModel> CaseData = [];
  void getCaseData(String CaseId) {
    emit(supervisorGetRequestedCasesDataLoadingState());
    CaseData = [];
    FirebaseFirestore.instance
        .collection('cases')
        .where('caseId', isEqualTo: CaseId)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        CaseData.add(caseModel.fromjson(element.data()));
      });
      print(CaseData[0].caseId);
      print(CaseData[1].caseId);
      print(CaseData[2].caseId);
      emit(supervisorGetRequestedCasesDataSucessState());
    }).catchError((error) {
      emit(supervisorGetRequestedCasesDataErrorState(error.toString()));
    });
  }
*/
/*
  List<String> casesid1=[];
 void getCasesId()   {
    FirebaseFirestore.instance
        .collection('requests')
        .where('supervisorid', isEqualTo: UID)
        .snapshots()
        .listen((event) {
      casesid1=[];
      event.docs.forEach((element)  {
        casesid1.add(element['']) ;
             });
      print(casesid1);
      emit(supervisorGetRequestedCasesIdSucessState());
        });
    }


  List<caseModel> studentsname = [];
  void getCases(String? casesid1)   {
    FirebaseFirestore.instance
        .collection('cases')
        .where('caseId', isEqualTo: casesid1)
        .get()
        .then((event) {
      requestedCases = [];
      event.docs.forEach((element) {
        requestedCases.add(caseModel.fromjson(element.data()));


      }); print(requestedCases);
    });

    emit(supervisorGetRequestedCasesSucessState());
  }*/
}
