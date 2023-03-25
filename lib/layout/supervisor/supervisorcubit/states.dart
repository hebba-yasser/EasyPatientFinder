/*abstract class supervisorLayoutstates {}
 class intialstate  extends supervisorLayoutstates{}
class changeBottomNavstate extends supervisorLayoutstates{}

class supervisorGetuserLoadingState extends supervisorLayoutstates{}
class supervisorGetuserSucessState extends supervisorLayoutstates{}
class supervisorGetuserErrorState extends supervisorLayoutstates{
 final String error ;
 supervisorGetuserErrorState(this.error);
}

class supervisorGetAllDoctorsLoadingState extends supervisorLayoutstates{}
class supervisorGetAllDoctorsSucessState extends supervisorLayoutstates{}
class supervisorGetAllDoctorsErrorState extends supervisorLayoutstates{
 final String error ;
 supervisorGetAllDoctorsErrorState(this.error);
}*/
abstract class supervisorLayoutstates {}
class intialstate  extends supervisorLayoutstates{}
class changeBottomNavstate extends supervisorLayoutstates{}
class chagePassvisibilitystate extends supervisorLayoutstates{}
// get data
class supervisorGetuserLoadingState extends supervisorLayoutstates{}
class supervisorGetuserSucessState extends supervisorLayoutstates{}
class supervisorGetuserErrorState extends supervisorLayoutstates{
 final String error ;
 supervisorGetuserErrorState(this.error);
}
// get doctors list
class supervisorGetAllDoctorsLoadingState extends supervisorLayoutstates{}
class supervisorGetAllDoctorsSucessState extends supervisorLayoutstates{}
class supervisorGetAllDoctorsErrorState extends supervisorLayoutstates{
 final String error ;
 supervisorGetAllDoctorsErrorState(this.error);
}
// update profile
class supervisorProfileImagePickedSucessState extends supervisorLayoutstates{}
class supervisorProfileImagePickedErrorState extends supervisorLayoutstates{}

class supervisorUploadProfileImageSucessState extends supervisorLayoutstates{}
class supervisorUploadProfileImageErrorState extends supervisorLayoutstates{}

class supervisorUpdateErrorState extends supervisorLayoutstates{}
class supervisorUpdateLoadingState extends supervisorLayoutstates{}

// delete account
class supervisorDeleteLoadingState extends supervisorLayoutstates{}
class supervisorDeleteSucessState extends supervisorLayoutstates{}
class supervisorDeleteErrorState extends supervisorLayoutstates{
 final String error ;
 supervisorDeleteErrorState(this.error);
}

//change password
class supervisorChangePasswordLoadingState extends supervisorLayoutstates{}
class supervisorChangePasswordSucessState extends supervisorLayoutstates{}
class supervisorChangePasswordErrorState extends supervisorLayoutstates{}
