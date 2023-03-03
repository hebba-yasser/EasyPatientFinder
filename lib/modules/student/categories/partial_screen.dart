import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/student/studentcubit/cubit.dart';
import '../../../layout/student/studentcubit/states.dart';
import '../../../shared/components/components.dart';
import '../post_screen.dart';
class partialScreen extends StatelessWidget {
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
        return Scaffold(
          appBar:  defaultAppBar(
            context:  context,
            title: 'Partial denture Cases',
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
             Container(
              padding: EdgeInsets.all(10.0),
          //    height: 50,
              width: double.infinity,
              child: Row(
               crossAxisAlignment:  CrossAxisAlignment.center,
               children: [
                Expanded(

                 child: defaultbutton(
                  onpress: () {
                  },
                  text: 'kennedy |',textalign:TextAlign.center ,
                  radius: 30,
                  hight: 35,
                 ),
                ),
                SizedBox(width: 5,),
                Expanded(

                 child: defaultbutton(
                  onpress: () {
                  },
                  text: 'kennedy ||',textalign:TextAlign.center ,
                  radius: 30,
                  hight: 35,
                 ),
                ),

               ],
              ),
             ),
             Container(
              padding: EdgeInsets.all(10.0),
              width: double.infinity,
              child: Row(
               crossAxisAlignment:  CrossAxisAlignment.center,
               children: [
                Expanded(

                 child: defaultbutton(
                  onpress: () {
                  },
                  text: 'kennedy |||',textalign:TextAlign.center ,
                  radius: 30,
                  hight: 35,                 ),
                ),
                SizedBox(width: 5,),
                Expanded(

                 child: defaultbutton(
                  onpress: () {
                  },
                  text: 'kennedy |v',textalign:TextAlign.center ,
                  radius: 30,
                  hight: 35,
                 ),
                ),

               ],
              ),
             ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildPost(context),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.0,
                ),
                itemCount: 5,
              ),
              SizedBox(
                height: 8.0,
              ),
            ]),
          ),
        );
      },
    );
  }

  Widget buildPost(context) => InkWell(
        onTap: () {
          navigateto(context, postScreen());
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
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/id/138205019/photo/happy-healthcare-practitioner.jpg?s=612x612&w=0&k=20&c=b8kUyVtmZeW8MeLHcDsJfqqF0XiFBjq6tgBQZC7G0f0=',
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
                            'ahmed mahmoud',
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
                            'february 20, 2023 at 11:00 pm',
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
                Text(
                  'The patient was a 77-year-old edentulous male whose chief complaint was instability of his complete dentures. At his initial examination, he clearly showed mandibular prognathism and imbalanced occlusion when wearing complete dentures.',
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
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
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultbutton(
                  onpress: () {
                    showtoast(
                        text: ' conatct information  Requested successfully',
                        state: toaststates.SUCCESS);
                  },
                  text: 'Request conatct information',
                  radius: 30,
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
