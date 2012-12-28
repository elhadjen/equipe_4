part of PlanProd_model;

class Board {
  Calendrier calendrier;
  var mesDispos = new List ();
  var listeProduits;
  var listeCommandes;
  var list3= new List();
  var ii =1;

  Board(){
    listeProduits = initProduits();
  }

  initProduits(){
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

    print ('La liste des produits contient maintenant ${listeProduits.getLongueur()} produits');
    var options = listeProduits.getOptionsProduits();
    query ("#codeProd").innerHtml = options;
    return listeProduits;
  }

  saisirCalendrier (Event event){
    var calendrier = new Calendrier();
    //var mesDispos= new List();
    list3.add('jjjjjjj098uj');//elle va servir au test de l'unicité du numero de commande

  var calendrannee =query("#CalendrierAnnee");
  var calendrmois = query("#CalendrierMois");
  var calendrjour = query("#CalendrierJour");
  var nbrjour = query("#NombreJour");
  query("#text2").text ='Saisie OK';


  //**************test de saisie  (vérifie qu'on a bien saisi des chiffres)****************
  var test_saisie1=0;
  var ann_calend;
  try {  int ann_calende = parseInt(calendrannee.value);
  ann_calend= parseInt(calendrannee.value); // Yes!  An integer.
  } catch (e){
  query("#text2").text ='ATTENTION ! erreur de saisie: Calendr_année ';
  test_saisie1=1;
  }

  var mois_calend;
  try {  int mois_calende = parseInt(calendrmois.value);
  mois_calend= parseInt(calendrmois.value); // Yes!  An integer.
  } catch (e){
  query("#text2").text ='ATTENTION ! erreur de saisie: Calendr_mois ';
  test_saisie1=1;
  }

  var jour_calend;
  try {  int jour_calende = parseInt(calendrjour.value);
  jour_calend= parseInt(calendrjour.value); // Yes!  An integer.
  } catch (e){
  query("#text2").text ='ATTENTION ! erreur de saisie: Calendr_jour ';
  test_saisie1=1;
  }

  var journum;
  try {  int journume = parseInt(nbrjour.value);
  journum= parseInt(nbrjour.value); // Yes!  An integer.
  } catch (e){
  query("#text2").text ='ATTENTION ! erreur de saisie: Nombre_jours: ';
  test_saisie1=1;
  }
//************** fin test de saisie****************

  if (test_saisie1==0){

  query("#cache3").value =ann_calend.toString();
  query("#cache4").value =mois_calend.toString();
  query("#cache5").value =jour_calend.toString();
  query("#cache6").value =journum.toString();


  if(query("#text2").text =='Saisie OK'){ // verifier d'abord que la saisie calendrier est correcte
    query("#cache7").value ='ok';}
  else{query("#cache7").value ='No';}



  calendrier.nbJours= parseInt(journum.toString());
  calendrier.dateDebut= new Date(parseInt(ann_calend.toString()),parseInt(mois_calend.toString()),parseInt(jour_calend.toString())); //variable à saisir
  print ('**********calendrier.getDateFin  ${calendrier.getDateFin ()}');
  print ('*********calendrier.getDates  ${calendrier.getDates()}');
  print ('*********calendrier.getCalProd  ${calendrier.getCalProd()}');


  var monCalProd = calendrier.getCalProd();
  List listeDates = new List();
  listeDates=calendrier.getDates();
  //monCalProd.forEach((k,v) => listeDates.add(k));
  var tabaffiche1 = '<table BORDER="10" cellpadding="5">';
  for (final e in listeDates){
    for (int i=0; i<monCalProd[e];i++) {
      var dispo = new Disponibilite();
      dispo.dateDispo = e;
      dispo.numeroDispo =(i+1);
      dispo.couleurDispo='palegreen';//couleur par défaut
      dispo.creerCodeDispo();
      mesDispos.add(dispo);//mesDispos.add(dispo.creerMaDispo());
      //print ('dispo.dateDispo ${dispo.dateDispo}');
      //print ('dispo.afficherDispo() ${dispo.afficherDispo()}');

      tabaffiche1 = '${tabaffiche1}${dispo.representerDispo()}';
      //tabaffiche1= '${tabaffiche1} <tr > <td <TD BGCOLOR=\" ${dispo.couleurDispo} \" ALIGN=\"center\" WIDTH=\"100px\" > ${dispo.dateDispo.year}-${dispo.dateDispo.month}-${dispo.dateDispo.day}   </td> <td BGCOLOR=\" ${dispo.couleurDispo} \" ALIGN=\"center\" WIDTH=\"60px\" > ${dispo.numeroDispo} </td><TD BGCOLOR=\" ${dispo.couleurDispo} \" ALIGN=\"center\" WIDTH=\"500px\"> libre    </td> </tr>';
    }
  //query('#container').innerHtml= '<table BORDER="10" cellpadding="5"> <tr > <td <TD BGCOLOR=\" ${dispo.couleurDispo} \" ALIGN=\"center\" WIDTH=\"100px\" > ${dispo.dateDispo.year}-${dispo.dateDispo.month}-${dispo.dateDispo.day}   </td> <td BGCOLOR=\" ${dispo.couleurDispo} \" ALIGN=\"center\" WIDTH=\"60px\" > ${dispo.numeroDispo} </td><TD BGCOLOR=\" ${dispo.couleurDispo} \" ALIGN=\"center\" WIDTH=\"500px\"> libre    </td> </tr></table>';
  }


  if(query("#cache8").value =='zero'){
  tabaffiche1='${tabaffiche1} </table>';
  query('#container').innerHtml='';
  query('#container').innerHtml=tabaffiche1;
  }
  query("#cache8").value ='one';

  //query("#valid").on.click.add(saisirProduits);

  }

  else print('\n ERREUR DE SAISIE DU CALENDRIER DES DISPONIBILIÉS');
  }

