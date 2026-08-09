# Cypress USB2IDE Adapter (in a Trekstore USB Harddisk)

## - Description

Das Gehäuse einer älteren TrekStor USB-Festplatte enthält typischerweise eine herkömmliche 3,5-Zoll- oder 2,5-Zoll-IDE-Festplatte sowie eine Cypress-Bridge-Platine (USB-zu-IDE-Konverter). Diese Platine basiert meistens auf dem weit verbreiteten Cypress FX2-Chipsatz (wie dem CY7C68013A), welcher die IDE-Signale der Festplatte für den USB-2.0-Anschluss übersetzt. \[1, 2, 3\]
Wenn Sie Probleme beim Zugriff auf Ihre Daten haben, das Laufwerk nicht erkannt wird oder Sie die alte Hardware weiternutzen möchten, helfen Ihnen die folgenden Schritte bei der Diagnose und Datenrettung:

## Häufige Fehlerursachen überprüfen

* Defektes Netzteil: Ältere 3,5-Zoll-Festplatten von TrekStor benötigen eine externe Stromversorgung über ein Netzteil (häufig mit einem 4-Pin-Mini-DIN-Stecker, der 5V und 12V liefert). Wenn die Festplatte gar nicht erst hochläuft (kein Summen oder Vibrieren), ist meist dieses Netzteil defekt. \[4\]
* Probleme mit dem Cypress-Controller: Wenn die Platine im Gehäuse altert, verliert das System oft die Zuordnung. Unter Windows wird die Festplatte dann im Geräte-Manager eventuell nur noch als unvollständiges „Cypress USB2IDE“ oder als unbekanntes Gerät ohne Laufwerksbuchstaben angezeigt. \[5\]
* Fehlerhafte Treiber/Firmware: Der im Konverter verbaute Cypress-Chip benötigt unter modernen Betriebssystemen Standard-Massenspeichertreiber. Manchmal verliert die Controller-Platine jedoch ihre Firmware im EEPROM, wodurch sie nicht mehr korrekt als Massenspeicher erkannt wird. \[2, 5\]

## Daten retten: Die Festplatte direkt auslesen

Der sicherste und schnellste Weg, um an Ihre Daten zu gelangen, ist der Ausbau der internen Festplatte:

   1. Gehäuse öffnen: Lösen Sie die Schrauben des TrekStor-Gehäuses (oft unter den Gummifüßen versteckt) und schieben Sie den internen Rahmen heraus.
   2. Platine entfernen: Trennen Sie die grüne Cypress-Controller-Platine vorsichtig von der Rückseite der eigentlichen Festplatte. Zum Vorschein kommt der breite, mehrpolige IDE-Anschluss (PATA) der Festplatte. \[6, 7\]
   3. Modernen Adapter nutzen: Schließen Sie die nackte Festplatte an einen modernen, universellen USB-zu-IDE/SATA-Adapter an. Diese Adapter bringen eine eigene, stabile Stromversorgung mit und umgehen den fehlerhaften Cypress-Chip vollständig. \[8\]

## Wichtige Hinweise beim Direktanschluss

* Jumper-Einstellung: Achten Sie darauf, dass der kleine Plastikblock (Jumper) an der Rückseite der Festplatte auf Master oder Single gesetzt ist. Eine falsche Jumper-Konstruktion blockiert an vielen USB-Adaptern die Erkennung.
* Dateisystem: Ältere TrekStor-Platten nutzen meist das Dateisystem FAT32 oder NTFS. Diese können von jedem modernen Windows-, Mac- oder Linux-PC problemlos direkt ausgelesen werden. \[7, 9\]

\[1\] [https://atariwiki.org](https://atariwiki.org/wiki/Wiki.jsp?page=DeviceMatrix)<br/>
\[2\] [https://www.siphec.com](http://www.siphec.com/project/USB2ATA/index.html)<br/>
\[3\] [https://www.utsource.net](https://www.utsource.net/itm/p/1557030.html)<br/>
\[4\] [https://www.amazon.de](https://www.amazon.de/netzteil-festplatte-trekstor/s?k=netzteil+festplatte+trekstor)<br/>
\[5\] [https://wiki.gbatemp.net](https://wiki.gbatemp.net/wiki/USB_Devices_Compatibility_List)<br/>
\[6\] [https://forums.tomshardware.com](https://forums.tomshardware.com/threads/hard-drive-and-the-sata-ide-to-usb-2-0-adapter.3539357/)<br/>
\[7\] [https://superuser.com](https://superuser.com/questions/1704380/how-to-use-an-usb-to-ide-adapter-to-connect-old-hard-drives-to-laptop-through-us)<br/>
\[8\] [https://www.youtube.com](https://www.youtube.com/watch?v=YrevfOXV3Pk)<br/>
\[9\] [https://www.vogons.org](https://www.vogons.org/viewtopic.php?t=91515)<br/>
