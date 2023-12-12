# Base_donnee_FFLEX
Création d'un base de donnée de streaming vidéo


### Assemble de requète:

Afficher tous les films disponibles.

`SELECT type, nom from media where type = '0';`
 > type 0 correspond au type film

`SELECT type, nom, dispo from media where type = '0' AND dispo = '1';`
 > type 1 correspond au film qui sont disponible

Afficher les films non disponibles.
`Select type, nom , dispo from media where type = '0' and dispo = '0';`


Consulter la liste des films déjà loués.
