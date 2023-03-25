/*abstract class doctorLayoutstates {}
 class intialstate  extends doctorLayoutstates{}
class changeBottomNavstate extends doctorLayoutstates{}

class doctorGetuserLoadingState extends doctorLayoutstates{}
class doctorGetuserSucessState extends doctorLayoutstates{}
class doctorGetuserErrorState extends doctorLayoutstates{ final String error ;
doctorGetuserErrorState(this.error);}

class doctorProfileImagePickedSucessState extends doctorLayoutstates{}
class doctorProfileImagePickedErrorState extends doctorLayoutstates{}

class doctorUploadProfileImageSucessState extends doctorLayoutstates{}
class doctorUploadProfileImageErrorState extends doctorLayoutstates{}

class doctorUpdateErrorState extends doctorLayoutstates{}
class doctorUpdateLoadingState extends doctorLayoutstates{}


//post a case
class doctorNewPostLoadingState extends doctorLayoutstates{}
class doctorNewPostSucessState extends doctorLayoutstates{}
class doctorNewPostErrorState extends doctorLayoutstates{ final String error ;
doctorNewPostErrorState(this.error);}

*/
abstract class doctorLayoutstates {}
class intialstate  extends doctorLayoutstates{}
class changeBottomNavstate extends doctorLayoutstates{}
class doctorLoadingstate extends doctorLayoutstates{}
class chagePassvisibilitystate extends doctorLayoutstates{}
// get data
class doctorGetuserLoadingState extends doctorLayoutstates{}
class doctorGetuserSucessState extends doctorLayoutstates{}
class doctorGetuserErrorState extends doctorLayoutstates{ final String error ;
doctorGetuserErrorState(this.error);}
// update profile
class doctorProfileImagePickedSucessState extends doctorLayoutstates{}
class doctorProfileImagePickedErrorState extends doctorLayoutstates{}

class doctorUploadProfileImageSucessState extends doctorLayoutstates{}
class doctorUploadProfileImageErrorState extends doctorLayoutstates{}

class doctorUpdateErrorState extends doctorLayoutstates{}
class doctorUpdateLoadingState extends doctorLayoutstates{}


//change password
class doctorChangePasswordLoadingState extends doctorLayoutstates{}
class doctorChangePasswordSucessState extends doctorLayoutstates{}
class doctorChangePasswordErrorState extends doctorLayoutstates{}
//post a case
class doctorNewPostLoadingState extends doctorLayoutstates{}
class doctorNewPostSucessState extends doctorLayoutstates{}
class doctorNewPostErrorState extends doctorLayoutstates{ final String error ;
doctorNewPostErrorState(this.error);}
class casePostImagePickedSuccessState extends doctorLayoutstates{}
class casePostImagePickedErrorState extends doctorLayoutstates{}

class changeDiabetesSuccess extends doctorLayoutstates{}
class changeDiabetesError extends doctorLayoutstates{}

class changeCardiacSuccess extends doctorLayoutstates{}
class changeCardiacError extends doctorLayoutstates{}

class changeHypertensionSuccess extends doctorLayoutstates{}
class changeHypertensionError extends doctorLayoutstates{}

class changeAllergiesSuccess extends doctorLayoutstates{}
class changeAllergiesError extends doctorLayoutstates{}

class casePostImageCapturedSuccessState extends doctorLayoutstates{}
class casePostImageCapturedErrorState extends doctorLayoutstates{}


