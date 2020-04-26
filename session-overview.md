# Übersicht der Sessions

Die mit "Referat" gekennzeichneten Themen sind Beiträge (Seminarleistungen) der TeilnehmerInnen. Zur Vorbereitung der Referate sollten die angegebenen Ressourcen ausgewertet werden. Natürlich können Sie zusätzlich auch auf eigene Quellen zurückgreifen. Alle weiteren genannten Themen werden vom Dozenten vorbereitet.

Weiterhin wird je Sitzung eine Übungsaufgabe bis zur nächsten Sitzung gestellt ('Hausaufgabe'). Die Aufgabe hilft Ihnen dabei den Gebrauch grundlegender Features und Funktionen einzuüben. In der jeweiligen Folgesitzung werden die Ergebnisse möglichst von mehreren TeilnehmerInnen vorgestellt.

Jede Session (mit Ausnahme der ersten) besteht aus folgenden Teilen:

- Vorstellung der 'Hausaufgabe' durch 1-3 TeilnehmerInnen
- Referat TeilnehmerInnen
- Erläuterungen, Präsentation des Dozenten
- Pair Programming: gemeinsames Arbeiten an (Abschluss-)Projekt in Gruppen von jeweils zwei TeilnehmerInnen

Die folgende Seminarübersicht ist vorläufig und wird je nach Interesse und Lernstand angepasst.

## Session 1: Einstieg

Datum: 16.10.2019

