import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_support/screens/home_screen.dart';
import 'package:social_support/screens/login/login_screen.dart';
import '../providers/auth.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Drawer(
      backgroundColor: Theme.of(context).canvasColor,
      child: Column(
        children: [
          Container(
            height: 90.h,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Text("מיזם\nהתחברתי", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline2,),
          ),
          SizedBox(
            height: 20.h,
          ),
          _buildListTile(context, "דף הבית", Theme.of(context).primaryColor, Icons.home, () {}),
          _buildListTile(context, "התנתקות", Colors.black, Icons.logout, () {
            print("logout");
            auth.logout();
            Navigator.popUntil(context, ModalRoute.withName(HomeScreen.routeName));
            Navigator.of(context).pushReplacementNamed(LoginScreen.screenRoute);
          }),

        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, Color color, IconData icon, Function onTap2) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3!.copyWith(color: color),
      ),
      onTap: () => onTap2(),
    );
  }


}
