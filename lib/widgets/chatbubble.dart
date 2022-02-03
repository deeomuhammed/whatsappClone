import 'package:flutter/material.dart';
import 'package:whatsapp/model/chatmessagemodel.dart';

class SingleChat extends StatelessWidget {
  Messagemodel chatbubble;
  SingleChat({Key? key, required this.chatbubble}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chatbubble.isSend == true
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 110,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Text(chatbubble.sendAt),
                      Icon(
                        chatbubble.isSend == true ? Icons.done_all : null,
                        color: chatbubble.isReaded == true
                            ? Colors.blue
                            : Colors.grey,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 30, 20),
                  child: Text(
                    chatbubble.message,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
