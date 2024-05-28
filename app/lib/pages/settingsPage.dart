//  Em xin phép update trang settings mới
// import 'package:app/main.dart';
// import 'package:app/pages/changePasswordPage.dart';
// import 'package:app/pages/forgotPasswordPage.dart';
// import 'package:app/widgets/ViewProfile.dart';
// import 'package:flutter/material.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//       body: ListView(
//         children: <Widget>[
//           ListTile(
//             leading: Icon(Icons.lock),
//             title: Text('Change password'),
//             onTap: () {
//               // Add navigation to change password page here
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ChangePasswordPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text('View Profile'),
//             onTap: () {
//               // Add navigation to view profile page here
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ViewProfilePage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.lock_clock),
//             title: Text('Forgot Password'),
//             onTap: () {
//               // Add navigation to view profile page here
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ForgotPassword()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
