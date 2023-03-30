import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/layout/doctor/doctorcubit/cubit.dart';
import 'package:project/layout/student/studentcubit/cubit.dart';
import 'package:project/layout/supervisor/supervisorcubit/cubit.dart';
import 'package:project/modules/supervisor/edit_case.dart';

import '../../layout/student/studentcubit/states.dart';
import '../../models/case_model.dart';
import '../../modules/student/post_screen.dart';
import '../styles/colors.dart';
import 'constants.dart';

Widget defaultTextButton({
  required  Function() onpress,
  required String text,
  double ?size ,  TextAlign ?textalign,
  FontWeight ?fontweight,
})=>TextButton(onPressed: onpress,
    child: Text(text.toUpperCase(),

    style: TextStyle(fontSize: size,fontWeight: fontweight),
textAlign:  textalign,));
Widget defaultbutton({
  double width = double.infinity,
  required void Function() onpress,
  required String text,
  bool upercase = true,
  double radius = 0.0,
  TextAlign ?textalign,
  double ?hight ,


}) =>
    Container(
      width: width,
      height: hight,
      child: MaterialButton(
        onPressed: onpress,
        child: Text(
          upercase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white,

          fontSize: 15,
          ),
          textAlign: textalign,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: defaultcol,
      ),
    );
Widget defaulttextformfield({
  required TextEditingController controller,
  required TextInputType keyboardtype,
  void Function(String)? onsubmit,
  void Function(String)? onshange,
  void Function()? ontap,
  required String? Function(String?)? validator,
  bool hidepassword = false,
  required String label,
  Color labelcolor = Colors.black,
  double radius = 0,
  Color bordercolor = Colors.black,
   IconData? prefix,
  IconData ? suffix,
  int?maxLength,

  void Function()? onpress,
  void Function()?  suffixPressed,

}) =>
    TextFormField(
        controller: controller,
        maxLength:maxLength ,

        keyboardType: keyboardtype,
        onFieldSubmitted: onsubmit,
        onChanged: onshange,
        onTap: ontap,
        validator: validator,
        obscureText: hidepassword,
        decoration: InputDecoration(
          //  hintText:'Email',
            labelText: label,
            counterText: '',
            labelStyle: TextStyle(
              color: labelcolor,
            ),
            //     border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                color: bordercolor,
              ),
            ),
            prefixIcon:  Icon(prefix,),
            suffixIcon: suffix  !=null ?IconButton(onPressed: suffixPressed, icon: Icon(suffix),
            ):null,

        )
    );

PreferredSizeWidget? defaultAppBar({
  required BuildContext context,
  String ?title,
  List<Widget>? actions,
  IconData? icon,
}) => AppBar(
  leading: IconButton(
    onPressed: ()
    {
      Navigator.pop(context);
    },
    icon: Icon(
      IconBroken.Arrow___Left_2,
    ),
  ),
  titleSpacing: 5.0,
  title: Text(
    title!,
  ),
  actions: actions,
);
Widget rowItmes({
required String text1,
  required String text2,
   int? maxline,
  TextOverflow overflow=TextOverflow.visible,
})=>    RichText(
maxLines: maxline,

overflow: overflow,
text: TextSpan(
children: <TextSpan>[
TextSpan(
text: text1,
style: TextStyle(
color: HexColor('#5394AD'),
  fontSize: 15
),
),
TextSpan(
text:text2,
style: TextStyle(color: Colors.black)),
],
),
);
void navigateto (context,widget)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context) =>widget),
);
void navigate (context,widget)=> Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) =>widget),
      (route) => false,
);
void showtoast ({
  required String text,
  required   toaststates state,
})=>   Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: toastcolor(state),
  textColor: Colors.white,
  fontSize: 16.0,
);
enum toaststates {SUCCESS,ERROR,WARNNING}
Color? toastcolor(toaststates state){
  Color? color;
  switch(state)
  {case toaststates.SUCCESS:
    color=Colors.green;
    break;
    case toaststates.ERROR:
      color=Colors.red[900];
      break;
    case toaststates.WARNNING:
      color=Colors.yellow[400];
      break;
  }
  return color;
}

