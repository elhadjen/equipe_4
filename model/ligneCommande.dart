part of PlanProd_model;


class Commande {//pour simplifier, une commande concerne un seul produit
  
  const delaiMt = 3; //en jours, délai pour arrivée matière
  const delaiProd = 4 ;//en jours, délai de production
  
  
  String numero;// selon ordre d'arrivée des commandes, chronologique
  String codeClient;
  String codeProduit;
  int anneeCde, moisCde, jourCde;// à saisir pour date de commande
  int anneeSht, moisSht, jourSht;// à saisir pour date de livraison souhaitée
  Date dateSouhait;
  Date dateProd;
  bool acompte;
  Date dateMatiere;
  bool complex;
  Date dateProdConfirmee;
  bool confirmed;
  Disponibilite dispo;
 
  Commande (produits, this.numero, this.codeClient, this.codeProduit, this.anneeCde, this.moisCde, this.jourCde, this.anneeSht, this.moisSht, this.jourSht, this.acompte){
    //print ('$numero $codeClient $codeProduit');
    dateSouhait = new Date(this.anneeSht,this.moisSht,this.jourSht);
    dateProd=new Date(this.anneeSht, this.moisSht, this.jourSht-delaiProd);
    dateMatiere = new Date(this.anneeSht, this.moisSht,this.jourSht-delaiMt-delaiProd);
    complex = this.isComplex(produits);
    confirmed = this.isConfirmed();
  }
  
  bool isComplex (produits){
    var code = this.codeProduit;
    //print (code);
    var produit = produits[code];//.getProduitParCode(code);
    complex = false;
    if (produit.isComplex){
      complex = true;
    }
    return complex;
  }
  
  confirmerAcompte (){// pour interface
    this.acompte = true;
    //print ('${this.numero} ${this.acompte}');
    this.isConfirmed();
  
  }
    
  bool isConfirmed (){
    confirmed = false;
    if (dateProdConfirmee!= null && this.acompte == true){
      confirmed=true;
    }
    return confirmed;
  }
  
  
  Map creerMaCommande (){
    var maCommande = new Map ();
    maCommande[this.numero]=this;
    return maCommande;
  }
  
  Date dateProdIdeale (num x){

    var prodIdeal = new Date(anneeSht, moisSht, jourSht-delaiProd+x);
    if (prodIdeal.weekday == 6 ){prodIdeal = new Date(anneeSht, moisSht, jourSht-delaiProd+2+x);}
    if (prodIdeal.weekday == 7 ){prodIdeal = new Date(anneeSht, moisSht, jourSht-delaiProd+1+x);}
    return prodIdeal;

  }
  
}

class Commandes  {

  var commandes = new Map<String,Commande>();//CORRIGÉ V3
  var compteur=0; 
  
  add (Commande commande){//MODIFIE V3
    compteur = compteur+1;
    commande.numero = (compteur).toString();
    print (commande.numero);
    var num = commande.numero;
    commandes[num]=commande;
 
    //print (commandes);
    return commandes;
  } 
    
  getCommandeParNumero (x){
    var commande = commandes[x];
    return commande;
  } 
  
  supprimerCommande(x) {//AJOUT V3
    var commande = commandes[x];  
    var dispo = commande.dispo;
    dispo.couleur = 'palegreen';
    commandes.remove(x);
  } 

  getLongueur (){
    var longueur = commandes.length;
    return longueur;
  } 
  
}