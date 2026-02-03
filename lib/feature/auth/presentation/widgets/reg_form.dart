import 'package:flutter/material.dart';
import 'package:m_pos/core/widgets/buttons.dart';
import 'package:m_pos/core/widgets/textfield.dart';

class RegForm extends StatefulWidget {
  const RegForm({super.key});

  @override
  State<RegForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
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
      body: Center(
        child: SizedBox(
          width: 500,
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 243, 241, 241),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FlutterLogo(size: 60),
                const SizedBox(height: 30),
                const Text(
                  'Create New Account',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                TextWidget(
                  controllerName: accemail,
                  hint: 'Enter Your Email',
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 20),

                TextWidget(
                  controllerName: accpass,
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
                const SizedBox(height: 20),

                TextWidget(
                  controllerName: cnfpass,
                  hint: 'Confirm Your Password',
                  labelText: 'Confirm Password',
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
                  errorText: confirmPasswordError,
                ),
                const SizedBox(height: 40),

                Button(
                  title: 'Create Account',
                  onPressed: () {
                    print('Create Account');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
