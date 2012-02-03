require('erubis')
require('maruku')

templfile = "template.erb"

def parse_args(args)
  filenames = {}
  if args.length == 1
     filenames[:in] = args[0]
     filenames[:out] = File.basename(args[0],'.*') + '.html'
  else 
    if args.length == 2
      filenames[:in] = args[0]
      filenames[:out] = args[1]
    end
  end
  filenames
end

# search for slide meta data
def include_files(text)
  includes = []
  tag = /^#include\((['"])(.*)\1\)/m
  text.gsub(tag) do  
    content = ""
    File.open($2) do |file|
      content = file.read
      file.close
    end
    content
  end
end

# search for slide meta data
def find_slides(text)
  slides = {}
  counter=1
  tag = /^#slide:([\w:]+)$/
  tag_and_field = /#{tag}((?:(?!#{tag}).)*)/m
  text.scan(tag_and_field).each do |match|
    if match.length >= 2 
      tags = match[0].split(':') # additional css classes
      id =  tags[0]
      classes = tags[1..5]  # 5 classes is enough
      if slides.has_key?(id)
        id = "#{id}#{counter}"
        counter+=1
      end
      unless match[1].empty? or match[1].nil?
        doc = Maruku.new(match[1])
        slides[id] = {:content => doc.to_html, :classes => classes.join(" ")}
      end
    end
  end
  slides
end

# partial renderer
class Erubis::Eruby
  def render(opts) 
    str = ""
    if opts && opts.has_key?(:classes) && !opts[:classes].nil?
      opts[:classes].each do |cl|
        str += "class=\"#{cl}\" "
      end
    end 
   str
  end
end


def usage
  "Usage: ruby process.rb infile [outfile]"
end

filenames = parse_args(ARGV)
if(filenames.empty?)
  puts "Too fiew arguments Arguments"
  puts usage
  exit -1
end

template = File.read(templfile)
File.open(filenames[:in],'r') do |infile|
  markdown = infile.read
  markdown = include_files(markdown)
  slides = find_slides(markdown)
  File.open(filenames[:out],'w') do |outfile|
    erbtemp = Erubis::Eruby.new(template)
    outfile.write erbtemp.result(:slides => slides)
  end
end


