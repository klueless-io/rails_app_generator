# frozen_string_literal: true

puts 'project diff'

# frozen_string_literal: true

class ProjectDiff
  attr_reader :lhs_path
  attr_reader :rhs_path

  def initialize(lhs_path, rhs_path)
    @lhs_path = lhs_path
    @rhs_path = rhs_path
  end

  def file_list_lhs
    @file_list_lhs ||= file_list(lhs_path)
  end

  def file_list_rhs
    @file_list_rhs ||= file_list(rhs_path)
  end

  def file_list(path)
    Dir.glob("#{path}/**/*")
       .reject(&method(:exclusions))
       .map { |f| f.delete_prefix(path) }
  end

  # What files are only on the left or right side?

  def files_only_on_lhs
    (file_list_lhs - file_list_rhs).uniq
  end

  def files_only_on_rhs
    (file_list_rhs - file_list_lhs).uniq
  end

  # What files are different on the left or right side?

  # rubocop:disable Metrics/AbcSize
  def files_that_are_different
    common_files = file_list_lhs & file_list_rhs
    common_files
      .map { |file| { file: file, different: !FileUtils.compare_file(File.join(lhs_path, file), File.join(rhs_path, file)) } }
      .select { |file| file[:different] }
      .reject { |file| diff_exclusions(file[:file]) }
      .map { |file| file[:file] }
  end
  # rubocop:enable Metrics/AbcSize

  def vscode_compare_files
    files_that_are_different.map do |file|
      system("code --diff #{File.join(lhs_path, file)} #{File.join(rhs_path, file)}")
    end
  end

  def debug
    debug_stats

    debug_files_only_on_the_left
    debug_files_only_on_the_right
    debug_files_that_are_different
  end

  private

  # rubocop:disable Metrics/AbcSize
  def debug_stats
    kv('left path'                      , lhs_path)
    kv('file count'                     , file_list_lhs.count)
    kv('files only on left count'       , files_only_on_lhs.count)

    kv('right path'                     , rhs_path)
    kv('file count'                     , file_list_rhs.count)
    kv('files only on right count'      , files_only_on_rhs.count)

    kv('files that are different count' , files_that_are_different.count)
  end
  # rubocop:enable Metrics/AbcSize

  def debug_files_only_on_the_left
    puts '- [files only on left]----------------------------------------------------'
    list = files_only_on_lhs.each { |f| puts f }
    puts list.any? ? list : 'NO FILES'
  end

  def debug_files_only_on_the_right
    puts '- [files only on right]---------------------------------------------------'
    list = files_only_on_rhs.each { |f| puts f }
    puts list.any? ? list : 'NO FILES'
  end

  def debug_files_that_are_different
    puts '- [files that are different]----------------------------------------------'
    puts files_that_are_different.empty? ? 'NO FILES' : files_that_are_different
  end

  def kv(label, value, len = 35)
    return ' ' * len if label.nil?

    label = label.to_s if label.is_a?(Symbol)
    label = label.length > len ? label.slice(0..len) : label.ljust(len, ' ')

    puts "#{label}: #{value}"
  end

  def exclusions(file)
    File.directory?(file) ||
      file.include?('/tmp/') ||
      file.include?('/node_modules')
  end

  def diff_exclusions(file)
    file.include?('config/credentials.yml.enc') ||
      file.include?('master.key')
  end
end