Widget studentDefaultbuildPost(caseModel model, context,Widget w, studentLayoutcubit studentLayoutcubit, ) => InkWell(
  onTap: () {
    studentLayoutcubit.studentGetCase(model.caseId as String);
  navigateto(context, w);
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
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '${model.dateTime}',
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
          SizedBox(
            height: 10,
          ),
          Text(
            'Medical history:',
            style: TextStyle(color: HexColor('#5394AD'), fontSize: 15),
          ),
          ConditionalBuilder(
              condition: model.isDiabetes as bool,
              builder: (context) => Text('diabetes'),
              fallback: (context) => SizedBox()),
          ConditionalBuilder(
              condition: model.isCardiac as bool,
              builder: (context) => Text('cardiac problems'),
              fallback: (context) => SizedBox()),
          ConditionalBuilder(
              condition: model.isHypertension as bool,
              builder: (context) => Text('hypertension'),
              fallback: (context) => SizedBox()),
          SizedBox(
            height: 5,
          ),
          ConditionalBuilder(
              condition: model.isAllergies as bool,
              builder: (context) => rowItmes(
                text1: 'List of allergies:   ',
                text2: '${model.allergies}',
                maxline: 2,
                overflow: TextOverflow.ellipsis,
              ),
              fallback: (context) => SizedBox()),
          SizedBox(
            height: 5,
          ),
          Text(
            'Diagnosis :',
            style: TextStyle(color: HexColor('#5394AD'), fontSize: 15),
          ),
          ConditionalBuilder(
              condition: model.category!.length > 0,
              builder: (context) => Text(
                '${model.category}',
              ),
              fallback: (context) => SizedBox()),
          ConditionalBuilder(
              condition: model.subCategory!.length > 0 &&
                  model.subCategory != 'none',
              builder: (context) => Text(
                '${model.subCategory}',
              ),
              fallback: (context) => SizedBox()),
          rowItmes(
            text1: 'Current medications: ',
            text2: '${model.currentMedications}',
            maxline: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 7,
          ),
          ConditionalBuilder(
              condition: model.others!.length > 0,
              builder: (context) => rowItmes(
                text1: 'Other notes : ',
                text2: '${model.others}',
                maxline: 2,
                overflow: TextOverflow.ellipsis,
              ),
              fallback: (context) => SizedBox()),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                4.0,
              ),
            ),
       /*     child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: getcount(),
                itemBuilder: (context, index) {
                  if (_items.length > 4) {
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
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(_items[index]),
                        ),
                      ),
                    );
                  }
                }),*/
          ),
          SizedBox(
            height: 10,
          ),
          defaultbutton(
            onpress: () {
              studentLayoutcubit. getStudentData();
              var m =
                  studentLayoutcubit. studentmodel;
              studentLayoutcubit.createRequest(
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
            /*onpress: () {
              studentLayoutcubit.getStudentData();
              var   m= studentLayoutcubit.studentmodel;
              /*  studentLayoutcubit.createRequest(
                    status: 'pending',
                    supervisorid:m!.supervisorId!,
                    studentid: UID,
                    caseid: model.caseId as String);*/
                  showtoast(
                      text:
                      ' conatct information  Requested successfully',
                      state: toaststates.SUCCESS);

            },*/
            text: 'Request conatct information',
            radius: 30,
          ),
        ],
      ),
    ),
  ),
);
/*dynamic getcount() {
  if (_items.length > 4) {
    return 4;
  } else {
    return _items.length;
  }
}*/

