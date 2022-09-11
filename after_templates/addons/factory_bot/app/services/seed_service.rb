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
    Article.delete_all
    Project.delete_all
    Employee.delete_all
    Tenant.delete_all
    App.delete_all
  end

  def refresh
  end

  def create
    app = FactoryBot.create(:app)
    tenants = FactoryBot.create_list(:tenant, rand(10..20), app: app)
    employees = FactoryBot.create_list(:employee, rand(10..20), tenant: tenants.sample)
    _articles = FactoryBot.create_list(:article, rand(10..20), tenant: tenants.sample, employee: employees.sample)
    _projects = FactoryBot.create_list(:project, rand(10..20), tenant: tenants.sample)
  end
end
