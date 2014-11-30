module Skillable
  extend ActiveSupport::Concern

  included do
    acts_as_taggable_on :skills
  end

  module ClassMethods
    def find_skills_match_all skill_list = []
      tagged_with( skill_list, on: :skills, match_all: true )
    end

    def find_skills_any skill_list = ''
      tagged_with( skill_list, on: :skills, any: true )
    end
  end
end
