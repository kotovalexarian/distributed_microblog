class UpdateOpReturnJob < ApplicationJob
  queue_as :default

  def perform(address)
    unless address.instance_of? Address
      raise TypeError, "Expected #{Address}, got #{address.class}"
    end

    return unless address.update_op_return?

    nil # TODO: update OP_RETURN
  end
end
