import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/layout/supervisor/supervisorcubit/cubit.dart';
import 'package:project/layout/supervisor/supervisorcubit/states.dart';
import 'package:project/models/case_model.dart';
import 'package:project/modules/student/post_screen.dart';
import 'package:project/modules/supervisor/post_screen.dart';
import 'package:project/shared/styles/colors.dart';

import '../../../layout/student/studentcubit/cubit.dart';
import '../../../layout/student/studentcubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class supervisorHomeScreen extends StatelessWidget {
  List _items = [
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/5-Figure4-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure5-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure6-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure7-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure8-1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer< supervisorLayoutcubit, supervisorLayoutstates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return
          ConditionalBuilder(
            condition: supervisorLayoutcubit.get(context).supervisorCases.length>0,
            fallback: (context) =>  Center(child: CircularProgressIndicator()),
              builder: (context) {
            return    Scaffold(
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
                    child: Column(
                        children:
                        [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => supervisorBuildPost(
                              supervisorLayoutcubit.get(context).supervisorCases[index],
                              context,
                              superPostScreen(),
                              supervisorLayoutcubit.get(context),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 8.0,
                            ),
                            itemCount: supervisorLayoutcubit.get(context).supervisorCases.length,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                        ]
                    ),
                  ),
                );
              },

          );

      },
    );
  }


}
