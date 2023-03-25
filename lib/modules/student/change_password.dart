import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/shared/components/components.dart';

import '../../layout/student/Layout_screen.dart';
import '../../layout/student/studentcubit/cubit.dart';
import '../../layout/student/studentcubit/states.dart';
import '../../shared/styles/colors.dart';


class changePasswordScreen extends StatelessWidget {


  var oldPasswordcon = TextEditingController();
  var newPasswordcon = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool ispass = true;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => studentLayoutcubit(),
      child: BlocConsumer<studentLayoutcubit, studentLayoutstates>(
        listener: (context, state) {
          if(state is studentChangePasswordSucessState){
            showtoast(
                text:
                'Password Changed Successfully',
                state: toaststates.SUCCESS);
            navigate(context, studentLayoutScreen());
          }
          if (state is studentChangePasswordErrorState) {
            showtoast(
                text:
                'Enter a valid password and try again.',
                state: toaststates.ERROR);
          }
        },
        builder: (context, state) {


          return Scaffold(
            appBar: AppBar(
              backgroundColor:  cc.defcol,
              leading: IconButton(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                icon: Icon(
                  IconBroken.Arrow___Left_2,color: Colors.white,
                ),
              ),
              titleSpacing: 5.0,
            ),
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
                            'Change Password ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Form(
                              key: formkey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  //       crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:30,
                                    ),
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: defaultcol,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Enter your current password and your new password to change it',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,

                                      ),textAlign:  TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    defaulttextformfield(
                                      controller: oldPasswordcon,
                                      radius: 30,
                                      keyboardtype:
                                      TextInputType.visiblePassword,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter your Current Password';
                                        }
                                        if(value.length<6) {
                                          return 'Password must be greater than six characters';
                                        }
                                      },
                                      label: 'Current Password',
                                      prefix:IconBroken.Password,
                                      suffix: studentLayoutcubit.get(context).suffix,
                                      suffixPressed: () => studentLayoutcubit
                                          .get(context)
                                          .changepassvisibility(),
                                      hidepassword:
                                      studentLayoutcubit.get(context).hidepass,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    defaulttextformfield(
                                      controller: newPasswordcon,
                                      radius: 30,
                                      keyboardtype:
                                      TextInputType.visiblePassword,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter your New password';
                                        }
                                        if(value.length<4) {
                                          return 'Password must be greater than six characters';
                                        }
                                      },
                                      label: 'New Password',
                                      prefix:IconBroken.Password,
                                      suffix: studentLayoutcubit.get(context).suffix,
                                      suffixPressed: () => studentLayoutcubit
                                          .get(context)
                                          .changepassvisibility(),
                                      hidepassword:
                                      studentLayoutcubit.get(context).hidepass,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ConditionalBuilder(
                                      condition: state is! studentChangePasswordLoadingState,
                                      fallback: (context) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      builder: (context) => defaultbutton(
                                        onpress: ()  {

                                          if (formkey.currentState!
                                              .validate()) {

                                            studentLayoutcubit.get(context).changePassword(
                                              oldPassword : oldPasswordcon.text,
                                              newPassword : newPasswordcon.text,
                                            );

                                          }
                                        },
                                        text: 'update Password ',
                                        upercase: true,
                                        radius: 30,
                                      ),
                                    ),


                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
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
