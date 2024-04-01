
<#PSScriptInfo

.VERSION 1.0.0

.GUID 9cbe7cb9-a403-4a38-b8b2-f5e360f53444

.AUTHOR Christopher GERARD

.COMPANYNAME

.COPYRIGHT Copyright 2024 Christopher GERARD

.TAGS

.LICENSEURI

.PROJECTURI

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

<# 

.SYNOPSIS
Script permettant de récupérer une vitesse aléatoirement et de choisir entre une rétrogradation ou un passage de vitesse.

.DESCRIPTION 
Script permettant de récupérer une vitesse aléatoirement et de choisir entre une rétrogradation ou un passage de vitesse.

.PARAMETER MaxGear
Spécifie une valeur entière strictement supérieure à 1 précisant le choix de la vitesse maximale souhaitée.

.EXAMPLE
PS> .\Get-RandomGear.ps1

Gear GearBoxAction
---- -------------
   4 Down

Cette commande retourne une vitesse comprise entre 1 et 6 et une action qui peut être soit un passage de vitesse, soit une rétrogradation.

.EXAMPLE
PS> .\Get-RandomGear.ps1 -MaxGear 5

Gear GearBoxAction
---- -------------
   1 Up

Cette commande retourne une vitesse comprise entre 1 et 5 (si un véhicule ne dispose que de 5 vitesses par exemple) et une action qui peut être soit un passage de vitesse, soit une rétrogradation.

.EXAMPLE
PS> for ( ($i = 0); $i -lt 10; $i++ ){
    .\Get-RandomGear.ps1
    Start-Sleep -Seconds 1
}

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

Cette commande permet de jouer le script 10 fois avec une pause de 1 seconde entre chaque exécution. Elle permet de retourner 10 fois une vitesse comprise entre 1 et 6 et une action qui peut être soit un passage de vitesse, soit une rétrogradation.

.OUTPUTS
System.Management.Automation.PSCustomObject

.NOTES
Ce script a été conçu dans l'objectif de s'entraîner, avant une séance de conduite, au bon placement de la main lors des passages de vitesse et des rétrogradations.

Une fois que le script retourne une vitesse et une action, l'idée est de placer sa main instinctivement de la façon la plus optimale pour effectuer l'action en question.

#>
[CmdletBinding()]
Param(
    # Choix de la vitesse maximale
    [Parameter(Mandatory=$false, HelpMessage="Paramètre permettant de choisir une vitesse maximale")]
    [ValidateScript({
        $_ -gt 1
    })]
    [int]
    $MaxGear = 6
)

$gear = Get-Random -Minimum 1 -Maximum $($MaxGear+1)

if ($gear -eq $MaxGear){
    $gearBoxAction = "Down"
}
elseif ($gear -eq 1) {
    $gearBoxAction = "Up"
}
else{
    $gearBoxAction = "Up", "Down" | Get-Random
}

$results = [PSCustomObject]@{
    Gear          = $gear;
    GearBoxAction = $gearBoxAction
}

return $results