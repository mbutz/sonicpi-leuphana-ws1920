# Karlheinz Stockhausen (1978): Die vier Kriterien der elektronischen Musik
# Beispiel zum 1. Kriterium: Komposition im Zeitkontinuum


live_loop :zeitkontinuum do
  
  use_synth :sine
  use_synth_defaults attack: 0, attack_level: 1, release: 0.0375
  
  ptn = (ring 0, 1, 1.25, 2, 2.5, 3)
  #ptn = (ring 0, 0.5, 1, 2, 2.75, 3)
  #ptn = (ring 0, 0.25, 0.5, 2, 2.25, 3)
  vol = (ring 1, 0.5, 1, 0.25, 0.25, 1)
  dns = (ring 1, 2, 4, 8, 16, 32, 64, 96)
  #dns = (ring 110)
  density dns.tick do
    puts "Tempo -----> x#{dns.look}"
    at ptn, vol do |v|
      play :c3, amp: v
    end
    sleep 4
  end
end


