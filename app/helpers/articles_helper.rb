module ArticlesHelper
  Languages = %w(C C++ Clojure CSS Delphi diff ERB Go Groovy HAML HTML Java
                 JavaScript JSON Lua PHP Python Ruby Sass SQL Taskpaper XML YAML)
  def coderay(text)
    text.gsub(/\<pre\>(.+?)\<\/pre\>/m) do
      code = $1
      language = code.scan(/^#{Regexp.union(Languages).source}/i)[0]
      language ? CodeRay.scan(code, language).div : text
    end
  end
end
