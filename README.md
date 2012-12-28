Cette application permet de remplir un calendrier de production en fonction des disponibilit�s, de v�rifier toutes les erreurs de saisie possibles, de parcourir le calendrier,� de cr�er une commande, de chercher une disponibilit�,� de confirmer une date de production, d'actualiser et d'afficher� le calendrier de production.  La page s'ouvre avec les champs d�j� saisies  par d�faut,  � modifier  selon les besoins. 

Veillez pr�ter attention aux messages d�erreurs  de saisie  qui  viendraient �ventuellement remplacer le message ��saisie OK��

1. On d�finit d'abord le calendrier des disponibilit�s de production : une plage de dates est calcul�e � partir d'une date de d�but et d'un nombre de jours. Le nombre de disponibilit�s est de trois par jours, sauf les samedis et dimanches

2.  On saisit ensuite les commandes en portefeuille : une commande comporte un num�ro (unique), r�f�re � un client identifi� par son code, comporte une date de cr�ation et une date souhait�e de livraison. Une liste de produit est initialis�e dans le projet. Ceci permet la s�lection du produit command�.

3. Le calcul de la date de production tient compte d'un d�lai de 4 jours (constante dans le code). Une disponibilit� "verte" indique qu'aucune production n'y est associ�e. Une disponibilit� "orange" indique qu'une commande dont l'acompte n'est pas vers� y est associ�e. Une disponibilit� "rouge" indique qu'une commande dont l'acompte est vers� y est associ�e.

NB, chaque journ�e  comporte 3 disponibilit�s, la production d�une commande dont le produit est complexe ne peut �tre confirm�e pour  le d�but de journ�e. 

