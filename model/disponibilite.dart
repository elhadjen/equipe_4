part of PlanProd_model;

class Disponibilite {
  
  String codeDispo;
  Date dateDispo;
  int numeroDispo;
  String couleurDispo;
  Commande commande;//AJOUT V3
  
  creerCodeDispo(){//MODIFIE V3
    var formatDate = afficherDate(this.dateDispo); 
    codeDispo = '$formatDate-${this.numeroDispo}';
  }
  coloryDispo (Commande c) {
    couleurDispo = 'palegreen';
    if (c.confirmed == true){
      couleurDispo = "red";
    }
    else if (c.dateProdConfirmee != null){
      couleurDispo = "orange";
    }
    return couleurDispo;
    //print (couleurDispo);
    
  }

  afficherDispo()  {
    var dateFormate = dateDispo.toLocal(); 
    var afficheDispo = 'Commande Numéro : ${this.commande.numero}   -- Code client : ${this.commande.codeClient} -- Code Produit : ${this.commande.codeProduit} --  complex: ${this.commande.complex} --  Acompte: ${this.commande.acompte}';//'$codeDispo $dateFormate $numeroDispo $couleurDispo';
    return afficheDispo;

  }
  
  Map creerMaDispo () {
    var maDispo = new Map ();
    maDispo[this.codeDispo]=this;
    return maDispo;

  }
  representerDispo (){
    var coul = this.couleurDispo;
    var date = '${this.dateDispo.year}-${this.dateDispo.month}-${this.dateDispo.day}';
    var num = this.numeroDispo;
    var tabaffiche = '';
    var libel;
    if (coul == 'palegreen'){
      libel = 'libre';                   
    } 
    else {
      libel= this.afficherDispo();
    }
    tabaffiche ='${tabaffiche} <tr > <td <TD BGCOLOR=\" ${coul} \" ALIGN=\"center\" WIDTH=\"100px\" > $date   </td> <td BGCOLOR=\" ${coul} \" ALIGN=\"center\" WIDTH=\"60px\" > ${num} </td><TD BGCOLOR=\" ${coul} \" ALIGN=\"center\" WIDTH=\"500px\"> $libel    </td> </tr>';
    return tabaffiche;
   }
  
  
}

class Disponibilites {

  var dispos = new Map();
  
}
