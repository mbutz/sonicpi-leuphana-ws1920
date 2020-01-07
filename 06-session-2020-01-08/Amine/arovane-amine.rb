# Based on "Amine" by Arovane

use_bpm 142

use_cue_logging false
use_debug false
use_midi_logging false
use_osc_logging false

# External samples
sn = "~/projects/sonicpi/github/leuphana-ws1920/online/06-session-2020-01-08/Amine/edm-snare-22.wav"
#sn = "~/projects/sonicpi/github/leuphana-ws1920/online/06-session-2020-01-08/Amine/edm-snare-27.wav"

### Mixer
play_bass_drum = 0
play_tock = 0
play_hihat = 0
play_snare1 = 0
play_snare2 = 0
play_wood = 0

play_slide_melody = 0
play_bass_melody = 0
play_synth_carpet = 0
play_bass = 0
play_soprano = 0

### Volume
master_vol_bass_drum = 4
master_vol_tock = 1.5
master_vol_hihat = 2
master_vol_snare1 = 3
master_vol_snare2 = 3
master_vol_wood = 1.0

master_vol_slide_melody = 0.5
master_vol_bass_melody = 1
master_vol_synth_carpet = 1
master_vol_bass = 0.75
master_vol_soprano = 0.25

### FX
fx_slide_melody_room = 0.25
fx_slide_melody_mix = 0.5

# A pattern consisting of 8 * 4/4 bars
# 1 bar = 0.8445
# 8 bars = 8 * 0.8445 = 6.757

live_loop :metro do
  sleep 0.5
end

live_loop :pattern do
  sync :metro
  sleep 16
end

### Bass Drum #########################################################################

ptn_bass_drum = (ring 1, 0, 0, 0,
                 1, 0, 0, 0,
                 0, 1, 0, 0,
                 1, 2, 0, 1,
                 1, 0, 0, 0,
                 0, 0, 0, 0,
                 1, 0, 0, 1,
                 1, 0, 0, 1)

live_loop :bass_drum, sync: :pattern do
  
  stop if play_bass_drum == 0
  
  if ptn_bass_drum.tick > 0
    sample :bd_fat, rate: 0.5, amp: ptn_bass_drum.look * master_vol_bass_drum
    sample :bd_boom, amp: ptn_bass_drum.look * master_vol_bass_drum
  end
  sleep 0.5
end

### Tock ###############################################################################
ptn_tock = (ring 0, 0, 1, 0,
            1, 0, 0, 1,
            0, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 0, 0,
            1, 0, 0, 0,
            0, 0, 0, 1,
            0, 0, 0, 0)

live_loop :tock, sync: :pattern do
  
  stop if play_tock == 0
  
  use_synth :fm
  use_synth_defaults divisor: 0.1 , depth: 10, attack: 0, sustain: 0, release: 0.005, amp: 2 * master_vol_tock, pan: -0.75, cutoff: 130
  
  if ptn_tock.tick > 0
    with_fx :reverb, room: 0.15, mix: 0.5 do
      play :a2
    end
  end
  sleep 0.5
end

### Hihat ##############################################################################
live_loop :hihat do
  
  stop if play_hihat == 0
  
  sync :metro
  
  use_synth :pnoise
  
  with_fx :rhpf, cutoff: 123, res: 0.75 do
    16.times do
      if (spread 13, 16).tick then
        play :c1, attack: 0.0, decay: 0.02, release: 0.05, pan: 0.75, amp: 2 * master_vol_hihat
      end
      sleep 0.25
    end
  end
end


### Snare1 #############################################################################
live_loop :snare1, sync: :pattern do
  
  stop if play_snare1 == 0
  
  2.times do
    with_fx :reverb, room: 0.25, mix: 0.5 do
      with_fx :hpf, cutoff: 75 do
        sample sn, amp: 1 * master_vol_snare1, rate: 1.6
        sleep 1.5
        sample sn, amp: 1 * master_vol_snare1, rate: 1.6
        sleep 2
        sample sn, amp: 1 * master_vol_snare1, rate: 1.6 if tick.even?
        sleep 0.5
        sample sn, amp: 1 * master_vol_snare1, rate: 1.6
        sleep 1.5
        sample sn, amp: 1 * master_vol_snare1, rate: 1.6
        sleep 2.5
        sample sn, amp: 1 * master_vol_snare1, rate: 1.6
        sleep 1.5
        sample sn, amp: 1 * master_vol_snare1, rate: 1.6
        sleep 2.5
        sample sn, amp: 1 * master_vol_snare1, rate: 1.6
        sleep 1.5
        sample sn, amp: 1 * master_vol_snare1, rate: 1.6
        sleep 2.5
      end
    end
  end
