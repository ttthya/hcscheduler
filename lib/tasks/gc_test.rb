# アカウントメールアドレス
mail = "hcscheduler21@gmail.com"
# パスワード
pass = "monster0141"
# Googleカレンダーの「カレンダー設定」画面から取得した非公開URL
feed = "https://calendar.google.com/calendar/embed?src=hyt.takahashi%40gmail.com&ctz=Asia%2FTokyo"

srv = GoogleCalendar::Service.new(mail, pass)
cal = GoogleCalendar::Calendar::new(srv, feed)
events = cal.events

events.each do |event|
  p event.title
  p event.desc
end
