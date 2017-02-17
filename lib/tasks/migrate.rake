namespace :migrate do
  desc 'save "themes" from hints table as record in tags table'
  task :themes_to_tags => :environment do
    tags = Tag.all
    Hint.where("theme is NOT NULL and theme != ''").each do |h|
      p "Current hint theme: #{h.theme}(#{h.id})"
      h.tags << tags.where(name: h.theme)
    end
  end
end
