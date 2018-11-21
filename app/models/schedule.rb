class Schedule < ApplicationRecord
  has_one_attached :pdf

  def import(file)
   File.open(file.path) do |f|
    
    reader = PDF::Reader.new(io)
    
     texts=[]
     reader.pages.each do |page|
      texts << page.text
     end

     txtfile = File.open("storage/txt/output.txt","w")
     txtfile.puts texts
     file.close

     File.foreach("storage/txt/output.txt"){ |line|
       p line.split 
       texts << line.split
     }
    end
   end
end
