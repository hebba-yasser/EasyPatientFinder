import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/layout/doctor/doctorcubit/states.dart';
import 'package:project/modules/doctor/home_screen.dart';
import 'package:project/modules/doctor/profile.dart';
import 'package:project/modules/doctor/newpost_screen.dart';
import '../../../models/user_model.dart';
import '../../../shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class doctorLayoutcubit extends Cubit<doctorLayoutstates> {
  doctorLayoutcubit() : super(intialstate());

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
  }

  userModel? doctormodel;
  void getDoctorData() {
    emit(doctorGetuserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(UID).get().then((value) {
      print(value.data());
      doctormodel = userModel.fromjson(value.data()!);
      emit(doctorGetuserSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(doctorGetuserErrorState(error.toString()));
    });
  }

  File? doctorProfileImage;
  var picker = ImagePicker();
  Future<void> getDoctorImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      doctorProfileImage = File(pickedFile.path);
      emit(doctorProfileImagePickedSucessState());
    } else {
      print('No Image Selected.');
      emit(doctorProfileImagePickedErrorState());
    }
  }

  void uploadDoctorProfileImage({
    required String name,
    required String phone,
    required String email,
  }) {
    emit(doctorUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(doctorProfileImage!.path).pathSegments.last}')
        .putFile(doctorProfileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(doctorUploadProfileImageSucessState());
        print(value);
        updateDoctorData(name: name, phone: phone, email: email, image: value);
      }).catchError((error) {
        emit(doctorUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(doctorUploadProfileImageErrorState());
    });
  }

  void updateDoctorData({
    required String name,
    required String phone,
    required String email,
    String? image,
  }) {
    userModel model = userModel(
      email: email,
      name: name,
      phone: phone,
      studentId:  doctormodel?.studentId,
      image: image ?? doctormodel?.image,
      role: doctormodel?.role,
      uId: doctormodel?.uId,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(UID)
        .update(model.tomap())
        .then((value) {
      getDoctorData();
    }).catchError((error) {
      emit(doctorUpdateErrorState());
    });
  }

  void createNewPost({
    required String uId,
    required String name,
    required String image,
    required String dateTime,
    required String patientName,
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
    required String subCategory,
    required String level,
  }) {
    emit(doctorNewPostLoadingState());
  }
}
