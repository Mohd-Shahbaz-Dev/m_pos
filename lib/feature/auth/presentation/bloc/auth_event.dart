abstract class AuthEvent{}

class LoginEvent extends AuthEvent {
   String email, password ;

   LoginEvent(this.email,this.password);
}