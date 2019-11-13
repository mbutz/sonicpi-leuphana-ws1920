use_bpm 120

live_loop :bar do
  sleep 4
end

#s = :ambi_piano
#s = :ambi_drone
#s = :ambi_choir
s = :ambi_glass_rub

live_loop :s1, sync: :bar do
  #stop
  p = (ring -1.5, -3.5, 3.5, 5.5, 8.5, 3.5, 1.5).mirror
  with_fx :reverb, room: 0.5, mix: 0.5, amp: 1.25 do
    sample s, attack: 0, attack: 0.025, sustain: 0.2, release: 0, rpitch: p.tick
  end
  sleep (ring 1, 0.5, 1, 2, 0.25, 1, 0.75, 1, 1, 1, 1.75, 1.75, 1.5, 1).look
end


live_loop :s2, sync: :bar do
  #stop
  p = (ring -13.5,-15.5,-20.5,-22.5)
  with_fx :reverb, room: 0.25, mix: 0.5, amp: 0.75 do
    with_fx :slicer, phase: 0.25, amp: 5 do
      with_fx :wobble, phase: 0.5 do
        sample s, attack: 0.05, sustain: 0.5, release: 0.05, rpitch: p.tick
      end
    end
  end
  sleep 4
end

live_loop :kick, sync: :bar do
  #stop
  sample :bd_ada, cutoff: 120, amp: 3
  sleep 2
end

live_loop :bass, sync: :bar do
  #stop
  bassline = (ring :e2,:d2,:g2,:e1,:a2,:r,:r,:g1,:b2,:d2,:r,:r,:g2,:fs2,:r,:e1)
  with_synth :fm do
    with_synth_defaults amp: 2, divisor: 0.5, depth: 1.5 do
      play bassline.tick
    end
  end
  sleep 0.5
  
end

# My standard noisy Hihat
live_loop :hihat_base, sync: :bar do
  #stop
  16.times do
    with_synth :cnoise do
      with_synth_defaults release: 0.1, amp: 2, pan: 0.25 do
        with_fx :hpf, cutoff: 120 do
          play :c
        end
      end
    end
    sleep 0.25
  end
end

# My standard accentuating noisy Hihat
live_loop :hihat, sync: :bar do
  #stop
  16.times do
    if spread([11, 9, 5].choose, 16).reverse.tick
      with_synth :cnoise do
        with_synth_defaults release: 0.15, amp: 2, pan: -0.25 do
          with_fx :hpf, cutoff: 120 do
            play :c
          end
        end
      end
    end
    sleep 0.25
  end
end

live_loop :drums, sync: :bar do
  #stop
  with_fx :echo, phase: (ring 0.5,0.75,0.75,).choose, mix: (ring 0.5,0,0,0,0.5,0,0).choose do
    sample :loop_breakbeat, beat_stretch: 4, amp: 2
  end
  sleep 4
end
