import 'package:cha_sa_jo_flutter/view/board/boardpage.dart';
import 'package:cha_sa_jo_flutter/view/carList.dart';
import 'package:cha_sa_jo_flutter/view/chatting/chat_screen.dart';
import 'package:cha_sa_jo_flutter/view/login/login.dart';
import 'package:cha_sa_jo_flutter/view/login/login_screen.dart';
import 'package:cha_sa_jo_flutter/view/login/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Login();
                  },
                ));
              },
              child: Text('carList'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Login();
                  },
                ));
              },
              child: Text('chart'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BoardPage();
                  },
                ));
              },
              child: Text('board'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ChatScreen();
                  },
                ));
              },
              child: Text('chatting'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ));
              },
              child: Text('login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return carList();
                  },
                ));
              },
              child: Text('sign-up'),
            ),
          ],
        ),
      ),
    );
  }
}
