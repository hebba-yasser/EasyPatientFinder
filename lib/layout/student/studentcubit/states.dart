abstract class studentLayoutstates {}
 class studentIntialstate  extends studentLayoutstates{}
class studentChangeBottomNavstate extends studentLayoutstates{}

class studentGetuserLoadingState extends studentLayoutstates{}
class studentGetuserSucessState extends studentLayoutstates{}
class studentGetuserErrorState extends studentLayoutstates{
 final String error ;
studentGetuserErrorState(this.error);
}