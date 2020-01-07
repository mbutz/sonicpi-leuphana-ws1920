# Structuring Sonic Pi Code to create complete tunes
# filename: afx-outtake.rb

use_bpm 128
set_sched_ahead_time! 0

###########################################################
# Helper Functions ########################################
###########################################################

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

define :play_synth do |notes|
  t = get_dur notes # get duration on base of list items
  notes.each do |n|
  if n != :r
    play n # play if it isn't a rest
  end
  sleep t
  end
end

###########################################################
# Notes and Durations #####################################
###########################################################

# Get notes and rythmic pattern for the bordun synth lines
define :get_bodn_fg_ptn do
  bodn_fg_ptn = [[:e4,:a3]]
end
define :get_bodn_bg_ptn do
  bodn_bg_ptn = [[:e3,:a2]]
end
define :get_bodn_pk_ptn do
  bodn_pk_ptn = [[:e5,:a4]]
end

# Get notes and rythmic pattern for the bouncer synth lines
define :get_bnce_ptn_b1 do
  bnce_ptn_b1 =  [[:e3,:a4],[:e3,:a4],:r,:r,:r,:r,[:e3,:a4],:r,:r,[:e3,:a4],:r,:r,[:e3,:a4],:r,[:e3,:a4],:r]
end
define :get_bnce_ptn_b2 do
  bnce_ptn_b2 =  [[:a4,:d5],[:a4,:d5],:r,:r,:r,:r,[:a4,:d5],:r,:r,[:a4,:d5],:r,:r,[:a4,:d5],:r,[:a4,:d5],:r]
end
define :get_bnce_ptn_b3 do
  bnce_ptn_b3 = [[:g4,:b4],[:g4,:b4],:r,:r,:r,:r,[:g4,:b4],:r,:r,[:g4,:b4],:r,:r,[:g4,:b4],:r,[:g4,:b4],:r]
end
define :get_bnce_ptn_b4 do
  bnce_ptn_b4 =  [[:d4,:fs4],:r,[:d4,:fs4],:r,:r,:r,:r,[:d4,:fs4],:r,:r,[:d4,:fs4],:r,:r,[:d4,:fs4],:r,[:d4,:fs4]]
end

###########################################################
# Song Module Definition ##################################
###########################################################

define :mod_metro do
  in_thread do
    4.times do
      sample :elec_blip
      sample :elec_blip, rate: 0.5
      sleep 1
      sample :elec_blip
      sleep 1
      sample :elec_blip
      sleep 1
      sample :elec_blip
      sleep 1
    end
  end
end

define :mod_bordun do
  # synth in foreground: attack + sustain + release = 7.8
  in_thread do
    use_synth :tri
    use_synth_defaults amp: 1, cutoff: 0, attack: 0.8, sustain: 3, release: 4, pan: 0.2
    # 2 times with sleep 4 = 8
    2.times do
      with_fx :panslicer, phase: 1, pulse_width: 0.05, wave: 3 do
        with_fx :flanger, phase: 10, wave: 3 do
          play_synth get_bodn_fg_ptn # here 'play_synth' sleeps for 4 beats
        end
      end
      # add another 4 beats to the 4 beats calculated by get_dur
      # to match the synth envelope which should have 8 beats
      sleep 4
    end
  end
  in_thread do
    # synth in background; attack + sustain + release = 8
    use_synth :tri
    use_synth_defaults amp: 0.75, attack: 3, sustain: 2, release: 3, pan: -0.2
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
    # synth for peak; sustain + release = 8
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

###########################################################
# Play Song Modules #######################################
###########################################################

mod_metro
# If you skip this, this call to mod_metro
# will play together with the next call of
# mod_metro because of in_thread
sleep 16

puts "Play only the Bordun"
mod_bordun
mod_metro
# Give all modules time to play without overlaying
sleep 16

puts "Play only the Bordun & Bouncer"
mod_metro
mod_bordun
mod_bouncer
sleep 16

puts "Leave out Metronome"
mod_bordun
mod_bouncer
sleep 16
