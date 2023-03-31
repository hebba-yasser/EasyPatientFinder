import 'package:project/shared/components/components.dart';
import 'package:project/shared/network/local/cache_helper.dart';

import '../../modules/loginscreen/loginScreen.dart';
dynamic UID;
dynamic ROLE ;
String LEVEL='';
void logout(context){
  cacheHelper.removedata(key: 'uId').then((value1) {
   if(value1==true){
     cacheHelper.removedata(key: 'role').then((value2) {
       if(value2==true)
         navigate(context, loginScreen());
     });
   }

});


}
void printFullText(String ?text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text!).forEach((match) => print(match.group(0)));
}
