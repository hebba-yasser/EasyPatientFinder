import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/shared/styles/colors.dart';

import '../../layout/doctor/doctorcubit/cubit.dart';
import '../../layout/doctor/doctorcubit/states.dart';
import '../../shared/components/components.dart';

class newPostScreen extends StatelessWidget {
  var textController = TextEditingController();
  String? categorydropdownvalue = null;
  var items = [
    'complete denture',
    'partial denture',
    ' overdenture',
    'single denture',
    'maxillofacial case',
    'full mouth rehabilitation',
  ];
  String? subcategorydropdownvalue = null;
  var items2 = [
    'Flat Ridge',
    'Well Developed Ridge',
    'kennedy |',
    'kennedy ||',
    'kennedy |||',
    'kennedy |V',
    'none'
  ];
  String? leveldropdownvalue = null;
  var items3 = [
    'Level 4',
    'Level 5',
    'postgraduate ',
  ];

  List _items = [
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/5-Figure4-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure5-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure6-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure7-1.png',
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure8-1.png',
  ];

  bool ?isDiabetes=false;
  bool? isHypertension=false;
  bool? isCardiac=false;
  bool? isAllergies=false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<doctorLayoutcubit, doctorLayoutstates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar:AppBar(
              title: Text('New Post',),
              actions: [
                defaultTextButton(
                onpress: () {  }, text: ' post',size: 15,
                ),
                ]
          ),
          body: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
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
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'what patient case do you have ..',
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
                      color: cc.defcol,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                             // controller: textController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: 'patient name',
                                border: InputBorder.none,
                              )),
                          TextFormField(
                             // controller: textController,
                            keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'patient age',
                                border: InputBorder.none,
                              )),
                          TextFormField(
                            // controller: textController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'gender',
                                border: InputBorder.none,
                              )),
                          TextFormField(
                            // controller: textController,
                              keyboardType: TextInputType.streetAddress,

                              decoration: InputDecoration(
                                hintText: 'patient address',
                                border: InputBorder.none,
                              )),
                          TextFormField(
                            // controller: textController,
                              keyboardType: TextInputType.phone,

                              decoration: InputDecoration(
                                hintText: 'patient phone',

                                border: InputBorder.none,
                              )),
                          TextFormField(
                            // controller: textController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Current medicaton',
                                border: InputBorder.none,
                              )),


                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Medical History',style: TextStyle(
                              fontSize: 15,
                            )),
                          ),
                          Row(
                            children: [

                              Checkbox(value: isDiabetes,
                                activeColor:  defaultcol,
                                  tristate:false ,
                                  onChanged: (value){
                                    isDiabetes=!isDiabetes!;
                                  }),
                              Text('Diabetes'),
                              SizedBox(width: 30,),
                              Checkbox(value: isCardiac,
                                   activeColor:  defaultcol,
                                  tristate:false ,
                                  onChanged: (value){
                                    isCardiac=!isCardiac!;
                                  }),
                              Text('Cardiac problems'),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(value: isAllergies,
                                  activeColor:  defaultcol,
                                  tristate:false ,
                                  onChanged: (value){
                                    isAllergies=!isAllergies!;
                                  }),
                              Text('Allergies'),
                              SizedBox(width: 30,),
                              Checkbox(value: isHypertension,
                                  activeColor:  defaultcol,
                                  tristate:false ,
                                  onChanged: (value){
                                    isHypertension=!isHypertension!;
                                  }),
                              Text('Hypertension'),
                            ],
                          ),
                          TextFormField(
                            // controller: textController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'others...',
                                border: InputBorder.none,
                              )),
                          DropdownButtonFormField(
                            value: categorydropdownvalue,
                            decoration: InputDecoration(
                              label: Text('choose category'),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            icon: const Icon(
                              IconBroken.Arrow___Down_2,
                              color: cc.defcol,
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'please choose  category';
                              }
                            },
                            onChanged: (String? newValue) {
                              categorydropdownvalue = newValue!;
                              print(categorydropdownvalue);
                            },
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                          DropdownButtonFormField(
                            value: subcategorydropdownvalue,
                            decoration: InputDecoration(
                              label: Text('choose  sub category'),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            icon: const Icon(
                              IconBroken.Arrow___Down_2,
                              color: cc.defcol,
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'please choose  subcategory';
                              }
                            },
                            onChanged: (String? newValue) {
                              subcategorydropdownvalue = newValue!;
                              print(subcategorydropdownvalue);
                            },
                            items: items2.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                          DropdownButtonFormField(
                            value: leveldropdownvalue,
                            decoration: InputDecoration(
                              label: Text('choose Level'),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            icon: const Icon(
                              IconBroken.Arrow___Down_2,
                              color: cc.defcol,
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'please choose  level ';
                              }
                            },
                            onChanged: (String? newValue) {
                              leveldropdownvalue = newValue!;
                              print(leveldropdownvalue);
                            },
                            items: items3.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 20.0,
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
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
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
                                                fontSize: 32,
                                                color: Colors.white),
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
                            height: 10.0,
                          ),

                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            //    SocialCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Image,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Add photo',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            //    SocialCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Camera,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Take photo',
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
        );
      },
    );
  }

  dynamic getcount() {
    if (_items.length > 4) {
      return 4;
    } else {
      return _items.length;
    }
  }
}
