module CommentsHelper
  def set_form_values (action_name)
     @action_options = Hash.new(2)
     if action_name == 'edit' 
       @action_options[:url_action] = comment_path(@comment)
       @action_options[:button_value] = 'Update comment'
     else 
       @action_options[:url_action] = article_comments_path(@article)
       @action_options[:button_value] = 'Add comment'
     end
  end
end
