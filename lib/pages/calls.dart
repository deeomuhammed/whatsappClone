import 'package:flutter/material.dart';
import 'package:whatsapp/model/chatmodel.dart';
import 'package:whatsapp/widgets/callstile.dart';

// ignore: camel_case_types
class calls extends StatefulWidget {
  const calls({Key? key}) : super(key: key);

  @override
  _callsState createState() => _callsState();
}

// ignore: camel_case_types
class _callsState extends State<calls> {
  List<Chatmodel> callsDetails = [
    Chatmodel(
      avatar:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPUGPu02KVECbV36wTxsxeAGilDDrbLJOuzCYQCGsmJsgznG7lyyrrGaOQ3E0qY-4MrAg&usqp=CAU",
      name: 'Mammootty New number',
      isGroup: false,
      updatedAt: '10:00 PM',
      message: 'hello ',
    ),
    Chatmodel(
      avatar: " ",
      name: 'Mohanlal',
      isGroup: false,
      updatedAt: '9:08 PM',
      message: 'hello',
    ),
    Chatmodel(
      avatar: " ",
      name: 'Flutter babte',
      isGroup: true,
      updatedAt: '8:10 PM',
      message: 'work ',
    ),
    Chatmodel(
      avatar:
          "https://scontent.fccj2-2.fna.fbcdn.net/v/t1.18169-9/13882126_103129963466906_6210432490885277440_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=XDaFIUeVPm4AX_euvoU&_nc_ht=scontent.fccj2-2.fna&oh=00_AT82tX_0aaX0zKz8NhmaQeCcF4BOSp-k7168ePnLjqMaxw&oe=62072E04",
      name: 'fayis kodu',
      isGroup: false,
      updatedAt: '5:00 AM',
      message: 'Good morning ',
    ),
    Chatmodel(
      avatar:
          "https://scontent.fccj2-2.fna.fbcdn.net/v/t31.18172-8/19402186_394815710919869_7628684913597954237_o.jpg?_nc_cat=111&ccb=1-5&_nc_sid=e3f864&_nc_ohc=YwXxNY4iVrsAX9q8mld&_nc_ht=scontent.fccj2-2.fna&oh=00_AT_SZ27andDFYQiZYbl1TDRz1PYAQljx7GVmOga8-04ykQ&oe=6206A830https://scontent.fccj2-2.fna.fbcdn.net/v/t31.18172-8/19402186_394815710919869_7628684913597954237_o.jpg?_nc_cat=111&ccb=1-5&_nc_sid=e3f864&_nc_ohc=YwXxNY4iVrsAX9q8mld&_nc_ht=scontent.fccj2-2.fna&oh=00_AT_SZ27andDFYQiZYbl1TDRz1PYAQljx7GVmOga8-04ykQ&oe=6206A830",
      name: 'Mishab',
      isGroup: false,
      updatedAt: '9:00 PM',
      message: 'kooi',
    ),
    Chatmodel(
      avatar:
          "https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/10/dulquer-salmaan-flaunts-his-bearded-look-0001.jpg",
      name: 'Dulqer',
      isGroup: true,
      updatedAt: '5:40 PM',
      message: 'haai ',
    ),
    Chatmodel(
      avatar:
          "https://images.newindianexpress.com/uploads/user/imagelibrary/2021/10/30/w900X450/superhero.JPG?w=400&dpr=2.6",
      name: 'Tovi',
      isGroup: true,
      updatedAt: '7:10 PM',
      message: 'work ',
    ),
    Chatmodel(
      avatar: "https://static.toiimg.com/photo/88749915.cms",
      name: 'antony ',
      isGroup: false,
      updatedAt: '9:00 PM',
      message: 'hai ',
    ),
    Chatmodel(
      avatar:
          "https://static.toiimg.com/thumb/msid-77629244,width-1200,height-900,resizemode-4/.jpg",
      name: 'asif',
      isGroup: false,
      updatedAt: '10:01 AM',
      message: 'hai ',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal[500],
        child: Icon(Icons.add_call),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return CallsTile(
              callsdata: callsDetails[index],
            );
          },
          itemCount: callsDetails.length),
    );
  }
}
