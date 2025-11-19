// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:chatwoot/Utils/utils.dart';
import 'package:chatwoot/Views/home_page.dart';
import 'package:chatwoot/Widgets/reusable/round_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(fontSize: 35),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: "Email Address",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email Address';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.password)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
              title: 'Login',
              loading: loading,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // logIn(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void logIn(BuildContext context) async {
    setState(() {
      loading = true;
    });

    final body = jsonEncode({
      "grant_type": "password",
      "client_id": 13,
      "client_secret": "JSU17vXGJduOCmbOErHhyYIgKpFTx5ybsNHXUuQx",
      "username": "oasisoutfit",
      "password": "11234456"
    });

    try {
      Response response =
          await post(Uri.parse("https://retail.ziiziiisland.com/oauth/token"),
              headers: {
                'Content-Type': 'application/json',
                'Accept': '*/*',
              },
              body: body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        final prefs = await SharedPreferences.getInstance();
        prefs.setString("email", emailController.text.toString());
        prefs.setString("token", data['access_token']);
        prefs.setBool("isLoggedIn", true);

        Utils().toastMessage("success");

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }

      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage(e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
