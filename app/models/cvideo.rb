class Cvideo < ActiveRecord::Base
  belongs_to :content
  
   has_attached_file :video
  
  def convert
    success = system(convert_command)
    system(generate_thumbnail)
    set_new_filename
  end

protected

  def generate_thumbnail
  flv = File.join(File.dirname(video.path), "#{id}.flv")
  command = "ffmpeg -ss 2 -i #{flv} -an -r 1 -vframes 1 -s 300x250 -y #{File.dirname(video.path)}/#{id}.png"
  puts command
  puts "+++++++++++++++++++++++++++++++++"
  puts flv
  command.gsub!(/\s+/, " ")
  return command
end

# This method creates the ffmpeg command that we'll be using
def convert_command
  flv = File.join(File.dirname(video.path), "#{id}.flv")
  File.open(flv, 'w')
  command = "ffmpeg -i  #{video.path} -acodec libfaac -aq 100 -vcodec libx264 -preset slow -crf 22 -threads 0 -f flv -y #{ flv }"
  command.gsub!(/\s+/, " ")
  return command
end

def set_new_filename
  update_attribute(:video_file_name, "#{id}.flv")
  update_attribute(:video_content_type,"video/x-flv")
  flv = File.join(File.dirname(video.path), "#{id}.flv")

  puts flv
  puts File.size(flv)
  size = File.size(flv)
  update_attribute(:video_file_size,"#{size}")
end

end
