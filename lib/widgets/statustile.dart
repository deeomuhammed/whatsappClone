import 'package:flutter/material.dart';
import 'package:whatsapp/model/chatmodel.dart';

class StatusTile extends StatefulWidget {
  StatusTile({Key? key, required this.statusdata}) : super(key: key);
  Chatmodel statusdata;

  @override
  _StatusTileState createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: Column(
          children: [
            widget.statusdata.avatar == " "
                ? CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    radius: 25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.statusdata.isGroup == true
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
                      widget.statusdata.avatar,
                    ),
                    radius: 25,
                  ),
          ],
        ),
        title: Text(widget.statusdata.name),
        subtitle: Text(widget.statusdata.updatedAt),
      ),
    );
  }
}
