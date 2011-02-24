
require 'ripl'

module Ripl::Rc; end
module Ripl::Rc::SqueezeHistory
  include Ripl::Rc # makes U avaliable

  # write squeezed history
  def write_history
    File.open(history_file, 'w'){ |f|
      f.puts U.squeeze_history(history).join("\n")
    } if (Ripl.config[:rc_anchor] || []).empty?
  end

  # squeeze history on memory too
  def eval_input input
    history.pop if input.strip == '' ||
                  (history.size > 1 && input == history[-2])
    super
  end

  def before_loop
    super if (Ripl.config[:rc_anchor] || []).empty?
  end

  module Imp
    def squeeze_history history
      history.to_a.inject([]){ |result, item|
        if result.last == item
          result
        else
          result << item
        end
      }
    end
  end
end

module Ripl::Rc::U; extend Ripl::Rc::SqueezeHistory::Imp; end

Ripl::Shell.include(Ripl::Rc::SqueezeHistory)
