import 'package:challenge/viewmodels/login_page_viewmodel.dart';
import 'package:challenge/views/main_page.dart';
import 'package:challenge/views/theme/colorsPalette.dart';
import 'package:challenge/views/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder(
            init: loginController,
            builder: (controller) => Column(
              children: [
                const PageTitle(),
                Divider(
                  color: dividerColor,
                  endIndent: 10,
                  indent: 10,
                  thickness: 2,
                ),
                UserNameTextField(loginController: loginController),
                PasswordTextField(loginController: loginController),
                LoginButton(loginController: loginController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Text(
        "Challenge app",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 250),
      child: ElevatedButton(
        onPressed: () async {
          bool result = await loginController.registerUser();

          if (result == false) {
            showSnackbar(
              "invalid combination of username and password!",
              color: errorColor,
            );
          } else {
            Get.to(const Mainpage());
          }
        },
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(primaryColor),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          fixedSize: MaterialStateProperty.all(
            const Size(250, 50),
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: "Password",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onChanged: (value) {
          loginController.setPassword(value);
        },
      ),
    );
  }
}

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: TextField(
        decoration: const InputDecoration(
          hintText: "UserName",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onChanged: (value) {
          loginController.setUserName(value);
        },
      ),
    );
  }
}
