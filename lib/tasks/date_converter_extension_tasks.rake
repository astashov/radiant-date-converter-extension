namespace :radiant do
  namespace :extensions do
    namespace :date_converter do
      
      desc "Runs the migration of the Date Converter extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          DateConverterExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          DateConverterExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Date Converter to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from DateConverterExtension"
        Dir[DateConverterExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(DateConverterExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
