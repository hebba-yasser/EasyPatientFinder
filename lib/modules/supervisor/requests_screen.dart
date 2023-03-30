
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/models/case_model.dart';
import 'package:project/models/request_id.dart';
import 'package:project/models/user_model.dart';
import 'package:project/modules/supervisor/post_screen.dart';

import '../../layout/supervisor/supervisorcubit/cubit.dart';
import '../../layout/supervisor/supervisorcubit/states.dart';
import '../../models/request.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../doctor/post_screen.dart';

class requestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return

        BlocConsumer<supervisorLayoutcubit, supervisorLayoutstates>(
        listener: (context, state) {
        },
        builder: (context, state)
        {
         var cubitcase = supervisorLayoutcubit.get(context).requestedCases;
         var cubitstudent = supervisorLayoutcubit.get(context).studentRequestedCases;


         return ConditionalBuilder(
                  condition: cubitcase.length >0,
                  builder:(context) => Scaffold(

                    appBar: AppBar(
                      title: Text(
                        'Requests List',
                      ),),
                    body: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildRequestItem(cubitstudent [index],cubitcase[index],context),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8.0,
                      ),
                      itemCount:cubitcase.length,
                    ),
                  ) ,
                  fallback:  (context) => Scaffold(
                    appBar: AppBar(
                      title: Text(
                        'Requests List',
                      ),),
                    body: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/nodataavailable.gif'),
                            //  width: 250,
                            //    height: 250,
                          ),
                          Text(
                            'Sorry We Can\'t Find Any Data ',
                            style: TextStyle(
                              fontSize: 20,
                              color: defaultcol,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                );

        },
      );

  }
   Widget buildRequestItem(userModel model,request modelcase,context){
     return  Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
           children: [
             Card(
               clipBehavior: Clip.antiAliasWithSaveLayer,
               elevation: 5.0,
               margin: EdgeInsets.symmetric(
                 horizontal: 10.0,
               ),
               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                   children: [
                     Row(
                       children: [
                 ConditionalBuilder(
                           condition: model?.image!=null ,
                           builder: (context) => Stack(
                             children: [
                               CircleAvatar(
                                 radius: 35.0,
                                 backgroundImage: NetworkImage(
                                   '${model?.image}',
                                 ),

                               ),
                             ],
                           ),
                           fallback: (context) => Stack(
                             children: [
                               CircleAvatar(
                                 radius: 35.0,
                                 backgroundImage: AssetImage('images/profileimage.jpg'),
                               ),

                             ],
                           ), ),

                         SizedBox(
                           width: 10.0,
                         ),
                         Expanded(
                           child: Container(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   '${model.name}',
                                   style: TextStyle(
                                     height: 1.4,
                                     fontSize: 15,
                                     fontWeight: FontWeight.w600,
                                   ),
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   'Request  contact  information  of ',
                                 ),
                                 Align(
                                   heightFactor: .5,
                                   child: Row(
                                     children: [
                                       Text('the case..'),
                                       defaultTextButton(
                                         onpress: () {
                                           supervisorLayoutcubit.get(context).supervisorGetCase(modelcase.caseid as String);
                                           navigateto(context, superPostScreen());
                                         },
                                         text: 'View the case',
                                         size: 12,textalign: TextAlign.center,
                                       ),
                                     ],
                                   ),
                                 ),

                                 SizedBox(
                                   height: 20,
                                 ),
                                 Row(
                                   children: [
                                     Expanded(
                                       child: defaultbutton(
                                         onpress: () {
                                           supervisorLayoutcubit.get(context).updateRequest(
                                             requeststatus: 'accept',
                                             supervisorid: modelcase.supervisorid! as String,
                                             studentid: model!.uId as String,
                                             requestid: modelcase!.requestid as String,
                                             uId: modelcase!.uId as String,
                                             name: modelcase!.name as String,
                                             image:  modelcase!.image != null ? modelcase!.image as String :'' ,
                                             caseid: modelcase.caseid as String,
                                             patientAge: modelcase!.patientAge as String,
                                             patientName: modelcase!.patientName as String,
                                             patientPhone: modelcase!.patientPhone as String,
                                             gender: modelcase!.gender as String,
                                             caseState: modelcase!.caseState as String,
                                             category: modelcase!.category as String,
                                             currentMedications: modelcase!.currentMedications as String,
                                             dateTime: modelcase!.dateTime as String,
                                             level: modelcase!.level as String,
                                             patientAddress: modelcase!.patientAddress as String,
                                             others: modelcase!.others as String,
                                             images: modelcase!.images as String,
                                             subCategory: modelcase!.subCategory as String,
                                             allergies: modelcase!.allergies as String,
                                             isHypertension: modelcase!.isHypertension,
                                             isAllergies: modelcase!.isAllergies,
                                             isCardiac: modelcase!.isCardiac,
                                             isDiabetes: modelcase!.isDiabetes,
                                           );
                                         },
                                         text: 'Accept',
                                         textalign: TextAlign.center,
                                         radius: 30,
                                         hight: 35,
                                       ),
                                     ),
                                     SizedBox(
                                       width: 5,
                                     ),
                                     Expanded(
                                       child: defaultbutton(
                                         onpress: () {
                                           supervisorLayoutcubit.get(context).updateRequest(
                                             requeststatus: 'ignore',
                                             supervisorid: modelcase.supervisorid! as String,
                                             studentid: model!.uId as String,
                                             requestid: modelcase!.requestid as String,
                                             uId: modelcase!.uId as String,
                                             name: modelcase!.name as String,
                                             image:  modelcase!.image != null ? modelcase!.image as String :'' ,
                                             caseid: modelcase.caseid as String,
                                             patientAge: modelcase!.patientAge as String,
                                             patientName: modelcase!.patientName as String,
                                             patientPhone: modelcase!.patientPhone as String,
                                             gender: modelcase!.gender as String,
                                             caseState: modelcase!.caseState as String,
                                             category: modelcase!.category as String,
                                             currentMedications: modelcase!.currentMedications as String,
                                             dateTime: modelcase!.dateTime as String,
                                             level: modelcase!.level as String,
                                             patientAddress: modelcase!.patientAddress as String,
                                             others: modelcase!.others as String,
                                             images: modelcase!.images as String,
                                             subCategory: modelcase!.subCategory as String,
                                             allergies: modelcase!.allergies as String,
                                             isHypertension: modelcase!.isHypertension,
                                             isAllergies: modelcase!.isAllergies,
                                             isCardiac: modelcase!.isCardiac,
                                             isDiabetes: modelcase!.isDiabetes,
                                           );
                                         },
                                         text: 'Ignore',
                                         textalign: TextAlign.center,
                                         radius: 30,
                                         hight: 35,
                                       ),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ],
         ),

     );
   }
}
