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
          condition: doctorLayoutcubit.get(context).cases.length>0,
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
                itemBuilder: (context, index) => buildPost(doctorLayoutcubit.get(context).cases[index],context),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.0,
                ),
                itemCount:doctorLayoutcubit.get(context).cases.length ,
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

  Widget buildPost( caseModel model,context) => InkWell(
        onTap: () {
          doctorLayoutcubit.get(context).getCase(model.caseId as String);
          navigateto(context, doctorPostScreen());
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5.0,
          margin: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                backgroundImage: NetworkImage('${model.image}'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                      ' ${model.name}',
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            ' ${model.dateTime}',
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      height: 1.4,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                /* rowItmes(text1:'Patient name: ', text2: 'mohamed magdy ',maxline: 2,overflow: TextOverflow.ellipsis,),
                SizedBox(
                  height: 7,
                ),
            rowItmes(text1:'Patient age: ', text2: '33 ',overflow: TextOverflow.ellipsis,maxline: 2),
                SizedBox(
                  height: 7,
                ),
               rowItmes(text1:'Patient gender: ', text2: 'male ',maxline: 2,overflow: TextOverflow.ellipsis,),
                SizedBox(
                  height: 7,
                ),
              rowItmes(text1:'Patient address: ', text2: 'mdfklnfladnaernkjvnnnnnnnnnnnajjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjnv ',
                    maxline: 2,overflow: TextOverflow.ellipsis,),
                SizedBox(
                  height: 7,
                ),
                */
                Text(
                  'Medical history:'
                  ,style: TextStyle(color: HexColor('#5394AD'),
                    fontSize: 15),
                ),
                ConditionalBuilder(
                    condition: model.isDiabetes  as bool, builder: (context) =>Text('diabetes') , fallback: (context) =>SizedBox() ),
                ConditionalBuilder(
                    condition: model.isCardiac  as bool, builder: (context) =>Text('cardiac problems') , fallback: (context) =>SizedBox() ),
                ConditionalBuilder(
                    condition: model.isHypertension  as bool, builder: (context) =>Text('hypertension') , fallback: (context) =>SizedBox() ),
                SizedBox(
                  height: 5,
                ),
                ConditionalBuilder(
                    condition: model.isAllergies  as bool, builder: (context) => rowItmes(
                  text1: 'List of allergies:   ',
                  text2: '${model.allergies}',
                  maxline: 2,
                  overflow: TextOverflow.ellipsis,
                ), fallback: (context) =>SizedBox() ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Diagnosis :'
                      ,style: TextStyle(color: HexColor('#5394AD'),
                fontSize: 15),
                ),
                ConditionalBuilder(
                    condition: model.category!.length>0, builder: (context) =>Text('${model. category}',) , fallback: (context) =>SizedBox() ),
                ConditionalBuilder(
                    condition: model.subCategory!.length>0, builder: (context) =>Text('${model.subCategory}',) , fallback: (context) =>SizedBox() ),
                rowItmes(
                  text1: 'Current medications: ',
                  text2: '${model.currentMedications}',
                  maxline: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(
                  height: 7,
                ),

                ConditionalBuilder(
                    condition: model.others!.length>0, builder: (context) => rowItmes(
                  text1: 'Other notes : ',
                  text2:'${model.others}',
                  maxline: 2,
                  overflow: TextOverflow.ellipsis,
                ), fallback: (context) =>SizedBox() ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4.0,
                    ),
                  ),
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: getcount(),
                      itemBuilder: (context, index) {
                        if (_items.length > 4) {
                          if (index < 3) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(_items[index]),
                                ),
                              ),
                            );
                          }
                          if (index == 3) {
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(_items[3], fit: BoxFit.cover),
                                Positioned.fill(
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.black54,
                                    child: Text(
                                      '+${(_items.length) - 4}',
                                      style: TextStyle(
                                          fontSize: 32, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        } else {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(_items[index]),
                              ),
                            ),
                          );
                        }
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
  dynamic getcount() {
    if (_items.length > 4) {
      return 4;
    } else {
      return _items.length;
    }
  }
}
