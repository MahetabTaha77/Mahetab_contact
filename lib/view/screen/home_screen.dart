import 'package:finalcontact/Constant/sql_db.dart';
import 'package:finalcontact/data/models/contact_model.dart';
import 'package:finalcontact/view/screen/about_screen.dart';
import 'package:finalcontact/view/screen/add_contact.dart';
import 'package:finalcontact/view/widget/header.dart';
import 'package:finalcontact/view/widget/show_contact.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SqlDB sqlDB = SqlDB();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: headerWidget(
          backColor: Colors.pink,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/fav.png',
              color: Colors.white,
            ),
          ),
          title: 'Contacts',
          action: PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: ListTile(
                            onTap: () {
                              sqlDB.deleteAllContact();
                              setState(() {});
                            },
                            leading: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            title: const Text('Delete all'))),
                    PopupMenuItem(
                        child: ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const AboutScreen()));
                            },
                            leading: const Icon(
                              Icons.info,
                              color: Color.fromARGB(255, 3, 86, 153),
                            ),
                            title: const Text('About')))
                  ],
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.more_vert),
              ))),
      body: FutureBuilder<List<ContactModel>>(
        future: sqlDB.getData(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return snapShot.data!.length != 0
                ? ListView.builder(
                    itemCount: snapShot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            showContact(
                                context: context,
                                size: size,
                                image: snapShot.data![index].image!,
                                name: snapShot.data![index].name!,
                                number: snapShot.data![index].number!,
                                email: snapShot.data![index].email!,
                                des: snapShot.data![index].describtion!,
                                deleteContact: () {
                                  Navigator.of(context).pop();
                                  sqlDB.deleteContact(
                                      snapShot.data![index].number!);
                                  setState(() {});
                                });
                          },
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage(snapShot.data![index].image!),
                          ),
                          title: Text(snapShot.data![index].name!),
                          subtitle: Text('0${snapShot.data![index].number!}'),
                          trailing: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.call,
                                      color: Color.fromARGB(255, 3, 86, 153),
                                    )),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) => AddContactScreen(
                                                  pageType: 'edit',
                                                  image: snapShot
                                                      .data![index].image!,
                                                  name: snapShot
                                                      .data![index].name!,
                                                  number: snapShot
                                                      .data![index].number!,
                                                  email: snapShot
                                                      .data![index].email!,
                                                  des: snapShot.data![index]
                                                      .describtion!)));
                                    },
                                    icon: const Icon(
                                      Icons.edit_note_rounded,
                                      color: Colors.pink,
                                      size: 35,
                                    )),
                              ],
                            ),
                          ));
                    })
                : const Center(
                    child: Text('No Data'),
                  );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (_) => AddContactScreen(
                    pageType: 'new',
                  )));
        },
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
    ));
  }
}
