class Address < ApplicationRecord
  scope :added_to_wallet, -> { where added_to_wallet: true }

  scope :to_update_op_return, lambda {
    added_to_wallet.where(
      Address.arel_table[:op_return_checked_at].eq(nil)
        .or(Address.arel_table[:op_return_checked_at].lt(1.hour.ago)),
    )
  }

  validates :value, presence: true

  after_create :add_to_wallet

  def update_op_return?
    added_to_wallet? && (
      op_return_checked_at == nil ||
      op_return_checked_at < 1.hour.ago
    )
  end

  def add_to_wallet
    AddAddressToWalletJob.perform_later self unless added_to_wallet?
  end

  def update_op_return
    UpdateOpReturnJob.perform_later self if update_op_return?
  end
end
