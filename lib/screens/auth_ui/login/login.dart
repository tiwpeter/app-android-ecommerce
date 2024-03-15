import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizeBox(
            height: kToolbarHeight + 12,
          ),
          const Text("Welcome"),
          const SizedBox(
            height: 12,
          ),
          const Text("Buy now"),
          Center(
              child: Image.asset(
            Image.assetAssetImage.instance.welcomeImage,
          )),
        ],
      ),
    ));
  }
}
