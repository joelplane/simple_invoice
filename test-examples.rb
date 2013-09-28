# bundle exec ruby test-examples.rb

failed = []

example_dir = File.expand_path('example', File.dirname(__FILE__))
Dir["#{example_dir}/*.expected-output.txt"].each do |output_file|
  script_file = output_file.sub('.expected-output.txt', '.rb')
  expected_output = File.read(output_file).strip
  actual_output = `cd #{example_dir}; bundle exec ruby #{script_file}`.strip
  if expected_output != actual_output
    failed << script_file
  end
end

if failed.any?
  puts "Failed examples:"
  failed.each do |script_file|
    puts script_file
  end
  exit 1
else
  exit 0
end
