import 'package:amazon_clone_app/features/auth/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../commons/widgets/custom_button.dart';
import '../../../commons/widgets/custom_text_button.dart';
import '../../../commons/widgets/custom_textfield.dart';
import '../../../constants/global_variables.dart';
import '../services/auth_services.dart';
import '../widgets/social_icon_button.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormState> _singUpFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();

  bool isTokenSaved = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();

    super.dispose();
  }

  void registerUser() {
    authService.registerUser(
      context: context,
      name: _nameController.text,
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _singUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    const Text(
                      'Sign up your account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Enter your name',
                      errorMessage: 'name can not be empty',
                    ),
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 10),
                    CustomButton(
                      text: "Register",
                      onPressed: () {
                        if (_singUpFormKey.currentState!.validate()) registerUser();
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
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              CustomTextButton(
                text: 'Login',
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    SigninScreen.routeName,
                    (route) => false,
                  );
                },
                buttonColor: GlobalVariables.kSecondaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
