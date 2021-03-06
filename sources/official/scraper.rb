#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    field :name do
      name_and_position_words.last(2).join(' ')
    end

    field :position do
      name_and_position_words.slice(0...-2).join(' ')
    end

    private

    # This whole approach will fail horribly if there is every a member
    # with a name that has more than 2 words. But as that seems like
    # it's going to be *much* more complicated, delay dealing with it
    # until we see what that looks like, as it might never happen!
    def name_and_position
      noko.xpath('.//a').first.text
    end

    def name_and_position_words
      name_and_position.split(' ')
    end
  end

  class Members
    def member_container
      noko.css('#block-menu-block-5 li.expanded')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
