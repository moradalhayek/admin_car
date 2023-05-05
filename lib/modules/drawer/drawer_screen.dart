import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../models/menue_item.dart';
import '../../shared/componants/componants.dart';
import '../../shared/styles/icon_brokin.dart';
import '../delivery/delivery_screen.dart';
import '../signin/signin_screen.dart';


class MenuItems {
  static const Home = MenuIteme('Home', IconBroken.Home);
  static const Rent = MenuIteme('rent', Icons.car_crash_outlined);
  static const cart = MenuIteme('Cart',  IconBroken.Buy);
  static const Ret = MenuIteme('Ret', IconBroken.Edit);
  static const Profile = MenuIteme('Profile', IconBroken.Profile);
  static const all = <MenuIteme>[Home, Rent, cart, Ret,Profile,];
}

class DrawerScreen extends StatelessWidget {
  final MenuIteme currentItem;
  final ValueChanged<MenuIteme> onSelectItem;
  const DrawerScreen(
      {super.key, required this.currentItem, required this.onSelectItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('D6F4DC'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () => navigateTo(context,const DeliveryScreen()),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Flexible(
                    flex: 4,
                    child: Text(
                      'Mohammad Almatar',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ...MenuItems.all.map(buildMenueItem).toList(),
            ListTile(
              onTap: () {
                //Share.share('com.example.users');
              },
              minLeadingWidth:2,
            leading:const Icon(IconBroken.Work),
            title:const Text('Share app'),
           ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(height: 1,width: double.infinity,color: Colors.grey.shade400,),
          ),
             ListTile(
              onTap: () => navigateTo(context, SignInScreen() ,),
              minLeadingWidth:2,
            leading:const Icon(IconBroken.Logout),
            title:const Text('Logout'),
           ),
            const Spacer(
              flex: 7,
            ),
           
          ],
        ),
      ),
    );
  }

  Widget buildMenueItem(MenuIteme iteme) => ListTile(
        minLeadingWidth: 20,
        selectedColor: Colors.blueAccent,
        selected: currentItem == iteme,
        leading: Icon(iteme.icon),
        title: Text(iteme.title),
        onTap: () {
          return onSelectItem(iteme);
        },
      );
}
