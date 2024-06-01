import 'package:beefit/models/custom_card.dart';
import 'package:beefit/views/commerce_page.dart';
import 'package:beefit/views/consult_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //current user as a variable
  final user = FirebaseAuth.instance.currentUser!;

  //sign out method
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.login))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomCard(
                icon: Icons.fitness_center,
                title: "Consult Fitness Instructor",              
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ConsultPage()));
                },
              ),
            ),
            const SizedBox(height: 10,),
            const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 97, 97, 97),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or",
                          style: TextStyle(
                              color: Color.fromARGB(255, 105, 105, 105)),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 97, 97, 97),
                        ),
                      ),
                    ],
                  ),
                ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomCard(
                icon: Icons.shopping_cart,
                title: "Browse Through Products",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CommercePage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
