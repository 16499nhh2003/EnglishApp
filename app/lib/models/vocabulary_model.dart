import 'topic_model.dart';

class Vocabulary {
  final int id;
  final String englishWord;
  final String vietnameseWord;
  String? desc;
  String? imageUrl;
  final Topic topic;

  Vocabulary({
    required this.id,
    required this.englishWord,
    required this.vietnameseWord,
    required this.topic,
    this.desc,
    this.imageUrl,
  });
}
