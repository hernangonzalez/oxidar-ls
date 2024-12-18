require 'toml-rb'

# Helper functions
def ensure_build
    system "cargo build --release"
    if $?.exitstatus != 0
        puts "Oops, we could not build the project!"
        exit 1
    end
end

def select_stage
    path = File.join(File.dirname(__FILE__), 'Course.toml')
    toml_data = TomlRB.load_file(path)
    return toml_data['test']['level']
end

# Build the project
puts "Building the project..."
ensure_build

# Run the tests
puts "Running tests..."
stage = select_stage
test_resut = system "cargo test --release --features stage#{stage}"

# Congrats!
if test_resut 
    puts "All Done!"
else 
    puts "Oops, something went wrong!"
    exit 1
end