end

### Snare2 #############################################################################
live_loop :snare2, sync: :pattern do
  
  stop if play_snare2 == 0
  
  with_fx :reverb, room: 0.5, mix: 0.5 do
    with_fx :hpf, cutoff: 70 do
      sample sn, amp: 1 * master_vol_snare2, rate: 1.6
      sleep 0.75
      sample sn, amp: 1 * master_vol_snare2, rate: 1.6
      sleep 0.75
      sample sn, amp: 1 * master_vol_snare2, rate: 1.5
      sleep 2.5
      sample sn, amp: 1 * master_vol_snare2, rate: 1.5
      sleep 1.5
      sample sn, amp: 1 * master_vol_snare2, rate: 1.5
      sleep 0.5
      sample sn, amp: 1 * master_vol_snare2, rate: 1.5
      sleep 1.75
      sample sn, amp: 0.75 * master_vol_snare2, rate: 1.6
      sleep 0.25
      sample sn, amp: 1.25 * master_vol_snare2, rate: 1.5
      sleep 1.5
      sample sn, amp: 1 * master_vol_snare2, rate: 1.5
      sleep 2.25
      sample sn, amp: 0.75 * master_vol_snare2, rate: 1.6
      sleep 0.25
      sample sn, amp: 1.25 * master_vol_snare2, rate: 1.5
      sleep 1.5
      sample sn, amp: 1 * master_vol_snare2, rate: 1.5
      sleep 1.5
      sample sn, amp: 1 * master_vol_snare2, rate: 1.5
      sleep 1
    end #reverb
  end
end

### The Wood Knick-Knack ###############################################################
define :the_wood do | p |
  use_synth :fm
  use_synth_defaults divisor: 0.1 , depth: 20, attack: 0, sustain: 0, release: 0.005, amp: p * master_vol_wood, cutoff: 100
  if p < 1
    play :d4
  elsif
    play :d3
  end
end

t = 0.25

live_loop :wood, sync: :pattern do
  
  stop if play_wood == 0
  
  2.times do
    the_wood 0.25
    sleep t
  end
  6.times do
    the_wood 1
    sleep t
    2.times do
      the_wood 0.25
      sleep t
    end
  end
  2.times do
    the_wood 0.25
    sleep t
  end
  4.times do
    the_wood 1
    sleep t
    2.times do
      the_wood 0.25
      sleep t
    end
  end
  the_wood 1
  sleep t
  
end

### Sliding Melody ###################################################################

nsl = [:eb5, :ab4, :bb4, :bb3, :ab4, :ab5, :f4, :db5, :b4,
       :eb4, :f5, :gb4, :db5, :gb4, :gb5, :b3, :b4,
       :bb4, :eb4, :ab4, :eb5, :bb3, :db5, :gb4, :bb4,
       :eb5, :b4, :bb4, :ab4, :b3, :bb4, :gb5]
vsl = [0.75, 0.75, 0.75, 0.75, 1, 1, 0.75, 1,
       1, 1, 0.75, 0.75, 1, 1, 0.75, 1,
       1, 1, 0.75, 1, 1, 1, 0.75, 0.75,
       1, 1, 1, 1, 0.75, 1, 0.75, 1]

define :the_slide_mel do | notes , vol |
  
  use_synth :tri
  
  sleep 0.5
  m = play :eb5, attack: 0, sustain: 15.5, release: 0.5, amp: 0.25
  
  notes.zip(vol) do | n, v |
    control m, note: n, amp: v * master_vol_slide_melody
    sleep 0.5
  end
end

live_loop :slide_melody, sync: :pattern do
  
  stop if play_slide_melody == 0
  
  with_fx :reverb, room: fx_slide_melody_room, mix: fx_slide_melody_mix, amp: 0.5 do
    the_slide_mel nsl, vsl
  end
end

### Bass Melody ######################################################################
live_loop :bass_melody, sync: :pattern do
  
  stop if play_bass_melody == 0
  
  use_synth :tri
  use_synth_defaults amp: 1, attack: 0, release: 0.5
  
  with_fx :reverb, room: 0.75, mix: 0.75, amp: 0.5 * master_vol_bass_melody do
    sleep 1
    play :ab3
    sleep 5
    play :f4
    sleep 3
    play :eb4
    sleep 3
    play :gb4
    sleep 3
    play :b3
    sleep 3
    play :eb4
    sleep 3
    play :bb3
    sleep 3
    play :gb4
    sleep 3
    play :db4
    sleep 4
    play :b3
    sleep 1
  end
