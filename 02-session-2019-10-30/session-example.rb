# Beispiel aus der Sitzung vom 07.11.2017

use_bpm 120

live_loop :hihat do
  rhythm = (ring 0,1,0,1,0,0,0,1,1,0,0,0,0,0,1,1,1)
  if rhythm.tick == 1
    sample :drum_cymbal_closed, amp: 1, rate: 1
  end
  sleep 0.25
end

live_loop :hihat do
  rhythm = (ring
            0,1,0,1,
            0,0,0,1,
            1,0,0,0,
            0,0,1,1,1)
  if rhythm.tick == 1
    sample :drum_cymbal_closed
  end
  sleep 0.25
end

live_loop :kick do
  sample :bd_haus, amp: 0.5
  sleep 1
end

live_loop :snare do
  sleep 1
  sample :drum_snare_soft, amp: 1.5
  sleep 1
end
