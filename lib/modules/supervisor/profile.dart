
import 'package:flutter/cupertino.dart';
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
}
