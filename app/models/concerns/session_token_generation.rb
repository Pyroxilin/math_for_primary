module SessionTokenGeneration
  extend ActiveSupport::Concern

  included do
    after_initialize :generate_session_token
    around_create :regenerate_session_token_if_not_unique
  end

  def generate_session_token
    self.session_token ||= GenerateSessionToken.new.call
  end

  def regenerate_session_token_if_not_unique(retries_count = 0)
    yield
  rescue ActiveRecord::RecordNotUnique => e
    raise e if retries_count >= 3

    self.session_token = GenerateSessionToken.new.call
    retries_count += 1
    retry
  end

  class GenerateSessionToken
    ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    LENGTH = 5

    def call
      Array.new(LENGTH) { ALPHABET.sample }.join
    end
  end
end
