import 'package:flutter/material.dart';
import 'main_app_bar.dart';
import 'main_drawer.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? appBarActions;
  final Widget? floatingActionButton;

  const MainLayout({
    super.key,
    required this.title,
    required this.body,
    this.appBarActions,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: title,
        actions: appBarActions,
      ),
      drawer: const MainDrawer(),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
