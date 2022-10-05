class SeedService
  include FactoryBot::Syntax::Methods

  class << self
    def seed(variant: :test_data)
      service = SeedService.new
      service.call(variant: variant)
    end
  end

  def call(variant: :reset)
    reset
    generate_test_data    if variant == :test_data
    generate_sample_data  if variant == :sample_data
  end

  private

  def reset
    Video.delete_all
    Article.delete_all
    Project.delete_all
    EmployeeRole.delete_all
    Employee.delete_all
    Role.delete_all
    Company.delete_all
    Region.delete_all
  end

  # add_scaffold('region', 'name', 'settings:json')
  # add_scaffold('company', 'name', 'slug', 'active:boolean', 'region:references')
  # add_scaffold('role', 'code', 'description') # contributor, moderator, admin
  # add_scaffold('employee', 'first_name', 'last_name', 'address:text', 'email', 'password', 'company:references')
  # add_scaffold('employee_role', 'employee:references', 'role:references')
  # add_scaffold('project', 'name', 'status', 'budget:decimal', 'country', 'progress:integer', 'company:references')
  # add_scaffold('article', 'title', 'body:text', 'is_featured:boolean', 'published:datetime', 'employee:references', 'company:references')
  # add_scaffold('video', 'title', 'youtube_id', '', 'article:references')

  def generate_test_data
    test_data_regions
    # companies = create_list(:company, rand(3..5))#, region: region)
    # companies = create_list(:company, rand(3..5))#, region: region)
    # employees = create_list(:employee, rand(10..20), company: companies.sample)
    # _articles = create_list(:article, rand(10..20), company: companies.sample, employee: employees.sample)
    # _projects = create_list(:project, rand(10..20), company: companies.sample)
  end

  def generate_sample_data
    regions = create_list(:region, rand(2..5))
    companies = create_list(:company, rand(3..5))#, region: region)
    # companies = create_list(:company, rand(3..5))#, region: region)
    # employees = create_list(:employee, rand(10..20), company: companies.sample)
    # _articles = create_list(:article, rand(10..20), company: companies.sample, employee: employees.sample)
    # _projects = create_list(:project, rand(10..20), company: companies.sample)
  end

  private

  def test_data_regions
    @region_western_sydney = create(:region, :western_sydney)
    @region_western_sydney2 = create(:region, :western_sydney) # create it again Sam
    @region_sydney = create(:region, :sydney)
    @region_eastern_suburbs = create(:region, :eastern_suburbs)
    @region_inner_west = create(:region, :inner_west)
    @region_north_shore = create(:region, :north_shore)
    @regions_random = create_list(:region, 4)
  end
end
