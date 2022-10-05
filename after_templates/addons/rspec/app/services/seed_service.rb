class SeedService
  class << self
    def seed(variant: :reset)
      service = SeedService.new
      service.call(variant: variant)
    end
  end

  def call(variant: :reset)
    reset     if variant == :reset
    refresh   if variant == :refresh
    create
  end

  private

  def reset
    # Person.delete_all
    # Post.delete_all
    # Project.delete_all
  end

  def refresh
  end

  def create
    # FactoryBot.create_list(:post, rand(10..20))
    # FactoryBot.create_list(:person, rand(10..20))
    # FactoryBot.create_list(:project, rand(10..20))
  end
end
