import 'package:app/models/topic_model.dart';
import 'package:app/repository/TopicRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TopicController extends GetxController {
  static TopicController get instance => Get.find();

  final name = TextEditingController();

  final topicRepo = Get.put(TopicRepository());

  // endpoint add topic
  Future<void> createTopic(Topic topic) async {
    await topicRepo.createTopic(topic);
  }

  Future<List<Topic>> getAllTopics() async {
    return await topicRepo.getAllTopic();
  }
}
