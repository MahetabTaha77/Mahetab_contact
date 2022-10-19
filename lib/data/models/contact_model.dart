class ContactModel {
  String? name;
  String? number;
  String? describtion;
  String? email;
  String? image;

  ContactModel(
      {this.name, this.number, this.describtion, this.email, this.image});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    ContactModel contactModel = ContactModel();
    contactModel.name = json['name'];
    contactModel.number = json['number'];
    contactModel.describtion = json['describtion'];
    contactModel.email = json['email'];
    contactModel.image = json['image'];
    return contactModel;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'number': number,
        'describtion': describtion,
        'email': email,
        'image': image
      };
}
