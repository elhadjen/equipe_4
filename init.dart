part of PlanProd_model;

init (mesDispos){
  //initialise une liste de produits
  var listeProduits = new Produits(); 
  var RC = new Produit ('RC','Rillettes canard',true);
  listeProduits.add(RC);
  var CC = new Produit ('CC','Terrine canard',false);
  listeProduits.add(CC);
  var CS = new Produit ('CS','Cassoulet',true);
  listeProduits.add(CS);
  var PC = new Produit ('PC','Pate en croute',false);
  listeProduits.add(PC);
  var MG = new Produit ('MG','Mitonne agneau',false);
  listeProduits.add(MG);
  //print (listeProduits);
  print ('La liste des produits contient maintenant ${listeProduits.getLongueur()} produits');

//initialise une liste de commandes : CORRIGÉ V3
  var listeCommandes = new List();
  var commandes = new Commandes();
  var Cde1 = new Commande(listeProduits,'1','TRUC','CC', 2012,12,15,2012,12,22,true);
  //var complexCde1 = Cde1.isComplex(listeProduits);
  listeCommandes.add(Cde1);
  commandes.add(Cde1);
  var Cde2 = new Commande(listeProduits,'2','CHOSE','RC', 2012,12,17,2012,12,21,true);
  listeCommandes.add(Cde2);
  commandes.add(Cde2);
  var Cde3 = new Commande(listeProduits,'3','BIDULE','CS',2012,12,10,2012,12,17,true);
  listeCommandes.add(Cde3); 
  commandes.add(Cde3);
  //print (complexCde1);
  //print (Cde3.dateSouhait.weekday);
  //print (listeCommandes);
  print ('La liste des commandes contient maintenant ${listeCommandes.length} commandes');
  
  print ('TEST DE LA FONCTION ASSOCIER');
  //test de la fonction associer
  associer(listeCommandes, mesDispos);

  print ('TEST DE LA FONCTION CONFIRMERACRECU');
  //test de la fonction confirmerAcRecu
  confirmerAcRecu(Cde1);
  print ("Pour la commande ${Cde1.numero}, l 'acompte a été reçu : ${Cde1.acompte}.");
  if (Cde1.dispo != null){
  print ('La production prévue en ${Cde1.dispo.codeDispo} passe au niveau de confirmation : ${Cde1.dispo.couleurDispo}.');
  }
  print ('TEST DE LA FONCTION ECHANGEDISPO');
  //test de la fonction echangeDispo
  var d2=Cde2.dispo;
  var d3=Cde3.dispo;
  echangeDispo (d2,d3);
  print ('La commande numéro ${Cde2.numero}/ ${Cde2.codeProduit}/ ${Cde2.codeClient}/ à livrer le ${Cde2.dateSouhait} - produit complexe : ${Cde2.complex} ') ;
  print ('sera produite le ${Cde2.dispo.codeDispo}. Niveau confirmation : ${Cde2.dispo.couleurDispo}');
} 