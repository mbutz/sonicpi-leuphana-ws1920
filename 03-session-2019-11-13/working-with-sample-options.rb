# "Ästhetik, Regel, Klang. Musikprogrammierung mit Sonic Pi"
# Session 3
# Working with Samples Options ('pitch', 'start', 'finish', 'onset', and ADSR-envelope)
# filename: working-with-sample-options.rb

live_loop :glass_hum do
  stop
  sample :ambi_glass_hum, beat_stretch: 4, start: 0, finish: 0.15
  sleep 0.5
  sample :ambi_glass_hum, beat_stretch: 4, start: 0, finish: 0.15, pitch: -2
  sleep 0.5
  sample :ambi_glass_hum, beat_stretch: 4, start: 0, finish: 0.15, pitch: +3
  sleep 0.5
  sample :ambi_glass_hum, beat_stretch: 4, start: 0, finish: 0.15
  sleep 0.5
end

live_loop :glass_rub do
  stop
  
  uncomment do
    sample :ambi_glass_rub, beat_stretch: 4, start: 0, finish: 0.05 #, release: 0.05
    sleep 0.25
    sample :ambi_glass_rub, beat_stretch: 4, start: 0, finish: 0.05, pitch: -2 #, release: 0.05
    sleep 0.25
    sample :ambi_glass_rub, beat_stretch: 4, start: 0, finish: 0.05, pitch: +3 #, release: 0.05
    sleep 0.25
    sample :ambi_glass_rub, beat_stretch: 4, start: 0, finish: 0.05 #, release: 0.05
    sleep 0.25
  end #comment
  
  comment do
    ptch = (ring 0,-2,3,0)
    sample :ambi_glass_rub, beat_stretch: 4, start: 0, finish: 0.05, release: 0.05, pitch: ptch.tick
    sleep 0.075
  end #comment
  
end

live_loop :guitar do
  stop
  #sample :guit_em9, pitch: -12, onset: 11, amp: 4
  #sample :guit_em9, amp: 6, pitch: -12, onset: 11, attack: 2, release: 2
  sample :guit_em9, pitch: (ring -12,-12,-12,-12,-15,-15,-13,-12).tick, onset: 11, amp: 8, attack: 0.75, release: 0.75
  sleep 1
end

# Ambient guitar atmo
live_loop :guitar_atmo do
  stop
  ptch = (ring 0,7,5,0,7,5,7,-12)
  sample :guit_em9, pitch: ptch.tick, onset: 11 #, attack: 0.125, release: 0.125
  sleep 0.25
end

# The Conet Project - Recordings of Shortwave Numbers Stations
# Sample from https://archive.org/details/ird059/tcp_d1_23_2_letter_rk_irdial.mp3

# NOTE: After downloading the sample from:
# https://github.com/mbutz/sonicpi-leuphana-ws1920/blob/master/03-session-2019-11-13/tcp_d1_23_2_letter_rk_irdial.wav
# do not forget to adjust the following path!
s =  "~/projects/sonicpi/github/leuphana-ws1920/online/03-session-2019-11-13/tcp_d1_23_2_letter_rk_irdial.wav"
# A very long sample; played with original speed: 143 sec

comment do
  sample_free_all
  #sample s
  #puts sample_duration s
  
  
  live_loop :shortwave00 do
    stop
    sample s, start: 0.543, finish: 0.55, rate: 1.0
    sleep 1
  end
  
  live_loop :shortwave01, sync: :shortwave00 do
    stop
    sample s, start: 0.543, finish: 0.55, rate: 0.5
    sleep 1
  end
  
  
  live_loop :shortwave02, sync: :shortwave00 do
    stop
    sample s, start: 0.75, finish: 0.755, rate: -0.25
    sleep 1
  end
  
  live_loop :shortwave03, sync: :shortwave00 do
    stop
    sample s, start: 0.934, finish: 0.94, rate: -0.125, amp: 2
    sleep 1
  end
  
  live_loop :drums, sync: :shortwave00 do
    stop
    sample :loop_tabla, beat_stretch: 8, amp: 4
    sleep 8
  end
  
end #comment