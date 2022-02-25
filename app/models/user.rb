class User < ApplicationRecord
  def my_tests(level_test)
    Test.joins('JOIN tests_users ON tests_users.test_id = tests.id').where(tests: {level: level_test}).where('tests_users.user_id = ?', self.id).pluck('tests.title')
  end  
end
