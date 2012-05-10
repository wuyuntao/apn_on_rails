# -*- coding: UTF-8 -*-

namespace :apn do

  namespace :notifications do

    desc "Deliver all unsent APN notifications."
    task :deliver_each => [:environment] do
      APN::App.find_each do |app|
        begin
          app.send_notifications
        rescue Exception => e
          puts "Failed to send notifications for app #{app.id}. Error: #{e}"
        end
      end
    end

  end # notifications

  namespace :group_notifications do

    desc "Deliver all unsent APN Group notifications."
    task :deliver_each => [:environment] do
      APN::App.find_each do |app|
        begin
          app.send_group_notifications
        rescue Exception => e
          puts "Failed to send group notifications for app #{app.id}. Error: #{e}"
        end
      end
    end

  end # group_notifications

  namespace :feedback do

    desc "Process all devices that have feedback from APN."
    task :process_each => [:environment] do
      APN::App.find_each do |app|
        begin
          app.process_devices
        rescue Exception => e
          puts "Failed to process devices for app #{app.id}. Error: #{e}"
        end
      end
    end

  end

end # apn
