/*abstract class studentLayoutstates {}
 class studentIntialstate  extends studentLayoutstates{}
class studentChangeBottomNavstate extends studentLayoutstates{}

class studentGetuserLoadingState extends studentLayoutstates{}
class studentGetuserSucessState extends studentLayoutstates{}
class studentGetuserErrorState extends studentLayoutstates{
 final String error ;
studentGetuserErrorState(this.error);
}*/
abstract class studentLayoutstates {}
class studentIntialstate  extends studentLayoutstates{}
class studentChangeBottomNavstate extends studentLayoutstates{}
class chagePassvisibilitystate extends studentLayoutstates{}

class studentGetuserLoadingState extends studentLayoutstates{}
class studentGetuserSucessState extends studentLayoutstates{}
class studentGetuserErrorState extends studentLayoutstates{
 final String error ;
 studentGetuserErrorState(this.error);
}

// update profile
class studentProfileImagePickedSucessState extends studentLayoutstates{}
class studentProfileImagePickedErrorState extends studentLayoutstates{}

class studentUploadProfileImageSucessState extends studentLayoutstates{}
class studentUploadProfileImageErrorState extends studentLayoutstates{}

class studentUpdateErrorState extends studentLayoutstates{}
class studentUpdateLoadingState extends studentLayoutstates{}

//change password
class studentChangePasswordLoadingState extends studentLayoutstates{}
class studentChangePasswordSucessState extends studentLayoutstates{}
class studentChangePasswordErrorState extends studentLayoutstates{}
