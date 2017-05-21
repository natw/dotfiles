require 'irb/completion'

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
  puts 'no awesome_print :('
end
