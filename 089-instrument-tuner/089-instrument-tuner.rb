require 'facets'

answer = ''
flag = false

File.open('DATA89.lst', 'r') do |file|
  while line = file.gets
    unless flag
      flag = true
      next
    end

    line.split(' ').each do |frec|
      octave = [32.70, 34.65, 36.71, 38.89, 41.20, 43.65,
      46.25, 49.00, 51.91, 55.00, 58.27, 61.74]
      scale = 1
      note = Array.new()

      while frec.to_i > octave.max
        octave = octave.ewise * 2
        scale += 1
      end

      octave << octave[11] / 2
      octave << octave[1] * 2

      octave.each do |num|
        note << (num - frec.to_i).abs
      end

      case note.index(note.min)
        when 0
          answer << "C#{scale} "
        when 1
          answer << "C##{scale} "
        when 2
          answer << "D#{scale} "
        when 3
          answer << "D##{scale} "
        when 4
          answer << "E#{scale} "
        when 5
          answer << "F#{scale} "
        when 6
          answer << "F##{scale} "
        when 7
          answer << "G#{scale} "
        when 8
          answer << "G##{scale} "
        when 9
          answer << "A#{scale} "
        when 10
          answer << "A##{scale} "
        when 11
          answer << "B#{scale} "
        when 12
          answer << "B#{scale -1} "
        when 13
          answer << "C#{scale + 1} "
      end

    end
  end
end
puts answer
