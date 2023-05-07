import 'dart:io';

import 'package:admincar/layout/cubit/states.dart';
import 'package:admincar/modules/upload/add_product_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/menue_item.dart';
import '../../modules/delivery/delivery_screen.dart';
import '../../modules/drawer/drawer_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/payment_page/payment_page.dart';
import '../../modules/search/search_screen.dart';
import '../../shared/componants/componants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialState());

  static MainCubit get(context) => BlocProvider.of(context);
   MenuIteme currentItem = MenuItems.Home;

  int currentIndex = 0;

  List<Widget> screens = [
     HomeScreen(),
     AddProductScreen(),
    const SearchScreen(),
    const DeliveryScreen(),
  ];
  List<String> titles = [
    'Home',
    'Add product',
    'Add offers',
    'Delivers',
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  void changeDrawer(MenuIteme index) {
    currentItem = index;
    emit(ChangeDrawerState());
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.Home:
        return const PaymentPage();
      case MenuItems.Rent:
        return const SearchScreen();
      case MenuItems.cart:
        return const  SearchScreen();
      case MenuItems.Ret:
        return const SearchScreen();
      case MenuItems.Profile:
        return const DeliveryScreen();
      default:
        return const SearchScreen();
    }
  }
bool isShow = true;
void changeManOrAut()
{
  isShow = !isShow;
  emit(ChangeContainerState());
}
bool isShowM = false;
void changePeOrFu()
{
  isShowM = !isShowM;
  emit(ChangeContainerFState());
}
 //Pick multi images
  List<File> selectedImages = [];
  final pickerMultiImages = ImagePicker();
  Future getMultiImages() async {
    final pickedFile = await pickerMultiImages.pickMultiImage(
      imageQuality: 100,
      maxWidth: 1050,
      maxHeight: 1050,
    );
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (int i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
      emit(MultiImagePickedSuccessState());
    } else {
      toast(msg: 'Nothing is selected', state: ToastState.ERROR);
    }
  }
 void removeOfSelectedImages(int index) {
    selectedImages.remove(selectedImages[index]);
    emit(MultiImagePickedDeletedState());
    toast(msg: 'Deleted successfully', state: ToastState.SUCCESS);
  }
  final FirebaseStorage storage = FirebaseStorage.instance;
 Future<List<File>> uploadImages({
   List<File>? images,}
    // required String name,
    // required String speed,
    // required String doors,
    // required String setes,
    // required String petrol,
    // required String color,
    // required String price,
    // required String branch,
    // required String status,}

  )async{
    emit(UpLoadImagCarLoding());
 List<String> urls = [];
  for (int i = 0; i < images!.length; i++) {
   await firebase_storage.FirebaseStorage.instance
   .ref().child('images/${Uri.file(selectedImages.toString())}');
   
  }
 
  }
}