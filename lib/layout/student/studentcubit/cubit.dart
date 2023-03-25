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

import '../../../models/user_model.dart';
import '../../../modules/student/categories/categories_screen.dart';
import '../../../modules/student/home_screen.dart';
import '../../../modules/student/profile_screen.dart';
import '../../../modules/student/requests_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
   void changebottom(int index){
      currentIndex=index;
      emit(studentChangeBottomNavstate());
   }
   userModel ?studentmodel;
   void getStudentData() {
      emit( studentGetuserLoadingState());

      FirebaseFirestore.instance.collection('users').doc(UID).get().then((value) {
         print(value.data());
         studentmodel = userModel.fromjson(value.data()!);
         emit(studentGetuserSucessState());
      }).catchError((error) {
         print(error.toString());
         emit(studentGetuserErrorState(error.toString()));
      });
   }

   //get image function
   File? studentProfileImage ;
   var picker = ImagePicker ();

   Future<void> getStudentImage() async
   {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null){
         studentProfileImage = File(pickedFile.path);
         emit(studentProfileImagePickedSucessState());

      }else {
         print('No Image Selected.');
         emit(studentProfileImagePickedErrorState());
      }
   }

   // upload image function
   void uploadStudentProfileImage({
      required String name ,
      required String phone ,
      required String email ,
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
      String?  image,}

       ){
      userModel model = userModel(

         email: email,
         name: name,
         phone: phone,
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

   // suffix icon
   IconData suffix =  IconBroken.Show;
   bool hidepass =true;
   void changepassvisibility(){
      hidepass=!hidepass;
      suffix=hidepass?IconBroken.Show :IconBroken.Hide;
      emit(chagePassvisibilitystate());

   }


   //change password function
   var auth = FirebaseAuth.instance;
   var currentStudentuser = FirebaseAuth.instance.currentUser;
   void changePassword({
      email,oldPassword,newPassword
   }) async{
      emit(studentChangePasswordLoadingState());
      var cred = EmailAuthProvider.credential(email: currentStudentuser!.email!, password: oldPassword);
      await currentStudentuser?.reauthenticateWithCredential(cred).
      then((value) {
         currentStudentuser?.updatePassword(newPassword);
         emit(studentChangePasswordSucessState());
      }).catchError((error){
         emit(studentChangePasswordErrorState());
      }
      );
   }

}