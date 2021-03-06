class Address < ApplicationRecord
  validates :value, presence: true

  after_create :add_to_dash_wallet

  def add_to_dash_wallet
    AddAddressToDashWalletJob.perform_later self unless added_to_wallet?
  end
end
