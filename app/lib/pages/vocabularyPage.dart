import 'package:app/models/flashcard_model.dart';
import 'package:app/pages/quiz/quizPage.dart';
import 'package:app/pages/typingPage.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/flashcardPage.dart';

// TODO: danh sách các vocab phải được truyền từ topic qua (file utils)
// TODO: appbar vocab là name của topic được chọn

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({super.key});

  @override
  State<VocabularyPage> createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage> {
  @override
  Widget build(BuildContext context) {
    var isStarred = false;

    final List<Flashcard> _flashcards = [
      Flashcard(
        englishWord: "beautiful",
        phonetic: "/ˈbjuːtɪfl/",
        wordType: "adjective",
        imageUrl:
            "https://th.bing.com/th/id/OIP.vfcvQrpunU1akdpD-BuCpgHaHa?w=179&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        vietnameseWord: "đẹp",
        meaning: "Mô tả về vẻ đẹp của một người, vật hoặc cảnh đẹp.",
      ),
      Flashcard(
        englishWord: "happy",
        phonetic: "/ˈhæpi/",
        wordType: "adjective",
        imageUrl:
            "https://th.bing.com/th/id/OIP.vfcvQrpunU1akdpD-BuCpgHaHa?w=179&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        vietnameseWord: "hạnh phúc",
        meaning: "Tâm trạng tích cực và hạnh phúc về điều gì đó.",
      ),
      Flashcard(
        englishWord: "smart",
        phonetic: "/smɑːrt/",
        wordType: "adjective",
        imageUrl:
            "https://th.bing.com/th/id/OIP.vfcvQrpunU1akdpD-BuCpgHaHa?w=179&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        vietnameseWord: "thông minh",
        meaning: "Có khả năng suy nghĩ và học hỏi nhanh chóng.",
      ),
      Flashcard(
        englishWord: "beautiful",
        phonetic: "/ˈbjuːtɪfl/",
        wordType: "adjective",
        imageUrl:
            "https://th.bing.com/th/id/OIP.vfcvQrpunU1akdpD-BuCpgHaHa?w=179&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        vietnameseWord: "đẹp",
        meaning: "Mô tả về vẻ đẹp của một người, vật hoặc cảnh đẹp.",
      ),
      Flashcard(
        englishWord: "happy",
        phonetic: "/ˈhæpi/",
        wordType: "adjective",
        imageUrl:
            "https://th.bing.com/th/id/OIP.vfcvQrpunU1akdpD-BuCpgHaHa?w=179&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        vietnameseWord: "hạnh phúc",
        meaning: "Tâm trạng tích cực và hạnh phúc về điều gì đó.",
      ),
      Flashcard(
        englishWord: "smart",
        phonetic: "/smɑːrt/",
        wordType: "adjective",
        imageUrl:
            "https://th.bing.com/th/id/OIP.vfcvQrpunU1akdpD-BuCpgHaHa?w=179&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        vietnameseWord: "thông minh",
        meaning: "Có khả năng suy nghĩ và học hỏi nhanh chóng.",
      ),
      Flashcard(
        englishWord: "beautiful",
        phonetic: "/ˈbjuːtɪfl/",
        wordType: "adjective",
        imageUrl:
            "https://th.bing.com/th/id/OIP.vfcvQrpunU1akdpD-BuCpgHaHa?w=179&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        vietnameseWord: "đẹp",
        meaning: "Mô tả về vẻ đẹp của một người, vật hoặc cảnh đẹp.",
      ),
      Flashcard(
        englishWord: "happy",
        phonetic: "/ˈhæpi/",
        wordType: "adjective",
        imageUrl:
            "https://th.bing.com/th/id/OIP.vfcvQrpunU1akdpD-BuCpgHaHa?w=179&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        vietnameseWord: "hạnh phúc",
        meaning: "Tâm trạng tích cực và hạnh phúc về điều gì đó.",
      ),
      Flashcard(
        englishWord: "smart",
        phonetic: "/smɑːrt/",
        wordType: "adjective",
        imageUrl:
            "https://th.bing.com/th/id/OIP.vfcvQrpunU1akdpD-BuCpgHaHa?w=179&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        vietnameseWord: "thông minh",
        meaning: "Có khả năng suy nghĩ và học hỏi nhanh chóng.",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Vocabularies'),
        actions: [
          IconButton(
            icon: Icon(Icons.gamepad),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('QUIZZ'),
                            onTap: () {
                              // Navigate to QuizPage for Option 1
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizPage()),
                              );
                            },
                          ),
                          ListTile(
                            title: Text('Typing'),
                            onTap: () {
                              // Navigate to QuizPage for Option 2
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Typing()),
                              );
                            },
                          ),
                          // Add more ListTile for additional options
                        ],
                      ),
                    );
                  });
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: _flashcards
              .map(
                (c) => ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_up_sharp,
                      color: Colors.purple,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    c.englishWord,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    c.phonetic,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isStarred = !isStarred;
                          });
                        },
                        icon: Icon(
                          Icons.star,
                          size: 30,
                          color: isStarred ? Colors.yellow : Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info,
                          color: Colors.orange,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  contentPadding: EdgeInsets.all(5),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => FlashCardPage()));
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
