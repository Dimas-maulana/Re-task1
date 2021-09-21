import 'dart:io';
import 'akun.dart';

class Menu {
  String? nama;
  String? pin;

  void Menulogin() {
    print("Selamat datang di ATM corner");
    print("Silahkan masukkan nama dan PIN");
    print("Nama: ");
    nama = stdin.readLineSync();

    print("Pin: ");
    pin = stdin.readLineSync();

    if (verifAkun(nama, pin)!.nama != null) {
      akunSekarang = verifAkun(nama, pin);
    } else {
      print("Nama dan PIN salah");
      return;
    }
  }

  void menuUtama() {
    if (akunSekarang == null) return;
    print("Sisa saldo anda: Rp.${akunSekarang!.saldo}");
    print("Silahkan pilih opsi berikut:");
    print("1. Tarik Tunai");
    print("2. Setor Tunai");
    print("3. Transfer Saldo");
    print("4. Keluar");
    print("Opsi pilihan: ");
    int? pilihan = int.parse(stdin.readLineSync()!);
    switch (pilihan) {
      case 1:
        print("Masukkan jumlah penarikan tunai: ");
        int? tarikTunai = int.tryParse(stdin.readLineSync()!);
        akunSekarang!.tarikTunai(tarikTunai);
        break;
      case 2:
        print("Masukkan jumlah setor tunai: ");
        int? setorTunai = int.tryParse(stdin.readLineSync()!);
        akunSekarang!.setorTunai(setorTunai);
        break;
      case 3:
        print("Masukkan nama akun tujuan:");
        String? akunTujuan = stdin.readLineSync();
        print("Masukkan jumlah transfer tunai: ");
        int? transfer = int.tryParse(stdin.readLineSync()!);
        akunSekarang!.transfer(akunTujuan, transfer);
        break;
      case 4:
        akunSekarang = null;
        break;
      default:
        print("Pilihan tidak ditemukan!");
        return;
    }
  }
}

