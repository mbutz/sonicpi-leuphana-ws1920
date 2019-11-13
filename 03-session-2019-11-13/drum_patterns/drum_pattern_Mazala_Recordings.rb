# Drum Pattern
# http://users.skynet.be/shedo/DMR1/Dance%20Music%20Rudiments6.htm


use_bpm 150
set_volume! 1

live_loop :timer do
  sleep 0.125
end

live_loop :bar, sync: :timer do
  #stop
  sample :elec_beep, amp: 0.15
  sleep 4
end

live_loop :phrase do
  sync :bar
  sleep 16
end

hihat_master_vol = 1.5
snare_master_vol = 1
kick_master_vol = 1

on = 4

if on == 1
  # 1. Standard Electro (100-150 bpm)
  hihat_ptn = (ring \
               1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0,
               1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0)
  snare_ptn = (ring \
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0)
  kick_ptn = (ring \
              1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0)
  
elsif on == 2
  # 2. Standard Breaks (100-150 bpm)
  hihat_ptn = (ring \
               1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0,
               1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0)
  snare_ptn = (ring \
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0)
  kick_ptn = (ring \
              1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
              1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0)
  
elsif on == 3
  # 3. Hybrid (100-150 bpm)
  hihat_ptn = (ring \
               0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0,
               0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0)
  snare_ptn = (ring \
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)
  kick_ptn = (ring \
              1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
              1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0)
  
elsif on == 4
  #  4. Irregular (100-150 bpm)
  #  Snare delayed or increased by 1/16th
  hihat_ptn = (ring \
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
  snare_ptn = (ring \
               0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
               0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0)
  kick_ptn = (ring \
              1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0,
              1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0)
  
elsif on == 5
  #  5. Rolling (100-150 bpm)
  hihat_ptn = (ring \
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
  snare_ptn = (ring \
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0)
  kick_ptn = (ring \
              1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0,
              1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0)
  
elsif on == 6
  #  6. Comtemporary Snare
  hihat_ptn = (ring \
               1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0,
               1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0)
  snare_ptn = (ring \
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0.5, 0, 0, 0, 1, 0, 0,
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0.5, 0, 0, 0, 1, 0, 0)
  kick_ptn = (ring \
              1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
              0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0)
  
elsif on == 7
  #  7. Comtemporary Kick
  #  Kick delayed or increased 1/8th
  hihat_ptn = (ring \
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
  snare_ptn = (ring \
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0)
  kick_ptn = (ring \
              1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
              0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0)
  
elsif on == 8
  # 8. Unconventinal
  # Snare that is not constant and delayed or increased by over 1/8th
  hihat_ptn = (ring \
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
  snare_ptn = (ring \
               0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0,
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0)
  kick_ptn = (ring \
              1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
              1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0)
  
elsif on == 9
  # 9) Polyrythmic
  # "Off Beat" and complementary to a regular "On Beat" sequence.
  hihat_ptn = (ring \
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
  snare_ptn = (ring \
               0, 0, 0.25, 0, 1, 0, 0, 0, 0.25, 0, 0, 0.25, 1, 0, 0.25, 0.25,
               0, 0, 0, 0, 0.25, 0, 1, 0, 0, 0, 0.25, 0, 1, 0, 0, 0)
  kick_ptn = (ring \
              1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0,
              0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0)
  
elsif on == 10
  # 10. Drum and Bass I
  hihat_ptn = (ring \
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0)
  snare_ptn = (ring \
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0)
  kick_ptn = (ring \
              1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1,
              1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0)
  
elsif on == 11
  # 11. Drum and Bass II
  hihat_ptn = (ring \
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1)
  snare_ptn = (ring \
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
               0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0)
  kick_ptn = (ring \
              1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1,
              1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)
end

# TEMPLATE
##| hihat_ptn = (ring \
##|              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
##|              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
##| snare_ptn = (ring \
##|              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
##|              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
##| kick_ptn = (ring \
##|             0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
##|             0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)


live_loop :hihat, sync: :phrase do
  #stop
  use_synth :cnoise
  if hihat_ptn.tick > 0
    
    with_synth_defaults release: 0.075, amp: hihat_ptn.look * hihat_master_vol do
      with_fx :hpf, cutoff: 120 do
        play :c
      end
    end
    
    ##| sample :drum_cymbal_closed, amp: hihat_ptn.look * hihat_master_vol
  end
  sleep 0.25
end

live_loop :snare, sync: :phrase do
  #stop
  if snare_ptn.tick > 0
    sample :drum_snare_soft, rate: 1.25, amp: snare_ptn.look * snare_master_vol
  end
  sleep 0.25
end

live_loop :kick, sync: :phrase do
  #stop
  if kick_ptn.tick > 0
    sample :bd_gas, amp: kick_ptn.look * kick_master_vol
  end
  sleep 0.25
end

