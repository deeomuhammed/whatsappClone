import 'package:flutter/material.dart';
import 'package:whatsapp/model/chatmodel.dart';

class CallsTile extends StatefulWidget {
  CallsTile({Key? key, required this.callsdata}) : super(key: key);
  Chatmodel callsdata;

  @override
  _CallsTileState createState() => _CallsTileState();
}

class _CallsTileState extends State<CallsTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        title: Text(widget.callsdata.name),
        subtitle: Row(
          children: [
            widget.callsdata.isGroup == true
                ? const Icon(
                    Icons.call_made,
                    color: Colors.green,
                    size: 15,
                  )
                : const Icon(
                    Icons.call_received_rounded,
                    color: Colors.red,
                    size: 15,
                  ),
            const SizedBox(width: 5),
            Text(widget.callsdata.updatedAt),
          ],
        ),
        leading: Column(
          children: [
            widget.callsdata.avatar == " "
                ? CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    radius: 25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.callsdata.isGroup == true
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
                      widget.callsdata.avatar,
                    ),
                    radius: 25,
                  ),
          ],
        ),
        trailing: Icon(
          Icons.call,
          color: Colors.teal[500],
        ),
      ),
    );
  }
}