Widget doctorBuildPost(caseModel model, context,Widget w, doctorLayoutcubit doctorLayoutcubit,) => InkWell(
  onTap: () {
    doctorLayoutcubit.doctorGetCase(model.caseId as String);
    navigateto(context, w);
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      ' ${model.name}',
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
                      ' ${model.dateTime}',
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
          SizedBox(
            height: 10,
          ),
          Text(
            'Medical history:'
            ,style: TextStyle(color: HexColor('#5394AD'),
              fontSize: 15),
          ),
          ConditionalBuilder(
              condition: model.isDiabetes  as bool, builder: (context) =>Text('diabetes') , fallback: (context) =>SizedBox() ),
          ConditionalBuilder(
              condition: model.isCardiac  as bool, builder: (context) =>Text('cardiac problems') , fallback: (context) =>SizedBox() ),
          ConditionalBuilder(
              condition: model.isHypertension  as bool, builder: (context) =>Text('hypertension') , fallback: (context) =>SizedBox() ),
          SizedBox(
            height: 5,
          ),
          ConditionalBuilder(
              condition: model.isAllergies  as bool, builder: (context) => rowItmes(
            text1: 'List of allergies:   ',
            text2: '${model.allergies}',
            maxline: 2,
            overflow: TextOverflow.ellipsis,
          ), fallback: (context) =>SizedBox() ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Diagnosis :'
            ,style: TextStyle(color: HexColor('#5394AD'),
              fontSize: 15),
          ),
          ConditionalBuilder(
              condition: model.category!.length>0, builder: (context) =>Text('${model. category}',) , fallback: (context) =>SizedBox() ),
          ConditionalBuilder(
              condition:model.subCategory!.length>0 && model.subCategory !='none', builder: (context) =>Text('${model.subCategory}',) , fallback: (context) =>SizedBox() ),
          rowItmes(
            text1: 'Current medications: ',
            text2: '${model.currentMedications}',
            maxline: 2,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(
            height: 7,
          ),

          ConditionalBuilder(
              condition: model.others!.length>0, builder: (context) => rowItmes(
            text1: 'Other notes : ',
            text2:'${model.others}',
            maxline: 2,
            overflow: TextOverflow.ellipsis,
          ), fallback: (context) =>SizedBox() ),
          SizedBox(
            height: 7,
          ),
        /*  Container(
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
                  if (_items.length > 4) {
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
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(_items[index]),
                        ),
                      ),
                    );
                  }
                }),
          ),*/
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  ),
);
Widget supervisorBuildPost(caseModel model, context,Widget w, supervisorLayoutcubit supervisorLayoutcubit,) => InkWell(
  onTap: () {
    supervisorLayoutcubit.supervisorGetCase(model.caseId as String);
    navigateto(context, w);
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      '${model!.name}',
                      style: TextStyle(
                        height: 1.4,
                        fontSize: 15,
                        fontWeight:  FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '${model!.dateTime}',
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
            'Medical history:'
            ,style: TextStyle(color: HexColor('#5394AD'),
              fontSize: 15),
          ),
          ConditionalBuilder(
              condition: model.isDiabetes! as bool , builder: (context) =>Text('diabetes') , fallback: (context) =>SizedBox() ),
          ConditionalBuilder(
              condition: model.isCardiac! as bool , builder: (context) =>Text('cardiac problems') , fallback: (context) =>SizedBox() ),
          ConditionalBuilder(
              condition: model.isHypertension! as bool , builder: (context) =>Text('hypertension') , fallback: (context) =>SizedBox() ),
          SizedBox(
            height: 5,
          ),
          ConditionalBuilder(
              condition: model.isAllergies! as bool , builder: (context) => rowItmes(
            text1: 'List of allergies:',
            text2:  '${model!.allergies}',
            maxline: 2,
            overflow: TextOverflow.ellipsis,
          ), fallback: (context) =>SizedBox() ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Diagnosis :'
            ,style: TextStyle(color: HexColor('#5394AD'),
              fontSize: 15),
          ),
          ConditionalBuilder(
              condition: model.category!.length>0 , builder: (context) =>Text( '${model!.category}',) , fallback: (context) =>SizedBox() ),
          ConditionalBuilder(
              condition: model.subCategory!.length>0 && model.subCategory !='none', builder: (context) =>Text( '${model!.subCategory}',) , fallback: (context) =>SizedBox() ),   rowItmes(
            text1: 'Current medications: ',
            text2:  '${model!.currentMedications}',
            maxline: 2,
            overflow: TextOverflow.ellipsis,
          ), SizedBox(
            height: 7,
          ),
          rowItmes(
            text1: 'Level: ',
            text2:  '${model!.level}',
            maxline: 2,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(
            height: 7,
          ),

          ConditionalBuilder(
              condition: model.others!.length>0 ,
              builder: (context) => rowItmes(
                text1: 'Other notes : ',
                text2:  '${model!.others}',
                maxline: 2,
                overflow: TextOverflow.ellipsis,
              ), fallback: (context) =>SizedBox() ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                4.0,
              ),),
          /*  child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount:  getcount(),
              itemBuilder: (context, index) {
                if (_items.length > 4) {
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
                }
                else{
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(_items[index]),
                      ),
                    ),
                  );
                }
              },
            ),*/
          ),

          SizedBox(
            height: 10,
          ),
          defaultbutton(
            onpress: () {
              supervisorLayoutcubit.supervisorGetCase(model.caseId as String);
              navigateto(context, editCaseScreen());
            /*  showtoast(
                  text: ' Reported successfully',
                  state: toaststates. ERROR);*/
            },
            text: 'Report Wrong Diagnosis',
            radius: 30,
          ),
        ],
      ),
    ),
  ),
);