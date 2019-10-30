#
# Ringe, Ticks und Looks
#

toene = [:c, :e, :g]
ein_ring = (ring :c, :e, :g)

comment do
  live_loop :zaehlen_und_spielen do
    play (ring :c, :e, :g).tick
    sample :drum_cowbell
    sleep 1
  end
end

live_loop :kuhglocke do
  
  glocke = (ring 0, 1, 0, 1,   0.25, 1, 0.5, 0,  0, 1, 0.5, 1,   0.25, 0, 0, 0)
  hihat = (ring 0, 1, 0, 1,   0, 1, 0, 1,   0, 1, 0, 1,   0, 1, 0, 1)
  
  #sample :drum_cowbell, amp: glocke.tick
  sample :ambi_glass_rub, start: 0, finish: 0.01, amp: glocke.tick
  sample :drum_cymbal_closed, amp: hihat.look
  sleep 0.125
end

