/*import 'dart:io';

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
}*/
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/layout/doctor/doctorcubit/states.dart';
import 'package:project/modules/doctor/home_screen.dart';
import 'package:project/modules/doctor/profile.dart';
import 'package:project/modules/doctor/newpost_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:project/shared/components/constants.dart';

import '../../../models/case_model.dart';
import '../../../models/user_model.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/constants.dart';
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

// get function
  void changebottomdoctor(int index) {

if(index==2){
  getDoctorData();
}
    currentIndex = index;
    emit(changeBottomNavstate());
  }

  userModel ?doctormodel;

  void getDoctorData() {
    emit(doctorGetuserLoadingState());
    doctormodel==null;
    FirebaseFirestore.instance.collection('users').doc(UID).get().then((value) {
      print(value.data());
      doctormodel = userModel.fromjson(value.data()!);
      emit(doctorGetuserSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(doctorGetuserErrorState(error.toString()));
    });
  }


//get image function
  File? doctorProfileImage;

  var picker = ImagePicker();

  Future<void> getDoctorImage() async
  {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      doctorProfileImage = File(pickedFile.path);
      emit(doctorProfileImagePickedSucessState());
    } else {
      print('No Image Selected.');
      emit(doctorProfileImagePickedErrorState());
    }
  }

// upload image function
  void uploadDoctorProfileImage(@required String name,
      @required String phone,
      @required String email,) {
    emit(doctorUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance.ref()
        .child('users/${Uri
        .file(doctorProfileImage!.path)
        .pathSegments
        .last}')
        .putFile(doctorProfileImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(doctorUploadProfileImageSucessState());
        print(value);
        updateDoctorData(
            name: name,
            phone: phone,
            email: email,
            image: value
        );
      })
          .catchError((error) {
        emit(doctorUploadProfileImageErrorState());
      });
    })
        .catchError((error) {
      emit(doctorUploadProfileImageErrorState());
    });
  }

// update function
  void updateDoctorData({required String name,
    required String phone,
    required String email,
    String? image,}) {
    userModel model = userModel(

      email: email,
      name: name,
      phone: phone,
      studentId: doctormodel?.studentId,
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
    })
        .catchError((error) {
      emit(doctorUpdateErrorState());
    });
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
  var currentDoctoruser = FirebaseAuth.instance.currentUser;

  void changePassword({
    email, oldPassword, newPassword,
  }) async {
    emit(doctorChangePasswordLoadingState());
    var cred = EmailAuthProvider.credential(
        email: currentDoctoruser!.email!, password: oldPassword);
    await currentDoctoruser?.reauthenticateWithCredential(cred).
    then((value) {
      currentDoctoruser?.updatePassword(newPassword);
      emit(doctorChangePasswordSucessState());
    }).catchError((error) {
      emit(doctorChangePasswordErrorState());
      print(error.toString());
    }
    );
  }

  /*//new post function
  File? postImage;
  var picker1 = ImagePicker();
  Future<void> getPostImage() async{
    final pickedFile=await picker1.getImage(source: ImageSource.gallery);
    if(pickedFile!=null)
    {
      postImage=File(pickedFile.path);
      emit(casePostImagePickedSuccessState());
    }
    else
    {
      print('No Image Selected!');
      emit(casePostImagePickedErrorState());
    }
  }
*/
  List<File> postImage = [];
  // File? myImage;
  final ImagePicker picker1=ImagePicker();
  List<String> paths=[];
  Future<void> getPostImage() async{
    final List<XFile>? pickedFile=await picker1.pickMultiImage();
    if(pickedFile!.isNotEmpty || pickedFile !=null)
    {
      paths = pickedFile.map((file) {
        return file.path;
      }).toList();
      print('hereeeeee');
      print(paths);
      //pickedFile[0]!.path
      pickedFile.forEach((file) {
        postImage.add(File(file.path));
      });
      //postImage=File(pickedFile[0]!.path);
      emit(casePostImagePickedSuccessState());
    }
    else
    {
      print('No Image Selected!');
      emit(casePostImagePickedErrorState());
    }
    }
