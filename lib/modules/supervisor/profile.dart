/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import 'edit_profile.dart';

class supervisorProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      color: defaultcol,
      child: Column(
        children: [
          Expanded(
            //  flex: 2,
            child: Container(
              padding: EdgeInsets.all(20),
              color: defaultcol,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 70,),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: 68.0,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 64.0,
                          backgroundImage: NetworkImage(
                            'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'mohamed ali',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:  Colors.white,
                      fontSize: 18,
                    ),
                  ), SizedBox(height: 5,),
                ],
              ),
            ),
          ),
          Expanded(
            // flex: 2,
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            navigateto(context,  supervisorEditProfileScreen());
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: cc.defcol,
                                child: Icon(IconBroken.Edit,
                                    color: Colors.white),
                              ),
                              SizedBox(width: 8,),
                              Text('Edit Profile',style: TextStyle(
                                fontSize: 19,color:  HexColor('#87b4c6'),
                              )),
                              Spacer(),
                              IconButton(onPressed: (){
                                navigateto(context,  supervisorEditProfileScreen());

                              }, icon: Icon(IconBroken.Arrow___Right,color: defaultcol,))
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            //  navigateto(context,  editProfileScreen());
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: cc.defcol,
                                child: Icon(IconBroken.Password,
                                    color: Colors.white),
                              ),
                              SizedBox(width: 8,),
                              Text('Reset Password',style: TextStyle(
                                fontSize: 19,color:  HexColor('#87b4c6'),
                              )),
                              Spacer(),
                              IconButton(onPressed: (){
                                //  navigateto(context,  editProfileScreen());
                              }, icon: Icon(IconBroken.Arrow___Right,color: defaultcol,))
                            ],
                          ),
                        ),    InkWell(
                          onTap: () {
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: cc.defcol,
                                child: Icon(IconBroken.Delete,
                                    color: Colors.white),
                              ),
                              SizedBox(width: 8,),
                              Text('Delete account',style: TextStyle(
                                fontSize: 19,color:  HexColor('#87b4c6'),
                              )),
                              Spacer(),
                              IconButton(onPressed: (){
                                //  navigateto(context,  editProfileScreen());
                              }, icon: Icon(IconBroken.Arrow___Right,color: defaultcol,))
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            logout(context);

                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: cc.defcol,
                                child: Icon(IconBroken.Logout,
                                    color: Colors.white),
                              ),
                              SizedBox(width: 8,),
                              Text('Logout',style: TextStyle(
                                fontSize: 19,color:  HexColor('#87b4c6'),
                              )),
                              Spacer(),
                              IconButton(onPressed: (){
                                //  navigateto(context,  editProfileScreen());
                              }, icon: Icon(IconBroken.Arrow___Right,color: defaultcol,))
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}*/
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/layout/student/studentcubit/cubit.dart';
import 'package:project/modules/supervisor/students_list.dart';

import '../../layout/supervisor/supervisorcubit/cubit.dart';
import '../../layout/supervisor/supervisorcubit/states.dart';
import 'package:project/modules/supervisor/change_password.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import 'edit_profile.dart';

class supervisorProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<supervisorLayoutcubit,supervisorLayoutstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = supervisorLayoutcubit.get(context).supervisormodel;
        supervisorLayoutcubit dialogs = new supervisorLayoutcubit();
        return  Scaffold(
          body: Container(
            color: defaultcol,
            child: Column(
              children: [
                Expanded(
                  //  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: defaultcol,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 70,),
                          ConditionalBuilder(condition: userModel?.image!=null,
                            builder: (context) => Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                CircleAvatar(
                                  radius: 68.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 64.0,
                                    backgroundImage: NetworkImage(
                                      '${userModel?.image}',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            fallback: (context) => Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                CircleAvatar(
                                  radius: 68.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 64.0,
                                    backgroundImage: AssetImage('images/profileimage.jpg'),
                                  ),
                                ),
                              ],
                            ), ),
                          SizedBox(height: 5,),
                          Text(
                            '${userModel?.name}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:  Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  // flex: 2,
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
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  navigateto(context,  supervisorEditProfileScreen());
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: cc.defcol,
                                      child: Icon(IconBroken.Edit,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 8,),
                                    Text('Edit Profile',style: TextStyle(
                                      fontSize: 19,color:  HexColor('#87b4c6'),
                                    )),
                                    Spacer(),
                                    IconButton(onPressed: (){
                                      navigateto(context,  supervisorEditProfileScreen());

                                    }, icon: Icon(IconBroken.Arrow___Right,color: defaultcol,))
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                supervisorLayoutcubit.get(context) . getSupervisorStudents();
                                  navigateto(context, studentsScreen());
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: cc.defcol,
                                      child: Icon(IconBroken.User1,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 8,),
                                    Text('student list',style: TextStyle(
                                      fontSize: 19,color:  HexColor('#87b4c6'),
                                    )),
                                    Spacer(),
                                    IconButton(onPressed: (){
                                      supervisorLayoutcubit.get(context) . getSupervisorStudents();
                                      navigateto(context, studentsScreen());
                                    }, icon: Icon(IconBroken.Arrow___Right,color: defaultcol,))
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  navigateto(context, changePasswordScreen());                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: cc.defcol,
                                      child: Icon(IconBroken.Password,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 8,),
                                    Text('Change Password',style: TextStyle(
                                      fontSize: 19,color:  HexColor('#87b4c6'),
                                    )),
                                    Spacer(),
                                    IconButton(onPressed: (){
                                      navigateto(context, changePasswordScreen());


                                    }, icon: Icon(IconBroken.Arrow___Right,color: defaultcol,))
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  dialogs.deleteAlertDialog(context,
                                      'Delete Account',
                                      'Are you sure you want to permanently delete your account ?');
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: cc.defcol,
                                      child: Icon(IconBroken.Delete,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 8,),
                                    Text('Delete account',style: TextStyle(
                                      fontSize: 19,color:  HexColor('#87b4c6'),
                                    )),
                                    Spacer(),
                                    IconButton(onPressed: (){
                                      dialogs.deleteAlertDialog(context,
                                          'Delete Account',
                                          'Are you sure you want to permanently delete your account ?');
                                    }, icon: Icon(IconBroken.Arrow___Right,color: defaultcol,))
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                   logout(context);
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: cc.defcol,
                                      child: Icon(IconBroken.Logout,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 8,),
                                    Text('Logout',style: TextStyle(
                                      fontSize: 19,color:  HexColor('#87b4c6'),
                                    )),
                                    Spacer(),
                                    IconButton(onPressed: (){
                                      logout(context);
                                    }, icon: Icon(IconBroken.Arrow___Right,color: defaultcol,))
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}