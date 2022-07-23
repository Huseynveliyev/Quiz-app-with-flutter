import 'Soru.dart';

class TestVeri {
  int _soruIndex = 0;

  List<Soru> _SoruBankasi = [
    Soru(
        SoruMetni: '1.Titanic gelmiş geçmiş en büyük gemidir',
        SoruYaniti: false),
    Soru(
        SoruMetni: '2.Dünyadaki tavuk sayısı insan sayısından fazladır,',
        SoruYaniti: true),
    Soru(SoruMetni: '3.Kelebeklerin ömrü bir gündür,', SoruYaniti: false),
    Soru(SoruMetni: '4.Dünya düzdür', SoruYaniti: false),
    Soru(
        SoruMetni: '5.Kaju fıstığı aslında bir meyvenin sapıdır',
        SoruYaniti: true),
    Soru(
        SoruMetni: '6.Fatih Sultan Mehmet hiç patates yememiştir',
        SoruYaniti: true),
    Soru(SoruMetni: '7.Fransızlar 80 demek için, 4 - 20 der', SoruYaniti: false)
  ];

  String getSoruMetni() {
    return _SoruBankasi[_soruIndex].SoruMetni;
  }

  bool getSoruYaniti() {
    return _SoruBankasi[_soruIndex].SoruYaniti;
  }

  void SonrakiSoruyGec() {
    if (_soruIndex + 1 < _SoruBankasi.length) {
      _soruIndex++;
    }
  }

  bool TestBittiMi() {
    if (_soruIndex + 1 >= _SoruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void TestiSifirla() {
    _soruIndex = 0;
  }
}
