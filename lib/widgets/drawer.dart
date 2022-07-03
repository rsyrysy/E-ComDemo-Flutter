import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final imageurl="https://media-exp1.licdn.com/dms/image/C4E03AQHwMpIkC9S25Q/profile-displayphoto-shrink_100_100/0/1617549573215?e=1652918400&v=beta&t=ZyecPEkcGxw2Z-RqhmCe5kk8y0-irjUsG1Jq2zurToE";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,

                child:UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,

                  accountName: Text("RaviShankaryadav",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  accountEmail: Text("rsyrysy@gamil.com",
                    style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                 //currentAccountPicture: Image.network(imageurl),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageurl),
                  ),
                )

            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,

              ),
              title:Text("Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
              ) ,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,

              ),
              title:Text("Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ) ,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,

              ),
              title:Text("Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
