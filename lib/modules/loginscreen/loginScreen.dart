import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/layout/student/Layout_screen.dart';
import 'package:project/layout/supervisor/supervisor_layout.dart';
import 'package:project/modules/registerscreen/registerScreen.dart';
import 'package:project/shared/network/local/cache_helper.dart';
import 'package:project/shared/styles/colors.dart';
import '../../layout/doctor/doctor_Layout_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../registerscreen/doctorsregisterScreen.dart';
import 'logincubit.dart';
import 'loginstates.dart';

class loginScreen extends StatelessWidget {
  var emailcon = TextEditingController();
  var passwordcon = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool ispass = true;
  String roletologin='';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => logincubit(),
      child: BlocConsumer<logincubit, loginstates>(
        listener: (context, state) {
          if (state is loginErrorState) {
            showtoast(
              text: state.error,
              state: toaststates.ERROR,
            );
          }
      if(state is loginSucessState)
          {
            cacheHelper.savedata(
              key:'uId',
              value: state.uId,
            ).then((value)
            {UID=state.uId;
              FirebaseFirestore.instance
                  .collection('users')
              .where('uId', isEqualTo: state.uId)
                  .get()
                  .then((QuerySnapshot querySnapshot) {
                querySnapshot.docs.forEach((doc) {
                  cacheHelper.savedata(
                    key:'role',
                    value: doc["role"] ,
                  ).then((value){
                    ROLE=doc["role"];
                  }).catchError((error){
                    print(error);
                  });
                  if(doc["role"]=='student'){
                    navigate(context, studentLayoutScreen());
                  }
                  else  if(doc["role"]=='Doctor'){
                    navigate(context, doctorLayoutScreen());
                  }else if(doc["role"]=='Supervisor'){
                    navigate(context, superviasorLayoutScreen());
                  }else {
                    print('cant login');
                  }
                });
              });
            });



          }

        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              color: defaultcol,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: defaultcol,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Sign in ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:  Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(30),
                          topEnd: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Form(
                                key: formkey,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Welcome Back',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:  defaultcol,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),  Text(
                                        'sign in to continue',
                                        style: TextStyle(
                                          color:  Colors.grey,
                                          fontSize: 10,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      defaulttextformfield(
                                        controller: emailcon,
                                        radius: 30,
                                        keyboardtype:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'please enter your email address';
                                          }
                                        },
                                        label: 'Email Address',
                                        prefix:  IconBroken.Message,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      defaulttextformfield(
                                        controller: passwordcon,
                                        radius: 30,
                                        onsubmit: (p0) {
                                          if (formkey.currentState!
                                              .validate()) {
                                            if(state is! loginLoadingState){
                                              logincubit.get(context).userLogin(
                                                  email: emailcon.text,
                                                  password: passwordcon.text);
                                            }

                                          }
                                        },
                                        keyboardtype:
                                            TextInputType.visiblePassword,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'please enter your  password';
                                          }
                                        },
                                        label: 'Password',
                                        prefix:IconBroken.Password,
                                        suffix: logincubit.get(context).suffix,
                                        suffixPressed: () => logincubit
                                            .get(context)
                                            .changepassvisibility(),
                                        hidepassword:
                                            logincubit.get(context).hidepass,
                                      ),TextButton(onPressed: () {

                                      }, child: Text('Forget your password ?'),),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      ConditionalBuilder(
                                        condition: state is ! loginLoadingState,
                                        builder: (context) => defaultbutton(
                                          onpress: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                             logincubit.get(context).userLogin(
                                                 email: emailcon.text,
                                                 password: passwordcon.text);
                                            }
                                          },
                                          text: 'sign in ',
                                          upercase: true,
                                          radius: 30,
                                        ),
                                        fallback: (context) => Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),SizedBox(
                                        height: 5,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Don\'t have an account?'),
                                          Row(
                                            children: [
                                              defaultTextButton(
                                                onpress: () {
                                                  navigateto(context, doctorRegisterScreen());

                                                }, text: 'sign up as doctor ',size: 13,
                                              ),
                                              defaultTextButton(
                                                onpress: () {
                                                  navigateto(context, registerScreen());

                                                }, text: 'sign up as Student ',size: 13,
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
