module SongsHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def make_favourite_song(song)
    if current_user && current_user.likes(song)
     t("song.remove_from_playlist")
    else
      t("song.add_to_playlist")
    end
  end

  def report_song(song)
    if current_user && current_user.flagged?(song, :report)
     t("song.remove_report")
    else
      t("song.report_for_delete")
    end
  end

  def song_downloads_chat(downloads)
    (3.weeks.ago.to_date..Date.today).map do |date|
      {
          downloaded_at: date,
          downloads: downloads.where("date(created_at) = ?", date).count(:distinct => downloads)
      }
    end
  end
end
