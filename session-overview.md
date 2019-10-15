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
- Demo: Sonic Pi
- Organisatorisches
- Erste Klänge (`play`, `sleep`, `live_loop`')

### Ressourcen

- Sonic Pi-Dokumentation "Tutorial" und "Beispiele"
- Blogbeitrag zu Sonic Pi anlässlich der Re:publica (Berlin, 2016) mit Vortrag, Folien und Code-Beispielen,  http://www.mkblog.org/2016/05/04/republica-ten-hoerbar-programmieren-mit-sonic-pi/
- Kyle Kingsbury: Core language concepts, https://aphyr.com/posts/266-core-language-concepts

## Session 2: Synthesizer in Sonic Pi, live_Loop, tick & look

Datum: 30.10.2019

- Präsentation der Hausaufgabe vom 16.10.
- Referat: Synthesizer (Grundlagen, Bestand in Sonic Pi)
- `live_loop`, `tick`, `look`
- Pair Programming

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
- Nach Absprache im Seminar: Tonmaterial, Skalen, Akkorde und Akkordfolgen (kurze Einführung in die Musiktheorie mit Sonic Pi)
- Pair Programming

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

### Referat

- Karheinz Stockhausen: Kontakte

### Ressourcen

- WDR3 Studio Elektronische Musik Stockhausen - Kontakte, Radio-Feature online:  https://www.youtube.com/watch?v=kBP1v29cx60
- Karlheinz Stockhausen (1978): Die vier Kriterien der elektronischen Musik, in: Texte zur Musik, Bd. 4, Köln: DuMont, S. 360-401; als Skript eines Vortrag vom 14.09.72 online: http://www.elektropolis.de/ssb_story_stockhausen.htm
- The Earth-Shaking Instrument Stockhausen Used | Rohde & Schwarz UBM, Hainbach, https://www.youtube.com/watch?v=En24uIjiGsg
- Polyrhythms; a presentation of Adam Neely about how the harmony of the spheres, Isaac Newton, and polyhythms are connected at Berlin, Ableton Loop, March 27, 2018, http://cdm.link/2018/03/watch-ableton-loop-talk-connects-polyrhythms-synesthesia/ (insbesondere zum 1. Kriterium der elektronischen Musik nach Stockhausen)

## Session 6: Elektronische Musik II: Electronica, musikalische Analyse

Datum: 08.01.2020

- Präsentation der Hausaufgabe von 11.12.
- Referat: Elektronische Musik II, "Advice to clever children": Aphex Twin, Plasticman, Scanner, Daniel Pemberton u.a.
- Musikalische Analyse und Nachbau in Sonic Pi ([SonicVisualizer](https://github.com/mbutz/sonicpi-leuphana-ws1617/tree/master/sonic-visualiser), Codebeispiele und Erläuterungen zu Nachbau von [Digital Bubblebath](https://www.youtube.com/watch?v=Fy8h3kSef1E)/[Nachbau](https://soundcloud.com/mbutz/digital-bubblebath) und [Otaku](https://www.youtube.com/watch?v=OYusX7V1SaI)/[Nachbau](https://soundcloud.com/mbutz/otaku-1-from-series-rec-with-sonic-pi))
- Pair Programming

### Referat

- Text: "Advice to clever children" (Leitfragen: Welche Unterschiede in der Konzeption von 'elektronischer Musik' werden deutlich? Welche Gemeinsamkeiten gibt es?)

### Ressourcen

- Interview mit Karlheinz Stockhausen, 'Advice to clever children', "The Wire", November 1995, http://www.stockhausen.org/ksadvice.html
- Karlheinz Stockhausen, Gesang der Jünglinge, https://www.youtube.com/watch?v=nffOJXcJCDg

## Session 7: Sonic Pi mit Midi & OSC erweitern - Rückblick

Datum: 22.01.2020

- Präsentation der Hausaufgabe vom 08.01.
- Midi und OSC: Sonic Pi mit externen Geräte ansteuern (z. B. Midi-Controller) oder externe Geräten steuern (z. B. Hard- oder Software-Synthesizer)
- Vorstellung der vorläufigen Arbeitsergebnisse
- Rekapitulation
- Offene Fragen

## Weitere Ressourcen zum Seminar

### Sonic Pi

* Homepage von Sonic Pi: http://sonic-pi.net/
* Offizielle Sonic-Pi-Community: https://in-thread.sonic-pi.net
* Anlaufstelle für Entwickler: https://github.com/samaaron/sonic-pi
* Sonic Pi-Tutorial online: https://sonic-pi.net/tutorial.html#section-1
* Ideen und Beispiele für Sonic Pi (laufend erweiterte Sammlung von M. Butz): https://github.com/mbutz/sonic-pi-resources
* Libraries für Sonic Pi (Wrapper zur vereinfachten Notation von Melodien, Rhythmen etc.):
  * beatPattern: These are some functions to parse a string like 'x-x-(hc)-[xx:2]-' into a ring of samples, (nested) rings or (nested) arrays to create a nice beat,  https://github.com/stahnirockt/beatPattern/blob/master/README.md
  * Petal: is a small language on Sonic Pi with similar syntax to TidalCycles, https://github.com/siaflab/petal
  * Ziffers: is a numbered musical notation (aka. Ziffersystem) that makes composing melodies easier and faster for any key or scale, https://github.com/amiika/ziffers

### Live Coding

* Sam Aaron, YouTube Channel, https://www.youtube.com/watch?v=KJPdbp1An2s
* Martin Butz,  Making Music with Text: Audible Programming with Sonic Pi (Live Coding & Presentation), https://media.ccc.de/v/sonoj2018-1806-sonic-pi 
* Martin Butz, (mostly) live coded experiments and tracks, https://www.youtube.com/channel/UCT_roO1KTLkJTO-4qQPe_kg; tracks made with Sonic Pi and some postproduction on https://soundcloud.com/mbutz/tracks
* Alexandre rANGEL 'bit crusher' Sonic Pi live coding, https://www.youtube.com/watch?v=7Yr-HGRikRg
* Live coding dub techno in Sonic Pi von Jindřich Mynarz, https://www.youtube.com/watch?v=a1RxpJkvqpY
* Earth To Abigail, Jungle Rhythms - Live Coding Session with Sonic Pi
https://m.youtube.com/watch?v=AuNNYn2BQYU
* All things livecoding - A curated list of livecoding languages and tools, https://github.com/lvm/awesome-livecoding/
* Bericht über Live-Coding im Deutschlandfunk vom 18.10.2016, http://www.deutschlandfunk.de/live-coding-konferenz-die-leute-koennen-sehen-wie-musik.807.de.html?dram:article_id=368890
* Toplap - Home of Live Coding, http://toplap.org/
* Toplap - Awesome Live Coding (Übersicht und diverse Links): https://github.com/toplap/awesome-livecoding/blob/master/README.md

### Synthesizer, Klangsynthese

* Additive synthese waveform generator, https://meettechniek.info/additional/additive-synthesis.html
* 'Modulator' lets you graphically build a modular sound synthesizer: https://lcrespom.github.io/synth/
* 63 Detaillierte Synthese-Tutorials von Sound on Sound, http://sonicbloom.net/de/63-detaillierte-synthese-tutorials-sound-on-sound/
* How do Synthesizers work, http://www.explainthatstuff.com/synthesizers.html, (basale aber gut verständliche Einführung)
* Synthesis types by Matt Ottewill, http://www.planetoftunes.com/synthesis/synthesis-types.htm
* Sound on Sound, Synth Secrets: all 63 Parts on Sound On Sound site, https://www.soundonsound.com/search/articles/%2522Synth%2520Secrets%2522, as PDF-Download: http://www.mediafire.com/file/7w2dcsqmkbeduea/Synth+Secrets+Complete.pdf
* Subtractive synths explained: Everything you wanted to know (and more) about the most widespread synthesis method in music technology, https://www.residentadvisor.net/features/1351 (gute Einführung in alle wichtigen Komponenten eines Synthesizers)
* Granular Synthesis: An Introduction, by Evan Bogunia, https://www.keithmcmillen.com/blog/granular-synthesis-an-introduction/
* The Physics Hypertextbook. Music & Noise, Glenn Elert, http://physics.info/music/
* Amplitude Modulation. An interactive demo which enables you to both see and hear the result of multiplying a sine wave with a cosine amplitude envelope, https://academo.org/demos/amplitude-modulation/
* An Introduction to FM Synthesis,  http://flypaper.soundfly.com/produce/an-introduction-to-fm-synthesis/
* Instrument, effect and plugin host VST Plugins and VST3 Plugins and soundware for Windows, Mac OS X and Linux: https://www.kvraudio.com/plugins/windows/macosx/linux/vst-plugins/vst3-plugins/instruments/effects/hosts/soundware/newest
* An Intro to Making Generative Music on Modular, https://www.youtube.com/watch?v=NvrxQbh6vAg&app=desktop

### Akustik, Klang, Musiktheorie, Stilmittel, Genre

* How Music Works: Acoustics for Musicians, http://www.thejazzpianosite.com/how-music-works
* Music Theory for Musicians and Normal People, Toby W. Rush, http://tobyrush.com/theorypages/
* Professional music theory: an outline of basic music theory, by Oscar van Dillen ©2011-2016, http://www.oscarvandillen.com/outline_of_basic_music_theory/
* Famous Chord Progressions, https://www.hooktheory.com/theorytab/common-chord-progressions
* Music Theory Net, Common Chord Progressions, http://www.musictheory.net/lessons/57
* Drum patterns and exercises, http://www.ethanhein.com/wp/my-nyu-masters-thesis/drum-patterns-and-exercises/
* Dance Music Rudiments, Free E-Book with Audio Examples and Midi Files, http://users.skynet.be/shedo/DMR1/Index.htm
* Equalization 101 – Everything Musicians Need to Know About EQ, http://flypaper.soundfly.com/produce/equalization-101-everything-musicians-need-know-eq/
* Cult Sounds: An investigation of the origins, applications and effects of dominant individual sounds in popular music between 1960 and 2014, Dr. Immanuel Brockhaus, Hochschule der Künste Bern, Schweiz, http://cult-sounds.com
* Übersicht über Frequenzbereich unterschiedlicher Instrumente: http://www.guitarbuilding.org/wp-content/uploads/2014/06/Instrument-Sound-EQ-Chart.pdf

### Midi & OSC (Open Sound Control)

* This MIDI tutorial will help you to understand how you can use the MIDI language to control any device that uses the MIDI protocol, http://www.music-software-development.com/midi-tutorial.html

### Kreativität & Ästhetik

* eSantis, Dennis (2015): Making Music. 74 Creative Strategies for Electronic Music Producers, Berlin: Ableton.
* Bense, Arne (2016): Live – eine gelöschte Unterscheidung, Blogbeitrag vom 12.08.2016, letzter Abruf am: 10.10.2016, https://netzpolitik.org/2016/live-eine-geloeschte-unterscheidung/
* as bedeutet eigentlich „live“? Obwohl die Beantwortung dieser Frage alles andere als trivial ist, geistert der Begriff durch die Welt der elektronischen Musik und trennt die Szene in elektronische Live- und DJ-Culture.
* Drum Patterns for Electronic Music, http://subaqueousmusic.com/drum-patterns-for-electronic-music/

### Allgemeine Ressourcen

* FACT Magazin, 3 Artikel zur Einführung in Werkzeuge zur Erstellung von elektronischer Musik
  * The 14 most important synths in electronic music history – and the musicians who use them, John Twells, Sep 15 2016, http://www.factmag.com/2016/09/15/14-most-important-synths/
  * The 14 pieces of software that shaped modern music, by John Twells, Oct 1 2016, http://www.factmag.com/2016/10/01/the-14-pieces-of-software-that-shaped-modern-music
  * 15 samplers that shaped modern music – and the musicians who use them, Laurent Fintoni, Sep 15 2016, http://www.factmag.com/2016/09/15/15-samplers-that-shaped-modern-music/

### Samples (Download)

* Free Sound Samples; Links gesammelt auf: http://wiki.laptop.org/go/Sound_samples
* Sampleswap: This exquisite hand-picked collection of original 16-bit 44khz samples is entirely free—as it has been since 2001 when I started organizing this library..., http://sampleswap.org/
* Freesound.org: Freesound aims to create a huge collaborative database of audio snippets, samples, recordings, bleeps, ... released under Creative Commons licenses that allow their reuse, http://www.freesound.org
* Philharmonic Orchestra: Thousands of free, downloadable sound samples specially recorded by Philharmonia Orchestra players. These samples are suitable for creating any kind of music, no matter what style: http://www.philharmonia.co.uk/explore/make_music
* 59,413 free sample downloads (A to Z), The MusicRadar Team (01.10.2016), http://www.musicradar.com/news/tech/free-music-samples-download-loops-hits-and-multis-627820
* Free Wave Samples: Free Wave Samples provides high-quality wav files free for use in your audio projects, http://freewavesamples.com/
* Hiphop Production Resource & Free Samples, http://www.thesample.net/
* FLStudioMusic offers one of the biggest archive of free sample packs featuring one-shots, sound effects, vocals, foley and much more. http://www.flstudiomusic.com/category/free-sample-packs
* The Flipside (Forum), February 12, 2009 (ich weiss nicht, wie aktuell diese Liste ist), http://www.theflipsideforum.com/index.php?topic=11431.0
* The Bedroom Producers Blog, an online magazine about cheap and affordable music making software, hardware and other music production tools. http://bedroomproducersblog.com/category/sample-packs/
