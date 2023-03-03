import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';

import 'loginstates.dart';


class logincubit extends Cubit<loginstates>{
  logincubit() : super (loginIntialState());
  static logincubit get(context)=> BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(loginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit( loginSucessState(value.user!.uid));
    })
        .catchError((error)
    {
      emit(loginErrorState(error.toString()));
    });
  }
  IconData suffix =  IconBroken.Show;
  bool hidepass =true;
  void changepassvisibility(){
    hidepass=!hidepass;
    suffix=hidepass?IconBroken.Show :IconBroken.Hide;
    emit(chagePassvisibilitystate());

  }

}