late String globalcaseid;
  void uploadCaseImage({
    // required String uId,
    // required String name,
    // required String image,
    required String dateTime,
    required String patientName,
    required String patientAge,
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
  }){
    emit(doctorNewPostLoadingState());
    List<String> filesUrls = [];
    for(int i=0; i< paths.length; i++) {

      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('cases/${
          Uri
              .file(paths[i])
              .pathSegments
              .last}')
          .putFile(postImage[i])
          .then((value1) {
        value1.ref.getDownloadURL().then((value) {
          print(value);
          filesUrls.add(value);
        }).catchError((error) {
          emit(doctorNewPostErrorState(error));
        });
      }).catchError((error) {
        emit(doctorNewPostErrorState(error));
      });
    };
    createCase(
      dateTime: dateTime,
      patientName: patientName,
      patientAge: patientAge,
      gender: gender,
      patientAddress: patientAddress,
      patientPhone: patientPhone,
      currentMedications: currentMedications,
      isHypertension: isHypertension,
      isDiabetes: isDiabetes,
      isCardiac: isCardiac,
      isAllergies: isAllergies,
      allergies: allergies,
      others: others,
      category: category,
      subCategory: subCategory,
      level: level,
      images: filesUrls,
      caseId: '',
      caseState: 'WAITING',
    );
  }

  void createCase({
    // required String name,
    // required String uId,
    // required String image,
    required String dateTime,
    required String patientName,
    required String patientAge,
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
    required List<String> images,
  required String caseId,
    required String caseState,
  }) {
    caseModel model = caseModel(
      uId: doctormodel?.uId,
      name: doctormodel?.name,
      image: doctormodel?.image,
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
      others: others,
      category: category,
      subCategory: subCategory,
      level: level,
      images: images??[],
      caseId: caseId,
        caseState:caseState,

    );
    FirebaseFirestore.instance
        .collection('cases')
        .add(model.tomap())
        .then((value) {
      FirebaseFirestore.instance
          .collection('cases')
          .doc(value.id)
          .update({'caseId': '${value.id}'})
          .then((value) {
            print('add post id ');
            emit(doctorUpdateCasesSucessState());
      }).catchError((error) {
        emit(doctorUpdateCasesErrorState(error));
      });
      emit(doctorNewPostSucessState());
    }).catchError((error) {
      emit(doctorNewPostErrorState(error));
    });
  }

  //Diabetes check box
  bool isDiabetes=false;
  bool changeDiabetes()
  {
    isDiabetes=!isDiabetes;
    emit(changeDiabetesSuccess());
    return isDiabetes;
  }

  //cardiac check box
  bool isCardiac=false;
  bool changeCardiac()
  {
    isCardiac=!isCardiac;
    emit(changeCardiacSuccess());
    return isCardiac;
  }

  //hypertension check box
  bool isHypertension=false;
  bool changeHypertension()
  {
    isHypertension=!isHypertension;
    emit(changeHypertensionSuccess());
    return isHypertension;
  }

  //allergies check box
  bool isAllergies=false;
  bool changeAllergies()
  {
    isAllergies=!isAllergies;
    emit(changeAllergiesSuccess());
    return isAllergies;
    }
  List<caseModel> doctorCases = [];

  void docotrGetCases()
  {
    FirebaseFirestore.instance
        .collection('cases')
        .orderBy('dateTime')
        .snapshots().listen((event) {
          doctorCases=[];
          event.docs.forEach((element) {
            doctorCases.add(caseModel.fromjson(element.data()));
          });
      emit(doctorGetCasesSucessState());
    });}
  caseModel? doctorClickcase ;
  void doctorGetCase( String uidpost) {
    emit(doctorGetuserLoadingState());
    FirebaseFirestore.instance.collection('cases').doc(uidpost).get().then((value) {
      print(value.data());
      doctorClickcase = caseModel.fromjson(value.data()!);
      emit(doctorGetClickedCaseSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(doctorGetClickedCaseErrorState(error.toString()));
    });
  }
}

