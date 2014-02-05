require "sourcify"
require "patched/version"

module Patched

  def self.included(receiver)
    receiver.send :include, ClassMethods
  end

  def self.refinements
    @refinements ||= {}
  end

  def self.new_refinement(receiver, class_to_refine, &block)
    refinement = Module.new
    refinement.module_eval <<-RB, __FILE__, __LINE__
      refine #{class_to_refine} do
        #{block.to_source(strip_enclosure: true, ignore_nested: true)}
      end
    RB

    module_name = "#{receiver}::#{class_to_refine}"
    self.refinements[module_name] = refinement
  end

  module ClassMethods
    def patched(klass, &block)
      Patched.new_refinement(self, klass, &block)
    end
  end

end
