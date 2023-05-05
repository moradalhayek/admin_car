import 'package:admincar/modules/upload/add_product_screen.dart';
import 'package:admincar/shared/componants/componants.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/icon_brokin.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
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
                      onPressed: () {},
                      icon: const Icon(
                        IconBroken.Filter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Newly added cars',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'jannah',
                      ),
                    ),
                    defaultTextButton(
                      context: context,
                      label: 'View all',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildCars(context),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCars(context) => Padding(
        padding: const EdgeInsets.only(left: 3, right: 8),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 200,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Positioned(
              top: 2,
              left: 15,
              child: SizedBox(
                height: 125,
                width: 190,
                child: Image.asset(
                  'assets/images/carred.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Container(
                height: 75,
                width: 190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Flexible(
                        flex: 2,
                        child: Text(
                          'BMW  x5m car ',
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Text(
                          'The BMW X5 is a mid-size luxury SUV produced by BMW....',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topLeft,
                    onPressed: () {},
                    icon: const Icon(
                      IconBroken.Delete,
                      size: 25,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      navigateTo(context, AddProductScreen());
                    },
                    icon: const Icon(
                      IconBroken.Edit,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
