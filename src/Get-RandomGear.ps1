
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

.DESCRIPTION 
 Script permettant de récupérer une vitesse aléatoirement et de choisir entre une rétrogradation ou un passage de vitesse 

#>
[CmdletBinding()]
Param(
    # Choix de la vitesse maximale
    [Parameter(Mandatory=$false, HelpMessage="Paramètre permettant de choisir une vitesse maximale")]
    [int]
    $MaxGear = 6,

    # Vitesse de rafraichissement
    [Parameter(Mandatory=$false, HelpMessage="Paramètre permettant de définir une vitesse de rafraichissement du script")]
    [int]
    $RefreshSpeed
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
