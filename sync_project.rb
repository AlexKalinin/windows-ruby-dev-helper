CUR_DIR = Dir.pwd #`pwd`.sub! "\n", ''
CUR_DIR_NAME = File.basename(Dir.pwd)
REMOTE_DIR = "ssh://hedin@localhost:2222///home/hedin/#{CUR_DIR_NAME}"
COMMAND_SYNC = "#{ENV['HOME']}/unison.exe #{CUR_DIR} #{REMOTE_DIR} -owner -group -batch -terse -confirmbigdel=false" #-prefer #{CUR_DIR}  #.gsub! '/', '\\'
SLEEP_TIME_SEC = 1


puts 'Starting project syncronization'
puts "Local directory: #{CUR_DIR}"
puts "Remote directory: #{REMOTE_DIR}"
while true do
  puts "Executing command: \n#{COMMAND_SYNC}"
  IO.popen(COMMAND_SYNC) { |f| puts f.gets }
  sleep SLEEP_TIME_SEC
end


