namespace :photos do

	# "Model" should be replaced with the name of your particular active record model.
	# The said model should include a CarrierWave Uploader that has been mounted.

	invalid_files = [
			".",
			"..",
			".DS_Store"
		]

	desc "Add photos in bulk from a 'seed_photos' directory"
	task :seed => :environment do
		
		seed_photos_path = "#{Rails.root.to_s}/seed_photos"
		seed_dir = Dir.open(seed_photos_path)
		photo_files_array = seed_dir.entries
		photo_files_array.each do |file|

			if !invalid_files.include? file
			  instance = Model.new
			  
			  # replace with actual keys/values
			  instance = {
			  	name: "name",
			  	description: "description"
			  }

			  instance.photo = File.open("#{seed_photos_path}/#{file.to_s}")

			  if instance.save!
			  	puts "#{file} added as #{instance.photo.url}"
			  end
			end
		end
	end

	desc "Check contents of 'seed_photos' directory"
	task :check => :environment do 
		seed_photos_path = "#{Rails.root.to_s}/seed_photos"
		seed_dir = Dir.open(seed_photos_path)
		photo_files_array = seed_dir.entries

		puts "Path: #{seed_photos_path}"
		photo_files_array.each do |file|
			if !invalid_files.include? file
				puts "#{file}"
			end
		end
	end
end