part of PlanProd_model;


class Produit {
  String codeProduit;
  String nomProduit;
  bool isComplex;
  
  Produit(this.codeProduit, this.nomProduit, this.isComplex);
 
}

class Produits {
  
  Map produits;
  
  Produits (){
    produits = new Map<String,Produit>();
  }
    
  add (Produit produit){
    var code = produit.codeProduit;
    produits[code]=produit;
    //print (produits);
    return produits;
  } 
    
  getProduitParCode (x){
    var produit = this.produits[x];
    return produit;
  }

  supprimerProduit(x){//AJOUT V3
    produits.remove(x);
    return produits;
  }  
  

  getLongueur (){
    var longueur = produits.length;
    return longueur;
  } 
  
  getOptionsProduits(){
    List listeOptions = new List();
    produits.forEach((k,v) => listeOptions.add(k));
    var options ='';
    for (final e in listeOptions){
      options = '$options <option>$e</option>\n';
    }
    return options;
  }
}