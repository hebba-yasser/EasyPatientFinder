import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/layout/doctor/doctorcubit/cubit.dart';
import 'package:project/layout/doctor/doctorcubit/states.dart';
import 'package:project/models/case_model.dart';
import 'package:project/modules/doctor/post_screen.dart';
import 'package:project/shared/styles/colors.dart';
import '../../layout/student/studentcubit/cubit.dart';
import '../../layout/student/studentcubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class doctorHomeScreen extends StatelessWidget {
  List _items = [/*
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/5-Figure4-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure5-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure6-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure7-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure8-1.png',
  */];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<doctorLayoutcubit, doctorLayoutstates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: doctorLayoutcubit.get(context).doctorCases.length>0,
          builder: (context) => Scaffold(
          appBar: AppBar(
              title: Text(
                'Home',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    //  navigateto(context, searchScreen()),
                  },
                  icon: Icon(IconBroken.Search),
                ),
              ]),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => doctorBuildPost(
                  doctorLayoutcubit.get(context).doctorCases[index],
                  context,
                  doctorPostScreen(),
                  doctorLayoutcubit.get(context),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.0,
                ),
                itemCount:doctorLayoutcubit.get(context).doctorCases.length ,
              ),
              SizedBox(
                height: 8.0,
              ),
            ]),
          ),
        ),
          fallback:(context) => Center(child: CircularProgressIndicator()),

        );
      },
    );
  }


}
