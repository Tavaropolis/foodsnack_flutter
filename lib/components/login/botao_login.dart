import 'package:flutter/material.dart';

//Pages
import '../../pages/page_view_demo.dart';

class BotaoLogin extends StatelessWidget {
  const BotaoLogin({
    super.key,
    required this.isActiveUser,
    required this.isActivePassword,
  });

  final String isActiveUser;
  final String isActivePassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
              onPressed: 
              isActiveUser.isNotEmpty && isActivePassword.isNotEmpty? 
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageViewDemo(),
                  ),
                );
              } : null,
              child: const Text("Login"))),
    );
  }
}