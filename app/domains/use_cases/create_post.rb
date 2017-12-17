#module UseCases
  class UseCases::CreatePost
    include ActiveModel::Validations

    attr_accessor :title, :content, :ip

    validates_presence_of :title
    validates_presence_of :content
    validates_presence_of :ip

    def initialize(title, content, user, ip)
      @title = title
      @content = content
      @user = user
      @ip = ip
    end

    def perform
      if @user.errors.empty?
        if valid?
          Post.create(title: @title, content: @content, user_ip: @ip, user_id: @user.id)
        else
          self
        end
      else
        self.errors.messages[:user] = @user.errors.messages
        self
      end
    end

  end
#end