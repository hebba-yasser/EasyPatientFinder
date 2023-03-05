import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/models/user_model.dart';
import 'package:project/modules/supervisor/posts_perDoctor_screen.dart';

import '../../layout/supervisor/supervisorcubit/cubit.dart';
import '../../layout/supervisor/supervisorcubit/states.dart';
import '../../shared/components/components.dart';
import '../doctor/post_screen.dart';

class doctorsScreen extends StatelessWidget {
  const doctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<supervisorLayoutcubit, supervisorLayoutstates>(
        listener: (context, state) {
        },
        builder: (context, state)
        {
            var   cubit=supervisorLayoutcubit.get(context).doctors;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Doctors List',
              ),),
            body: ConditionalBuilder(
              condition:state is !supervisorGetAllDoctorsLoadingState ,
              builder: (context) =>  ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildRequestItem(cubit[index],context),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.0,
                ),
                itemCount: cubit.length,
              ),
              fallback:(context) => Center(child: CircularProgressIndicator()),

            ),
          );


        },
      );
  }
  Widget buildRequestItem(userModel modell ,context){
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
                        backgroundImage: NetworkImage('${modell.image}'  ),
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
                                '${modell.name}',
                                style: TextStyle(
                                  height: 1.4,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                                    defaultTextButton(
                                      onpress: () {
                                        navigateto(context, postPerDoctorScreen());
                                      },
                                      text: 'View the cases',
                                      size: 12,textalign: TextAlign.center,
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