end

### Synth Carpet ######################################################################
c1 = [:bb4, :cb4, :db4, :eb4, :f4, :gb4,
      :bb5, :db5, :f5, :gb5,
      :bb6, :db6, :f6, :gb6]

c2 = [:bb3, :bb4, :bb5, :bb6, :bb7]
c3 = [:db3, :db4, :db5, :db6, :db7]
c4 = [:f3, :f4, :f5, :f6, :f7]
c5 = [:cb3, :cb4, :cb5, :cb6, :cb7]
c6 = [:gb3, :gb4, :gb5, :gb6, :gb7]
c7 = [:ab3, :ab4, :ab5, :ab6, :ab7]
c8 = [:cb3, :cb4, :cb5, :cb6, :cb7]

chords = [c2, c3, c4, c5, c6, c7, c8]

q = [2, 4]
vol = [0.075, 0.1, 0.25]
a = [0.005, 0.01, 0.025]
a = [0.05, 0.1, 0.25]
r = [1, 2]
c = [30, 50]
s1 = [:sine, :sine]
s2 = [:tri, :dsaw]

live_loop :synth_carpet, sync: :pattern do
  
  stop if play_synth_carpet == 0
  
  lfo_range = (range 70, 110, step: 10).mirror
  
  with_fx :flanger, wave: 4, depth: 8, feedback: 0.25 do
    with_fx :rlpf, res: 0.90, cutoff: lfo_range.tick do
      with_fx :reverb, room: 1, mix: 0.75, amp: 0.75 do
        with_synth choose([:sine, :fm]) do
          with_synth_defaults attack: 2, sustain: 12, release: 2, amp: 0.15 * master_vol_synth_carpet, cutoff: 120 do
            play c1
          end
        end
        with_synth choose([:tri, :dsaw]) do
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose
          sleep q.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose, cutoff: c.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose, cutoff: c.choose
          sleep q.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose, cutoff: c.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose, cutoff: c.choose
          sleep q.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose, cutoff: c.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose, cutoff: c.choose
          sleep q.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose, cutoff: c.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose, cutoff: c.choose
          sleep q.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, amp: a.choose, attack: a.choose, release: r.choose, cutoff: c.choose
          play chords.choose, amp: vol.choose * master_vol_synth_carpet, attack: a.choose, release: r.choose, cutoff: c.choose
        end
        sleep q.choose
      end
    end #fx_rhpf
  end #fx_flanger
end

### Bass #############################################################################
live_loop :bass, sync: :pattern do
  
  stop if play_bass == 0
  
  use_synth :fm
  use_synth_defaults divisor: 2, depth: 0.25, amp: 1 * master_vol_bass, cutoff: 80
  
  
  play :ab2, attack: 1, sustain: 5, release: 2
  sleep 6
  play :gb2, attack: 3, sustain: 5, release: 2
  sleep 10
end

### Soprano ##########################################################################
live_loop :slide_soprano, sync: :pattern do
  
  stop if play_soprano == 0
  
  use_synth :tri
  with_transpose -12 do
    with_fx :echo, phase: 4, decay: 2, mix: 0.5 do
      with_fx :reverb, room: 0.75, mix: 0.75 do
        if tick == 0
          puts look
          sleep 6
          s1 = play :ab5, attack: 0, sustain: 1, release: 0.5, amp: 1 * master_vol_soprano
          sleep 0.5
          control s1, note: :db6
          sleep 0.5
        else
          s2 = play :eb6, attack: 0, sustain: 7, release: 0.5, amp: 1 * master_vol_soprano
          sleep 1
          
          control s2, note: :f6
          sleep 0.5
          
          control s2, note: :eb6
          sleep 1
          
          control s2, note: :gb6
          sleep 0.5
          
          control s2, note: :f6
          sleep 1
          
          control s2, note: :db6
          sleep 0.5
          
          control s2, note: :eb6
          sleep 0.5
          
          control s2, note: :cb6
          sleep 1
          
          control s2, note: :bb5
          sleep 0.5
          
          control s2, note: :ab5
          sleep 1
          
          s1 = play :ab5, attack: 0, sustain: 1, release: 0.5, amp: 1 * master_vol_soprano
          sleep 0.5
          
          control s1, note: :db6
          sleep 0.5
        end
      end
    end
  end
end

