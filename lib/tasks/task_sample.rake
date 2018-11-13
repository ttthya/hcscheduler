namespace :task_sample do

  desc 'PDF読み込み' # rake -T で表示する説明
  task read: :environment do
    # Report.pdfの読み込み処理
   # reader = Pdftotext.text('lib/tasks/pdf/test3.pdf')# 読み込むPDF名
   # puts reader#.gsub("\n","")[468..1657]
 #国家試験中１クラスの文字数1189 普通

reader = PDF::Reader.new("lib/tasks/pdf/sample.pdf")

reader.pages.each do |page|
  puts page.text
end


  end
end
