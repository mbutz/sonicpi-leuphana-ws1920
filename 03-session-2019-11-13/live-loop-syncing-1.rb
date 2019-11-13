# "Ästhetik, Regel, Klang. Musikprogrammierung mit Sonic Pi"
# Session 3 - Synchronization of live loops
# filename: live-loop-syncing-1.rb

use_bpm 110 # set timing for the whole file

#########################################
# Why We need to sync
#########################################

# comment out sleep in :hihat1 to stop loop
# evaluate
# remove error
# evaluate again

comment do
  live_loop :bass1 do
    sample :bd_ada, amp: 1
    sleep 1.75
    sample :bd_ada, amp: 1
    sleep 0.25
    sample :bd_ada, amp: 1
    sleep 2
  end
  
  live_loop :hihat1 do
    sleep 0.5
    sample :drum_cymbal_closed
    sleep 0.5
  end
  
  live_loop :snare1 do
    sleep 1
    sample :drum_snare_soft
    sleep 1
  end
end

comment do
  live_loop :metronom do
    sleep 1
  end
  
  live_loop :bass2 do
    sync :metronom
    sample :bd_ada, amp: 1
    sleep 1.75
    sample :bd_ada, amp: 1
    sleep 0.25
    sample :bd_ada, amp: 1
    sleep 2
  end
  
  live_loop :hihat2 do
    sync :metronom
    sleep 0.5
    sample :drum_cymbal_closed
    sleep 0.5
  end
  
  live_loop :snare2 do
    sync :metronom
    sleep 1
    sample :drum_snare_soft
    sleep 1
  end
end



#########################################
# Metronome Helper Functions for synching
#########################################

# Count every beat
comment do
  live_loop :beat do
    16.times do
      sample :elec_blip, amp: 2, rate: 3
      sleep 1
    end
  end
end

# Sync 2-bar patterns
live_loop :two_bars, sync: :beat do
  sample :elec_blip, amp: 1, rate: 1
  sleep 8
end

# Synch 4-bar patterns
live_loop :four_bars, sync: :two_bars do
  sample :elec_blip, amp: 1.5, rate: 0.25
  sleep 16
end
