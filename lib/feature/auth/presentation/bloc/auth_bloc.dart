import 'package:m_pos/feature/auth/presentation/bloc/auth_event.dart';
import 'package:m_pos/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{

  AuthBloc():super(AuthInitailState()){
    on<LoginEvent>((event, emit) async {
      emit(AuthLodingState());
      await Future.delayed(Duration(seconds: 3));
      String email = event.email;
      String password = event.password;

      if(email == 'shah@gmail.com' && password == '123'){
        emit(AuthSuccessState());
      } else {
        emit(AuthFailureState('Invalid E-Mail OR Password'));
      }

    });
  }
}

