require 'irb/completion'

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

begin
  require 'amazing_print'
  AmazingPrint.irb!
rescue LoadError
  puts 'no amazing_print :('
end
