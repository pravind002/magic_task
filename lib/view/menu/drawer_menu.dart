// ignore_for_file: deprecated_member_use

// import 'package:ecommagix/imports.dart';
import 'package:magic_task/imports.dart';

import '../../widgets/text/text_builder.dart';
import '../appbar/app_name.dart';
import '../cart/cart.dart';
import '../home/home.dart';
import '../init_screen/login/login.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 170.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/face_image.jpg'),
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextBuilder(
                                text: 'John Doe',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                            TextBuilder(
                                text: 'john@gmail.com',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ]),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 400,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Home()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.home, color: Colors.black),
                          title: TextBuilder(
                              text: "Home",
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Cart()));
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.shopping_bag,
                            color: Colors.black,
                          ),
                          title: TextBuilder(
                              text: "Cart",
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: (() {}),
                        child: ListTile(
                          leading: Icon(Icons.info, color: Colors.black),
                          title: TextBuilder(
                              text: "About App",
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Login()));
                        }),
                        child: ListTile(
                          leading: Icon(Icons.logout, color: Colors.black),
                          title: TextBuilder(
                              text: "LogOut",
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 100.0,
            child: Column(
              children: [
                AppName(),
                TextBuilder(text: 'E-commerce App using Rest Api.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
