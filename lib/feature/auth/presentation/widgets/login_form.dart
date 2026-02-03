import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_pos/core/widgets/buttons.dart';
import 'package:m_pos/core/widgets/textfield.dart';
import 'package:m_pos/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:m_pos/feature/auth/presentation/bloc/auth_event.dart';
import 'package:m_pos/feature/auth/presentation/bloc/auth_state.dart';
import 'package:m_pos/feature/auth/presentation/pages/desktop_page.dart';
import 'package:m_pos/feature/auth/presentation/widgets/reg_form.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController accemail = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController accpass = TextEditingController();
  TextEditingController cnfpass = TextEditingController();

  bool isPasswordHidden = true;
  String? confirmPasswordError;

  @override
  void initState() {
    super.initState();
    cnfpass.addListener(validateConfirmPassword);
  }

  void validateConfirmPassword() {
    setState(() {
      if (cnfpass.text.isEmpty) {
        confirmPasswordError = null;
      } else if (cnfpass.text != accpass.text) {
        confirmPasswordError = 'Passwords do not match';
      } else {
        confirmPasswordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: const Color.fromARGB(255, 206, 208, 211),
        child: Row(
          children: [
            // ---------------- text ----------------
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: const Color.fromARGB(255, 243, 241, 241),
                ),
                padding: EdgeInsets.all(100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Flutter',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Flutter helps you build beautiful, fast, and cross-platform apps from a single codebase.',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---------------- SIGN IN ----------------
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: const Color.fromARGB(255, 243, 241, 241),
                ),

                // color: const Color.fromARGB(255, 243, 241, 241),
                padding: EdgeInsets.all(100),

                child: Column(
                  children: [
                    FlutterLogo(size: 60),
                    SizedBox(height: 30),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextWidget(
                      controllerName: email,
                      hint: 'Enter Your Email',
                      labelText: 'Email',
                      prefixIcon: Icons.email,
                    ),
                    SizedBox(height: 20),
                    TextWidget(
                      controllerName: pass,
                      hint: 'Enter Your Password',
                      labelText: 'Password',
                      pass: isPasswordHidden,
                      prefixIcon: Icons.lock,
                      suffixIcon: isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onSuffixPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                    SizedBox(height: 8), 

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegForm(),
                              ),
                            );
                          },
                          child: Text('Create New Account'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 30),
                    Button(
                      title: 'Login',
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context,listen: false).add(
                          LoginEvent('gffh', '5555')
                        );
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyDesktop(),
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
