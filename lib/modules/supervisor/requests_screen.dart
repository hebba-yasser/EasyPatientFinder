
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/supervisor/supervisorcubit/cubit.dart';
import '../../layout/supervisor/supervisorcubit/states.dart';
import '../../shared/components/components.dart';
import '../doctor/post_screen.dart';

class requestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => supervisorLayoutcubit(),
      child: BlocConsumer<supervisorLayoutcubit, supervisorLayoutstates>(
        listener: (context, state) {},
        builder: (context, state)
        {

                 return Scaffold(
                   appBar: AppBar(
                       title: Text(
                         'Requests List',
                       ),),
                   body: ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildRequestItem(context),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 8.0,
                        ),
                        itemCount: 5,
                      ),
                 );


        },
      ),
    );
  }
   Widget buildRequestItem(context){
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
                         CircleAvatar(
                           radius: 35.0,
                           backgroundImage: NetworkImage(
                             'https://media.istockphoto.com/id/138205019/photo/happy-healthcare-practitioner.jpg?s=612x612&w=0&k=20&c=b8kUyVtmZeW8MeLHcDsJfqqF0XiFBjq6tgBQZC7G0f0=',
                           ),
                         ),
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
                                   'ahmed mahmoud',
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
                                           navigateto(context, doctorPostScreen());
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
                                         onpress: () {},
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
                                         onpress: () {},
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
