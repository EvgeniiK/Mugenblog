module HintsHelper
  def cut_link(link)
    link.sub(/^https?\:\/\//, '').sub(/^www./,'').split('/')[0]
  end
end