  saisirCommandes(Event event){




  var listeCommandes = new List();
  var listeProduits;

  // on vérifie d'abord que le calendrier des disponibilités est bien défini.
  if (query("#cache7").value !='ok'){
    query("#text").text =' ATTENTION ! Erreur Calendrier : vérifier et valider  Calendrier des Disponibilités';
    print(' ATTENTION ! erreur de saisie du Calendrier des disponibilités \n');
    return;
  }

  print ('\n  INITIALISATION LISTE DE PRODUITS ET SAISIE DE COMMANDES');

  //on initialise une liste de produits


  //on récupère les données saisies
  var num_cmde =query("#numeroCommande");
  var client_code =query("#codeClient");
  var annee_commande =query("#anneeCommande");
  var mois_commande=query("#moisCommande");
  var jour_commande=query("#jourCommande");
  var annee_souhait =query("#anneeSouhait");
  var mois_souhait =query("#moisSouhait");
  var jour_souhait =query("#jourSouhait");
  var code =query("#codeProd");
  print (code.value.toString());



  var acomp= query("#cache2");



  //************** test de saisie (on véfifie qu'on a bien saisi des chiffres pour les dates)****************
  var test_saisie=0;

  if(num_cmde.value==''){
    query("#text").text ='ATTENTION ! saisir  Numéro ';
     test_saisie=1;
   }
  var num_cde=num_cmde.value;

  if(client_code.value==''){
    query("#text").text ='ATTENTION ! saisir  Client_code ';
    test_saisie=1;
  }

  var ann_cde;
  try {  int ann_cdee = parseInt(annee_commande.value);
  ann_cde= parseInt(annee_commande.value); // Yes!  An integer.
  } catch (e){
  query("#text").text ='ATTENTION ! erreur de saisie: année ';
  test_saisie=1;
  }

  var mois_cde;
  try {  int mois_cdee = parseInt(mois_commande.value);
  mois_cde= parseInt(mois_commande.value); // Yes!  An integer.
  } catch (e){
  query("#text").text ='ATTENTION ! erreur de saisie: mois ';
  test_saisie=1;
  }

  var jour_cde;
  try {  int jour_cdee = parseInt(jour_commande.value);
  jour_cde= parseInt(jour_commande.value); // Yes!  An integer.
  } catch (e){
  query("#text").text ='ATTENTION ! erreur de saisie: jour ';
  test_saisie=1;
  }

  var ann_souh;
  try {  int ann_souhe = parseInt(annee_souhait.value);
  ann_souh= parseInt(annee_souhait.value); // Yes!  An integer.
  } catch (e){
  query("#text").text ='ATTENTION ! erreur de saisie: année_souhait: ';
  test_saisie=1;
  }

  var mois_souh;
  try {  int mois_souhe = parseInt(mois_souhait.value);
  mois_souh= parseInt(mois_souhait.value); // Yes!  An integer.
  } catch (e){
  query("#text").text ='ATTENTION ! erreur de saisie: mois_souhait: ';
  test_saisie=1;
  }

  var jour_souh;
  try {  int jour_souhe = parseInt(jour_souhait.value);
  jour_souh= parseInt(jour_souhait.value); // Yes!  An integer.
  } catch (e){
  query("#text").text ='ATTENTION ! erreur de saisie: jour_souhait: ';
  test_saisie=1;
  }
  //************** fin test de saisie****************

  var xxx;  if(acomp.value=="true"){xxx=true;} else {xxx=false;} //convertir string to boolean pour la variable acompte
  print (xxx);


  var codeP= code.value.toString();
  var produits = this.listeProduits.produits;
  var produit = produits[codeP];
  query("#nomProd").innerHtml = produit.nomProduit;
  query("#complexite").innerHtml = produit.isComplex.toString();
  //var nom = query("#nomProd");
  //var comp= query("#cache");


  //var xx;  if(comp.value=="true"){xx=true;} else {xx=false;} //convertir string to boolean pour la variable complexite


  //var listeProduits = new Produits();
  //var prod = new Produit (code.value,nom.value,xx);
  //listeProduits.add(prod);

  //FIN DE LA PARTIE A RÉVISER


  if (test_saisie==0)  //******debut test d'unicité du numero de commande
  {
    var Cde = new Commande(produits,num_cde,client_code.value,code.value, ann_cde,mois_cde,jour_cde,ann_souh,mois_souh,jour_souh,xxx);

    list3.add('${Cde.numero}${ii}');
    for(var i=0;i<ii;i++){
    if ('${Cde.numero}${ii-1}'==list3[i])
    {
      query("#text").text ='ATTENTION ! Numéro de commande déja attribuée ';
      test_saisie=1;
    }else query("#text").text ='Saisie OK';

    }
    ii=ii+1;
  }                 //******fin  test d'unicité du numero de commande
print('***********************   $list3');

    if (test_saisie==0) {
      var Cde = new Commande(produits,num_cde,client_code.value,code.value, ann_cde,mois_cde,jour_cde,ann_souh,mois_souh,jour_souh,xxx);

      var complexCde = Cde.isComplex(produits);
      listeCommandes.add(Cde);//listeCommandes.add(Cde1.creerMaCommande());

   // on calcule la date de production idéale pour la commande

   var dateProdIdealeCde = Cde.dateProdIdeale(0);
   print (' Commande Numéro = ${Cde.numero}\n Commande complexe =  ${complexCde} \n Date souhait =${Cde.dateSouhait}');
   print (' Code Produit = ${Cde.codeProduit} \n Code Client = ${Cde.codeClient} \n Date production idéale =   ${dateProdIdealeCde} ');



   // on associe une commande à une disponibilité

   print ('ASSOCIATION COMMANDE-DISPONIBILITE');
   //
   //premier arrivé premier servi : la date de la commande fait foi
   //on essaye de se rapprocher le plus possible de la date de livraison souhaitée

  // for (final c in listeCommandes){
  bool trouve=false;
  var testrouge=0;
  query('#container1').innerHtml= '<table BORDER="2" cellpadding="4"> <tr > <td  WIDTH=\"100px\"  ALIGN=\"center\"> DATE  </td> <td  \" ALIGN=\"center\" WIDTH=\"60px\" > No.Dispo   </td><TD  \" ALIGN=\"center\" WIDTH=\"500px\"> REFERENCES COMMANDES </td> </tr> </table>';
  var tabaffiche = '<table BORDER="10" cellpadding="5">';

  for (final d in mesDispos){
    if(!trouve){
      if (dateProdIdealeCde==d.dateDispo){ //vérifie si date disponible
        if(Cde.complex== true){
          if(d.numeroDispo ==1) {
            tabaffiche = '${tabaffiche} ${d.representerDispo()}';
            //if(d.couleurDispo=='red')
            //  tabaffiche ='${tabaffiche} <tr > <td <TD BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"100px\" >  ${d.dateDispo.year}-${d.dateDispo.month}-${d.dateDispo.day}  </td> <td BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"60px\" > ${d.numeroDispo} </td><TD BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"500px\"> Commande Numéro : ${d.numerocommande}   -- Code client : ${d.codeclient} -- Code Produit : ${d.codeprod} --  complex: ${d.complex} --  Acompte: ${d.acompt} </td> </tr>';
            //else
            //  tabaffiche ='${tabaffiche} <tr > <td <TD BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"100px\" > ${d.dateDispo.year}-${d.dateDispo.month}-${d.dateDispo.day}   </td> <td BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"60px\" > ${d.numeroDispo} </td><TD BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"500px\"> libre    </td> </tr>';
            continue;
            }

            if(d.couleurDispo == 'palegreen'){
              affecterDispo(Cde, d);
             //d.couleurDispo = 'red';
             //d.numerocommande=Cde.numero;
             //d.codeclient=Cde.codeClient;
             //Cde.dateProdConfirmee = d.dateDispo;
             //d.complex=Cde.complex;
             //d.codeprod=Cde.codeProduit;
             //d.acompt=Cde.acompte;

             trouve=true;
            }
            else{

              if (testrouge==0)
                testrouge+=1;
             else {
               dateProdIdealeCde=Cde.dateProdIdeale(1);
             }

           }

         }
         else {
           if(d.couleurDispo == 'palegreen'){
             affecterDispo(Cde, d);
             //d.couleurDispo = 'red';
             //d.numerocommande=Cde.numero;
             //d.codeclient=Cde.codeClient;
             //d.complex=Cde.complex;
             //d.codeprod=Cde.codeProduit;
             //Cde.dateProdConfirmee = d.dateDispo;
             //d.acompt=Cde.acompte;

             trouve=true;
           }
           else{

             if (testrouge==0 ||testrouge==1)
               testrouge+=1;
             else {
               dateProdIdealeCde=Cde.dateProdIdeale(1);
             }
           }
         }
      }
  }
   else{
  }

  // if(d.couleurDispo=='red')
   //tabaffiche ='${tabaffiche} <tr > <td <TD BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"100px\" >  ${d.dateDispo.year}-${d.dateDispo.month}-${d.dateDispo.day}  </td> <td BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"60px\" > ${d.numeroDispo} </td><TD BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"500px\"> Commande Numéro : ${d.numerocommande} --   Code client : ${d.codeclient} -- Code Produit : ${d.codeprod} -- complex: ${d.complex} --  Acompte : ${d.acompt}</td> </tr>';
   //else
   //tabaffiche ='${tabaffiche} <tr > <td <TD BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"100px\"> ${d.dateDispo.year}-${d.dateDispo.month}-${d.dateDispo.day}   </td> <td BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"60px\" > ${d.numeroDispo} </td><TD BGCOLOR=\" ${d.couleurDispo} \" ALIGN=\"center\" WIDTH=\"500px\"> libre    </td> </tr>';
  tabaffiche = '${tabaffiche} ${d.representerDispo()}';
  }


  tabaffiche='${tabaffiche} </table>';
  query('#container').innerHtml='';
  query('#container').innerHtml= tabaffiche;
  tabaffiche='';
  print (' Date de production confirmée = ${Cde.dateProdConfirmee}');

  if(Cde.dateProdConfirmee == null){
  query("#text").text ='ATTENTION ! ! : augmenter date souhait';
  query("#text3").text ='ATTENTION ! : augmenter date souhait';
  list3.removeAt(ii-1);}
  print('***********************   $list3');
  }
  else print('\n   ERREUR DE SAISIE DES COMMANDES');
  }

  affecterDispo (Commande c,Disponibilite d){
    print ('La commande numéro ${c.numero}/ ${c.codeProduit}/ ${c.codeClient}/ à livrer le ${c.dateSouhait} - produit complexe : ${c.complex} ') ;
    c.dateProdConfirmee = d.dateDispo;
    c.isConfirmed();
    d.couleurDispo = d.coloryDispo(c);
    c.dispo=d;
    d.commande =c;
    print ('sera produite le ${d.codeDispo}. Niveau confirmation : ${d.couleurDispo}');
  }

}
