import 'package:finalcontact/view/widget/header.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: headerWidget(
          backColor: Colors.pink,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: 'About Me',
          action: Container()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  "https://mahitabdeveloper.com/wp-content/uploads/2022/04/1616967303769-300x300.jpg"),
            ),
            const SizedBox(height: 40),
            const Text(
              "Mahitab Taha Mahmoud",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "A Web developer trained incompatible design and Development of deferent templates, and then do projects with experience in e-commerce page projects. Using WordPress, seeking to leverage my design skills and back-end knowledge based on PHP & MYSQL to help the company implement creative ideas for web pages.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              onPressed: () {},
              child: const Text('Conatct Me',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            )
          ],
        ),
      ),
    ));
  }
}
