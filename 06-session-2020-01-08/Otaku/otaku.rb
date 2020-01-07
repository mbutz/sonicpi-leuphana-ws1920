# From the series R(emodelling) E(electronic) C(lassics) with Sonic Pi
# Black Dog Productions - Otaku (1992)

use_bpm 120

# Download sample and adjust path to your environement
# http://www.freesound.org/people/kendallbear/sounds/123804/
clap = "~/projects/sonicpi/github/leuphana-ws1819/online/session-06-2019-01-23/Otaku/"

# Mixer ----------------------------------------------------------------------------
run_chewing = 0
run_perc_base = 0
run_bassline = 1
run_perc = 1
run_swing = 1
run_perc_support = 1
run_organ = 1
run_organ_support = 0
run_flitter = 0
run_echoes = 0
run_strings = 1
run_strings_support = 0

organ_vol_master = 1
organ_support_vol_master = 0.75
echoes_vol_master = 1
flitter_vol_master = 0.75
bass_vol_master = 4
chew_vol_master = 0.75
swing_vol_master = 1
flitter_vol_master = 0.5
perc_vol_master = 2
strings_vol_master = 1.0
strings_support_vol_master = 1

# Metro ----------------------------------------------------------------------------

live_loop :metro do
  sleep 4
end

# Instruments ----------------------------------------------------------------------
define :wood do
  use_synth :fm
  use_synth_defaults divisor: 0.6 , depth: 7, attack: 0, sustain: 0, release: 0.025, amp: 3, cutoff: 100
  play :g4
end

define :metal do
  use_synth :fm
  use_synth_defaults divisor: 0.1, depth: 20, attack: 0, sustain: 0, release: 0.025, amp: 3
  use_synth_defaults divisor: 0.05 , depth: 80, attack: 0, sustain: 0, release: 0.025, amp: 3
  play :bb5
end

# Organ Chords ---------------------------------------------------------------------

org_c1 = [:d3, :f3, :bb3, :d4, :f4, :g4, :a4, :bb4, :c5, :d5 ]
org_c2 = [:f4, :g4, :bb4, :c5, :f5, :g5, :bb5, :c6]
org_c3 = [:g3, :a3, :c4, :e4, :g4, :a4, :c5, :d5, :e5]
org_c4 = [:c4, :f4, :a4, :c5, :f5, :g5, :a5, :c6]
org_c5 = [:g4, :g5, :bb5, :d5, :d5, :a5, :f5, :d6, :d6, :d6]

live_loop :organ, sync: :metro do
  stop if run_organ == 0
  use_synth :tri
  use_synth_defaults amp: 1 * organ_vol_master, cutoff: 0, attack: 0.5, release: 0.5, pan: 0.5
  with_fx :reverb, room: 0.5, mix: 0.5 do
    with_fx :flanger do
      play org_c1, sustain: 4
      sleep 6
      play org_c2, sustain: 1
      sleep 2
      play org_c3, sustain: 4
      sleep 6
      play org_c4, sustain: 1
      sleep 2
      play org_c1, sustain: 4
      sleep 6
      play org_c2, sustain: 1
      sleep 2
      play org_c3, sustain: 4
      sleep 6
      play org_c5, sustain: 1
      sleep 2
    end
  end
end

# org_c6 = [:g3, :bb3, :d4, :d4, :f4, :f4, :a4, :a4, :g4, :g4, :bb4, :bb4, :d5,  :d5, :d5, :d5, :f5, :f5, :f5, :f5, :a5, :a5, :a5, :a5]
org_c6 = [:g4, :bb4, :d5, :d5, :f5, :f5, :a5, :a5, :g5, :g5, :bb5, :bb5, :d6, :d6, :d6, :d6, :f6, :f6, :f6, :f6, :a6, :a6, :a6, :a6]
org_c7 = [:g3, :bb3, :d4, :d4, :f4, :f4, :a4, :a4, :g4, :g4, :bb4, :bb4, :d5,  :d5, :d5, :d5, :c5, :c5, :c5, :c5, :g5, :g5, :g5, :g5]

