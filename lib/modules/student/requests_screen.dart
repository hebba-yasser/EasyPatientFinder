import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/student/studentcubit/cubit.dart';
import '../../../layout/student/studentcubit/states.dart';
import '../../shared/components/components.dart';
import '../doctor/post_screen.dart';

class studentRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<studentLayoutcubit, studentLayoutstates>(
      listener: (context, state) {},
      builder: (context, state)
      {
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  'Request status',
                ),
               ),
            body: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>  buildRequestItem(context),
              separatorBuilder: (context, index) => SizedBox(
                height: 8.0,
              ),
              itemCount: 3,
            ),
          );


      },
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
                           radius: 25.0,
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
                                   'Accepted your request ',
                                   style:
                                   TextStyle(
                                     color:  Colors.green[600],
                                   ),
                                 ),SizedBox(
                                   height: 5,
                                 ),


                               ],
                             ),
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
                     Align(
                       alignment:  Alignment.centerLeft,
                       child: Text(
                         'Patient Phone : 010235469821 ',
                       ),
                     ),
                     Container(
                       alignment: Alignment.topLeft,
                       child: defaultTextButton(
                         onpress: () {
                           navigateto(context, doctorPostScreen());
                         },
                         text:'View the case',
                         textalign: TextAlign.start,

                         size: 12,
                       ),
                     ),
                   ],
                 ),
               ),
             ),
             SizedBox(height:10 ,),
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
                           radius: 25.0,
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
                                   'Rejected your request ',
                                   style:
                                   TextStyle(
                                     color:  Colors.red[600],
                                   ),
                                 ),SizedBox(
                                   height: 5,
                                 ),


                               ],
                             ),
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
                     Container(
                       alignment: Alignment.topLeft,
                       child: defaultTextButton(
                         onpress: () {
                           navigateto(context, doctorPostScreen());
                         },
                         text:'View the case',
                         textalign: TextAlign.start,

                         size: 12,
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ],
         ),

     );
   }
  Widget  buildRequestItemfalse(context){
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
                        radius: 25.0,
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
                                'Rejected your request ',
                                style:
                                TextStyle(
                                  color:  Colors.red[600],
                                ),
                              ),SizedBox(
                                height: 5,
                              ),


                            ],
                          ),
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
                  Container(
                    alignment: Alignment.topLeft,
                    child: defaultTextButton(
                      onpress: () {
                        navigateto(context, doctorPostScreen());
                      },
                      text:'View the case',
                      textalign: TextAlign.start,

                      size: 12,
                    ),
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
