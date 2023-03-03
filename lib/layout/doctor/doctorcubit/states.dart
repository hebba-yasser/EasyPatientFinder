abstract class doctorLayoutstates {}
 class intialstate  extends doctorLayoutstates{}
class changeBottomNavstate extends doctorLayoutstates{}

class doctorGetuserLoadingState extends doctorLayoutstates{}
class doctorGetuserSucessState extends doctorLayoutstates{}
class doctorGetuserErrorState extends doctorLayoutstates{ final String error ;
doctorGetuserErrorState(this.error);
}
