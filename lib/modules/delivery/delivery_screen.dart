import 'package:admincar/shared/componants/componants.dart';
import 'package:admincar/shared/styles/icon_brokin.dart';
import 'package:flutter/material.dart';
import '../../shared/componants/constants.dart';
import 'delivery_profile_screen.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 275,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade100,
                    ),
                    child: const TextField(
                      //controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Products',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        prefixIcon: Icon(
                          IconBroken.Search,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () {
                       //showTaskCategoryDialog(context, size);
                      },
                      icon: const Icon(
                        IconBroken.Filter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildDeliveryWidget(context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDeliveryWidget(context) => ListTile(
        onTap: () {
          navigateTo(
            context,
            const DeliveryProfileScreen(),
          );
        },
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(width: 2.0, color: Colors.amber),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20.0,
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/1077/1077012.png',
            ),
          ),
        ),
        title: const Text(
          'Mohammad Almatar',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(
              Icons.linear_scale_outlined,
              color: Colors.blue,
            ),
            Text(
              'fonded',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
        trailing: const Icon(
          IconBroken.Arrow___Right_2,
          size: 25,
          color: Colors.blue,
        ),
      );
  void showTaskCategoryDialog(context, size) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Task category',
              style: TextStyle(color: Colors.pink.shade300, fontSize: 20),
            ),
            content: Container(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Constants.taskCategoryList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // print('index ${Constants.taskCategoryList[index]}');
                        // setState(() {
                        //   taksCategory = Constants.taskCategoryList[index];
                        // });
                        Navigator.canPop(context)
                            ? Navigator.pop(context)
                            : null;
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red.shade200,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              Constants.taskCategoryList[index],
                              style: const TextStyle(
                                color: Color(0xff00325A),
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  // setState(() {
                  //   taksCategory = null;
                  // });
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text('Cancel filter'),
              ),
            ],
          );
        });
  }
}
