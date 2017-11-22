module ApplicationHelper

  def form_image_select(post)
    return image_tag post.image.url(:medium),
                     id: 'image-preview',
                     class: 'img-responsive' if post.image.exists?
    image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end

  def bootstrap_class_for(flash_type)
    case flash_type
    when "success" #green
      "alert-success"
    when "error" #red
      "alert-danger"
    when "alert" #yellow
      "alert-warning"
    when "notice" #blue
      "alert-info"
    else
      flash_type.to_s
    end
  end

end
