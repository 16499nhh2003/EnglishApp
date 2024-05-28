import 'package:app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

// entity
class Folder {
  String? id;
  final String name;
  String? iconData;
  User? author;

  Folder({required this.name, this.id, this.author, this.iconData});
}
