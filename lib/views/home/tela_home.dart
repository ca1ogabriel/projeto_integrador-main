import 'package:flutter/material.dart';
import 'package:projeto_integrador/theme/colors.dart';
import 'package:projeto_integrador/theme/get_style_card_product.dart';
import 'package:projeto_integrador/theme/get_style_seach.dart';
import 'package:projeto_integrador/widgets/get_drawer.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: getDrawer(context),
      backgroundColor: kBackGroundColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70), child: _getAppBarHome()),
      body: _getBodyHome(),
    );
  }

  Widget _getAppBarHome() {
    return AppBar(
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 35,
      ),
      elevation: 0,
      backgroundColor: kBackGroundColor,
      centerTitle: true,
      title: Row(
        children: [
          SizedBox(
            width: 250,
            height: 41,
            child: TextFormField(
              decoration: getStyleSeach,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            iconSize: 30,
          ),
        ],
      ),
    );
  }

  Widget _getBodyHome() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                RichText(
                    text: const TextSpan(
                        text: 'Explore os',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Kadwa',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                      TextSpan(
                          text: ' produtos',
                          style: TextStyle(
                              color: kColorTextPrimary,
                              fontFamily: 'Kadwa',
                              fontSize: 20))
                    ]))
              ],
            ),
            const SizedBox(
              height: 250,
            ),
             Row(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadiusDirectional.circular(10),

                        ),
                      )
                    ]
                  ),
                 ),
              ],
            ),
            const Row(
              children: [
                Text('Usados',
                    style: TextStyle(
                        fontFamily: 'Kadwa',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))
              ],
            ),
            const SizedBox(
              height: 250,
            ),
            const Row(
              children: [
                Text(
                  'Visto recentemente',
                  style: TextStyle(
                      fontFamily: 'Kadwa',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
            const SizedBox(
              height: 250,
            ),
            const Row(
              children: [
                Text(
                  'Notebooks',
                  style: TextStyle(
                      fontFamily: 'Kadwa',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 250)
          ],
        ),
      ),
    ));
  }
}
