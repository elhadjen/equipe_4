library PlanProd_model;

import 'dart:html';
import 'dart:math';

part 'init.dart';
part 'Board.dart';
part 'model/calendrier.dart';
part 'model/produit.dart';
part 'model/ligneCommande.dart';
part 'model/disponibilite.dart';
part 'model/testModele.dart';
part 'utilitaires.dart';//AJOUT V3


void main() {
  
  // tester le modèle

  // on commence par définir le calendrier, soit une période entre deux dates, et des disponibilités.
  
  Board board = new Board();
  
  print ('DÉFINITION DU CALENDRIER DE PRODUCTION');
  query("#cache8").value ='zero';
  query("#cache7").value ='';
  query("#valid_calender").on.click.add(board.saisirCalendrier);
  
 
  // on initialise une liste de produits et de commandes (en l'absence de base de données).
  print ('INITIALISATION LISTE DE PRODUITS ET SAISIE DE COMMANDES');
  //var listeCommandes = init(mesDispos);
  var acompte;
  queryAll('[name="acompte"]').forEach((InputElement radioButton) {
    radioButton.on.click.add((e) {
      InputElement clicked = e.target;
      acompte = clicked.value;
      query("#cache2").value =acompte.toString();
    });

  });
  
  query("#valid").on.click.add(board.saisirCommandes);
  
}


