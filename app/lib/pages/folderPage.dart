import 'package:app/models/folder_model.dart';
import 'package:app/pages/topicPage.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/folder_utils.dart';
import 'dart:math';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode _focusNode;
  late TextEditingController _folderController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _folderController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _folderController.dispose();
    super.dispose();
  }

  Widget _itemBuilder(context, index) {
    final random = Random();
    final color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: color,
      child: InkWell(
        onTap: () {
          // Handle folder tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TopicListPage(folder: folders[index]),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.folder,
                size: 50,
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              Text(
                folders[index].name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: _itemBuilder,
          itemCount: folders.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Thêm folder'),
                content: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Focus(
                          child: TextFormField(
                            focusNode: _focusNode,
                            controller: _folderController,
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
                        // thêm một folder vào danh sách
                        setState(() {
                          folders.add(Folder(
                            name: _folderController.text,
                            iconData: Icons.folder.toString(),
                          ));

                          // clear input
                          _folderController.clear();
                          _focusNode.requestFocus();
                        });

                        // Show snackbar alert them thanh cong
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Đã thêm folder thành công'),
                          ),
                        );
                      }
                    },
                    child: Text('Thêm'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
