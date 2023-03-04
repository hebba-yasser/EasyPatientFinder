abstract class doctorLayoutstates {}
 class intialstate  extends doctorLayoutstates{}
class changeBottomNavstate extends doctorLayoutstates{}

class doctorGetuserLoadingState extends doctorLayoutstates{}
class doctorGetuserSucessState extends doctorLayoutstates{}
class doctorGetuserErrorState extends doctorLayoutstates{ final String error ;
doctorGetuserErrorState(this.error);
}
//post a case
class doctorNewPostLoadingState extends doctorLayoutstates{}
class doctorNewPostSucessState extends doctorLayoutstates{}
class doctorNewPostErrorState extends doctorLayoutstates{ final String error ;
doctorNewPostErrorState(this.error);
}
