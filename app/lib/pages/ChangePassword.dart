import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Current Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Change Password"),
              ),
            ),
            SizedBox(height: 16.0),
            FutureBuilder<Uint8List>(
              future: _loadGif(), // Future để load ảnh GIF
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Image.memory(snapshot.data!); // Hiển thị ảnh GIF
                  } else {
                    return Text('Error loading GIF');
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> _loadGif() async {
    // Load ảnh GIF từ asset bằng rootBundle
    final ByteData data = await rootBundle.load('assets/forget-password.gif');
    return data.buffer.asUint8List();
  }
}
