# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id              :bigint           not null, primary key
#  email           :string           default(""), not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_accounts_on_email  (email) UNIQUE
#
require "rails_helper"

RSpec.describe Account do
  describe "validations" do
    subject { build(:account) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end

  describe "valid factory" do
    it { expect(build(:account)).to be_valid }
  end
end
