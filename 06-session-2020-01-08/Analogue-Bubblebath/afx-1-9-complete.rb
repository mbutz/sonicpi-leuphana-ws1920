# AFX 1.9
# filename: afx-1-9-b1.rb
# Exercise inspired by "Analogue Bubblebath" by Richard D. James'
# originally issued under his official pseudonym "Aphex Twin" in 1991

# Due to a size restriction in Sonic Pi, there are 3 numbered files:
# afx-1-9-b1.rb -> first buffer
# afx-1-9-b2.rb -> second buffer
# afx-1-9-b3.rb -> third buffer
# Evaluate these in this order.
#
# 1st buffer: set up some helper functions and define rhythmic/melodic patterns

use_debug false
use_bpm 128

# Helper Functions

# Return note duration based on the defined rythmic pattern
# Count number of elements in ptn, return single note value
define :get_dur do |ptn|
  if ptn.count == 1
    d = 4
  elsif ptn.count == 2
    d = 2
  elsif ptn.count == 4
    d = 1
  elsif ptn.count == 8
    d = 0.5
  elsif ptn.count == 16
    d = 0.25
  elsif ptn.count == 32
    d = 0.125
  else
    puts "NOTE: No idea what rythmic pattern you mean!"
  end
  return d
end

define :play_sample do |spec, ptn|
  # take orders, what and how to play

  d = get_dur ptn # get duration of sample call

  ptn.each do |i|
    if i != 0
      sample spec[0], amp: spec[1], rate: spec[2], pan: spec[3], start: spec[4], finish: spec[5]
    end
    sleep d
  end
end

# example param: [:-,:-,:-,:-,[:to,1,0.5,0.5,:g5,:fs5],:-,[:to,1,1,1,:f5,:e5],:-]
# n[0], keyword for slide
# n[1], slide time
# n[2], sustain
# n[3], release
# n[4], base note
# n[5], note to slide to
define :play_synth do |notes|
  t = get_dur notes
  notes.each do |n|
    if n[0] == :to
      control (play n[4], note_slide: n[1], sustain: n[2], release: n[3]), amp: 3, note: n[5]
    elsif n != :-
        play n
    end
    sleep t
  end
end

# rhythmic patterns (ptn)
#                   1 e + e 2 e + e 3 e + e 4 e + e

define :get_cbsa_on_ptn_a do
  cbsa_on_ptn_a    = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]
end
define :get_cbsa_of_ptn_a do
  cbsa_of_ptn_a    = [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]
end
define :get_cbsa_on_ptn_b do
  cbsa_on_ptn_b    = [1,0,1,1,0,0,1,0,1,0,0,1,1,0,1,0]
end
define :get_cbsa_of_ptn_b do
  cbsa_of_ptn_b    = [0,1,0,0,1,1,0,1,0,1,1,0,0,1,0,1]
end

define :get_bass_on_ptn_1 do
  bass_on_ptn_1    = [1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0]
end
define :get_bass_of_ptn_1 do
  bass_of_ptn_1    = [0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0]
end
define :get_snre_on_ptn_1 do
  snre_on_ptn_1    = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0]
end
define :get_snre_of_ptn_1 do
  snre_of_ptn_1    = [0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0]
end

define :get_bass_ptn_2a do
  bass_ptn_2a      = [1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0]
end
define :get_bass_ptn_2b do
  bass_ptn_2b      = [1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0]
end
define :get_snre_ptn_2 do
  snre_ptn_2       = [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]
end

define :get_hiht_on_ptn do
  hiht_on_ptn      = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]
end
define :get_hiht_of_ptn do
  hiht_of_ptn      = [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]
end
define :get_hiht_lo_ptn do
  hiht_lo_ptn      = [0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0]
