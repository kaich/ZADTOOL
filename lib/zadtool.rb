require "zadtool/version"
require 'optparse'

module Zadtool

  def self.run
    
    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: zad tool for zad project"

      opts.on("-o", "--obscure XcodeprojPath", "obscure code") do |v|
        options[:obscure] = v
      end

      opts.on("-l", "--load path1,path2,path3",Array,"load filt symbols from path") do |v|
        options[:load] = v 
      end

      opts.on("-r", "--reset", "reset loaded symbols") do |v|
        options[:reset] = true
      end

      opts.on("-f", "--fetch type1,type2,type3", "fetch and replace type,default type is [c,p,f].c for class,p for property,f for function") do |v|
        options[:fetch] = v
      end

      opts.on("-i", "--ignore XcodeprojPath", "create a ignore file, you can write your filt symbols in it.eg:name,age ...") do |v|
        options[:ignore] = v 
      end

      opts.on("-t", "--type replaceType", "obscure type = [r,w,c] ,r: random w: random words c: custom replace rule") do |v|
        options[:type] = v 
      end

    end.parse!

    
  end

end
