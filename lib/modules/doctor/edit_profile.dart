/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/shared/styles/colors.dart';

import '../../shared/components/components.dart';

class doctorEditProfileScreen extends StatelessWidget {
  var namecon = TextEditingController();
  var phonecon = TextEditingController();
  var emailcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cc.defcol,
        title: Center(
          child: Text('Edit profile',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconBroken.Arrow___Left_2, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check, color: Colors.white),
          )
        ],
      ),
      body: Container(
        color: defaultcol,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: defaultcol,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(height: 70,),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          CircleAvatar(
                            radius: 54.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20.0,
                              child: Icon(
                                IconBroken.Camera,
                                size: 16.0,
                              ),
                            ),
                            onPressed: () {
                              //  SocialCubit.get(context).getCoverImage();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
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
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              //if (SocialCubit.get(context).profileImage != null)
                              Expanded(
                                child: Column(
                                  children: [
                                    defaultbutton(
                                      onpress: () {
                                        /* SocialCubit.get(context).uploadProfileImage(
    name: nameController.text,
    phone: phoneController.text,
    bio: bioController.text,
    );*/
                                      },
                                      text: 'upload profile image',radius: 30,
                                    ),
                                    // if (state is SocialUserUpdateLoadingState)
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    //   if (state is SocialUserUpdateLoadingState)
                                    LinearProgressIndicator(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                            ],
                          ),
                          /*if (SocialCubit.get(context).profileImage != null ||
    SocialCubit.get(context).coverImage != null)*/
                          SizedBox(
                            height: 20.0,
                          ),
                          defaulttextformfield(
                            controller: namecon,
                            radius: 30,
                            keyboardtype: TextInputType.name,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'name must not be empty';
                              }
                            },
                            label: 'Name',
                            prefix: IconBroken.User,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaulttextformfield(
                            controller: emailcon,
                            radius: 30,
                            keyboardtype: TextInputType.text,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Email must not be empty';
                              }
                            },
                            label: 'Email',
                            prefix: IconBroken.Message,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaulttextformfield(
                            controller: phonecon,
                            radius: 30,
                            keyboardtype: TextInputType.phone,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'phone number must not be empty';
                              }
                            },
                            label: 'Phone',
                            prefix: IconBroken.Call,
                          ),
                          SizedBox(
                            height: 15.0,
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
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/layout/doctor/doctor_Layout_screen.dart';
import 'package:project/modules/doctor/profile.dart';
import 'package:project/shared/styles/colors.dart';

import '../../layout/doctor/doctorcubit/cubit.dart';
import '../../layout/doctor/doctorcubit/states.dart';
import '../../shared/components/components.dart';

class doctorEditProfileScreen extends StatelessWidget {
  var namecon = TextEditingController();
  var phonecon = TextEditingController();
  var emailcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<doctorLayoutcubit, doctorLayoutstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = doctorLayoutcubit.get(context).doctormodel;
        var doctorProfileImage =
            doctorLayoutcubit.get(context).doctorProfileImage;
        namecon.text = userModel!.name!;
        phonecon.text = userModel!.phone!;
        emailcon.text = userModel!.email!;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: cc.defcol,
            title: Center(
              child: Text('Edit profile',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(IconBroken.Arrow___Left_2, color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  doctorLayoutcubit.get(context).updateDoctorData(
                      name: namecon.text,
                      phone: phonecon.text,
                      email: emailcon.text);
                  navigate(context, doctorLayoutScreen());
                },
                icon: Icon(Icons.check, color: Colors.white),
              )
            ],
          ),
          body: Container(
            color: defaultcol,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: defaultcol,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // SizedBox(height: 70,),
                          ConditionalBuilder(
                            condition: userModel?.image != null,
                            fallback: (context) => Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              SizedBox(
                                height: 3,
                              ),
                              CircleAvatar(
                                radius: 54.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: doctorProfileImage == null
                                      ?   AssetImage('images/profileimage.jpg')
                                      : FileImage(doctorProfileImage)
                                  as ImageProvider,
                                ),
                              ),
                              IconButton(
                                icon: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ),
                                onPressed: () {
                                  doctorLayoutcubit
                                      .get(context)
                                      .getDoctorImage();
                                },
                              ),
                            ],
                          ),
                            builder: (context) => Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                SizedBox(
                                  height: 3,
                                ),
                                CircleAvatar(
                                  radius: 54.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: doctorProfileImage == null
                                        ? NetworkImage('${userModel?.image}')
                                        : FileImage(doctorProfileImage)
                                            as ImageProvider,
                                  ),
                                ),
                                IconButton(
                                  icon: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20.0,
                                    child: Icon(
                                      IconBroken.Camera,
                                      size: 16.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    doctorLayoutcubit
                                        .get(context)
                                        .getDoctorImage();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        if (doctorLayoutcubit
                                                .get(context)
                                                .doctorProfileImage !=
                                            null)
                                          defaultbutton(
                                            onpress: () {
                                              doctorLayoutcubit
                                                  .get(context)
                                                  .uploadDoctorProfileImage(
                                                      name: namecon.text,
                                                      phone: phonecon.text,
                                                      email: emailcon.text);
                                            },
                                            text: 'upload profile image',
                                            radius: 30,
                                          ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        if (state is doctorUpdateLoadingState)
                                          LinearProgressIndicator(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaulttextformfield(
                                controller: namecon,
                                radius: 30,
                                keyboardtype: TextInputType.name,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'name must not be empty';
                                  }
                                },
                                label: 'Name',
                                prefix: IconBroken.User,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaulttextformfield(
                                controller: emailcon,
                                radius: 30,
                                keyboardtype: TextInputType.text,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Email must not be empty';
                                  }
                                },
                                label: 'Email',
                                prefix: IconBroken.Message,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaulttextformfield(
                                controller: phonecon,
                                radius: 30,
                                keyboardtype: TextInputType.phone,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'phone number must not be empty';
                                  }
                                },
                                label: 'Phone',
                                prefix: IconBroken.Call,
                              ),
                              SizedBox(
                                height: 15.0,
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