live_loop :organ_support, sync: :metro do
  stop if run_organ_support == 0
  use_synth :tb303
  use_synth_defaults attack: 0.5, release: 0.5, pan: 0.2, amp: 1 * organ_support_vol_master
  with_fx :reverb, room: 0.75, mix: 0.5 do
    with_fx :flanger do
      sleep 3
      play org_c6,
        amp: 2 * organ_support_vol_master,
        attack: 4, release: 8, pan: -0.5
      sleep 15
      play org_c7,
        amp: 2 * organ_support_vol_master,
        attack: 4, release: 8, pan: -0.5
      sleep 14
    end
  end
end

# Echoes ----------------------------------------------------------------------
live_loop :echoes, sync: :metro do
  
  echoes_t = 0.25
  stop if run_echoes == 0
  
  use_synth :fm
  use_synth_defaults divisor: 0.1, depth: 20, attack: 0, sustain: 0, release: 1
  
  with_fx :echo, phase: 0.5, decay: 4, mix: 0.5 do
    with_fx :reverb, room: 1, mix: 0.5 do
      play :d4, pan: 1, amp: 0.25 * echoes_vol_master
      sleep echoes_t
      play :a4, pan: 0.5, amp: 0.5 * echoes_vol_master
      sleep echoes_t
      play :e5, pan: 0, amp: 0.75 * echoes_vol_master
      sleep echoes_t
      play :c6, pan: -0.5, amp: 1 * echoes_vol_master
      sleep echoes_t
      play :g6, pan: -0.75, amp: 0.15 * echoes_vol_master
      sleep echoes_t
      play :d7, pan: -1, amp: 0.5 * echoes_vol_master
      sleep echoes_t
    end
  end
  sleep [12,18].choose
end

# Flitter ----------------------------------------------------------------------

live_loop :flitter, sync: :metro do
  stop if run_flitter == 0
  
  with_fx :flanger, wave: 0, phase: 1.5 do
    with_fx :reverb, room: 0.5, mix: 0.75 do
      sleep 1.5
      sample :ambi_glass_rub, rate: 5, start: 0.5, pan: -1, amp: flitter_vol_master * 0.5
      sleep 1.5
      sample :ambi_glass_rub, rate: 3.85, start: 0.5, pan: -0.75, amp: flitter_vol_master * 1
      sleep 0.5
      sample :ambi_glass_rub, rate: 2.85, start: 0.5, pan: -0.5, amp: flitter_vol_master * 1.5
      sleep 3
      sample :ambi_glass_rub, rate: 2.85, start: 0.5, pan: -0.25, amp: flitter_vol_master * 0.5
      sleep 1
      sample :ambi_glass_rub, rate: 3.85, start: 0.5, pan: 0, amp: flitter_vol_master * 0.25
      sleep 1
      sample :ambi_glass_rub, rate: 5, start: 0.5, pan: 0.25, amp: flitter_vol_master * 0.5
      sleep 2
      sample :ambi_glass_rub, rate: 5, start: 0.5, pan: 0.5, amp: flitter_vol_master * 0.75
      sleep 0.5
      sample :ambi_glass_rub, rate: 3.85, start: 0.5, pan: 0.75, amp: flitter_vol_master * 1
      sleep 0.5
      sample :ambi_glass_rub, rate: 2.85, start: 0.5, pan: 1, amp: flitter_vol_master * 1.5
      sleep 3
      sample :ambi_glass_rub, rate: 2.85, start: 0.5, pan: 0, amp: flitter_vol_master * 1
      sleep 0.5
      sample :ambi_glass_rub, rate: 3.85, start: 0.5, pan: -1, amp: flitter_vol_master * 0.5
      sleep 0.5
      sample :ambi_glass_rub, rate: 5, start: 0.5, pan: 0, amp: flitter_vol_master * 0.25
      sleep 0.5
    end
  end
  
end

# Swing ----------------------------------------------------------------------
live_loop :swing, sync: :metro do
  stop if run_swing == 0
  
  use_synth :noise
  
  with_fx :hpf, cutoff: 120 do
    play :c, release: 0.5, amp: 3 * swing_vol_master
    sleep 0.5
    play :c, release: 0.15, amp: 1.5 * swing_vol_master
    sleep 0.5/3 * 2
    play :c, release: 0.15, amp: 3 * swing_vol_master
    sleep 0.5/3
  end
  
