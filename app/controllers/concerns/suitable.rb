module Suitable

  def fully_suitable_employees skill_list = []
    Employee.find_skills_match_all(skill_list).looking
  end

  def suitable_employees skill_list = []
    Employee.find_skills_any(skill_list).looking - fully_suitable_employees( skill_list )
  end

  def fully_suitable_vacancies skill_list = []
    Vacancy.find_skills_match_all(skill_list).active
  end

  def suitable_vacancies skill_list = []
    Vacancy.find_skills_any(skill_list).active - fully_suitable_vacancies( skill_list )
  end
end
