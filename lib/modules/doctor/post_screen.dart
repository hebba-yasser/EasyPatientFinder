import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/layout/doctor/doctorcubit/cubit.dart';
import 'package:project/layout/doctor/doctorcubit/states.dart';

import '../../shared/components/components.dart';

class doctorPostScreen extends StatelessWidget {
  List _items = [
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/5-Figure4-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure5-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure6-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure7-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure8-1.png',
  ];

  doctorPostScreen();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<doctorLayoutcubit, doctorLayoutstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = doctorLayoutcubit.get(context).clickcase;

          return ConditionalBuilder(
            condition: doctorLayoutcubit.get(context).clickcase != null,
            builder: (context) => Scaffold(
              appBar: defaultAppBar(
                context: context,
                title: 'Case',
              ),
              body: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage('${model?.image}'),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                            '${model?.name}',
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
                                    '${model?.dateTime}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                        height: 1.4,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              rowItmes(
                                text1: 'Patient name : ',
                                text2: '${model?.patientName}'
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              rowItmes(
                                text1: 'Patient age : ',
                                text2: '${model?.patientAge}' ,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              rowItmes(
                                text1: 'Patient gender : ',
                                text2: '${model?.gender}' ,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              rowItmes(
                                text1: 'Current medications : ',
                                text2: '${model?.currentMedications}' ,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Medical history :',
                                style: TextStyle(
                                    color: HexColor('#5394AD'), fontSize: 15),
                              ),
                              ConditionalBuilder(
                                  condition: model?.isDiabetes as bool ,
                                  builder: (context) => Text('diabetes'),
                                  fallback: (context) => SizedBox()),
                              ConditionalBuilder(
                                  condition: model?.isCardiac as bool ,
                                  builder: (context) =>
                                      Text('cardiac problems'),
                                  fallback: (context) => SizedBox()),
                              ConditionalBuilder(
                                  condition: model?.isHypertension as bool ,
                                  builder: (context) => Text('hypertension'),
                                  fallback: (context) => SizedBox()),
                              SizedBox(
                                height: 5,
                              ),
                              ConditionalBuilder(
                                  condition: model?.isAllergies as bool ,
                                  builder: (context) => rowItmes(
                                        text1: 'List of allergies : ',
                                        text2:  '${model?. allergies}' ,
                                       // maxline: 2,
                                     //   overflow: TextOverflow.ellipsis,
                                      ),
                                  fallback: (context) => SizedBox()),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Diagnosis :',
                                style: TextStyle(
                                    color: HexColor('#5394AD'), fontSize: 15),
                              ),
                              ConditionalBuilder(
                                  condition: model!.category!.length!>0,
                                  builder: (context) => Text( '${model?.category}' ),
                                  fallback: (context) => SizedBox()),
                              ConditionalBuilder(
                                  condition: model!.subCategory!.length!>0,
                                  builder: (context) => Text( '${model?.subCategory}' ),
                                  fallback: (context) => SizedBox()),
                              rowItmes(
                                text1: 'Level : ',
                                text2:'${model?.level}',
                              ),
                              ConditionalBuilder(
                                  condition: model!.others!.length!>0,
                                  builder: (context) => Text('Other notes :${model?.others}'),
                                  fallback: (context) => SizedBox()),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                height: 350,
                                decoration: BoxDecoration(),
                                child: GridView.builder(
                                  physics: PageScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount: _items.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: double.infinity,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: NetworkImage(_items[index]),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
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
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        });
  }
}
