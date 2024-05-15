@echo off
echo Nettoyage des tables de routage de toutes les routes
route -f >nul 2>nul
echo.

echo Libération de l'adresse IP
ipconfig /release >nul 2>nul
echo.

echo Renouvellement de l'adresse IP
ipconfig /renew >nul 2>nul
echo.

echo Vidage du cache du protocole de résolution d'adresses (ARP)
arp -d * >nul 2>nul
echo.

echo Rechargement du cache des noms NetBIOS
nbtstat -R >nul 2>nul
echo.

echo Envoi de la mise à jour du nom NetBIOS
nbtstat -RR >nul 2>nul
echo.

echo Vidage du cache du système de noms de domaine (DNS)
ipconfig /flushdns >nul 2>nul
echo.

echo Enregistrement du nom DNS
ipconfig /registerdns >nul 2>nul
echo.

echo Terminé.
pause