end
define :get_hiht_hi_ptn do
  hiht_hi_ptn      = [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
end

define :get_snre_hr_ptn_a do
  snre_hr_ptn_a    = [0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0]
end
define :get_snre_hr_ptn_b do
  snre_hr_ptn_b    = [0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0]
end

define :get_cong_low_ptn do
  cong_low_ptn     = [1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0]
end
define :get_cong_mdm_ptn do
  cong_mdm_ptn     = [0,0,0,0,0,0,1,0,0,1,0,1,0,0,1,0]
end
define :get_cong_hih_ptn do
  cong_hih_ptn     = [0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0]
end

# lines for synths
define :get_bodn_fg_ptn do
  bodn_fg_ptn  = [[:e4,:a3]]
end
define :get_bodn_bg_ptn do
  bodn_bg_ptn  = [[:e3,:a2]]
end
define :get_bodn_pk_ptn do
  bodn_pk_ptn  = [[:e5,:a4]]
end

define :get_frog_ptn do
  frog_ptn      = [:-,:-,:-,:-,:-,:g1,:-,:-,:-,:-,:-,:-,:-,:-,:-,:-]
end

define :get_bnce_ptn_b1 do
  bnce_ptn_b1   = [[:e3,:a4],[:e3,:a4],:-,:-,
                   :-,:-,[:e3,:a4],:-,
                   :-,[:e3,:a4],:-,:-,
                   [:e3,:a4],:-,[:e3,:a4],:-]
end
define :get_bnce_ptn_b2 do
  bnce_ptn_b2   = [[:a4,:d5],[:a4,:d5],:-,:-,
                   :-,:-,[:a4,:d5],:-,
                   :-,[:a4,:d5],:-,:-,
                   [:a4,:d5],:-,[:a4,:d5],:-]
end
define :get_bnce_ptn_b3 do
  bnce_ptn_b3   = [[:g4,:b4],[:g4,:b4],:-,:-,
                   :-,:-,[:g4,:b4],:-,
                   :-,[:g4,:b4],:-,:-,
                   [:g4,:b4],:-,[:g4,:b4],:-]
end
define :get_bnce_ptn_b4 do
  bnce_ptn_b4   = [[:d4,:fs4],:-,[:d4,:fs4],:-,
                   :-,:-,:-,[:d4,:fs4],
                   :-,:-,[:d4,:fs4],:-,
                   :-,[:d4,:fs4],:-,[:d4,:fs4]]
end

define :get_flute_ptn_a do
  flute_ptn_a   = [:-,:-,:-,:-,[:to,1,0.5,0.5,:g5,:fs5],:-,[:to,1,1,1,:f5,:e5],:-]
end
define :get_flute_ptn_b do
  flute_ptn_b   = [:-,:-,:-,:-,[:to,1,0.5,0.5,:g4,:fs4],:-,:-,:-]
end
define :get_flute_ptn_v do
  flute_ptn_v   = [[:-,[:to,1,0.5,0.5,:g5,:fs5],:-,:-,:-,:-,:-,:-],
                   [:-,:-,:-,[:to,1,0.5,0.5,:b4,:a4],:-,:-,:-,:-],
                   [:-,[:to,1,0.5,0.5,:e5,:fs5],:-,:-,[:to,1,0.5,0.5,:a5,:b5],:-,:-,:-],
                   [:-,:-,:-,:-,:-,:-,:-,[:to,1,0.5,0.5,:g4,:e4]],
                   [:-,:-,:-,:-,[:to,1,0.5,0.5,:g5,:fs5],:-,[:to,1,1,1,:f5,:e5],:-],
                   [:-,:-,:-,:-,[:to,1,0.5,0.5,:g4,:fs4],:-,:-,:-]]
end

define :get_tune_ptn_b1 do
  tune_ptn_b1   = [:a5,:-,:-,:-,
                   :b5,:-,:d6,:-,
                   :e6,:-,:-,:-,
                   :-,:-,:a5,:-]
end
define :get_tune_ptn_b2 do
  tune_ptn_b2    = [:b5,:a5,:-,:-,
                    :b5,:-,:d6,:-,
                    :-,:e6,:-,:-,
                    :a5,:-,:-,:-]
end
define :get_tune_ptn_b3 do
  tune_ptn_b3    = [:g5,:-,:-,:-,
                    :a5,:-,:-,:-,
                    :b5,:-,:-,:-,
                    :-,:-,:-,:-]
end
define :get_tune_ptn_b4 do
  tune_ptn_b4    = [:a5,:-,:g5,:-,
                    :-,:-,:-,:a5,
                    :-,:-,:b5,:-,
                    :a5,:-,:-,:-]
end

# AFX 1.9
# 2nd buffer: define song modules and instruments
# filename: afx-1-9-b2.rb

use_debug false

tambourine = "~/projects/sonicpi/github/leuphana-ws1920/online/06-session-2020-01-08/Analogue-Bubblebath/"

define :mod_shaker do
  in_thread do
    2.times do
      play_sample [tambourine, 3, 1, 0, 0, 1], get_cbsa_on_ptn_a
      play_sample [tambourine, 3, 1, 0, 0, 1], get_cbsa_on_ptn_b
    end
  end
  in_thread do
    2.times do
      play_sample [tambourine, 2, 0.95, 0, 0, 1], get_cbsa_of_ptn_a
      play_sample [tambourine, 2, 0.95, 0, 0, 1], get_cbsa_of_ptn_b
    end
  end
end

define :mod_bordun do
  in_thread do
    use_synth :tri
    use_synth_defaults amp: 1, cutoff: 0, attack: 0.8, sustain: 3, release: 4, pan: 0.2, depth: 20
    2.times do
      with_fx :panslicer, phase: 1, pulse_width: 0.05, wave: 3 do
        with_fx :flanger, phase: 10, wave: 3 do
          play_synth get_bodn_fg_ptn
        end
      end
      sleep 4
    end
  end
  in_thread do
    use_synth :tri
    use_synth_defaults amp: 0.75, attack: 3, sustain: 2, release: 3, pan: -0.2, depth: 10
    2.times do
      with_fx :panslicer, phase: 1, pulse_width: 0.05, wave: 3 do
        with_fx :flanger, phase: 10, wave: 3 do
          play_synth get_bodn_bg_ptn
        end
      end
      sleep 4
    end
  end
  in_thread do
    use_synth :tri
    use_synth_defaults amp: 0.75, cutoff: 0, attack: 0.3, sustain: 3, release: 5, pan: 0.2, depth: 0
    2.times do
      with_fx :panslicer, phase: 1, pulse_width: 0.05, wave: 3 do
        with_fx :flanger, phase: 10, wave: 3 do
          play_synth get_bodn_pk_ptn
        end
      end
      sleep 4
    end
  end
end

define :mod_frog do
  use_synth :tb303
  use_synth_defaults amp: 6, attack: 0.3, sustain: 0.4, release: 0.2, pan: rrand(-0.4, 0.1), res: 0.1
  in_thread do
    with_fx :wobble do
      with_fx :reverb, room: 0.4 do
        4.times do
          play_synth get_frog_ptn
        end
      end
    end
  end
end

define :mod_drums_1 do
  in_thread do
    4.times do
      play_sample [:drum_bass_hard, 3.0, 0.7, -0.2, 0, 1], get_bass_on_ptn_1
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_bass_hard, 2.0, 0.7, -0.2, 0, 1], get_bass_of_ptn_1
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_snare_hard, 1.75, 1.275, -0.1, 0, 1], get_snre_on_ptn_1
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_snare_hard, 2.0, 1.3, -0.1, 0, 1], get_snre_of_ptn_1
    end
  end
