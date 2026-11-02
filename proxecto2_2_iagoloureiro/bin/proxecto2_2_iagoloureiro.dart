// PROXECTO TEMA 2.2 - Iago Loureiro Carcacia
import '../lib/modelo/repositorio_futbolistas.dart';
import '../lib/vistas/menu.dart';

// Iniciar el programa.
void main() {
  RepositorioFutbolistas repositorio = RepositorioFutbolistas();
  Menu menu = Menu(repositorio: repositorio);
  menu.iniciar();
}
