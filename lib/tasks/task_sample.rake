namespace :task_sample do

  desc 'PDF読み込み' # rake -T で表示する説明
  task read: :environment do
    # Report.pdfの読み込み処理
    reader = Pdftotext.text('lib/tasks/pdf/test.pdf') # 読み込むPDF名
    puts reader                       # 読み込んだテキストの出力
  end
end
