import 'package:flutter/material.dart';

import 'Chat.dart';
import 'constant.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {

    print(Constant.friends.length);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Messages",
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: Constant.friends.length,
          itemBuilder: (BuildContext context, int index) {
            return FriendItem(Constant.friends[index]);
          },
        ));
  }
}

class FriendItem extends StatelessWidget {


  String fname = "";

  FriendItem(this.fname);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: (){
          print("friend clicked");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Chat()));
    },
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text("$fname"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
