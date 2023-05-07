import 'dart:io';

import 'package:admincar/layout/cubit/cubit.dart';
import 'package:admincar/layout/cubit/states.dart';
import 'package:admincar/shared/componants/componants.dart';
import 'package:admincar/shared/styles/icon_brokin.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});
    

  var speedController = TextEditingController();
  var doorController = TextEditingController();
  var seatsController = TextEditingController();
  var petrolController = TextEditingController();
  var discriptionController = TextEditingController();
  var colorController = TextEditingController();
  var priceController = TextEditingController();
  var branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Add images',
                      style: TextStyle(fontSize: 18, fontFamily: 'jannah'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultButton(
                      width: 120,
                      background: Colors.blueAccent,
                      isUpperCase: false,
                      function: () {
                        cubit.getMultiImages();
                      },
                      text: 'Add Images',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (cubit.selectedImages.isNotEmpty)
                      SizedBox(
                        height: 150,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              buildImageItem(context, index),
                          separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(height: 1, color: Colors.grey),
                          ),
                          itemCount: cubit.selectedImages.length,
                        ),
                      ),
                    if (cubit.selectedImages.isEmpty)
                      SizedBox(
                        height: 150,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            height: 150,
                            width: 150,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber.shade100,
                            ),
                            child: const Icon(
                              IconBroken.Image_2,
                              size: 50,
                              color: Colors.black45,
                            ),
                          ),
                          separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(height: 1, color: Colors.grey),
                          ),
                          itemCount: 5,
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Add Discription',
                      style: TextStyle(fontSize: 18, fontFamily: 'jannah'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: defaultFormField(
                                  controller: speedController,
                                  type: TextInputType.number,
                                  label: 'Speed',
                                  prefix: Icons.speed_rounded,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Missing field';
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: defaultFormField(
                                  controller: doorController,
                                  type: TextInputType.number,
                                  label: 'Doors',
                                  prefix: Icons.door_sliding_outlined,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Missing field';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: defaultFormField(
                                  controller: seatsController,
                                  type: TextInputType.number,
                                  label: 'Seats',
                                  prefix: Icons.chair,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Missing field';
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: defaultFormField(
                                  controller: doorController,
                                  type: TextInputType.number,
                                  label: 'Petrol',
                                  prefix:
                                      Icons.check_box_outline_blank_outlined,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Missing field';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: defaultFormField(
                                  controller: colorController,
                                  type: TextInputType.text,
                                  label: 'Color',
                                  prefix: Icons.color_lens,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Missing field';
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: defaultFormField(
                                  controller: priceController,
                                  type: TextInputType.number,
                                  label: 'Price',
                                  prefix: Icons.attach_money_outlined,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Missing field';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: defaultFormField(
                                  controller: branchController,
                                  type: TextInputType.text,
                                  label: 'Bransh',
                                  prefix: Icons.car_crash_outlined,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Missing field';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Add Explane',
                      style: TextStyle(fontSize: 18, fontFamily: 'jannah'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: discriptionController,
                      maxLines: 4,
                      maxLength: 200,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Statues Car',
                      style: TextStyle(fontSize: 18, fontFamily: 'jannah'),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            cubit.changeManOrAut();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: cubit.isShow
                                  ? Colors.blue.shade300
                                  : Colors.grey.shade100,
                            ),
                            child: const Text('Automatic'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'OR',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            cubit.changeManOrAut();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: !cubit.isShow
                                  ? Colors.blue.shade300
                                  : Colors.grey.shade100,
                            ),
                            child: const Text('Manual'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            cubit.changePeOrFu();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: cubit.isShowM
                                  ? Colors.blue.shade300
                                  : Colors.grey.shade100,
                            ),
                            child: const Text('Petrol'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'OR',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            cubit.changePeOrFu();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: !cubit.isShowM
                                  ? Colors.blue.shade300
                                  : Colors.grey.shade100,
                            ),
                            child: const Text('Fuele'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        defaultButton(
                          function: () {
                         
                
                          },
                          text: 'Upload to new',
                          isUpperCase: false,
                          width: 150,
                        ),
                        const Text(
                          'OR',
                          style: TextStyle(color: Colors.grey),
                        ),
                        defaultButton(
                          function: () {},
                          text: 'Upload to booking',
                          isUpperCase: false,
                          width: 150,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildImageItem(context, index) {
    var cubit = MainCubit.get(context);
    return InkWell(
      onTap: () {
        // cubit.getMultiImages();
      },
      onLongPress: () {
        cubit.removeOfSelectedImages(index);
      },
      child: Container(
        height: 150,
        width: 150,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber.shade100,
        ),
        child: Image.file(
          cubit.selectedImages[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
