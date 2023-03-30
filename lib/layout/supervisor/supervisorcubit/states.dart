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
// get cases
class supervisorGetCasesLoadingState extends supervisorLayoutstates{}
class supervisorGetCasesSucessState extends supervisorLayoutstates{}
class supervisorGetCasesErrorState extends supervisorLayoutstates{ final String error ;
supervisorGetCasesErrorState(this.error);}
// get clickedcase
class supervisorGetClickedCaseLoadingState extends supervisorLayoutstates{}
class supervisorGetClickedCaseSucessState extends supervisorLayoutstates{}
class supervisorGetClickedCaseErrorState extends supervisorLayoutstates{ final String error ;
supervisorGetClickedCaseErrorState(this.error);}
//get cases per docotr
class supervisorGetCasesPerDoctorSucessState extends supervisorLayoutstates{}

class supervisorAllSupervisorStudentsSucessState extends supervisorLayoutstates{}
//request screen
class supervisorGetRequestsSucessState extends supervisorLayoutstates{}

class supervisorGetStudentRequestedCasesDataLoadingState extends supervisorLayoutstates{}
class supervisorGetStudentRequestedCasesDataSucessState extends supervisorLayoutstates{}
class supervisorGetStudentRequestedCasesDataErrorState extends supervisorLayoutstates{ final String error ;
supervisorGetStudentRequestedCasesDataErrorState(this.error);}

class supervisorGetRequestedCasesDataLoadingState extends supervisorLayoutstates{}
class supervisorGetRequestedCasesDataSucessState extends supervisorLayoutstates{}
class supervisorGetRequestedCasesDataErrorState extends supervisorLayoutstates{ final String error ;
supervisorGetRequestedCasesDataErrorState(this.error);}

class supervisorUpdateRequestedCasesDataLoadingState extends supervisorLayoutstates{}
class supervisorUpdateRequestedCasesDataSucessState extends supervisorLayoutstates{}
class supervisorUpdateRequestedCasesDataErrorState extends supervisorLayoutstates{ final String error ;
supervisorUpdateRequestedCasesDataErrorState(this.error);}