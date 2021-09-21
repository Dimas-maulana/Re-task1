class Akun {
  String? nama;
  String? pin;
  int saldo = 0;

  Akun(this.nama, this.pin, this.saldo);

  bool cekValidasi(String? inputNama, String? inputPin) {
    return (inputNama == this.nama) && (inputPin == this.pin);
  }

  void tarikTunai(int? tunai) {
    if (tunai == null || tunai < 0) return;
    if (this.saldo < tunai) {
      print("saldo anda tidak cukup");
      return;
    }
    this.saldo -= tunai;
    print("Penarikan tunai berhasil dilakukan!");
  }

  void setorTunai(int? tunai) {
    if (tunai == null || tunai < 0) return;
    this.saldo += tunai;
    print("setor tunai berhasil dilakukan!");
  }

  void transfer(String? namaTujuan, int? tunai) {
    if (namaTujuan == null || tunai == null || tunai < 0) return;
    if (this.saldo < tunai) {
      print("Saldo anda tidak cukup untuk melakukan transfer");
      return;
    }

    Akun? akunTujuan = listAkun.firstWhere(
        (element) => element.nama == namaTujuan,
        orElse: () => Akun(null, null, 0));
    if (akunTujuan.nama != null) {
      this.saldo -= tunai;
      akunTujuan.saldo += tunai;
      print("Transfer berhasil dilakukan!");
    } else {
      print("Akun tidak ditemukan!");
    }
  }
}

List<Akun> listAkun = [
  Akun('dimas', '123', 20000),
  Akun('maulana', '456', 30000),
  Akun('malik', '789', 40000)
];

Akun? verifAkun(String? nama, String? pin) {
  if (nama == null || pin == null) return null;
  return listAkun.firstWhere((element) => element.cekValidasi(nama, pin),
      orElse: () => Akun(null, null, 0));
}

Akun? akunSekarang = null;
