import 'package:finalcontact/data/models/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDB {
  Database? _db;

  Future<Database>? get db async {
    if (_db == null) {
      _db = await initalDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  initalDB() async {
    String databasepath = await getDatabasesPath(); //  file/images
    String path = join(databasepath, 'Mahetab.db'); // file/images/Mahetab.db
    var database = await openDatabase(path, onCreate: _onCreate, version: 1);
    return database;
  }

  _onCreate(Database db, int version) {
    db.execute(
        "CREATE TABLE contact (name STRING NOT NULL , number STRING NOT NULL, describtion STRING NOT NULL , email STRING NOT NULL, image STRING NOT NULL)");
  }

  Future<List<ContactModel>> getData() async {
    var data = await db;
    List<Map> response = await data!.rawQuery("SELECT * FROM contact");
    List<ContactModel> contantModel = [];
    for (int i = 0; i < response.length; i++) {
      contantModel.add(ContactModel(
        name: response[i]["name"],
        number: response[i]["number"].toString(),
        describtion: response[i]["describtion"],
        email: response[i]["email"],
        image: response[i]["image"],
      ));
    }
    return contantModel;
  }

  Future<ContactModel> getOneContact({String? number, int? index}) async {
    var data = await db;
    var response =
        await data!.rawQuery("SELECT * FROM contact WHERE number = '$number'");
    return ContactModel.fromJson(response[index!]);
  }

  addContact(ContactModel contactModel) async {
    var data = await db;
    var response = await data!.rawInsert(
        "INSERT INTO contact(name,number,describtion,email,image) VALUES ('${contactModel.name}','${contactModel.number}','${contactModel.describtion}','${contactModel.email}','${contactModel.image}')");
    return response;
  }

  updateContact(ContactModel contactModel, String? number) async {
    var data = await db;
    var response = await data!.rawUpdate(
        "UPDATE contact SET name ='${contactModel.name}',number ='${contactModel.number}',describtion ='${contactModel.describtion}',email ='${contactModel.email}', image ='${contactModel.image}'  WHERE number ='$number'");
    return response;
  }

  deleteContact(String? number) async {
    var data = await db;
    var response =
        await data!.rawDelete("DELETE FROM contact WHERE number = '$number'");
    return response;
  }

  deleteAllContact() async {
    var data = await db;
    var response = await data!.rawDelete("DELETE FROM contact");
    return response;
  }
}
