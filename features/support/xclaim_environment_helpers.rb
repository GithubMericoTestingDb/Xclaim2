# coding: utf-8
# frozen_string_literal: true

class EnvironmentHelper
  def self.for_environment
    env = ENV['target'] || :prod

    {
      prod: {
        url: 'https://staging.x-claim.com/login'
      },
      master: {
      url:   'https://staging.x-claim.com/login',
      },
      dev: {
      url: 'https://staging.x-claim.com/login',
      },
      staging: {
      url:   'https://staging.x-claim.com/login',
      },
      local: {
      url:   'https://localhost:9443/',
      },
    }[env.to_sym]
  end

  def self.domain
    env = ENV['target'] || :prod

    env == :dev ? 'http://' : 'https://'
  end

  def self.base_url
    "#{for_environment[:url]}"
  end
end
