import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/model/chatmessagemodel.dart';
import 'package:whatsapp/model/chatmodel.dart';
import 'package:whatsapp/widgets/attachmenu.dart';
import 'package:whatsapp/widgets/chatbubble.dart';

class Details extends StatefulWidget {
  Details({Key? key, required this.name}) : super(key: key);
  final Chatmodel name;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Messagemodel> chatbubblelist = [
    Messagemodel(
        isSend: true,
        isReaded: true,
        message:
            'helloewwrrfdsfjfjfgndgdkgdgkdngdgngdjndjdkjdhgguergureggjbdfdb ',
        sendAt: '11:00 PM'),
    Messagemodel(
        isSend: false, isReaded: true, message: 'hi', sendAt: '02:00 PM'),
    Messagemodel(
        isSend: true, isReaded: false, message: 'how r u ', sendAt: '01:00AM'),
    Messagemodel(
        isSend: false, isReaded: false, message: 'fine', sendAt: '10:00 AM'),
  ];

  TextEditingController messageController = TextEditingController();

  FocusNode focusNode = FocusNode();

  bool showSend = false;

  bool showEmoji = false;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      } else {
        print('sss');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('asset/IMAGES/wall.jpeg'),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return SingleChat(chatbubble: chatbubblelist[index]);
            },
            itemCount: chatbubblelist.length,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              if (value.length > 0) {
                                setState(() {
                                  showSend = true;
                                });
                              } else {
                                setState(() {
                                  showSend = false;
                                });
                              }
                            },
                            controller: messageController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  icon: Icon(showEmoji == true
                                      ? Icons.keyboard
                                      : Icons.emoji_emotions),
                                  onPressed: () {
                                    if (focusNode.hasFocus) {
                                      focusNode.unfocus();
                                    }

                                    setState(() {
                                      showEmoji = !showEmoji;
                                    });
                                  },
                                ),
                                hintText: 'type a messege',
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.attach_file),
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (builder) {
                                                return Menu();
                                              });
                                        }),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.camera_alt),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                )),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        child: Icon(
                          showSend == true ? Icons.send : Icons.mic,
                          color: Colors.white,
                        ),
                        radius: 25,
                        backgroundColor: Colors.teal[500],
                      ),
                    )
                  ],
                ),
                showEmoji == true ? selectEmoji() : Container()
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name.name),
            Row(
              children: [
                Text(
                  "Last seen ${widget.name.updatedAt}",
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              const Icon(Icons.videocam),
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.call),
              const SizedBox(
                width: 0,
              ),
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        child: Text(widget.name.isGroup == false
                            ? 'View contact'
                            : 'Group info')),
                    PopupMenuItem(
                        child: Text(widget.name.isGroup == false
                            ? 'Media,links and docs'
                            : 'Group media')),
                    PopupMenuItem(child: Text('Search')),
                    PopupMenuItem(child: Text('Mute notifiacation')),
                    PopupMenuItem(child: Text('Wallpaper')),
                    PopupMenuItem(child: Text('More'))
                  ];
                },
              ),
            ],
          )
        ],
        backgroundColor: Colors.teal[800],
        leadingWidth: 90,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back)),
              const SizedBox(width: 8),
              widget.name.avatar == " "
                  ? CircleAvatar(
                      child: Icon(
                        widget.name.isGroup == true
                            ? Icons.group
                            : Icons.person,
                        color: Colors.white,
                      ),
                      radius: 20,
                      backgroundColor: Colors.grey[400],
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(widget.name.avatar),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        messageController.text = '${messageController.text}${emoji.emoji}';
        if (messageController.text.length > 0) {
          setState(() {
            showSend = true;
          });
        } else {
          setState(() {
            showSend = false;
          });
        }
      },
    );
  }
}
