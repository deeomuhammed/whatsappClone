import 'package:flutter/material.dart';
import 'package:whatsapp/model/chatmodel.dart';
import 'package:whatsapp/pages/chatdetails.dart';

// ignore: must_be_immutable
class ChatTile extends StatefulWidget {
  ChatTile({Key? key, required this.chatdata}) : super(key: key);
  Chatmodel chatdata;
  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(
            name: widget.chatdata,
          ),
        ),
      ),
      child: ListTile(
        trailing: Text(
          widget.chatdata.updatedAt,
          style: TextStyle(color: Colors.teal[500]),
        ),
        title: Text(widget.chatdata.name),
        subtitle: Row(
          children: [
            Icon(
              widget.chatdata.isGroup == true ? Icons.done : Icons.done_all,
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(widget.chatdata.message),
          ],
        ),
        leading: Column(
          children: [
            widget.chatdata.avatar == " "
                ? CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    radius: 25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.chatdata.isGroup == true
                            ? const Icon(
                                Icons.group,
                                color: Colors.white,
                                size: 30,
                              )
                            : const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30,
                              ),
                      ],
                    ))
                : CircleAvatar(
                    backgroundColor: Colors.green[400],
                    backgroundImage: NetworkImage(
                      widget.chatdata.avatar,
                    ),
                    radius: 25,
                  ),
          ],
        ),
      ),
    );
  }
}
