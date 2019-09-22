# Informationen zu Prüfungsleistungen

Ästhetik, Regel, Klang - Musikprogrammierung mit Sonic Pi, WS 19/20

## Sonic Pi-Programm

* Code-Beispiel für die Arbeit mit Sonic Pi; verschiedene Vorschläge, was ihr machen könnten, findet ihr hier: [Projekt-Ideen](https://github.com/mbutz/sonicpi-leuphana-ws1819/blob/master/01-session-2019-10-16/project-ideas.md)
  * Wenn Ihr Samples verwendet, bitte diese wie folgt oben in der Datei einbinden:

```
# Name des Pfades/Ordners, in dem ihr die Dateien abgelegt habt, Pfad auf eurer Festplatte
path = "c:/pfad/zum/verzeichnis/"

# Samples können dann weiter unten im Code entweder mit Index oder mit Dateinamen bzw. Teil
# eingebunden werden, z. B.

live_loop :mein_sample do
  sample path, 0, beat_stretch: 8
  sample path, "drum-beat", beat_stretch: 8
  sleep 8
end

```

* Code-Beispiele, an denen ich mehr ändern muss als lediglich die Pfadangabe oben in der Datei, kann ich nicht annehmen.
* Code als Datei mit der Endung '.txt' oder '.rb' sowie Samples bitte per Email an mb@mkblog.org; sollten die Samples zu groß als Anhang sein, dann bitte per 'Wetransfer', 'dropbox' oder auf ähnliche Weise. 

## Dokumentation bzw. Reflexion 

* mit einem Umfang von ca. 5 Din A4-Seiten nach wissenschaftlichen Standards (d. h. korrekte Quellenangaben)
* Dies kann unterschiedliches sein z. B.:
  * Gedanken zu Themen der einzelnen Sessions
  * Dokumentation zu eurem Code-Beispiel (wie seid ihr vorgegangen, welche ästhetischen Überlegungen habt ihr angestellt usw.)
  * Vergleich Sonic Pi mit anderen Software-Lösungen

## Termine für die Prüfung

* Prüfungstermin: Samstag, 01.02.2020 - Sonntag, 15.03.2020
* Wiederholungstermin: Freitag, 22.05.2020 - Sonntag, 21.06.2020