end

define :mod_drums_2 do
  in_thread do
    play_sample [:drum_bass_hard, 3, 0.7, -0.2, 0, 1], get_bass_ptn_2a
    play_sample [:drum_bass_hard, 3, 0.7, -0.2, 0, 1], get_bass_ptn_2b
    play_sample [:drum_bass_hard, 3, 0.7, -0.2, 0, 1], get_bass_ptn_2a
    play_sample [:drum_bass_hard, 3, 0.7, -0.2, 0, 1], get_bass_ptn_2b
  end
  in_thread do
    play_sample [:drum_snare_hard, 1.5, 1.275, -0.1, 0, 1], get_snre_ptn_2
    play_sample [:drum_snare_hard, 1.5, 1.275, -0.1, 0, 1], get_snre_ptn_2
    play_sample [:drum_snare_hard, 1.5, 1.275, -0.1, 0, 1], get_snre_ptn_2
  end
end

define :mod_hiht do
  in_thread do
    4.times do
      play_sample [:drum_cymbal_closed, 1.25, 1, -0.5, 0, 0.4, 1], get_hiht_on_ptn
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_cymbal_closed, 1.25, 1.3, -0.5, 0, 0.3], get_hiht_of_ptn
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_cymbal_closed, 1.5, 1, -0.4, 0.0, 0.6], get_hiht_lo_ptn
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_cymbal_closed, 1.5, 1, -0.4, 0.0, 0.6], get_hiht_hi_ptn
    end
  end
end

