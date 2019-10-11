# Test technique

## API de rendu de monnaie pour caisses automatiques

On veut écrire un service web qui indique comment rendre la monnaie sur une somme.
Notre service est interrogé par des automates (par exemple, des caisses automatiques) 
chaque fois qu’ils ont une somme à rendre, afin de connaître le nombre de billets et pièces à rendre.
Les sommes sont toujours entières, sans centimes.
Notre service doit indiquer la monnaie optimale (par exemple, 1 billet de 10 au lieu de 5 pièces de 2).

Chaque automate a un nom de modèle, qui définit ses caractéristiques et notamment les billets et pièces auxquels il a accès.
Les modèles supportés actuellement sont :

- le modèle `mk1`, qui n'a accès qu'aux pièces de 1 ;
- le modèle `mk2`, qui n’a accès qu’aux billets de 10, billets de 5 et pièces de 2.

On souhaite que notre application puisse être étendue facilement pour supporter d'autres modèles futurs avec des caractéristiques complètement différentes (par exemple, un automate dont le fonctionnement est décrit par une base de données, ou par une API externe...).

Votre objectif: écrire une API qui puisse être interrogée par les automates pour déterminer la monnaie à rendre.

1. Écrire deux classes `Mk1Calculator` et `Mk2Calculator` qui implémentent `AppBundle\Calculator\CalculatorInterface` 
   pour les modèles d'automates `mk1` et `mk2`.
   Les classes doivent passer les tests unitaires dans `tests/` (executés avec `vendor/bin/phpunit`).
   Ajouter un test `Mk2CalculatorTest::testGetChangeHard`.
1. Écrire une classe `CalculatorRegistry` qui implémente `AppBundle\Registry\CalculatorRegistryInterface`.
1. Écrire le controlleur en utilisant le service `CalculatorRegistry`. 
   Le controlleur doit passer le test fonctionnel dans `features/change.feature` (executé avec `vendor/bin/behat`).

Le projet peut être installé avec `make install`. Vous pouvez utiliser les autres actions du fichier `Makefile` pour valider votre solution.
