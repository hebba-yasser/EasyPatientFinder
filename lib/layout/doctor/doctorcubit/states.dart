abstract class doctorLayoutstates {}
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

