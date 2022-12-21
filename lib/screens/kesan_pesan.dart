import 'package:flutter/material.dart';

class KesanPesan extends StatefulWidget {
  const KesanPesan({Key? key}) : super(key: key);

  @override
  State<KesanPesan> createState() => _KesanPesanState();
}

class _KesanPesanState extends State<KesanPesan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //
                          ListTile(
                              subtitle: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Kesan',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Card(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            children: <Widget>[
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                children: <Widget>[
                                                  ...ListTile.divideTiles(
                                                    color: Colors.black,
                                                    tiles: [
                                                      const ListTile(
                                                        title: Text(
                                                            "Seru belajarnya tapi ga seru di otak saya Pak :'("),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  'Pesan',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Card(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            children: <Widget>[
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                children: <Widget>[
                                                  ...ListTile.divideTiles(
                                                    color: Colors.black,
                                                    tiles: [
                                                      const ListTile(
                                                        title: Text(
                                                            "Harap kedepannya UAS diberi waktu lebih banyak ya Pak"),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
