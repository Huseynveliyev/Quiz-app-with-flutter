import 'package:flutter/material.dart';
import 'package:flutter_projects/Test_Veri.dart';
import 'constants.dart';

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> Secimler = [];

  TestVeri test_1 = TestVeri();

  void ButtonFunction(bool SecilenButton) {
    if (test_1.TestBittiMi() == true) {
      //alert dialog gosterilecek
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Tebrikler Testi Bitirdiniz"),
            content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new TextButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();

                  setState(() {
                    test_1.TestiSifirla();
                    Secimler = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        test_1.getSoruYaniti() == SecilenButton
            ? Secimler.add(kdogruIconu)
            : Secimler.add(kyanlisIconu);
        test_1.SonrakiSoruyGec();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(runSpacing: 3, spacing: 3, children: Secimler),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red[400], onPrimary: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.thumb_down),
                    ),
                    onPressed: () {
                      ButtonFunction(false);
                    },
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green[400], onPrimary: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(Icons.thumb_up),
                      ),
                      onPressed: () {
                        ButtonFunction(true);
                      }),
                )),
              ])),
        )
      ],
    );
  }
}

class Soru {
  String SoruMetni;
  bool SoruYaniti;

  Soru({required this.SoruMetni, required this.SoruYaniti});
}
