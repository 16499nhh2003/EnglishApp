import 'package:app/models/topic_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicRepository extends GetxController {
  static TopicRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createTopic(Topic topic)  async {
    await _db
        .collection("topic")
        .add(topic.toJson())
        .whenComplete(() => Get.snackbar(
              "Success",
              "Your account has been created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,
            ))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try Again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  getAllTopic() async {
    final snapshot = await _db.collection("topic").get();
    final topicData = snapshot.docs.map(Topic.fromSnapshot).toList();
    return topicData;
  }
}
