# "Ästhetik, Regel, Klang. Musikprogrammierung mit Sonic Pi"
# Session 3
# Slicing a Breakbeat Sample

use_bpm 120

# 4 bars = 16 beats
# Original speed is 120 bpm

# NOTE: After downloading the sample from:
# https://github.com/mbutz/sonicpi-leuphana-ws1920/blob/master/03-session-2019-11-13/4bars_120bpm.wav
# do not forget to adjust the following path!
s =  "~/projects/sonicpi/github/leuphana-ws1920/online/03-session-2019-11-13/4bars_120bpm.wav"

live_loop :orig do
  stop
  sample s, beat_stretch: 16
  sleep 16
end

#################################################
# Slice into bars and loop this bar
# use 'start' and 'finish' to play only portions
#################################################

# bar 1
live_loop :bar1 do
  stop
  sample s, beat_stretch: 16, start: 0, finish: 0.25
  sleep 4
end

# bar 2
live_loop :bar2 do
  stop
  sample s, beat_stretch: 16, start: 0.25, finish: 0.5
  sleep 4
end

# bar 3
live_loop :bar3 do
  stop
  sample s, beat_stretch: 16, start: 0.5, finish: 0.75
  sleep 4
end

# bar 4
live_loop :bar4 do
  stop
  sample s, beat_stretch: 16, start: 0.75, finish: 1.0
  sleep 4
end

###########################################################
# Use 'slice' to cut sample into bars and pick one randomly
###########################################################
live_loop :slice_bar_1_4 do
  stop
  sample s, beat_stretch: 16, num_slices: 4, slice: pick
  sample s, beat_stretch: 16, num_slices: 4, slice: rrand_i(0,3)
  #sample s, beat_stretch: 16, num_slices: 4, slice: range(0,4).choose
  sleep 4
end

####################################################################
# Make smaller slices but still fill a complete bar (use n.times do)
####################################################################
# 1/2 bar = 2 beats
live_loop :slice_bar_half do
  stop
  2.times do
    sample s, beat_stretch: 16, num_slices: 8, slice: pick
    #sample s, beat_stretch: 16, num_slices: 8, slice: rrand_i(0,7)
    #sample s, beat_stretch: 16, num_slices: 8, slice: range(0,8).choose
    sleep 2
  end
end

# 1/4 bar = 1 beat
live_loop :slice_bar_quarter do
  stop
  4.times do
    sample s, beat_stretch: 16, num_slices: 16, slice: pick
    #sample s, beat_stretch: 16, num_slices: 16, slice: rrand_i(0,15)
    #sample s, beat_stretch: 16, num_slices: 16, slice: range(0,16).choose
    sleep 1
  end
end

# 1/8 bar = 0.5 beats
live_loop :slice_bar_eighth do
  stop
  8.times do
    sample s, beat_stretch: 16, num_slices: 32, slice: rrand_i(0,31)
    sleep 0.5
  end
end

# Combine two slice sizes: play 3 complete bars and piece together the 4th one
live_loop :slice_bar_combine do
  stop
  3.times do
    sample s, beat_stretch: 16, num_slices: 4, slice: pick
    sleep 4
  end
  4.times do
    sample s, beat_stretch: 16, num_slices: 16, slice: pick
    sleep 1
  end
end

###################
# onset
###################
live_loop :onset do
  stop
  #8.times do
  sample s, beat_stretch: 16, onset: pick
  sleep 0.5
  #end
end

# Use 'onset' to collect individual shots and create a new drum beat
comment do
  live_loop :bass do
    #stop
    b = (ring
         1,0.5,0,0, 1,0,1,0.25, 0.5,0.25,1,0, 0.25,0.75,0,0.25
         )
    tick
    sample s, beat_stretch: 16, onset: 0, amp: b.look
    sleep 0.5
  end
  
  live_loop :hihat, sync: :bass do
    stop
    h = (ring 0,0.5,0,1, 0,1,0,0.5, 0,0.5,0,1, 0,0.5,0,1)
    tick
    sleep 0.5
    sample s, beat_stretch: 16, onset: 1, amp: h.look if h.look > 0
  end
  
  live_loop :hihat_plus, sync: :bass do
    stop
    sample s, beat_stretch: 16, onset: 7, amp: rrand(0.25,0.5), rate: -1
    sleep 0.5
  end
  
  live_loop :snare, sync: :bass do
    #stop
    sleep 1
    with_fx :reverb, room: 0.5 do
      sample s, beat_stretch: 16, onset: [8, 14].choose, amp: 0.5 # 5 8 14
    end
    sleep 1
  end
end #comment
