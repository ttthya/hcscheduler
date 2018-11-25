class ScheduleMailer < ApplicationMailer
  default from: 'xxxx@hcs.co.jp' 

  def edition_email(schedule,addresses)
   @schedule = schedule
   mail( bcc: addresses,
        subject: '時間割変更のお知らせ'
   )
  end
end
