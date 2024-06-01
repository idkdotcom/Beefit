import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;

  const CustomCard({required this.icon,  required this.title, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4.0,
      color: Colors.grey,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children:[ 
                Icon(icon, size: 100, color: Colors.white,),
                Text(
                  title,
                  style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
