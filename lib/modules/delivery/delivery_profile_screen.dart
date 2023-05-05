import 'package:flutter/material.dart';

class DeliveryProfileScreen extends StatelessWidget {
  const DeliveryProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: Stack(
              children: [
                Card(
                  shadowColor: Colors.purple.shade100,
                  elevation: 10,
                  margin: const EdgeInsets.all(30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Mohammad Almatar',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'jannah',
                            ),
                          ),
                        ),
                        
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'IT since joined date 16/4/2023',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                             fontFamily: 'jannah',
                            ),
                          ),
                        ),
                        
                        const Divider(
                          thickness: 1,
                        ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        const Text(
                          'Contact info :',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                           fontFamily: 'jannah',
                          ),
                        ),
                        
                        socialInfo(
                            label: 'Email : ',
                            content: 'abomatar232@gmail.com'),
                       
                        socialInfo(
                            label: 'Phone number : ', content: '0981681916'),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            socialButtons(
                              color: Colors.green,
                              icon: Icons.whatsapp_outlined,
                              function: () {
                                // _openWhatsAppChat();
                              },
                            ),
                            socialButtons(
                              color: Colors.red,
                              icon: Icons.email_outlined,
                              function: () {
                                // _mailTo();
                              },
                            ),
                            socialButtons(
                              color: Colors.purple,
                              icon: Icons.call_outlined,
                              function: () {
                                // _callPhoneNumber();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shadowColor: Colors.blue.shade300,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(49.0)),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 6,
                            color: Colors.white,
                          ),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/1077/1077012.png',
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget socialInfo({
    required String label,
    required String content,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
           fontFamily: 'jannah',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            content,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'jannah',
            ),
          ),
        ),
      ],
    );
  }

  Widget socialButtons(
      {required Color color,
      required IconData icon,
      required Function function}) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 25,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 23,
        child: IconButton(
          onPressed: () {
            function();
          },
          icon: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
