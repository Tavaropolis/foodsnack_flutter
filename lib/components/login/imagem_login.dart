import 'package:flutter/material.dart';

class ImagemLogin extends StatelessWidget {
  const ImagemLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 0.40 * MediaQuery.of(context).size.width ,
          height:  0.27 * MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(15)))),
    );
  }
}