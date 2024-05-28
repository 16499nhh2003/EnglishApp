import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String aboutMeDescription;

  const User({
    this.id,
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.aboutMeDescription,
  });

  User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        image: json['imagePath'],
        name: json['name'],
        email: json['email'],
        aboutMeDescription: json['about'],
        phone: json['phone'],
      );

  toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'imagePath': image,
        'about': aboutMeDescription,
      };

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> firestore) {
    final data = firestore.data()!;
    return User(
        id: firestore.id,
        image: data["image"],
        name: data["name"],
        email: data["email"],
        phone: data["phone"],
        aboutMeDescription: data["aboutMeDescription"]);
  }

  User copy({
    String? imagePath,
    String? name,
    String? phone,
    String? email,
    String? about,
  }) =>
      User(
        id: this.id,
        image: imagePath ?? this.image,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        aboutMeDescription: about ?? this.aboutMeDescription,
      );
}
