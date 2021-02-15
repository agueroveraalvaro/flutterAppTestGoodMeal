import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  TextEditingController _searchTextFieldController;

  //Get
  TextEditingController get searchTextFieldController =>
      _searchTextFieldController;

  //Set
  set setSearchTextFieldController(TextEditingController value) {
    _searchTextFieldController = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    return super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}