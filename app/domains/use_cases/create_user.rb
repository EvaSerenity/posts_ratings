#module UseCase
  class UseCases::CreateUser
    include ActiveModel::Validations

    attr_accessor :login

    validates_presence_of :login

    def initialize(login)
      @login = login
    end

    def perform
      if valid?
        User.find_or_create_by(login: @login)
      else
        self
      end
    end

  end
#end
