

define :bass do
  in_thread do
    play :c3, release: 4
    sleep 4
  end
end

define :melody do
  in_thread do
    4.times do
      akkord = (ring :c, :e, :g, :b)
      play akkord.tick, release: 0.25
      sleep 1
    end
  end
end

bass
melody
sleep 4

bass
melody
