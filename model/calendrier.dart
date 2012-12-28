part of PlanProd_model;

//le calendrier de production consiste en une série de dates comprises entre la dateDebut et la dateFin. On définit également le nombre
//de production par défaut pour tous les jours sauf les samedis et dimanches.

class Calendrier {
  Date dateDebut;
  int nbJours;
  Date dateFin;
  List dates;
  Map calProd;
  

  getDateFin () {
      
    if (this.dateDebut == null){
      dateFin = null;
    }
    else {
      dateFin = new Date(this.dateDebut.year,this.dateDebut.month,this.dateDebut.day + this.nbJours);
    }
    return dateFin;
  }
 
  getDates (){//retourne une liste des dates du calendrier
    dates = new List<Date>(this.nbJours);
    for (var i=0;i<this.nbJours;i++ ){
      dates[i]= new Date (this.dateDebut.year, this.dateDebut.month, this.dateDebut.day+i);
    }
    return dates;
  }


  getCalProd () {//retourne une Map associant une date du calendrier, et un nombre de disponibilités de production pour cette date
    var calProd = new Map <Date, int>  ();
    getDates();
    for (final d in dates){      
      int nbDispos = 3; //pour simplifier le problème : nb de productions possibles par jour par défaut         
      if (d.weekday == 6 || d.weekday ==7){ //pas de productions les samedis et dimanches
        nbDispos = 0;
      }
      calProd[d]=nbDispos;  
    }
    
    return calProd; 
  }
}
