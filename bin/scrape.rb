require 'open-uri'
require 'nokogiri'
require 'mail'


host = 'https://ntst.umd.edu/soc/search?'
course_id = 'cmsc435'
section_id = '0101'
term_id = '201501'
open_sections_only = 'on'
course_level_filter = 'ALL'
class_start_time = ''
class_days = 'on'
teaching_center = 'ALL'

page = Nokogiri::HTML(open(host +
                               'courseId=' + course_id +
                               '&sectionId=' + section_id +
                               '&termId=' + term_id +
                               '&_openSectionsOnly=' + open_sections_only +
                               '&courseLevelFilter=' + course_level_filter +
                               '&classStartTime=' + class_start_time +
                               '&_classDays=' + class_days +
                               '&teachingCenter=' + teaching_center))

puts page.css('.open-seats-count')[0].text

threshold = 5

open_seat_count = page.css('.open-seats-count')[0].text.to_i

if open_seat_count < threshold

  mail = Mail.new do
    from     'alieskandari3@gmail.com'
    to       'alieskandari3@gmail.com'
    subject  'Here is the image you wanted'
    body     "hello"
  end

  mail.delivery_method :sendmail

  mail.deliver

end

