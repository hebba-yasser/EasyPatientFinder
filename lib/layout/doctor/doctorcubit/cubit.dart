
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/layout/doctor/doctorcubit/states.dart';
import 'package:project/modules/doctor/home_screen.dart';
import 'package:project/modules/doctor/profile.dart';
import 'package:project/modules/doctor/newpost_screen.dart';

import '../../../models/user_model.dart';
import '../../../shared/components/constants.dart';
class doctorLayoutcubit extends Cubit<doctorLayoutstates> {
  doctorLayoutcubit() :super (intialstate());

  static doctorLayoutcubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> doctorbottomScreens = [
    doctorHomeScreen(),
    newPostScreen(),
    doctorProfileScreen(),
  ];

  void changebottomdoctor(int index) {
    currentIndex = index;
    emit(changeBottomNavstate());
  }userModel ?model;
  void getUserData() {
    emit( doctorGetuserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(UID).get().then((value) {
      print(value.data());
      model = userModel.fromjson(value.data()!);
      emit(doctorGetuserSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(doctorGetuserErrorState(error.toString()));
    });
  }
  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery,);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path );
      print(pickedFile.path);
     // emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
     // emit(SocialProfileImagePickedErrorState());
    }
  }

  void createNewPost({
  required String uId,
  required String name,
  required String image,
  required String dateTime,
  required String  patientName,
  required String patientAge,
  required String gender,
  required String patientAddress,
  required String patientPhone,
  bool? isDiabetes,
  bool? isHypertension,
  bool? isCardiac,
  bool? isAllergies,
  String? others,
  required String category,
  required  String subCategory,
  required  String level,
}){
    emit(  doctorNewPostLoadingState());



  }

}