class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
 
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url
    'default.jpg'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  process resize_to_fit: [1000, 1000]
  process :strip_exif

  def strip_exif
    manipulate! do |img|
      img.strip       # Exif情報除去
      img = yield(img) if block_given?
      img
    end
  end

end
