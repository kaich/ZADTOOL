require "zadtool/version"
require 'optparse'
require 'open-uri'

module Zadtool

  def self.run
    
    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: zad tool for zad project"

      opts.on("-s", "--string urlstring", "url encode for urlString") do |v|
        options[:str] = v
      end

      opts.on("-f", "--file path","url encode for content of path") do |v|
        options[:file] = v
      end

      opts.on("-b", "--base baseURL","base url for url encode") do |v|
        options[:base] = v
      end

    end.parse!

    base_url = options[:base]
    if base_url == nil
        base_url = ""
    end

    str = options[:str]
    if str
        puts "---------------------"
        puts(base_url + URI::encode(str))
    end

    path = options[:file]
    if path
        results = ""
        File.readlines(path).each do |line|
            encodeStr = base_url + URI::encode(line)
            results = results + encodeStr + "\n"
        end
        puts "---------------------"
        puts results
    end
    
  end

end
