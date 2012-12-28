part of PlanProd_model;

// Ces fonctions ont été codées au départ pour tester le modèle, elles ne sont plus forcément fonctionnelles, mais servent de référence.
// Il y a là aussi des fonctions pour des développements futurs du projet.

definirCalendrier (){

var calendrier = new Calendrier();

  calendrier.nbJours = 7; // variable à saisir
  calendrier.dateDebut= new Date(2012,12,12); //variable à saisir
//print (calendrier.getDateFin ());
//print (calendrier.getDates());
//print (calendrier.getCalProd());

//génération des disponibilités (classe Disponibilite)
var mesDispos = new List();
var monCalProd = calendrier.getCalProd();
List listeDates = calendrier.getDates();//new List();
//monCalProd.forEach((k,v) => listeDates.add(k));
for (final e in listeDates){
  for (int i=0; i<monCalProd[e];i++) {
    var dispo = new Disponibilite ();
    dispo.dateDispo = e;
    dispo.numeroDispo =(i+1);
    dispo.couleurDispo='palegreen'; //couleur par défaut
    dispo.creerCodeDispo();
    mesDispos.add(dispo);
    //print (dispo.afficherDispo());
    print (dispo.representerDispo());
  }
}
print ('Définition OK : ${mesDispos.length} disponibilités de production établies \n pour la période de ${calendrier.nbJours} jours commençant le ${calendrier.dateDebut}');
return mesDispos;
}


associer(listeCommandes,mesDispos){
  // on associe une commande à une disponibilité
  
  print ('ASSOCIATION COMMANDE-DISPONIBILITE');
  //
  //premier arrivé premier servi : le numero de la commande fait foi
  //listeCommandes = listeCommandes.sort((m,n) => m.compareTo(n));
  //on essaye de se rapprocher le plus possible de la date de livraison souhaitée
  
  listeCommandes = listeCommandes.filter((c)=>c.dateProdConfirmee==null);
  for (final c in listeCommandes){ 
    for (final d in mesDispos){
      if (c.dateProdConfirmee==null){
        if (c.dateProd==d.dateDispo){ //vérifie si date disponible
          if (d.couleurDispo == 'palegreen'){//vérifie si disponible
            if (c.complex == true && d.numeroDispo !=1 ){//un produit complexe ne peut pas être mis en début de journée
              affecterDispo(c,d); 
            } 
            else if (c.complex ==false){
              affecterDispo(c,d);
            }
          }
        }
      }
    }

  }


}

affecterDispo (Commande c,Disponibilite d){
  print ('La commande numéro ${c.numero}/ ${c.codeProduit}/ ${c.codeClient}/ à livrer le ${c.dateSouhait} - produit complexe : ${c.complex} ') ;
  c.dateProdConfirmee = d.dateDispo;
  d.couleurDispo = d.coloryDispo(c);
  c.dispo=d;
  d.commande =c;
  print ('sera produite le ${d.codeDispo}. Niveau confirmation : ${d.couleurDispo}');
}
  
confirmerAcRecu (Commande c){
  c.confirmerAcompte();
  //la production est confirmée (dispo devient rouge) si acompte versé
  if (c.dispo != null){
  c.dispo.coloryDispo(c);
  }
}

echangeDispo (Disponibilite d1, Disponibilite d2){//AJOUT V3
  var c1 = d1.commande;
  var c2 = d2.commande;
  if (c1 !=null && c2 !=null){
  d1.commande = c2;
  d2.commande = c1;
  c1.dispo = d2;
  c2.dispo = d1;
  c1.dateProdConfirmee = d2.dateDispo;
  c2.dateProdConfirmee = d1.dateDispo;
  d1.coloryDispo (c2);
  d2.coloryDispo (c1);
  }
}