define :mod_snre_hr do
  in_thread do
    play_sample [:elec_snare, 1.0, 0.5, -0.1, 0, 0.4], get_snre_hr_ptn_a
    play_sample [:elec_snare, 1.0, 0.5, -0.1, 0, 0.4], get_snre_hr_ptn_a
    play_sample [:elec_snare, 1.0, 0.5, -0.1, 0, 0.4], get_snre_hr_ptn_a
    play_sample [:elec_snare, 1.0, 0.5, -0.1, 0, 0.4], get_snre_hr_ptn_a
  end
  in_thread do
    play_sample [:elec_snare, 1.0, 0.5, -0.1, 0, 0.4], get_snre_hr_ptn_b
    play_sample [:elec_snare, 1.0, 0.5, -0.1, 0, 0.4], get_snre_hr_ptn_b
    play_sample [:elec_snare, 1.0, 0.5, -0.1, 0, 0.4], get_snre_hr_ptn_b
    play_sample [:elec_snare, 1.0, 0.5, -0.1, 0, 0.4], get_snre_hr_ptn_b
  end
end

define :mod_congas do
  in_thread do
    4.times do
      play_sample [:drum_tom_hi_soft, 3, 1.05, -0.8, 0.1, 1], get_cong_low_ptn
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_tom_hi_soft, 4, 1.17, -0.2, 0.1, 1], get_cong_mdm_ptn
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_tom_hi_soft, 4, 1.23, 0.6, 0.1, 1], get_cong_hih_ptn
    end
  end
end

define :mod_flute do
  use_synth :fm
  use_synth_defaults amp: 1, attack: 0.3, sustain: 0.2, release: 0.2, pan: 1, divisor: 20, depth: 0.0
  in_thread do
    with_fx :reverb, room: 0.9 do
      play_synth get_flute_ptn_a
    end
  end
  in_thread do
    sleep 8
    with_fx :reverb, room: 0.9 do
      play_synth get_flute_ptn_b
    end
  end
end

define :mod_flute_rand do
  use_synth :fm
  use_synth_defaults amp: 1, attack: 0.3, sustain: 0.2, release: 0.2, pan: 1, divisor: 20, depth: 0.0
  in_thread do
    with_fx :reverb, room: 0.9 do
      use_random_seed rand_i(23)
      play_synth choose(get_flute_ptn_v)
    end
  end
  in_thread do
    sleep 4
    with_fx :reverb, room: 0.9 do
      use_random_seed rand_i(33)
      play_synth choose(get_flute_ptn_v)
    end
  end
  in_thread do
    sleep 8
    with_fx :reverb, room: 0.9 do
      use_random_seed rand_i(33)
      play_synth choose(get_flute_ptn_v)
    end
  end
  in_thread do
    sleep 12
    with_fx :reverb, room: 0.9 do
      use_random_seed rand_i(71)
      play_synth choose(get_flute_ptn_v)
    end
  end
end

define :mod_bouncer do
  use_synth :fm
  use_synth_defaults amp: 5, attack: 0, sustain: 0.2, release: 0.1, pan: 0.2, depth: 0.5
  in_thread do
    with_fx :reverb, room: 0.9 do
      play_synth get_bnce_ptn_b1
      play_synth get_bnce_ptn_b2
      play_synth get_bnce_ptn_b3
      play_synth get_bnce_ptn_b4
    end
  end
end

define :mod_bouncer_init do
  use_synth :cnoise
  use_synth_defaults amp: 0.3, attack: 0.1, sustain: 0.2, release: 1, pan: 0.2
  in_thread do
    with_fx :reverb, room: 0.9 do
      play_synth get_bnce_ptn_b1
      play_synth get_bnce_ptn_b2
      play_synth get_bnce_ptn_b3
      play_synth get_bnce_ptn_b4
    end
  end
end

define :mod_tune do
  use_synth :mod_fm
  use_synth_defaults amp: 4, attack: 0, sustain: 0.1, release: 0.2, pan: -0.3, mod_phase: 0.25, mod_range: 0.2, divisor: 2, depth: 0.2
  in_thread do
    with_fx :reverb, room: 0.5 do
      play_synth get_tune_ptn_b1
      play_synth get_tune_ptn_b2
      play_synth get_tune_ptn_b3
      play_synth get_tune_ptn_b4
    end
  end
end

