import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/layout/student/studentcubit/cubit.dart';
import 'package:project/layout/student/studentcubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class studentPostScreen extends StatelessWidget {
  List _items = [
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/5-Figure4-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure5-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure6-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure7-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure8-1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<studentLayoutcubit, studentLayoutstates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: studentLayoutcubit.get(context).studentClickcase != null,
            fallback: (context) => Center(child: CircularProgressIndicator()),
            builder: (context) {
              var model = studentLayoutcubit.get(context).studentClickcase;
              return Scaffold(
                appBar: defaultAppBar(
                  context: context,
                  title: 'Case',
                ),
                body: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ConditionalBuilder(
                              condition: model?.image != null,
                              builder: (context) => Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage: NetworkImage(
                                      '${model?.image}',
                                    ),
                                  ),
                                ],
                              ),
                              fallback: (context) => Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage:
                                        AssetImage('images/profileimage.jpg'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${model!.name}',
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
                                    '${model!.dateTime}',
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
                                  text2: '${model!.patientName}',
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                rowItmes(
                                  text1: 'Patient age : ',
                                  text2: '${model!.patientAge}',
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                rowItmes(
                                  text1: 'Patient gender : ',
                                  text2: '${model!.gender}',
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                rowItmes(
                                  text1: 'Current medications : ',
                                  text2: '${model!.currentMedications}',
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
                                    condition: model.isDiabetes as bool,
                                    builder: (context) => Text('diabetes'),
                                    fallback: (context) => SizedBox()),
                                ConditionalBuilder(
                                    condition: model.isCardiac as bool,
                                    builder: (context) =>
                                        Text('cardiac problems'),
                                    fallback: (context) => SizedBox()),
                                ConditionalBuilder(
                                    condition: model.isHypertension as bool,
                                    builder: (context) => Text('hypertension'),
                                    fallback: (context) => SizedBox()),
                                SizedBox(
                                  height: 5,
                                ),
                                ConditionalBuilder(
                                    condition: model.allergies!.length > 0,
                                    builder: (context) => rowItmes(
                                          text1: 'List of allergies : ',
                                          text2: '${model!.allergies}',
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
                                    condition: model.category!.length > 0,
                                    builder: (context) =>
                                        Text('${model!.category}'),
                                    fallback: (context) => SizedBox()),
                                ConditionalBuilder(
                                    condition: model.subCategory!.length > 0 &&
                                        model.subCategory != 'none',
                                    builder: (context) =>
                                        Text('${model!.subCategory}'),
                                    fallback: (context) => SizedBox()),
                                SizedBox(
                                  height: 7,
                                ),
                                ConditionalBuilder(
                                    condition: model.others!.length > 0,
                                    builder: (context) => rowItmes(
                                          text1: 'Other notes : ',
                                          text2: '${model!.others}',
                                        ),
                                    fallback: (context) => SizedBox()),
                                Container(
                                  height: 320,
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
                        defaultbutton(
                          onpress: () {
                            studentLayoutcubit.get(context).getStudentData();
                            var m =
                                studentLayoutcubit.get(context).studentmodel;
                            studentLayoutcubit.get(context).createRequest(
                                  status: 'pending',
                                  supervisorid: m!.supervisorId!,
                                  studentid: UID,
                                  requestid: '',
                                  uId: model!.uId as String,
                                  name: model!.name as String,
                                  image:  model!.image != null ? model!.image as String :'' ,
                                  caseid: model.caseId as String,
                                  patientAge: model!.patientAge as String,
                                  patientName: model!.patientName as String,
                                  patientPhone: model!.patientPhone as String,
                                  gender: model!.gender as String,
                                  caseState: model!.caseState as String,
                                  category: model!.category as String,
                                  currentMedications: model!.currentMedications as String,
                                  dateTime: model!.dateTime as String,
                                  level: model!.level as String,
                                  patientAddress: model!.patientAddress as String,
                                  others: model!.others as String,
                                  images: model!.images as String,
                                  subCategory: model!.subCategory as String,
                                  allergies: model!.allergies as String,
                                  isHypertension: model!.isHypertension,
                                  isAllergies: model!.isAllergies,
                                  isCardiac: model!.isCardiac,
                                  isDiabetes: model!.isDiabetes,

                                );

                            showtoast(
                                text:
                                    ' conatct information  Requested successfully',
                                state: toaststates.SUCCESS);
                          },
                          /*{
                       studentLayoutcubit.get(context).getStudentData();
                         var   m= studentLayoutcubit.get(context).studentmodel;
                         if(state is studentGetuserSucessState){
                           studentLayoutcubit.get(context).createRequest(
                               status: 'pending',
                               supervisorid:m!.superid!,
                               studentid: UID,
                               caseid: model.caseId as String);
                           if(state is studentCreateRequestSucessState){
                             showtoast(
                                 text:
                                 ' conatct information  Requested successfully',
                                 state: toaststates.SUCCESS);
                           }

                         }

                          },*/
                          text: 'Request conatct information',
                          radius: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
