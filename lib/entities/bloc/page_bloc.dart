// ignore_for_file: prefer_const_constructors
import 'package:flutter_coffee/screens/app_drawer.dart';
import 'package:flutter_coffee/screens/pages/login.dart';
import 'package:flutter_coffee/screens/products/product_drawer.dart';
import 'package:flutter_coffee/screens/pages/myhomepage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial()) {
    on<ChangePageEvent>((event, emit) {
      switch (event.index) {
        case 0:
          emit(PageLoaded(Login()));
          break;
        case 1:
          emit(PageLoaded(MyHomePage()));
          break;
        case 2:
          emit(PageLoaded(ProductDrawer()));
          break;
        case 3:
          emit(PageLoaded(AppDrawer()));
          break;
        default:
          emit(PageLoaded(MyHomePage()));
      }
    });
  }
}
