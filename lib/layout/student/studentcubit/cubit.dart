/*
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/student/studentcubit/states.dart';

import '../../../models/user_model.dart';
import '../../../modules/student/categories/categories_screen.dart';
import '../../../modules/student/home_screen.dart';
import '../../../modules/student/profile_screen.dart';
import '../../../modules/student/requests_screen.dart';
import '../../../shared/components/constants.dart';

class studentLayoutcubit extends Cubit<studentLayoutstates> {
   studentLayoutcubit() :super (studentIntialstate());

   static studentLayoutcubit get(context) => BlocProvider.of(context);
   int currentIndex = 0;
   List<Widget> studentBottomScreens = [
      studentHomeScreen(),
      categoriesScreen(),
      studentRequestScreen(),
      studentProfileScreen(),
   ];
   void changebottom(int index){
      currentIndex=index;
      emit(studentChangeBottomNavstate());
   }
   userModel ?model;
   void getUserData() {
      emit( studentGetuserLoadingState());

      FirebaseFirestore.instance.collection('users').doc(UID).get().then((value) {
         print(value.data());
         model = userModel.fromjson(value.data()!);
         emit(studentGetuserSucessState());
      }).catchError((error) {
         print(error.toString());
         emit(studentGetuserErrorState(error.toString()));
      });
   }
}*/

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/layout/student/studentcubit/states.dart';
import 'package:project/models/request_id.dart';

import '../../../models/case_model.dart';
import '../../../models/request.dart';
import '../../../models/user_model.dart';
import '../../../modules/student/categories/categories_screen.dart';
import '../../../modules/student/home_screen.dart';
import '../../../modules/student/profile_screen.dart';
import '../../../modules/student/requests_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../doctor/doctorcubit/states.dart';

class studentLayoutcubit extends Cubit<studentLayoutstates> {
   studentLayoutcubit() :super (studentIntialstate());

   static studentLayoutcubit get(context) => BlocProvider.of(context);
   int currentIndex = 0;

   List<Widget> studentBottomScreens = [
      studentHomeScreen(),
      categoriesScreen(),
      studentRequestScreen(),
      studentProfileScreen(),
   ];

   // get function
   void changebottom(int index) {
      if (index == 2) {
         getStudentData();
      }
      currentIndex = index;
      emit(studentChangeBottomNavstate());
   }

   userModel ?studentmodel;

   void getStudentData() {
      emit(studentGetuserLoadingState());
      int level;
      FirebaseFirestore.instance.collection('users').doc(UID).get().then((
          value) {
         print(value.data());
         studentmodel = userModel.fromjson(value.data()!);
         switch(studentmodel!.studentId![0]) {
            case "4":
               level = 4;
               break;
            case "5":
               level = 5;
               break;
            default:
               level = 6;
               break;
         }
         print(level);
         emit(studentGetuserSucessState());
      }).catchError((error) {
         print(error.toString());
         emit(studentGetuserErrorState(error.toString()));
      });
   }

   //get image function
   File? studentProfileImage;

   var picker = ImagePicker();

   Future<void> getStudentImage() async
   {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
         studentProfileImage = File(pickedFile.path);
         emit(studentProfileImagePickedSucessState());
      } else {
         print('No Image Selected.');
         emit(studentProfileImagePickedErrorState());
      }
   }
