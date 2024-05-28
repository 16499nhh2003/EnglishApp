import 'package:flutter/material.dart';

// not entity
class Flashcard {
  final String englishWord;
  final String wordType;
  final String phonetic;
  final String imageUrl;
  final String vietnameseWord;
  final String meaning;
  Flashcard(
      {required this.englishWord,
      required this.wordType,
      required this.phonetic,
      required this.imageUrl,
      required this.vietnameseWord,
      required this.meaning});
}
