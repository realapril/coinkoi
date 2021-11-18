import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPortfolioAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailPortfolioAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("My Portfolio" ),
      backgroundColor: Colors.grey[700],

    );
  }
}