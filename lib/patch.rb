require "sourcify"
require "patch/version"

module Patch

  def self.included(receiver)
    receiver.send :extend, ClassMethods
  end

  module ClassMethods
    def patch(klass, &block)
      __send__ :using, Module.new { refine klass, &block }
    rescue ArgumentError
      class_eval <<-RB, __FILE__, __LINE__
        using Module.new do
          refine #{klass} do
            #{block.to_source(strip_enclosure: true, ignore_nested: true)}
          end
        end
      RB
    end
  end

end
