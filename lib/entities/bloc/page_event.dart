// ignore_for_file: prefer_const_constructors_in_immutables

part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class ChangePageEvent extends PageEvent {
  final int index;

  ChangePageEvent({this.index});

  @override
  List<Object> get props => [index];
}