// upload image function
   void uploadStudentProfileImage({
      required String name ,
      required String phone ,
      required String email ,
      required String supervisorname,
   }){
      emit(studentUpdateLoadingState());
      firebase_storage.FirebaseStorage.instance.ref()
          .child('users/${Uri.file(studentProfileImage!.path)
          .pathSegments.last}')
          .putFile(studentProfileImage!).then((value) {
         value.ref.getDownloadURL().then((value) {

            print(value);
            updateStudentData(
                name:name,
                phone:phone,
                email:email,
                supervisorname : supervisorname,
                image: value
            );
         })
             .catchError((error){
            emit(studentUploadProfileImageErrorState());
         });
      })
          .catchError((error){
         emit(studentUploadProfileImageErrorState());
      });
   }

   // update function
   void updateStudentData({required String name,
      required String phone,
      required String email,
      required supervisorname ,
      String?  image,
   }

       ){
      userModel model = userModel(

         email: email,
         name: name,
         phone: phone,
         supervisorName: supervisorname,
         supervisorId: studentmodel?.supervisorId,
         studentId : studentmodel?.studentId,
         image: image??studentmodel?.image,
         role : studentmodel?.role,
         uId : studentmodel?.uId,
      );

      FirebaseFirestore.instance
          .collection('users')
          .doc(UID)
          .update(model.tomap())
          .then((value) {
         getStudentData();
      })
          .catchError((error){
         emit(studentUpdateErrorState());
          });
      }
   // upload image function
  /* void uploadStudentProfileImage({
      required String name,
      required String phone,
      required String email,
   }) {
      emit(studentUpdateLoadingState());
      firebase_storage.FirebaseStorage.instance.ref()
          .child('users/${Uri
          .file(studentProfileImage!.path)
          .pathSegments
          .last}')
          .putFile(studentProfileImage!).then((value) {
         value.ref.getDownloadURL().then((value) {
            print(value);
            updateStudentData(
                name: name,
                phone: phone,
                email: email,
                image: value
            );
         })
             .catchError((error) {
            emit(studentUploadProfileImageErrorState());
         });
      })
          .catchError((error) {
         emit(studentUploadProfileImageErrorState());
      });
   }

   // update function
   void updateStudentData({required String name,
      required String phone,
      required String email,
      String? image,}) {
      userModel model = userModel(

         email: email,
         name: name,
         phone: phone,
         studentId: studentmodel?.studentId,
         image: image ?? studentmodel?.image,
         role: studentmodel?.role,
         uId: studentmodel?.uId,
      );

      FirebaseFirestore.instance
          .collection('users')
          .doc(UID)
          .update(model.tomap())
          .then((value) {
         getStudentData();
      })
          .catchError((error) {
         emit(studentUpdateErrorState());
      });
   }
*/
   // suffix icon
   IconData suffix = IconBroken.Show;
   bool hidepass = true;

   void changepassvisibility() {
      hidepass = !hidepass;
      suffix = hidepass ? IconBroken.Show : IconBroken.Hide;
      emit(studentChagePassvisibilitystate());
   }


   //change password function
   var auth = FirebaseAuth.instance;
   var currentStudentuser = FirebaseAuth.instance.currentUser;

   void changePassword({
      email, oldPassword, newPassword
   }) async {
      emit(studentChangePasswordLoadingState());
      var cred = EmailAuthProvider.credential(
          email: currentStudentuser!.email!, password: oldPassword);
      await currentStudentuser?.reauthenticateWithCredential(cred).
      then((value) {
         currentStudentuser?.updatePassword(newPassword);
         emit(studentChangePasswordSucessState());
      }).catchError((error) {
         emit(studentChangePasswordErrorState());
      }
      );
   }
   List<userModel> supervisors = [];
   void getSupervisorsData() {
      FirebaseFirestore.instance
          .collection('users').where('role', isEqualTo:'Supervisor')
          .snapshots().listen((event) {
         supervisors = [];
         event.docs.forEach((element) {
            print(element.data());
            supervisors.add(userModel.fromjson(element.data()));
         });
         emit(studentGetSupervisorsDataSucessState());
      });
   }
   List<caseModel> studentCases = [];

   void studentGetCases() {
      FirebaseFirestore.instance
          .collection('cases')
          .orderBy('dateTime').snapshots().listen((event) {
         studentCases = [];
         event.docs.forEach((element) {
            studentCases.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetCasesSucessState());
      });
   }

   caseModel? studentClickcase;

   void studentGetCase(String uidpost) {
      emit(studentGetuserLoadingState());
      FirebaseFirestore.instance.collection('cases').doc(uidpost).get().then((
          value) {
         print(value.data());
         studentClickcase = caseModel.fromjson(value.data()!);
         emit(studentGetClickedCaseSucessState());
      }).catchError((error) {
         print(error.toString());
         emit(studentGetClickedCaseErrorState(error.toString()));
      });
   }
   //get cases of each category
   List<caseModel> completeCases = [];

   void getCompleteCases() {
      FirebaseFirestore.instance
          .collection('cases').where('category', isEqualTo: 'complete denture')
          .snapshots().listen((event) {
         completeCases = [];
         event.docs.forEach((element) {
            completeCases.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetCompleteCasesSucessState());
      });
   }
   List<caseModel> completeFlatCases = [];

   void getCompleteFlatCases() {
      FirebaseFirestore.instance
          .collection('cases').where('subCategory', isEqualTo: 'Flat Ridge')
          .snapshots().listen((event) {
         completeFlatCases = [];
         event.docs.forEach((element) {
            completeFlatCases.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetCompleteFlatCasesSucessState());
      });
   }
   List<caseModel> completeWellCases = [];

   void getCompleteWellCases() {
      FirebaseFirestore.instance
          .collection('cases').where('subCategory', isEqualTo: 'Well Developed Ridge')
          .snapshots().listen((event) {
         completeWellCases = [];
         event.docs.forEach((element) {
            completeWellCases.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetCompleteWellCasesSucessState());
      });
   }
   List<caseModel> partialCases = [];

   void getPartialCases() {
      FirebaseFirestore.instance
          .collection('cases').where('category', isEqualTo: 'partial denture')
          .snapshots().listen((event) {
         partialCases = [];
         event.docs.forEach((element) {
            partialCases.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetPartialCasesSucessState());
      });
   }
   List<caseModel> partialCases1 = [];

   void getPartial1Cases() {
      FirebaseFirestore.instance
          .collection('cases').where('subCategory', isEqualTo: 'kennedy |')
          .snapshots().listen((event) {
         partialCases1 = [];
         event.docs.forEach((element) {
            partialCases1.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetPartial1CasesSucessState());
      });
   }
   List<caseModel> partialCases2 = [];

   void getPartial2Cases() {
      FirebaseFirestore.instance
          .collection('cases').where('subCategory', isEqualTo: 'kennedy ||')
          .snapshots().listen((event) {
         partialCases2 = [];
         event.docs.forEach((element) {
            partialCases2.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetPartial2CasesSucessState());
      });}
         List<caseModel> partialCases3 = [];

         void getPartial3Cases() {
            FirebaseFirestore.instance
                .collection('cases').where('subCategory', isEqualTo: 'kennedy |||')
                .snapshots().listen((event) {
               partialCases3 = [];
               event.docs.forEach((element) {
                  partialCases3.add(caseModel.fromjson(element.data()));
               });
               emit(studentGetPartial3CasesSucessState());
            });
         }
         List<caseModel> partialCases4 = [];

         void getPartial4Cases() {
            FirebaseFirestore.instance
                .collection('cases').where('subCategory', isEqualTo: 'kennedy |V')
                .snapshots().listen((event) {
               partialCases4 = [];
               event.docs.forEach((element) {
                  partialCases4.add(caseModel.fromjson(element.data()));
               });
               emit(studentGetPartial1CasesSucessState());
            });
         }

   List<caseModel> singleCases = [];

   void getSingleCases() {
      FirebaseFirestore.instance
          .collection('cases').where('category', isEqualTo: 'single denture')
          .snapshots().listen((event) {
         singleCases = [];
         event.docs.forEach((element) {
            singleCases.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetSingleCasesSucessState());
      });
   }
   List<caseModel> overcases = [];

   void getOverCases() {
      FirebaseFirestore.instance
          .collection('cases').where('category', isEqualTo: 'overdenture')
          .snapshots().listen((event) {
         overcases = [];
         event.docs.forEach((element) {
            overcases.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetOverCasesSucessState());
      });
   }


   List<caseModel> fullMouthCases = [];

   void getFullMouthCases() {
      FirebaseFirestore.instance
          .collection('cases').where('category', isEqualTo: 'full mouth rehabilitation')
          .snapshots().listen((event) {
         fullMouthCases = [];
         event.docs.forEach((element) {
            fullMouthCases.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetfullMouthCasesSucessState());
      });
   }
   List<caseModel> maxilloCases = [];
   void getMaxilloCases() {
      FirebaseFirestore.instance
          .collection('cases').where('category', isEqualTo: 'maxillofacial case')
          .snapshots().listen((event) {
         maxilloCases = [];
         event.docs.forEach((element) {
            maxilloCases.add(caseModel.fromjson(element.data()));
         });
         emit(studentGetMaxilloCasesSucessState());
      });
   }
   void createRequest(
       {
          required String status,
       required String requestid,
       required String supervisorid,
          required String studentid,
          required  String caseid,
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
      requeststatus: status,
      studentid: studentid,
      requestid: requestid,
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
       .add(model.tomap())
       .then((value){
      FirebaseFirestore.instance
          .collection('requests')
          .doc(value.id)
          .update({'requestid': '${value.id}'})
          .then((value) {
         print('add request id ');
      }).catchError((error) {
         emit(studentCreateRequestErrorState(error));
      });
       emit(studentCreateRequestSucessState());
   })
       .catchError((onError){
      emit(studentCreateRequestErrorState(onError));
   });
   }


   List<request> requestedCasesStudent = [];
   void getRequestedCases() {
      FirebaseFirestore.instance
          .collection('requests')
          .where('studentid', isEqualTo: UID)
          .snapshots()
          .listen((event) {
         requestedCasesStudent = [];

         event.docs.forEach((element) {
            print(element.data());
            requestedCasesStudent.add(request.fromjson(element.data()));
            getstudentRequestedCases(element['supervisorid']);

         });  print( 'heeeeeeere');print(requestedCasesStudent);
         emit(studentGetRequestsSucessState());
      });
   }
   List<userModel> RequestedCasesSupervisor = [];
   void getstudentRequestedCases(String supervisorid) {
      emit(studentGetSupervisorRequestedCasesLoadingState());
      RequestedCasesSupervisor = [];
      FirebaseFirestore.instance
          .collection('users')
          .where('uId', isEqualTo: supervisorid)
          .snapshots()
          .listen((event) {
         event.docs.forEach((element) {
            RequestedCasesSupervisor.add(userModel.fromjson(element.data()));
         });
         emit(studentGetSupervisorRequestedCasesSucessState());
      });
   }
}
   /*
   List<userModel> students4 =[];
   void getStudentLevel4() {
      FirebaseFirestore.instance.collection('users')
       .where('role', isEqualTo: 'student')
          .get( ).then((value) {
      // print(value.toString() );

       students4=value.docs.map((e)=>
           userModel.fromjson(e.data() as Map<String,dynamic>)).toList();
       print(students4.length);
      }).catchError((onError) {
         print(onError.toString());

      });

/*
         students = [];
         event.docs.forEach((element) {
          print(element['studentId']);
          students.add(userModel.fromjson(element.data()));
         });*/
        // print(students[0].studentId.toString());
       //  print(students[0].uId.toString());

         // emit(supervisorGetAllDoctorsSucessState());
      }*/



