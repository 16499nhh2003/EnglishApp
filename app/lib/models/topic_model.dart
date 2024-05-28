import 'dart:html';

import 'package:app/models/folder_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// entity
class Topic {
  final String? uid;
  final String name;
  final String? iconData;
  final int? numberOfWord;
  final bool ispublic;
  final Folder? folder;

  Topic(
      {this.uid,
      required this.name,
       this.iconData,
       this.folder,
      required this.ispublic,
      this.numberOfWord});

   toJson() {
     return {
       "name"  : name ,
       "folder"  : folder,
       "iconData"  : iconData ,
       "ispublic"  : ispublic ,
     };
   }

   factory Topic.fromSnapshot(DocumentSnapshot<Map<String , dynamic>> document ){
     final data = document.data()!;
     return Topic(
       uid: document.id ,
       name:  data["name"],
       ispublic:  data["ispublic"] ,
       folder: data["folder"],
       numberOfWord: data["numberOfWord"]
     );
  }
}


