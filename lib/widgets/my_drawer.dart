import 'package:flutter/material.dart';
import 'package:ovqatlar_menu/screens/products.dart';
import 'package:ovqatlar_menu/screens/tabs_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Widget lisTile(IconData icon, String title,Function() handle) {
    return ListTile(
      onTap: handle ,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 40,),
            lisTile(Icons.home, "Home",(){
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            }),
            lisTile(Icons.category, "Ctegory",(){
              Navigator.of(context).pushReplacementNamed(ProductScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
