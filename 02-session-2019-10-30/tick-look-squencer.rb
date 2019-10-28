# Tick & Look
# Drum Sequencer

use_bpm 120

live_loop :bdrum do
  sample :bd_ada
  sleep 1
end

live_loop :first_example do
  stop
  hihat = (ring
           1, 0, 1, 1,
           1, 0, 1, 1,
           0, 1, 1, 1,
           1, 1, 1, 1)
  sample :drum_cymbal_closed if hihat.tick == 1
  sleep 0.25
end

live_loop :sequencer do
  hihat = (ring
           1, 0.5, 0.5, 0.5,
           1, 0, 1, 0.25,
           0, 1, 0.25, 1,
           1, 1, 0.5, 1)
  snare = (ring
           0, 0, 0, 0,
           1, 0, 0, 0,
           0, 0, 0, 0.5,
           1, 0, 0, 0)
  cowbell = (ring
             0, 0.25, 0, 0.5,
             0, 0, 0, 0,
             0, 0, 0.5, 0,
             0, 0.5, 0, 0)
  sample :drum_cymbal_closed, amp: hihat.tick
  sample :drum_snare_soft, amp: snare.look
  sample :drum_cowbell, amp: cowbell.look
  
  sleep 0.25
end