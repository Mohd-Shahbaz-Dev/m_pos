abstract class AuthState{}

class AuthInitailState extends AuthState{}

class AuthLodingState extends AuthState{}

class AuthSuccessState extends AuthState{}

class AuthFailureState extends AuthState{
  String msg;

   AuthFailureState(this.msg);
}
