# Get-RandomGear

Script PowerShell permettant de récupérer une vitesse aléatoirement et de choisir entre une rétrogradation ou un passage de vitesse.

Par défaut, le choix de la vitesse se fait entre 1 et 6.

## Syntaxe

```POWERSHELL
.\Get-RandomGear.ps1
    [[-MaxGear] <int>]
    [<CommonParameters>]
```

## Paramètre

__-MaxGear__

Spécifie une valeur entière strictement supérieure à 1 précisant le choix de la vitesse maximale souhaitée.

La valeur par défaut de ce paramètre est 6.

Ce paramètre n'est pas obligatoire.
 
## Exemple 1

### Commande:
```POWERSHELL
.\Get-RandomGear.ps1
```

### Résultat:

Le script retourne une vitesse et une action.

```POWERSHELL
Gear GearBoxAction
---- -------------
   4 Down
```
## Exemple 2

### Commande:
```POWERSHELL
.\Get-RandomGear.ps1 -MaxGear 5
```

### Résultat:

Le script retourne une vitesse entre 1 et 5 et une action.

```POWERSHELL
Gear GearBoxAction
---- -------------
   1 Up
```

## Exemple 3

### Commande:
```POWERSHELL
for ( ($i = 0); $i -lt 10; $i++ ){
    .\Get-RandomGear.ps1
    Start-Sleep -Seconds 1
}
```

### Résultat:

Le script retourne une vitesse et une action 10 fois avec une pause de 1 seconde entre chaque retour.

```POWERSHELL
Gear GearBoxAction
---- -------------
   2 Up
   3 Up
   2 Down
   5 Down
   2 Down
   5 Up
   1 Up
   6 Down
   6 Down
   6 Down
```

## Note

Ce script a été conçu dans l'objectif de s'entraîner, avant une séance de conduite, au bon placement de la main lors des passages de vitesse et des rétrogradations.

Une fois que le script retourne une vitesse et une action, l'idée est de placer sa main instinctivement de la façon la plus optimale pour effectuer l'action en question.