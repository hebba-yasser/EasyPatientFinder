import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';

class superPostScreen extends StatelessWidget {
  List _items = [
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/5-Figure4-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure5-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure6-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure7-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure8-1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context:  context,
        title: 'Case',
      ),
      body:  Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5.0,
          margin: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                        rowItmes(text1:'Patient name : ', text2: 'mohamed magdy ',),
                        SizedBox(
                          height: 7,
                        ),
                        rowItmes(text1:'Patient age : ', text2: '33 ',),
                        SizedBox(
                          height: 7,
                        ),
                        rowItmes(text1:'Patient gender : ', text2: 'male ',),
                        SizedBox(
                          height: 7,
                        ),
                        rowItmes(text1:'Current medications : ', text2: 'maefegewagrrearaggle ',),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Medical history :'
                          ,style: TextStyle(color: HexColor('#5394AD'),
                            fontSize: 15),
                        ),
                        ConditionalBuilder(
                            condition: true, builder: (context) =>Text('diabetes') , fallback: (context) =>SizedBox() ),
                        ConditionalBuilder(
                            condition: true, builder: (context) =>Text('cardiac problems') , fallback: (context) =>SizedBox() ),
                        ConditionalBuilder(
                            condition: true, builder: (context) =>Text('hypertension') , fallback: (context) =>SizedBox() ),
                        SizedBox(
                          height: 5,
                        ),
                        ConditionalBuilder(
                            condition: true, builder: (context) => rowItmes(
                          text1: 'List of allergies : ',
                          text2: 'nfejknvrinavkjnvajnv ajnkj',
                          maxline: 2,
                          overflow: TextOverflow.ellipsis,
                        ), fallback: (context) =>SizedBox() ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Diagnosis :'
                          ,style: TextStyle(color: HexColor('#5394AD'),
                            fontSize: 15),
                        ),
                        ConditionalBuilder(
                            condition: true, builder: (context) =>Text('category') , fallback: (context) =>SizedBox() ),
                        ConditionalBuilder(
                            condition: true, builder: (context) =>Text('sub') , fallback: (context) =>SizedBox() ),
                rowItmes( text1: 'Level : ',  text2: '... ',),


                        ConditionalBuilder(
                            condition: true, builder: (context) => rowItmes(
                          text1: 'Other notes : ',
                          text2: '... ',
                          maxline: 2,
                          overflow: TextOverflow.ellipsis,
                        ), fallback: (context) =>SizedBox() ),SizedBox(
                          height: 7,
                        ), Container(
                          height: 320,
                          decoration: BoxDecoration(
                          ),

                          child: GridView.builder(
                            physics:  PageScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing:10,

                            ),
                            itemCount: _items.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
                                height: 250,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit:  BoxFit.fitWidth,

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
                    showtoast(
                        text: ' Reported successfully',
                        state: toaststates. ERROR);
                  },
                  text: 'Report Wrong Diagnosis',
                  radius: 30,
                ),
              ],
            ),
          ),
        ),

    );
  }
}
