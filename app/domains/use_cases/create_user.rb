class UseCases::CreateUser

  attr_reader :user

  delegate :errors, to: :user

  def initialize(login)
    @login = login
    @success = false
  end

  def success?
    @success
  end

  def perform
    @user = User.find_or_create_by(login: @login)
    if @user.persisted?
      success!
    end
    self
  end

  protected

  def success!
    @success = true
  end

end