define :mod_tune_octave do
  use_synth :mod_fm
  use_synth_defaults amp: 4, attack: 0, sustain: 0.1, release: 0.2, pan: -0.3, mod_phase: 0.25, mod_range: 0.2, divisor: 2, depth: 0.2
  in_thread do
    with_fx :reverb, room: 0.5 do
      with_transpose +12 do
        play_synth get_tune_ptn_b1
        play_synth get_tune_ptn_b2
        play_synth get_tune_ptn_b3
        play_synth get_tune_ptn_b4
      end
    end
  end
end

# AFX 1.9
# 3rd buffer: play the tune
# filename: afx-1-9-b3.rb

use_cue_logging false
use_debug false
use_midi_logging false
use_osc_logging false

use_bpm 128

puts "01"
mod_shaker
mod_bordun
sleep 16

puts "02"
mod_shaker
mod_bordun
sleep 16

puts "03"
mod_shaker
mod_bordun
mod_frog
sleep 16

puts "04"
mod_shaker
mod_bordun
mod_frog
sleep 16

puts "05"
mod_drums_1
mod_hiht
mod_bordun
mod_frog
sleep 16

puts "06"
mod_drums_1
mod_hiht
mod_bordun
mod_frog
mod_flute
sleep 16

puts "07"
mod_drums_1
mod_hiht
mod_bordun
mod_frog
mod_congas
sleep 16

puts "08"
mod_drums_1
mod_hiht
mod_bordun
mod_frog
mod_flute_rand
sleep 16

puts "09" # frog leaves
mod_drums_1
mod_hiht
mod_bordun
mod_flute_rand
mod_congas
sleep 16

puts "10" # congas leave
mod_drums_1
mod_hiht
mod_bordun
sleep 16

puts "11"
mod_bouncer
mod_bouncer_init
sleep 16

puts "12"
mod_bouncer
mod_drums_1
mod_hiht
mod_flute_rand
sleep 16

puts "13" # bordun in again
mod_bouncer
mod_drums_1
mod_hiht
mod_bordun
mod_flute_rand
sleep 16

puts "14"
mod_bouncer
mod_drums_1
mod_hiht
mod_bordun
mod_flute_rand
sleep 16

puts "15" # hammer snare in
mod_bouncer
mod_drums_1
mod_hiht
mod_bordun
mod_flute_rand
mod_snre_hr
sleep 16

puts "16" # drums out, shaker in
mod_bouncer
mod_shaker
mod_bordun
mod_flute_rand
sleep 16

puts "17" # drums 2 in
mod_bouncer
mod_drums_2
mod_hiht
mod_bordun
mod_snre_hr
sleep 16

puts "18"
mod_bouncer
mod_drums_2
mod_hiht
mod_bordun
mod_snre_hr
sleep 16

puts "19: Missing Break"
mod_drums_2
mod_hiht
mod_snre_hr
mod_frog
sleep 16

puts "Mark the Break"
sleep 2

puts "20"
mod_drums_1
mod_hiht
mod_snre_hr
mod_congas
mod_frog
sleep 16

puts "21: Missing blend: 1.3 to 2.2+"
mod_drums_2
mod_hiht
mod_snre_hr
mod_frog
sleep 16

puts "22"
mod_drums_1
mod_hiht
mod_flute_rand
mod_congas
mod_bordun
mod_frog
sleep 16

puts "24"
mod_bouncer
mod_drums_1
mod_hiht
mod_congas
mod_bordun
sleep 16

puts "25"
mod_bouncer
mod_drums_1
mod_hiht
mod_bordun
sleep 16

puts "26"
mod_tune
mod_bouncer
mod_drums_1
mod_hiht
mod_bordun
sleep 16

puts "27"
mod_tune
mod_bouncer
mod_drums_1
mod_hiht
mod_bordun
mod_snre_hr
sleep 16

puts "28"
mod_tune_octave
mod_bouncer
mod_shaker
mod_bordun
mod_flute
sleep 16

puts "29"
mod_tune_octave
mod_bouncer
mod_shaker
mod_bordun
mod_flute
sleep 16

puts "30"
mod_shaker
mod_bordun
sleep 16

puts "31: Stop and Reverb"
mod_bordun
sleep 16

puts "32"
mod_tune
mod_bouncer
mod_drums_1
mod_hiht
mod_bordun
mod_flute
sleep 16

puts "33"
mod_tune_octave
mod_bouncer
mod_drums_1
mod_hiht
mod_bordun
mod_flute
sleep 16

puts "34"
mod_shaker
mod_bordun
sleep 16

puts "35"
mod_bordun
sleep 16
