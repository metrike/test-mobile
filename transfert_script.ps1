# Définir les chemins source et destination
$source = "C:\Users\A723864\Downloads\test.txt"
$destination = "\\HIOD2K02.htropiques.HSDI.dns21.socgen\ODO_POD$\REQUETAGE\UPDATE\test.txt"

# Vérifie si le fichier source existe
if (-Not (Test-Path -Path $source)) {
    Write-Output "Le fichier source n'existe pas : $source"
    exit 1
}

# Vérifie si le fichier de destination existe
if (Test-Path -Path $destination) {
    Write-Output "Le fichier existe déjà à la destination. Ajout du contenu du fichier source."
    # Ajoute le contenu du fichier source à la fin du fichier de destination
    Get-Content -Path $source | Add-Content -Path $destination
    Write-Output "Contenu ajouté avec succès au fichier de destination."
} else {
    Write-Output "Le fichier n'existe pas à la destination. Déplacement du fichier."
    # Déplace le fichier source vers la destination
    Move-Item -Path $source -Destination $destination
    Write-Output "Fichier déplacé avec succès."
}
