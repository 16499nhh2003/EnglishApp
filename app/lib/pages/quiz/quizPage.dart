import 'package:app/controllers/question_controller.dart';
import 'package:app/pages/quiz/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    String? displayLanguage = 'Anh-Việt';

    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
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
                          Text(
                            'Custom Settings',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text('Câu hỏi và trả lời:'),
                          DropdownButton<String>(
                            value: displayLanguage,
                            onChanged: (newValue) {
                              displayLanguage = newValue;
                              if (displayLanguage == 'Anh-Việt') {
                                controller.updateQuestions(true, true);
                              } else {
                                controller.updateQuestions(false, false);
                              }
                            },
                            items: ["Anh-Việt", "Việt-Anh"]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    );
                  });
            },
          ),
        ],
      ),
      body: Body(),
    );
  }
}
