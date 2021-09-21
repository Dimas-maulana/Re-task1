import 'akun.dart';
import 'menu.dart';

void main(List<String> args) {
  Menu menu = new Menu();
  do {
    if (akunSekarang == null) {
      menu.Menulogin();
    } else {
      menu.menuUtama();
    }
  } while (true);
}