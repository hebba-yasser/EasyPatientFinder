abstract class supervisorLayoutstates {}
 class intialstate  extends supervisorLayoutstates{}
class changeBottomNavstate extends supervisorLayoutstates{}

class supervisorGetuserLoadingState extends supervisorLayoutstates{}
class supervisorGetuserSucessState extends supervisorLayoutstates{}
class supervisorGetuserErrorState extends supervisorLayoutstates{
 final String error ;
 supervisorGetuserErrorState(this.error);
}
