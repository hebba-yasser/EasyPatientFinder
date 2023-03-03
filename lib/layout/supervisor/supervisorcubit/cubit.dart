import 'package:cloud_firestore/cloud_firestore.dart';
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
}
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