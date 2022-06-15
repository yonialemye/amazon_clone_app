import 'package:amazon_clone_app/commons/widgets/custom_button.dart';
import 'package:amazon_clone_app/commons/widgets/custom_textfield.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../commons/widgets/custom_text_button.dart';
import '../services/auth_services.dart';
import '../widgets/social_icon_button.dart';

enum TokenState { save, doNotSave }

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _singInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();

  bool isTokenSaved = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() {
    authService.loginUser(
      context: context,
      mounted: mounted,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _singInFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: Image.asset('assets/images/logo.png'),
              ),
              const Text(
                'Sign in your account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              CustomTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                errorMessage: 'email can not be empty',
              ),
              const SizedBox(height: 15),
              const Text(
                'password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
                errorMessage: 'password can not be empty',
                isPassword: true,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Switch(
                        value: isTokenSaved,
                        onChanged: (value) => setState(() => isTokenSaved = value),
                        activeColor: GlobalVariables.kSecondaryColor,
                      ),
                      const Text(
                        'Save me',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CustomTextButton(
                    onPressed: () {},
                    text: 'Forgot password?',
                    buttonColor: Colors.grey.shade600,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: "Login",
                onPressed: () {
                  if (_singInFormKey.currentState!.validate()) loginUser();
                },
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: double.maxFinite),
                  const Text(
                    'OR',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Login with',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIconButton(
                        onPressed: () {},
                        iconData: Icons.facebook,
                        iconColor: Colors.blue,
                      ),
                      const SizedBox(width: 15),
                      SocialIconButton(
                        onPressed: () {},
                        iconData: Icons.apple,
                        iconColor: Colors.black,
                      ),
                      const SizedBox(width: 15),
                      SocialIconButton(
                        onPressed: () {},
                        iconData: Icons.bedroom_baby,
                        iconColor: Colors.teal,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account yet?"),
                  CustomTextButton(
                    text: 'REGISTER',
                    onPressed: () {},
                    buttonColor: GlobalVariables.kSecondaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
