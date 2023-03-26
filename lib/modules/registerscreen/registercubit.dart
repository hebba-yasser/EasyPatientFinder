import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/models/user_model.dart';
import 'registerstates.dart';


class registercubit extends Cubit<registerstates>{
  registercubit() : super (registerIntialState());
  static registercubit get(context)=> BlocProvider.of(context);
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    String? studentId,
    required String role,

  }) {
    emit(registerLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
          createUser(
              name: name,
              email: email,
              phone: phone,
              role: role,
              studentId: studentId,
              uId: value.user!.uid,
                );


    }).catchError((error) {
      emit(registerErrorState(error) );
      print(error.toString());
    });}

  void createUser(
  {
    required String name,
    required String email,
    required String phone,
    required  String role,
    required  String uId,
     String? studentId,
     String? image,
}){   userModel model = userModel(
      studentId: studentId,
      email: email,
      image: image,
     name: name,
    phone: phone,
    role: role,
    uId: uId,
  );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.tomap())
        .then((value){
          emit(createUserSucessState());
    })
        .catchError((onError){
      emit(createUserErrorState(onError));
  });
  }

/*void userCreate({
    @required String name,
    @required String email,
    @required String phone,
    @required String uId,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      bio: 'write you bio ...',
      cover: 'https://image.freepik.com/free-photo/photo-attractive-bearded-young-man-with-cherful-expression-makes-okay-gesture-with-both-hands-likes-something-dressed-red-casual-t-shirt-poses-against-white-wall-gestures-indoor_273609-16239.jpg',
      image: 'https://image.freepik.com/free-photo/photo-attractive-bearded-young-man-with-cherful-expression-makes-okay-gesture-with-both-hands-likes-something-dressed-red-casual-t-shirt-poses-against-white-wall-gestures-indoor_273609-16239.jpg',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }*/

// File postImage;

/*Future<void> getPostImage() async {
     final pickedFile = await picker.getImage(
       source: ImageSource.gallery,
     );

     if (pickedFile != null) {
       postImage = File(pickedFile.path);
     //  emit(SocialPostImagePickedSuccessState());
     } else {
       print('No image selected.');
     //  emit(SocialPostImagePickedErrorState());
     }
   }
}*/
  IconData suffix =IconBroken.Show;
  bool hidepass =true;
  void changepassvisibility(){
    hidepass=!hidepass;
    suffix=hidepass?IconBroken.Show :IconBroken.Hide;
    emit(registerChagePassvisibilitystate());

  }

}