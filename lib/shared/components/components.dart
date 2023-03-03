import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icon_broken/icon_broken.dart';

import '../styles/colors.dart';

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
  void Function()? onpress,
  void Function()?  suffixPressed,

}) =>
    TextFormField(
        controller: controller,
        keyboardType: keyboardtype,
        onFieldSubmitted: onsubmit,
        onChanged: onshange,
        onTap: ontap,
        validator: validator,
        obscureText: hidepassword,
        decoration: InputDecoration(
          //  hintText:'Email',
            labelText: label,
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