end

# Bassline ----------------------------------------------------------------------
bassline_a = [:r, :g1, :r, :r,
              :r, :g1, :r, :r,
              :r, :r, :c2, :r,
              :f2, :r, :bb2, :r,
              :bb1, :r, :r, :r,
              :bb1, :r, :r, :bb2,
              :r, :r, :f2, :r,
              :r, :c2, :r, :r]

bassline_b = [:r, :g1, :r, :r,
              :r, :g1, :r, :r,
              :r, :r, :bb1, :r,
              :f2, :r, :bb1, :r,
              :c1, :r, :r, :r,
              :c2, :r, :r, :c3,
              :r, :r, :f2, :r,
              :r, :bb2, :r, :r]

live_loop :bassline, sync: :metro do
  
  stop if run_bassline == 0
  
  use_synth :fm
  use_synth_defaults divisor: 1, depth: 2, attack: 0, sustain: 0.2, cutoff: 50, release: 1, amp: 1 * bass_vol_master
  
  play_pattern_timed bassline_a, [0.25]
  play_pattern_timed bassline_b, [0.25]
end

# Percussion Base ----------------------------------------------------------------------
live_loop :perc_base, sync: :metro do
  
  stop if run_perc_base == 0
  
  with_synth :noise do
    with_fx :hpf, cutoff: 100 do
      with_synth_defaults attack: 0.075, sustain: 0, release: 0.75, amp: 0.5 do
        play :c
      end
    end
  end
  
  # Bar 1
  sleep 0.25
  wood
  sleep 0.25
  sample :drum_cymbal_closed, amp: 3
  sleep 0.25
  sample :drum_cymbal_closed, amp: 3
  sleep 0.25
  
  # Bar 2
  wood
  sleep 0.5
  sample :drum_cymbal_closed, amp: 3
  sleep 0.25
  sample :drum_cymbal_closed, amp: 3
  sleep 0.5
  
  # Bar 3
  wood
  sleep 0.75
  
  # Bar 4
  wood
  sleep 0.5
  with_fx :reverb, room: 0.5, mix: 0.25 do
    sample clap, amp: 3
  end
  sleep 0.5
end

# Chewing -------------------------------------------------------------------------
live_loop :chewing, sync: :metro do
  
  stop if run_chewing == 0
  
  define :chew do |n, v|
    
    use_synth :fm
    use_synth_defaults depth: 3, divisor: 2, attack: 0, release: 0.05
    with_fx :echo, phase: 0.5, decay: 0.25, mix: 0.25 do
      play n, amp: v * chew_vol_master
    end
    
  end
  
  
  # Bar 1
  chew :e4, 0.25
  sleep 0.75
  chew :d4, 1
  sleep 0.25
  chew :bb3, 0.25
  # Bar 2
  sleep 0.5
  chew :d4, 0.25
  sleep 0.25
  chew :bb3, 0.25
  sleep 0.25
  # Bar 3
  chew :e4, 1
  sleep 0.5
  chew :d4, 0.25
  sleep 0.25
  chew :bb3, 0.25
  sleep 0.5
  # Bar 4
  chew :d4, 1
  sleep 0.25
  chew :bb3, 0.25
  sleep 0.25
  chew :g4, 1
  sleep 0.25
  
  # Bar 1
  chew :e4, 1
  sleep 0.5
  chew :d4, 0.25
  sleep 0.25
  chew :e4, 1
  sleep 0.25
  # Bar 2
  chew :e4, 1
  sleep 1
  # Bar 3
  chew :e4, 1
  sleep 0.5
  chew :d4, 0.25
  sleep 0.5
  # Bar 4
  chew :e4, 1
  sleep 0.25
  chew :d4, 0.5
  sleep 0.75
end

# Percussion Support -------------------------------------------------------------------

