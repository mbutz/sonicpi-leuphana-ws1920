# Session 03 - Example for in_thread composition
# filename: in-thread-example.rb

use_bpm 130

################################################################################
# Definition of Song Parts
################################################################################

# Bassline in
define :bassline_in do
  use_synth :fm
  use_synth_defaults divisor: 2 , depth: 2, attack: 0, sustain: 0, release: 0.75
  
  bassline = (ring :c3, :c3, :g3, :bb3,
              :c3, :c3, :g3, :bb3,
              :c3, :c3, :g3, :bb3,
              :c4, :g3, :bb3, :c4)
  
  cutoff = (line 30, 130, steps: 128, inclusive: true).ramp
  depth = (line 0.5, 4, steps: 128, inclusive: true).ramp
  res = (line 0.5, 0.95, steps: 264, inclusive: true).ramp
  
  in_thread do
    64.times do
      with_synth_defaults depth: depth.look, release: 0.75 do
        with_fx :rlpf, cutoff: cutoff.look, res: res.look do
          play bassline.tick, amp: 1
        end
        sleep 0.5
      end
    end
  end
end

# Bassline (without changes of timbre)
define :bassline do
  use_synth :fm
  use_synth_defaults divisor: 2 , depth: 2, attack: 0, sustain: 0, release: 0.75
  
  bassline = (ring :c3, :c3, :g3, :bb3,
              :c3, :c3, :g3, :bb3,
              :c3, :c3, :g3, :bb3,
              :c4, :g3, :bb3, :c4)
  
  in_thread do
    32.times do
      with_synth_defaults depth: 4, release: 0.75 do
        with_fx :rlpf, cutoff: 130, res: 0.95 do
          play bassline.tick, amp: 1
        end
        sleep 0.5
      end
    end
  end
end

# Bassline out
define :bassline_out do
  use_synth :fm
  use_synth_defaults divisor: 2 , depth: 2, attack: 0, sustain: 0, release: 0.75
  
  bassline = (ring :c3, :c3, :g3, :bb3,
              :c3, :c3, :g3, :bb3,
              :c3, :c3, :g3, :bb3,
              :c4, :g3, :bb3, :c4)
  
  cutoff = (line 30, 130, steps: 64, inclusive: true).reverse.ramp
  depth = (line 0.5, 4, steps: 64, inclusive: true).reverse.ramp
  res = (line 0.5, 0.95, steps: 128, inclusive: true).reverse.ramp
  
  in_thread do
    64.times do
      with_synth_defaults depth: depth.look, release: 0.75 do
        with_fx :rlpf, cutoff: cutoff.look, res: res.look do
          play bassline.tick, amp: 1
        end
        sleep 0.5
      end
    end
  end
end

# A Simple Hihat
define :hihat do
  in_thread do
    4.times do
      4.times do
        sleep 0.5
        sample :drum_cymbal_closed, amp: 3, finish: 0.15
        sleep 0.5
      end
    end
  end
end

# Shaker
define :shaker do
  use_synth :noise
  use_synth_defaults release: 0.15
  
  in_thread do
    16.times do
      2.times do
        with_fx :hpf, cutoff: 115 do
          play :c, amp: 1.5
        end
        sleep 0.25
        
        with_fx :hpf, cutoff: 110 do
          play :c
        end
        sleep 0.25
      end
    end
  end
end

define :kick do
  in_thread do
    bd = (ring 2, 0, 0, 0, 2, 0, 0, 0.5, 2, 0, 0, 0, 2, 0.5, 0, 1)
    64.times do
      sample :bd_haus, amp: bd.look if bd.tick != 0
      sleep 0.25
    end
  end
end



################################################################################
# Play the Song
################################################################################

bassline_in
sleep 16

hihat
sleep 16

bassline
hihat
shaker
sleep 16

bassline
hihat
shaker
kick
sleep 16

hihat
shaker
bassline_out
sleep 32

