def measure(replays=1)
  all_time = 0
  replays.times do
    start_time = Time.now
    yield
    stop_time   = Time.now
    all_time += stop_time - start_time
  end
  all_time / replays
end
