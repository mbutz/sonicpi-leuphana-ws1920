# -*- coding: utf-8 -*-
p = 1

all_synths = synth_names

live_loop :use_all_synths do

  use_synth_defaults attack: 0, sustain: 0, release: 0.5, cutoff: 130

  with_synth synth_names.tick do
    puts "=================================================================="
    puts "                       #{synth_names.look}"
    puts "=================================================================="
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    sleep 0.5
    play_pattern_timed [:c4,:eb,:g,:bb], 0.5
    sleep 0.5
    play [:c4,:eb,:g,:bb], amp: 3
    sleep p
  end
end
