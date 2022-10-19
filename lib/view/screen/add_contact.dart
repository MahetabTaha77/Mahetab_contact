// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:finalcontact/Constant/sql_db.dart';
import 'package:finalcontact/data/models/contact_model.dart';
import 'package:finalcontact/view/screen/home_screen.dart';
import 'package:finalcontact/view/widget/custom_textField.dart';
import 'package:finalcontact/view/widget/header.dart';
import 'package:finalcontact/view/widget/select_image.dart';

import 'about_screen.dart';

class AddContactScreen extends StatefulWidget {
  String? pageType;
  String? name;
  String? number;
  String? des;
  String? email;
  String? image;
  AddContactScreen({
    Key? key,
    this.pageType,
    this.name,
    this.number,
    this.des,
    this.email,
    this.image,
  }) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  SqlDB sqlDB = SqlDB();
  String image = 'assets/images/img1.png';
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.pageType == 'edit') {
      nameController.text = widget.name!;
      numberController.text = '0${widget.number!}';
      desController.text = widget.des!;
      emailController.text = widget.email!;
      image = widget.image!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: headerWidget(
            backColor: Colors.pink,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                )),
            title:
                widget.pageType == 'new' ? 'Add New Contact' : 'Edit Contact',
            action: PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                          child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const AboutScreen()));
                              },
                              child: const Text('About')))
                    ],
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.more_vert),
                ))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 35),
                InkWell(
                  onTap: () {
                    selectImage(
                        context: context,
                        firstTap: () {
                          setState(() {
                            image = 'assets/images/img1.png';
                          });
                          Navigator.of(context).pop();
                        },
                        secondTap: () {
                          setState(() {
                            image = 'assets/images/img2.png';
                          });
                          Navigator.of(context).pop();
                        },
                        thirdTap: () {
                          setState(() {
                            image = 'assets/images/img3.jpg';
                          });
                          Navigator.of(context).pop();
                        });
                  },
                  child: Center(
                    child: CircleAvatar(
                      radius: 59,
                      backgroundColor: Colors.pink,
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                customTextField(
                    icon: Icons.person,
                    hintText: 'Type your name',
                    controller: nameController),
                const SizedBox(height: 30),
                customTextField(
                    icon: Icons.phone,
                    hintText: 'Type your number',
                    controller: numberController),
                const SizedBox(height: 30),
                customTextField(
                    icon: Icons.description,
                    hintText: 'Typer your description',
                    controller: desController),
                const SizedBox(height: 30),
                customTextField(
                    icon: Icons.email,
                    hintText: 'Type your email',
                    controller: emailController),
                const SizedBox(height: 45),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    onPressed: widget.pageType == 'new'
                        ? () {
                            var model = ContactModel(
                                name: nameController.text,
                                describtion: desController.text,
                                number: numberController.text.toString(),
                                email: emailController.text,
                                image: image);
                            sqlDB.addContact(model);
                            nameController.clear();
                            numberController.clear();
                            desController.clear();
                            emailController.clear();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const HomeScreen()));
                          }
                        : () {
                            var model = ContactModel(
                                name: nameController.text,
                                describtion: desController.text,
                                number: numberController.text.toString(),
                                email: emailController.text,
                                image: image);
                            sqlDB.updateContact(model, widget.number);
                            nameController.clear();
                            numberController.clear();
                            desController.clear();
                            emailController.clear();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const HomeScreen()));
                          },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Text(
                        widget.pageType == 'new' ? 'Save' : 'Done',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
