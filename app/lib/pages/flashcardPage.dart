import 'package:app/models/flashcard_model.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashCardPage extends StatefulWidget {
  const FlashCardPage({Key? key}) : super(key: key);

  @override
  State<FlashCardPage> createState() => _FlashCardPageState();
}

class _FlashCardPageState extends State<FlashCardPage> {
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
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(2), // Chiều cao mong muốn của thanh tiến trình
          child: LinearProgressIndicator(
            value: 0.8, // Giá trị của tiến trình (từ 0 đến 1)
            backgroundColor: Colors.grey[300], // Màu nền của thanh tiến trình
            valueColor: AlwaysStoppedAnimation<Color>(
                Colors.red), // Màu của thanh tiến trình
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.auto_awesome),
                  title: Text("Chế độ tự động"),
                ),
                value: "Chế độ tự động",
                onTap: () {
                  // TODO: Xử lý khi người dùng chọn chế độ tự động
                },
              ),

              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.shuffle),
                  title: Text("Trộn thứ tự từ"),
                ),
                value: "Trộn thứ tự từ",
                onTap: () {
                  // TODO: Xử lý khi người dùng chọn trộn thứ tự từ
                },
              ),

              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.volume_up_rounded),
                  title: Text("Tự động phát âm thanh"),
                ),
                value: "Tự động phát âm thanh",
                onTap: () {
                  // TODO: Xử lý khi người dùng chọn tự động phát âm thanh
                },
              ),
            ],
            // Khi người dùng select 1 option bất kỳ trên PopupMenu
            onSelected: (option) {
              print('Người dùng đã chọn: $option');
            }, 
            icon: Icon(Icons.settings_outlined), // Icon đại diện cho PopupMenu
          )
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/transient.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 350,
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${_flashcards[_currentIndex].englishWord}(${_flashcards[_currentIndex].wordType})",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _flashcards[_currentIndex].phonetic,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.volume_up),
                              onPressed: () {
                                // Xử lý sự kiện khi người dùng nhấn vào biểu tượng loa
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Image.network(
                          _flashcards[_currentIndex].imageUrl,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  back: _buildBackOfCard(_flashcards[_currentIndex]),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: showPreviousCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev'),
                  ),
                  ElevatedButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackOfCard(Flashcard flashcard) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tiếng Anh: ${flashcard.englishWord}',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Phát âm: ${flashcard.phonetic}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Dạng từ: ${flashcard.wordType}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Giải thích: ${flashcard.meaning}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _flashcards.length;
    });
  }
}
