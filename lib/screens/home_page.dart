import 'package:flutter/material.dart';
import 'kurs_page.dart';
import 'pembelian_page.dart';
import 'profil_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              Card(
                //Kurs Mata Uang
                margin: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const KursPage();
                      },
                    ));
                  },
                  splashColor: Colors.deepPurple,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.attach_money,
                          size: 70,
                          color: Colors.deepPurple,
                        ),
                        Text(
                          "Konversi Mata Uang",
                          style: TextStyle(fontSize: 17.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                //Daftar Pembelian
                margin: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const PembelianPage();
                      },
                    ));
                  },
                  splashColor: Colors.deepPurple,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.money,
                          size: 70,
                          color: Colors.deepPurple,
                        ),
                        Text(
                          "Pembelian",
                          style: TextStyle(fontSize: 17.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                //Profil
                margin: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Mahasiswa();
                      },
                    ));
                  },
                  splashColor: Colors.deepPurple,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.person_pin,
                          size: 70,
                          color: Colors.deepPurple,
                        ),
                        Text(
                          "Profil",
                          style: TextStyle(fontSize: 17.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
