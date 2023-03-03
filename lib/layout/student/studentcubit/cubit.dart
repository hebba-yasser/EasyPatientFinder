
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
}