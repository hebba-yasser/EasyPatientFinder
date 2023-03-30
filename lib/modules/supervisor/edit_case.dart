import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/layout/doctor/doctor_Layout_screen.dart';
import 'package:project/layout/supervisor/supervisor_layout.dart';
import 'package:project/layout/supervisor/supervisorcubit/cubit.dart';
import 'package:project/layout/supervisor/supervisorcubit/states.dart';
import 'package:project/shared/styles/colors.dart';
import '../../layout/doctor/doctorcubit/cubit.dart';
import '../../layout/doctor/doctorcubit/states.dart';
import '../../shared/components/components.dart';
import '../student/change_password.dart';

class editCaseScreen extends StatelessWidget {
  var textController = TextEditingController();
  String? categorydropdownvalue;
  var items = [
    'complete denture',
    'partial denture',
    'overdenture',
    'single denture',
    'maxillofacial case',
    'full mouth rehabilitation',
  ];
  String? subcategorydropdownvalue;
  var items2 = [
    'Flat Ridge',
    'Well Developed Ridge',
    'kennedy |',
    'kennedy ||',
    'kennedy |||',
    'kennedy |V',
    'none'
  ];
  String? leveldropdownvalue;
  var items3 = [
    'Level 4',
    'Level 5',
    'postgraduate ',
  ];
  List _items = [ /*
    'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/5-Figure4-1.png',
     'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure5-1.png',
     'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure6-1.png',
      'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure7-1.png',
     'https://d3i71xaburhd42.cloudfront.net/bd1dda091dc895f3f2dfee27bedb5beed39bfc53/250px/6-Figure8-1.png',*/
  ];
  var formkey2 = GlobalKey<FormState>();
  bool isDiabetes = false;
  bool isHypertension = false;
  bool isCardiac = false;
  bool isAllergies = false;
  var patientNameController = TextEditingController();
  var patientAgeController = TextEditingController();
  var patientGenderController = TextEditingController();
  var patientAdressController = TextEditingController();
  var patienPhoneController = TextEditingController();
  var otherController = TextEditingController();
  var imagesController = TextEditingController();
  var currentMedicationsController = TextEditingController();
  var allergiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<supervisorLayoutcubit, supervisorLayoutstates>(
      listener: (context, state) {
       /* if (state is doctorNewPostSucessState) {
          showtoast(
              text:
              'updated Successfully',
              state: toaststates.SUCCESS);
         navigate(context,  superviasorLayoutScreen());
        }*/
      },
      builder: (context, state) {
        var postimage = doctorLayoutcubit .get(context).postImage;
        var model = supervisorLayoutcubit.get(context).supervisorClickcase;

        patientNameController.text = model!.patientName! ;
        patientAgeController.text = model!.patientAge!;
        patientGenderController.text = model!.gender!;
          patientAdressController .text = model!.patientAddress! ;
          patienPhoneController.text = model!.patientPhone! ;
          otherController.text = model!.others! ;
        //  imagesController.text = model!.images! ;
          currentMedicationsController .text = model!.currentMedications! ;
          allergiesController.text = model!.allergies! ;
          isDiabetes = model!.isDiabetes!;
          isHypertension = model!.isHypertension!;
          isCardiac = model!.isCardiac!;
          isAllergies =model!.isAllergies!;
        categorydropdownvalue=model!.category!;
        subcategorydropdownvalue=model!.subCategory!;
        leveldropdownvalue=model!.level!;

        return Scaffold(
          appBar: AppBar(
              title: Text(
                'Edit Case',
              ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateto(context, superviasorLayoutScreen());

                },
                icon: Icon(Icons.check, color: cc.defcol),
              )
            ],
          ),
          body: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //impppppppppppppppppppppp
                  if (state is doctorNewPostLoadingState)
                    LinearProgressIndicator(),
                  if (state is doctorNewPostLoadingState)
                    SizedBox(
                      height: 10.0,
                    ),
                  Row(
                    children: [
                      ConditionalBuilder(
                        condition: model?. image!=null ,
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
                              backgroundImage: AssetImage('images/profileimage.jpg'),
                            ),

                          ],
                        ), ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${model.name}',
                              style: TextStyle(
                                height: 1.4,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
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
                      child: Form(
                        key: formkey2,
                        child: Column(
                          children: [
                            TextFormField(
                                controller:  patientNameController ,
                                keyboardType: TextInputType.name,

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter Patient Name';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'patient name',
                                  border: InputBorder.none,
                                )),
                            TextFormField(
                                controller: patientAgeController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter Patient Age';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'patient age',
                                  border: InputBorder.none,
                                )),
                            TextFormField(
                                controller: patientGenderController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter Patient Gender';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'gender',
                                  border: InputBorder.none,
                                )),
                            TextFormField(
                                controller: patientAdressController,
                                keyboardType: TextInputType.streetAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter Patient Address';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'patient address',
                                  border: InputBorder.none,
                                )),
                            TextFormField(
                                controller: patienPhoneController,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter Patient phone number';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'patient phone',
                                  border: InputBorder.none,
                                )),
                            TextFormField(
                                controller: currentMedicationsController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter Patient medication no medication?? write none';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Current medicaton',
                                  border: InputBorder.none,
                                )),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Medical History',
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  tristate: false,
                                  value: isDiabetes,
                                  activeColor: defaultcol,
                                  onChanged: (value) {
                                    isDiabetes = doctorLayoutcubit
                                        .get(context)
                                        .changeDiabetes();
                                  },
                                ),
                                Text('Diabetes'),
                                SizedBox(
                                  width: 30,
                                ),
                                Checkbox(
                                  tristate: false,
                                  value: isCardiac,
                                  activeColor: defaultcol,
                                  onChanged: (value) {
                                    isCardiac = doctorLayoutcubit
                                        .get(context)
                                        .changeCardiac();
                                  },
                                ),
                                Text('Cardiac problems'),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  tristate: false,
                                  value: isAllergies,
                                  activeColor: defaultcol,
                                  onChanged: (value) {
                                    isAllergies = doctorLayoutcubit
                                        .get(context)
                                        .changeAllergies();
                                  },),
                                Text('Allergies'),
                                SizedBox(
                                  width: 30,
                                ),
                                Checkbox(
                                  value: isHypertension,
                                  activeColor: defaultcol,
                                  tristate: false,
                                  onChanged: (value) {
                                    isHypertension = doctorLayoutcubit
                                        .get(context)
                                        .changeHypertension();
                                  },
                                ),
                                Text('Hypertension'),
                              ],
                            ),
                            ConditionalBuilder(
                                condition: isAllergies,
                                builder: (context) =>
                                    TextFormField(
                                        controller: allergiesController,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'please enter patient Allergies';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Allergies ',
                                          border: InputBorder.none,
                                        )),
                                fallback: (context) => SizedBox()),
                            TextFormField(
                                controller: otherController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelText: 'others...',
                                  border: InputBorder.none,
                                )),
                            DropdownButtonFormField(
                              value: categorydropdownvalue,
                              decoration: InputDecoration(
                              label: Text('category'),
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
                                label: Text('sub category'),
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
                                label: Text(' Level'),
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
                            if(postimage != null)
                      //         Container(
                      //           height: 300,
                      //           width: double.infinity,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(
                      //               4.0,
                      //             ),
                      //             image: DecorationImage(
                      //               image: FileImage(postimage!),
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //
                      //           /*   child: GridView.builder(
                      //   physics: NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   gridDelegate:
                      //   SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     crossAxisSpacing: 5,
                      //     mainAxisSpacing: 5,
                      //   ),
                      //   itemCount: getcount(),
                      //   itemBuilder: (context, index) {
                      //     if (index < 3) {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //           image: DecorationImage(
                      //             fit: BoxFit.cover,
                      //             image: FileImage( postimage!) as ImageProvider,
                      //           ),
                      //         ),);
                      //     }
                      //     if (index == 3) {
                      //       return Stack(
                      //         fit: StackFit.expand,
                      //         children: [
                      //           Image.network(_items[3], fit: BoxFit.cover),
                      //           Positioned.fill(
                      //             child: Container(
                      //               alignment: Alignment.center,
                      //               color: Colors.black54,
                      //               child: Text(
                      //                 '+${(_items.length) - 4}',
                      //                 style: TextStyle(
                      //                     fontSize: 32,
                      //                     color: Colors.white),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       );
                      //     }
                      //   },
                      // ),*/
                      //         ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            doctorLayoutcubit.get(context).getPostImage();
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
                            // doctorLayoutcubit.get(context).getPostImage();
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
}