- Vorstellung der TeilnehmerInnen und des Dozenten
- Organisatorisches
- Demo und Einführung in Sonic Pi
- Erste Klänge (`play`, `sleep`,`attack`, `release`, `sustain` und `live_loop`')
- Hausaufgabe: Experimentiert mit `play`, `sleep`,`attack`, `release`, `sustain` (ohne Schleife)

### Ressourcen

- Sonic Pi-Dokumentation "Tutorial" und "Beispiele"
- Blogbeitrag zu Sonic Pi anlässlich der Re:publica (Berlin, 2016) mit Vortrag, Folien und Code-Beispielen,  http://www.mkblog.org/2016/05/04/republica-ten-hoerbar-programmieren-mit-sonic-pi/
- Kyle Kingsbury: Core language concepts, https://aphyr.com/posts/266-core-language-concepts

## Session 2: Synthesizer in Sonic Pi, live_Loop, tick & look

Datum: 30.10.2019

- Präsentation der Hausaufgabe vom 16.10.
- Referat: Synthesizer (Grundlagen, Bestand in Sonic Pi)
- `use/with_synth`, `use/with_synth_defaults`, `live_loop`, `tick`, `look`
- Pair Programming
- Hausaufgabe: Baut einen einfachen Sequencer mit `tick` und `look`, `if` oder `amp`

### Referat

- Grundbegriffe der Klangerzeugung durch Synthesizer mit Hinblick auf Sonic Pi.
    - Sinuston und Obertöne
    - Grundkomponenten eines Synthesizers (Oscillator, Filter, Amplifier, Envelope, LFO)
    - Wellenformen, Modulation, Hüllkurve, Filter
    - Additive und subtraktive Synthese
    - Synthesizer in Sonic Pi
    - Klangbeispiele mit Modifikationen der Hüllkurve
    - Demonstration und Erläuterung der ausgewählter Parameter (z. B. `synth :fm`)

### Ressourcen

- Sonic Pi-Dokumentation Kap. 2 "Synths"
- Wolfgang Saus, Die Obertonreihe, http://www.oberton.org/obertongesang/die-obertonreihe/ 
- Sound on Sound, Synth Secrets, http://www.soundonsound.com/sos/allsynthsecrets.htm
- Overtones, harmonics and Additive synthesis, https://www.youtube.com/watch?v=YsZKvLnf7wU&list=PL0CF041F562C5BE5E
- ADSR envelope synth tutorial part A:  https://www.youtube.com/watch?v=A6pp6OMU5r8&list=PL0CF041F562C5BE5E&index=2
- ADSR envelope synth tutorial part B: https://www.youtube.com/watch?v=9niampRkFW0&index=3&list=PL0CF041F562C5BE5E
- A Young Person's Guide to the Principles of Music Synthesis by Beau Sievers http://beausievers.com/synth/synthbasics/

## Session 3: Samples in Sonic Pi, Live_Loop-Synchronisation

Datum: 13.11.2019

- Präsentation der Hausaufgabe vom 30.10.
- Referat: Samples in Sonic Pi (Einbindung, Parameter, externe Samples)
- Sample-Parameter und Slicing
- Synchronisation von Live-Loops (Codebeispiele mit Erläuterungen)
- Pair Programming
- Hausaufgabe: Arbeit mit einem selbstaufgenommenen oder mitgelieferten Sample

### Referat

- Sampling
    - Grundbegriffe
    - Samples in Sonic Pi (Bestand, Parameter, Beispiele)
    - Einbindung externer Samples

### Ressourcen

- Sonic Pi-Hilfe zu `sample` etc. und Tutorial "3 Samples"
- Nyquist and sampling quality: https://www.youtube.com/watch?v=pKa_m9KGB98&t=1m12s, https://www.youtube.com/watch?v=kLZqo1xwOWs
- "Can I Get Another Amen", Dokumentarfilm über den Amen Break von Nate Harrison, https://archive.org/details/NateHarrisonCanIGetAnAmen

## Session 4: Filter und Effekte in Sonic Pi, Musiktheorie

Datum: 27.11.2019

- Präsentation der Hausaufgabe vom 13.11.
- Referat: Filter und Effekte in Sonic Pi
- Synchronisation von `live_loops`
- Linearer Ablauf mit `in_thread`
- Nach Absprache im Seminar: Tonmaterial, Skalen, Akkorde und Akkordfolgen (kurze Einführung in die Musiktheorie mit Sonic Pi, siehe dazu: https://tobyrush.com/theorypages/
- Pair Programming
- Hausaufgabe: Verwendet einen einzelnen Ton oder eine einfache Melodie als Grundlage, dann  Soundmanipulation nur mit einem oder zwei Filtern, Automatisierung mithilfe von `tick` und 'look'

### Referat

- Filter und Effekte in Sonic Pi
    - grundsätzliche Anwendung (`with_fx`) und ausgewählte Parameter
    - Klangbeispiele mit unterschiedlichen Filtern und Parametern

### Ressourcen

- Sonic Pi-Hilfe zu `with_fx` etc. und Tutorial Kap. 6 "Effekte"
- Einführung in die Musiktheorie, kurze Einführung als PDF: http://www.2felsfrei.de/attachments/024_musiktheorie.pdf
- Music Theory for Musicians and Normal People, by Toby W. Rush, http://tobyrush.com/theorypages/

## Session 5: Elektronische Musik I, Organisation und Ablaufsteuerung von Code II

Datum: 11.12.2019

- Präsentation der Hausaufgabe von 27.11.
- Referat: Elektronische Musik I am Beispiel von "Kontakte" von Karlheinz Stockhausen
- Wiederholung des Materials aus vorhergehenden Sessions (Tonfolgen, Effekte, `live_loop`, `in_thread` etc.)
- Pair Programming
- Hausaufgabe: Spaß mit einem Sample, Echo und/oder Reverb

### Referat

- Karheinz Stockhausen: Kontakte

### Ressourcen

- WDR3 Studio Elektronische Musik Stockhausen - Kontakte, Radio-Feature online:  https://www.youtube.com/watch?v=kBP1v29cx60
- Karlheinz Stockhausen (1978): Die vier Kriterien der elektronischen Musik, in: Texte zur Musik, Bd. 4, Köln: DuMont, S. 360-401; als Skript eines Vortrag vom 14.09.72 online: http://www.elektropolis.de/ssb_story_stockhausen.htm; zum 1. Kriterium "Die Komposition im musikalischen Zeitnkontinuum": https://youtu.be/JiNKlhspdKg?t=612
- The Earth-Shaking Instrument Stockhausen Used | Rohde & Schwarz UBM, Hainbach, https://www.youtube.com/watch?v=En24uIjiGsg
- Analysis, explanation and personal impressions of the works of the avant-garde composer Karlheinz Stockhausen. KONTAKTE - Electronic Music Techniques, http://stockhausenspace.blogspot.com/2018/03/kontakte-electronic-music-techniques.html?m=1
- Sirius FM - Expedition an den Bandtellerrand, WDR 3 Hörspiel. 11.01.2020. 53:13 Min: Ein Expeditionsteam fliegt vom Sirius zur Erde. Seine Mission: Die Suche nach dem "Studio für Elektronische Musik", dem sagenumwobenen Soundlabor im WDR. Ein Hybrid aus Reportage und Science-Fiction-Hörspiel u. a. mit O-Tönen von Karlheinz Stockhausen. Von Ulrich Bassenge und Philip Stegers, WDR 2017
- Polyrhythms; a presentation of Adam Neely about how the harmony of the spheres, Isaac Newton, and polyhythms are connected at Berlin, Ableton Loop, March 27, 2018, http://cdm.link/2018/03/watch-ableton-loop-talk-connects-polyrhythms-synesthesia/ (insbesondere zum 1. Kriterium der elektronischen Musik nach Stockhausen)

## Session 6: Elektronische Musik II: Electronica, musikalische Analyse

Datum: 08.01.2020

- Präsentation der Hausaufgabe von 11.12.
- Referat: Elektronische Musik II, "Advice to clever children": Aphex Twin, Plasticman, Scanner, Daniel Pemberton u.a.
- Musikalische Analyse und Nachbau in Sonic Pi ([SonicVisualizer](https://github.com/mbutz/sonicpi-leuphana-ws1617/tree/master/sonic-visualiser), Codebeispiele und Erläuterungen zu Nachbau von [Digital Bubblebath](https://www.youtube.com/watch?v=Fy8h3kSef1E)/[Nachbau](https://soundcloud.com/mbutz/digital-bubblebath) und [Otaku](https://www.youtube.com/watch?v=OYusX7V1SaI)/[Nachbau](https://soundcloud.com/mbutz/otaku-1-from-series-rec-with-sonic-pi))
- Pair Programming
- Hausaufgabe: Freude mit Skalen und/oder Akkorden

### Referat

- Text: "Advice to clever children" (Leitfragen: Welche Unterschiede in der Konzeption von 'elektronischer Musik' werden deutlich? Welche Gemeinsamkeiten gibt es?)

### Ressourcen

- Interview mit Karlheinz Stockhausen, 'Advice to clever children', "The Wire", November 1995, https://utah.instructure.com/files/44337462/download?download_frd=1
- Karlheinz Stockhausen, Gesang der Jünglinge, https://www.youtube.com/watch?v=nffOJXcJCDg

## Session 7: Sonic Pi mit Midi & OSC erweitern - Rückblick

Datum: 22.01.2020

- Präsentation der Hausaufgabe vom 08.01.
- Midi und OSC: Sonic Pi mit externen Geräte ansteuern (z. B. Midi-Controller) oder externe Geräten steuern (z. B. Hard- oder Software-Synthesizer)
- Vorstellung der vorläufigen Arbeitsergebnisse
- Rekapitulation
- Offene Fragen

---

## Ergänzende Literatur und Links (Ressources and Good Reads)

Über die Jahre habe ich Ressourcen gesammelt, auf die ich auch immer wieder selbst zurückgreife. Die Themen umfassen u. a.: 

[Sonic Pi, Live Coding, Synthesizer, Klangsynthese, Musiktheorie, Akustik, Ästhetik, Software, Sampes und mehr](https://github.com/mbutz/sonicpi-leuphana-ws1920/blob/master/resources-and-good-reads.md)
