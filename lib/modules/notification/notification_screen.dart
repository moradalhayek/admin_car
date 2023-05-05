import 'package:flutter/material.dart';
import '../../shared/styles/icon_brokin.dart';
import 'package:admincar/shared/componants/componants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildNotificationItem(context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: 1,
          ),
        ),
      ),
    );
  }

  Widget buildNotificationItem(context) {
    return InkWell(
      onLongPress: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      IconBroken.Delete,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 175,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Column(
                children: [
                  Row(
                children: const [
                  Icon(
                    Icons.timer_sharp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 3,),
                  Text(
                    'Message Time : 12:48 AM',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
             const SizedBox(height: 10,),
                  Row(
                    children: const [
                      Text(
                        'Client Name :',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'jannah',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Mohamad Almatar',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'jannah',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'Client Phone Number :',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'jannah',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '0981681916',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'jannah',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'Car Name :',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'jannah',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'BMW 2022',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'jannah',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              defaultTextButton(
                context: context,
                label: 'OK',
                onTap: () {},
              ),
              defaultTextButton(
                context: context,
                label: 'DON\'T OK',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
