import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconGen(
                    color: Colors.indigo,
                    text: 'Document',
                    icons: Icon(
                      Icons.insert_drive_file,
                      color: Colors.white,
                    )),
                iconGen(
                    color: Colors.pink,
                    text: 'Camera',
                    icons: Icon(Icons.camera_alt, color: Colors.white)),
                iconGen(
                    color: Colors.purple,
                    icons: Icon(Icons.image, color: Colors.white),
                    text: 'Gallery')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconGen(
                  color: Colors.orange,
                  text: 'Audio',
                  icons: Icon(Icons.headset, color: Colors.white),
                ),
                iconGen(
                  color: Colors.green,
                  text: 'Location',
                  icons: Icon(Icons.location_on, color: Colors.white),
                ),
                iconGen(
                  color: Colors.blue,
                  text: 'contact',
                  icons: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      margin: EdgeInsets.all(10),
    );
  }

  Widget iconGen({Color? color, Icon? icons, String? text}) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 25, backgroundColor: color, child: icons),
            SizedBox(
              height: 5,
            ),
            Text(text.toString()),
          ],
        ),
      ),
    );
  }
}
