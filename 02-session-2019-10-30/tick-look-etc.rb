# Session 2
# Code-Beispiele zu 'tick', 'look' und verschiedenen Datenstrukturen

use_synth_defaults attack: 0, release: 0.25

#######################################################################
# Variablen und Anzeige mit 'puts'
#######################################################################

# v1 = 2018
# v2 = "Leuphana"

# puts "Das Sonic Pi-Seminar finden #{v1} an der #{v2} statt."

#######################################################################
# Datenstrukturen
#######################################################################

# # list ([a,b,c])
# lst = [:c, :eb, :g, :bb, :d5]
# #puts l

# # vector (vector)
# vct = (vector :c, :eb, :g, :bb, :d5)
# # puts vct[1]

# # ring (ring a,b,c)
# rng = (ring :c, :eb, :g, :bb, :d5)
# #puts rng

# # line
# ln = (line 1, 10, steps: 10, inclusive: true)
# puts ln

# # ramp
# rmp = c.ramp
# #puts rmp

# # reverse
# rvs = c.reverse
# puts rvs

# # mirror
# mrr = c.mirror
# puts mrr

#######################################################################
# 'tick' und 'look'
#######################################################################

# tick in Variable
# cnt = tick
# puts cnt
# puts cnt

# 'tick' mit 'look' abfragen
# tick
# puts look

# 'tick' wiederholt aufrufen
# tick
# puts "Das 1. Mal: #{look}"
# tick
# puts "Das 2. Mal: #{look}"
# tick
# puts "Das 3. Mal: #{look}"

# 'times'
# 5.times do
#   tick
#   puts "Das #{look}. Mal..."
#   sleep 1
# end

# 'live_loop'
# live_loop :tick do
#   tick
#   puts "Das #{look}. Mal..."
#   sleep 1
# end

# 'tick'ing through a chord
# my_notes = (chord :c, 'm7+9')
#puts my_notes

# live_loop :chord_tick do
#   play my_notes.tick
#   puts "================================="
#   puts "Das war diese Note: #{my_notes.look}."
#   puts "================================="
#   sleep 1
# end

