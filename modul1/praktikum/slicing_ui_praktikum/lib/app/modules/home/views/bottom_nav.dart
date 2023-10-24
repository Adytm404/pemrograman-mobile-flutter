import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:slicing_ui_praktikum/app/modules/home/controllers/home_controller.dart';
import 'package:slicing_ui_praktikum/app/modules/home/views/home_view.dart';


class BottomAppNav extends GetView<HomeController>{
  const BottomAppNav({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
             Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeView(key: key,),)
             );
            },
          child: NavItem(icon: Icons.home),
          ),
          NavItem(icon: Icons.favorite),
          NavItem(icon: Icons.file_download),
          NavItem(icon: Icons.movie),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;

  NavItem({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}