live_loop :perc_support, sync: :metro do
  
  stop if run_perc_support == 0
  
  with_synth :noise do
    with_fx :hpf, cutoff: 100 do
      with_synth_defaults attack: 0.075, sustain: 0, release: 0.75, amp: 0.5 do
        play :c
      end
    end
  end
  
  # Bar 1
  sleep 0.25
  wood
  sleep 0.75
  
  # Bar 2
  wood
  sleep 1.25
  
  # Bar 3
  wood
  sleep 0.75
  
  # Bar 4
  wood
  sleep 0.5
  with_fx :reverb, room: 0.5, mix: 0.25 do
    sample clap, amp: 3
  end
  sleep 0.5
end

# Percussion ---------------------------------------------------------------------------
live_loop :perc, sync: :metro do
  
  stop if run_perc == 0
  
  # 1
  sample :bd_haus, rate: 0.75, amp: 2 * perc_vol_master
  sleep 0.25
  wood
  sleep 0.25
  sample :drum_cymbal_closed, amp: 2 * perc_vol_master
  sleep 0.25
  sample :drum_cymbal_closed, amp: 2 * perc_vol_master
  sleep 0.25
  
  # 2
  wood
  sleep 0.25
  sleep 0.25
  sample :drum_cymbal_closed, amp: 2 * perc_vol_master
  sleep 0.25
  sample :drum_cymbal_closed, amp: 2 * perc_vol_master
  sample :bd_haus, rate: 0.75, amp: 2 * perc_vol_master
  sleep 0.25
  
  # 3
  sleep 0.25
  sleep 0.25
  wood
  sleep 0.25
  sleep 0.25
  
  # 4
  wood
  sample clap, amp: 2 * perc_vol_master
  sleep 0.25
  sleep 0.25
  sample :bd_haus, rate: 0.75, amp: 2 * perc_vol_master
  sleep 0.25
  sleep 0.25
  
  # 1
  sample :bd_haus, rate: 0.75, amp: 2 * perc_vol_master
  sleep 0.25
  wood
  sleep 0.25
  sample :drum_cymbal_closed, amp: 2 * perc_vol_master
  sleep 0.25
  sample :drum_cymbal_closed, amp: 2 * perc_vol_master
  sleep 0.25
  
  # 2
  wood
  sleep 0.25
  sample clap, amp: 1 * perc_vol_master
  sleep 0.25
  sample :drum_cymbal_closed, amp: 2 * perc_vol_master
  sample :bd_haus, rate: 0.75, amp: 2 * perc_vol_master
  sleep 0.25
  sample :drum_cymbal_closed, amp: 2 * perc_vol_master
  sleep 0.25
  
  # 3
  sleep 0.25
  sleep 0.25
  wood
  sleep 0.25
  sleep 0.25
  
  # 4
  sleep 0.25
  wood
  sleep 0.25
  sleep 0.25
  sleep 0.25
end

live_loop :strings, sync: :metro do
  
  stop if run_strings == 0
  
  use_synth :fm
  use_synth_defaults release: 0.25, depth: 2, divisor: 1, amp: 1 * strings_vol_master
  
  with_fx :flanger, phase: 5, wave: 0 do
    with_fx :reverb, room: 0.75, mix: 0.5 do
      play_pattern_timed \
        [:c7, :bb6, :a6, :f6, :d6, :f6, :d6, :c6, :f6, :g5, :f6, :e6, :e6, :c7, :e6],
        [0.25, 0.25, 1.25, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 1, 0.75, 0.5, 0.25, 1.5]
    end
  end
end

live_loop :strings_support, sync: :metro do
  
  stop if run_strings_support == 0
  
  use_synth :fm
  use_synth_defaults release: 0.25, depth: 2, divisor: 2, amp: 1 * strings_support_vol_master
  
  sleep 0.25
  with_fx :reverb, room: 0.75, mix: 0.5 do
    play_pattern_timed \
      [:c7, :bb6, :a6, :f6, :d6, :f6, :d6, :c6, :f6, :g5, :f6, :e6, :e6, :c7, :e6],
      [0.25, 0.25, 1.25, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 1, 0.75, 0.5, 0.25, 1.5]
  end
end
