class AddAddressToDashWalletJob < ApplicationJob
  queue_as :default

  def perform(address)
    unless address.instance_of? Address
      raise TypeError, "Expected #{Address}, got #{address.class}"
    end

    raise unless system %Q(dash-cli importaddress "#{address.value}" "" true)

    address.update! added_to_wallet: true
  end
end
