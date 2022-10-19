import 'package:flutter/material.dart';

import '../screen/add_contact.dart';

showContact(
    {dynamic size,
    required BuildContext context,
    String? image,
    String? name,
    String? number,
    String? email,
    String? des,
    Function()? deleteContact}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => AddContactScreen(
                                pageType: 'edit',
                                image: image!,
                                name: name!,
                                number: number!,
                                email: email!,
                                des: des!)));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 3, 86, 153),
                      )),
                  IconButton(
                      onPressed: deleteContact,
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 3, 86, 153),
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.cancel, color: Colors.pink))
                ],
              ),
              Image.asset(
                image!,
                height: size.height * 0.2,
                fit: BoxFit.fill,
              ),
              Center(
                  child: Text(
                name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(height: size.height * 0.01),
              ListTile(
                leading: const Icon(
                  Icons.call,
                  color: Colors.pink,
                ),
                title: Text(
                  '0$number',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.email,
                  color: Colors.pink,
                ),
                title: Text(
                  email!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.description,
                  color: Colors.pink,
                ),
                title: Text(
                  des!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox(height: size.height * 0.02),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              //     onPressed: () {},
              //     child: const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              //       child: Text(
              //         'Edit',
              //         style: TextStyle(fontSize: 20),
              //       ),
              //     ))
            ],
          ),
        );
      });
}
