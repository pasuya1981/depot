proc = Proc.new { puts "I am a proc" }

def proc_level1_method(condition, message, code)
  if condition
  	message = 'The conditin is true'
  end
  proc_level2_method(message, code)
end

def proc_level2_method(message, &code)
  puts message
  p code
end

proc_level1_method(true, message = " ", proc)