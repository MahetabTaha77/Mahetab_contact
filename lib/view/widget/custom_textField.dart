import 'dart:ffi';

import 'package:flutter/material.dart';

customTextField(
    {IconData? icon, String? hintText, TextEditingController? controller}) {
  return Row(
    children: [
      Icon(
        icon,
        size: 25,
        color: Colors.pink,
      ),
      const SizedBox(width: 10),
      Expanded(
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              hintText: hintText,
            )),
      ),
    ],
  );
}
