class UploaderController < ApplicationController
  def form
   @uploadfile = UploadFile.new
  end
end
