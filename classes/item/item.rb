require 'date'

class Item

    attr_accessor :archived

    def initialize(id, genre, author, source, label, publish_date, archived = false)
        @id = id
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = archived
    end

    def can_be_archived?
        publish_date = Date.parse(@publish_date)
        today = Date.today
        if today.year - publish_date.year > 10
            return true
        else
            return false
        end
    end

    def move_to_archive
       @archived = can_be_archived?
    end
end