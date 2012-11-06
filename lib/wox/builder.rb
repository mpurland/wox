module Wox
  class Builder < Task
    include Environment
    # def initialize(environment); super end
    
    def build
      configuration = environment[:configuration]
      puts "Building #{environment[:full_name]} configuration:#{configuration}"
      
      log_file = File.join environment[:build_dir], "build-#{configuration}.log"

      run_command "xcodebuild -#{environment[:target_or_scheme]} '#{environment[:target]}' -configuration '#{configuration}' BUILD_DIR=#{environment[:build_dir]} clean build", :results => log_file
    end
  end
end
