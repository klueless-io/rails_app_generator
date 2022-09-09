class SeedService
  class << self
    def seed
      service = SeedService.new
      service.call
    end
  end

  def call
    reset
    create
  end

  private

  def reset
    # Person.delete_all
    # Post.delete_all
    # Project.delete_all
  end

  def create
    # FactoryBot.create_list(:post, rand(10..20))
    # FactoryBot.create_list(:person, rand(10..20))
    # FactoryBot.create_list(:project, rand(10..20))
  end
end
