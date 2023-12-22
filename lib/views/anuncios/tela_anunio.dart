import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_integrador/theme/colors.dart';
import 'package:projeto_integrador/theme/get_button_style.dart';
import 'package:projeto_integrador/widgets/get_app_bar_screens.dart';
import 'package:projeto_integrador/widgets/get_drawer.dart';

class TelaAnuncio extends StatefulWidget {
  const TelaAnuncio({super.key});

  @override
  State<TelaAnuncio> createState() => _TelaAnuncioState();
}

final CollectionReference collectionReference = FirebaseFirestore.instance.collection('Produto');
final Stream<QuerySnapshot> snapshots = collectionReference.snapshots();

class _TelaAnuncioState extends State<TelaAnuncio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: getDrawer(context),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(95),
          child: getAppBarScreensSecundary(title: 'Anúncio')),
      body: Column(
        children: [
          _getBody(),
          _getProducts()
        ],
      ),
      backgroundColor: kBackGroundColor,
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 353,
                height: 41,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ScreenGeraAnuncio');
                    },
                    style: getButtonGeraAnuncioStyle,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gerar Anúncio',
                          style: TextStyle(
                              fontFamily: 'Kadwa',
                              fontSize: 20,
                              color: kColorTextSecondary,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.add_rounded,
                          color: Colors.black,
                          size: 30,
                        )
                      ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 27,
          ),
          const Text(
            'Produtos Aúnciados:',
            style: TextStyle(
                fontFamily: 'Kadwa', fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Column(
            children: [
              _getProducts()
            ],
          )
        ],
      ),
    );
  }

  Widget _getProducts() {
    return SizedBox(
      child: StreamBuilder(
        stream: snapshots,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Erro${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center (
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData){
            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (BuildContext context, int index){
                final Map<String, dynamic> data = 
                  documents[index].data() as Map<String, dynamic>;
                return Container(
                  margin: const EdgeInsets.all(5),
                  width: 100,
                  height: 85,
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kColorTextPrimary),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data['nomeProduto'],
                              style: const TextStyle(
                                fontFamily: 'Kadwa',
                                fontSize: 5,
                                fontWeight: FontWeight.bold,
                                color: kColorTextPrimary
                              ),
                            ),
                            Text(
                              data['descricao'],
                              style: const TextStyle(
                                fontFamily: 'Kadwa',
                                fontSize: 5,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey),
                            ),
                            Text(
                              data['marcaProduto'],
                              style: const TextStyle(
                                fontFamily: 'Kadwa',
                                fontSize: 5,
                                fontWeight: FontWeight.bold,
                                color: kColorTextPrimary),
                            ),
                            Text(
                              data['defeito'],
                              style: const TextStyle(
                                fontFamily: 'Kadwa',
                                fontSize: 5,
                                fontWeight: FontWeight.bold,
                                color: kColorTextPrimary
                              ),
                            ),
                            Text(
                              data['preco'],
                              style: const TextStyle(
                                fontFamily: 'Kadwa',
                                fontSize: 5,
                                fontWeight: FontWeight.bold,
                                color: kColorTextPrimary
                              ),
                            ),
                          ]
                        )
                      ),
                    )
                  )
                );
              },
            );
          }
          return const Text('erro');
        },
      )
    );
  }
}
