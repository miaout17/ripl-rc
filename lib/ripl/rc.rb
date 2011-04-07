
# when session ends
require 'ripl/rc/squeeze_history'
require 'ripl/rc/mkdir_history'
require 'ripl/rc/ctrld_newline'

# handling error
require 'ripl/rc/last_exception'

# result format
require 'ripl/rc/strip_backtrace'
require 'ripl/rc/color'

# input modification
require 'ripl/rc/multiline'
require 'ripl/rc/eat_whites'

# speical tool
require 'ripl/rc/anchor'

# config
require 'ripl/rc/noirbrc'

# to force ripl to load everything before bundler kicks in!
Ripl.shell
