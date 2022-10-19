import 'package:flutter/material.dart';

selectImage(
    {required BuildContext context,
    Function()? firstTap,
    Function()? secondTap,
    Function()? thirdTap}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('Select Images')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: firstTap,
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/img1.png'),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: secondTap,
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/img2.png'),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: thirdTap,
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/img3.jpg'),
                ),
              )
            ],
          ),
        );
      });
}
