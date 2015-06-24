# To run: ruby get_asserts.rb <JOB_ID>

require 'json'

job_id = ARGV[0] || "51154ba9ed3744309f27eb3de23d5084"

curl_command = "curl -u #{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']} \
https://saucelabs.com/rest/v1/#{ENV['SAUCE_USERNAME']}/jobs/#{job_id}"

assets = JSON.parse `#{curl_command}/assets`

screenshots = assets['screenshots']

# getting screenshots
for screenshot in screenshots
	`#{curl_command}/assets/#{screenshot} > #{screenshot}`
end

# selenium-server log
`#{curl_command}/assets/selenium-server.log > selenium-server.log`

# video
`#{curl_command}/assets/video.flv > video.flv`

# final screenshot
# `#{curl_command}/assets/final-screenshot.png > final-screenshot.png`
