import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  TextEditingController controller = TextEditingController();
  List<Talk> talks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat"), centerTitle: true),

      body:SingleChildScrollView(
        child: Column(
          children: talks,
          ),
      ),

      bottomNavigationBar: Row(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    print("clicked here");

                     String msg = controller.text;
                     print(msg);
                     controller.clear();

                    talks.add(Talk(true, msg));
                    setState(() {
                    });
                  },
                  child: Text('Send')),
            ),
          )
        ],
      ),
    );
  }
}

class Talk extends StatelessWidget {
  bool hasMe = false;
  String msg = "";

  Talk(this.hasMe,this.msg);

  @override
  Widget build(BuildContext context) {

    if(hasMe){
      return Container(
        alignment: Alignment.topRight,
        child: Card(
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Text("Akash",style: TextStyle(fontSize: 10),),
               Text(msg,style: TextStyle(color: Colors.purple),)
             ],
            ),
          ),
        ),
      );
    }else{
      return Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.topLeft,
        child: Card(
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amit",style: TextStyle(fontSize: 10),),
                Text("Fine! what about you?",style: TextStyle(color: Colors.purple),)
              ],
            ),
          ),
        ),
      );
    }
  }
}
