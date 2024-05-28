import 'dart:math';

import 'package:app/controllers/topicController.dart';
import 'package:app/pages/vocabularyPage.dart';
import 'package:flutter/material.dart';
import 'package:app/models/folder_model.dart'; // Import folder model
import 'package:app/models/topic_model.dart';
import 'package:get/get.dart'; // Import topic model

class TopicListPage extends StatefulWidget {
  final Folder folder;
  TopicListPage({required this.folder});
  @override
  State<TopicListPage> createState() => _TopicListPageState();
}

class _TopicListPageState extends State<TopicListPage> {
  // List<Topic> topics = getTopicsForFolder(folder);
  List<Topic> topics = [];
  final controller = Get.put( TopicController());
  // late TextEditingController _topicController;

  final _formKey = GlobalKey<FormState>();
  late FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _topicController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _topicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(TopicController());

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.folder.name),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future:  controller.topicRepo.getAllTopic(),
            builder: (context , snapshot) {
              if (snapshot.connectionState == ConnectionState.done){
                if (snapshot.hasData){
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final random = Random();
                      final percentage = random.nextInt(101);
                      return Row(
                        children: [
                          // Sequential number
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VocabularyPage()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 230, 228, 228)),
                                padding:
                                EdgeInsets.only(top: 10.0, right: 10, bottom: 10),
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .red, // Background color for the rectangle
                                            borderRadius: BorderRadius.circular(
                                                5), // Border radius of the rectangle
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3,
                                              horizontal:
                                              25), // Padding for the rectangle

                                          child: Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          topics[index].name ?? 'test',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        // Text(
                                        //   topics[index].name,
                                        //   style: const TextStyle(
                                        //     fontSize: 18,
                                        //     fontWeight: FontWeight.bold,
                                        //   ),
                                        //   textAlign: TextAlign.center,
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 150,
                                    ), // Add spacing between topic content and circle
                                    // Circle showing percentage
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green, // Change color as needed
                                      ),
                                      child: Center(
                                        child: Text(
                                          '$percentage%', // Display percentage here
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }, itemCount: topics.length,
                  );
                }
                else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()));
                }
                else{
                  return const Center(child: CircularProgressIndicator());
                }
              }

              else{
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Thêm topic'),
                  content: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Focus(
                            child: TextFormField(
                              focusNode: _focusNode,
                              controller: controller.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng không được để trống';
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Hủy bỏ'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // thêm một topic vào danh sách
                          setState(() {
                            // topics.add(Topic(
                            //   name: _topicController.text,
                            //   iconData: Icons.school.toString(),
                            //   folder: Folder(
                            //       name: "Basic English",
                            //       iconData: Icons.school.toString()),
                            //   ispublic: true,
                            // ));

                            final topic =  Topic(
                              name: controller.name.text.trim(),
                              numberOfWord:  0 ,
                              ispublic: false,
                              iconData: "123",
                            );
                            TopicController.instance.createTopic(topic);
                            // clear input
                            // _topicController.clear();
                            _focusNode.requestFocus();
                          });

                          // Show snackbar alert them thanh cong
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Đã thêm topic thành công'),
                            ),
                          );
                        }
                      },
                      child: Text('Thêm'),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
