# Examples for the use of 'control'
# filename: examples-for-control.rb

# don't forget to download the sample "marvin.wav" and adust this path
path = "~/projects/sonicpi/github/leuphana-ws1920/online/04-session-2019-11-27/"

#########################################################################
# 'control' running synths
#########################################################################

comment do
  my_tone = play :c4, release: 4
  sleep 1
  control my_tone, note: :c5, note_slide: 0.5
  sleep 1
  # control my_tone, note: :c3, note_slide: 1.0
  # sleep 1
end

comment do
  live_loop :panning do
    s = synth :fm, note: :e4, pan: -1, release: 1, amp: 0
    control s, pan: 1, amp: 3, pan_slide: 2, amp_slide: 6
    sleep 4
    control s, pan: -1, pan_slide: 2
    # sleep 6
    sleep 4
  end
end

# (Modified) Example for use of 'control' from documentation
comment do
  live_loop :test do
    notes = (scale :e3, :minor_pentatonic, num_octaves: 2).shuffle
    s = synth :dtri, cutoff: 70, note: :e3, sustain: 8
    64.times do
      control s, note: notes.tick, note_slide: 0.005
      sleep 0.125
    end
  end
end #comment

comment do
  mel = (ring :c3,:g3,:c4,:g4,:c5,:g4,:f4)
  
  # syn is a reference to the synth.
  # Every time a new note is played, this same synth is used.
  
  syn = synth :beep, amp: 1, attack: 5, sustain: 0, release: 5
  
  live_loop :ring do
    control syn, note: mel.tick
    sleep 0.25
  end
end

comment do
  live_loop :bass do
    use_bpm 60
    
    bass_nts = (ring :c2, :c3, :c2, :c3, :bb1, :bb2, :a2, :g2, :a2, :g2)
    bass_slp = (ring 0.5, 0.75, 0.25, 0.25, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25)
    
    #stop
    tick
    
    with_transpose 0 do
      s = synth :fm, note: bass_nts.look, release: 0.35, depth: 1, divisor: 0.5
      control s, depth_slide: (ring 0.25, 0.0025,0.0025).choose, depth: (ring 2, 4, 6).choose
    end
    sleep bass_slp.look
  end
end #comment

comment do
  live_loop :control_synth_sound do
    notes = (scale :c5, :minor_pentatonic, num_octaves: 1).shuffle
    s = synth :fm, note: notes.tick, release: 0.25, depth: 1, divisor: 1, cutoff: 130
    control s, cutoff: 50, cutoff_slide: 0.0625, depth: 3, depth_slide: 0.0625
    sleep 0.25
  end
end

#########################################################################
# 'control' samples
#########################################################################

comment do
  # control low pass filter
  live_loop :amen do
    s = sample :loop_amen, beat_stretch: 2, lpf: 50
    control s, lpf: 130, lpf_slide: 1.7
    sleep 2
  end
end

comment do
  # control high pass filter
  live_loop :amen do
    s = sample :loop_amen, beat_stretch: 2, hpf: 130
    control s, hpf: 30, hpf_slide: 1.25
    sleep 2
  end
end

comment do
  # control pitch
  live_loop :amen do
    s = sample :loop_amen, beat_stretch: 2, pitch: -1
    control s, pitch: 4, pitch_slide: 2
    sleep 2
  end
end

comment do
  # control pitch
  live_loop :amen do
    s = sample :loop_amen, beat_stretch: 2, pitch: -20
    control s, pitch: 20, pitch_slide: 2
    sleep 2
    
  end
end

comment do
  # control pan
  live_loop :amen do
    s = sample :loop_amen, beat_stretch: 2, pan: -1
    control s, pan_slide: 1.7, pan: 1
    sleep 2
    
  end
end

comment do
  # control amp
  live_loop :amen do
    s = sample :loop_amen, beat_stretch: 2, amp: 0
    control s, amp: 1, amp_slide: 2
    sleep 2
  end
end

#########################################################################
# 'control' effects
#########################################################################

uncomment do
  live_loop :who_marvin do
    with_fx :rlpf, cutoff: 80, res: 0.955, mix: 1 do |rlpf|
      with_fx :gverb, room: 2, mix: 0.75 do
        control rlpf, mix_slide: 1, mix: 0.0, cutoff_slide: 4, cutoff: 110
        sample path, "marvin", beat_stretch: 4, amp: 0.25
      end
    end
    sleep 4
  end
end