class PostsCollection < BaseCollection
  private

  def relation
    @relation ||= Post.includes(:author).all
  end

  def ensure_filters
    author_filter
    sort_filters
  end

  def sort_filters
    filter do |rel|
      case sort_field
      when 'created_at'
        rel.order(created_at: sort_order)

      else
        raise 'Invalid sort key'
      end
    end
  end

  def author_filter
    filter do |rel|
      rel.where(author_id: params[:author_id])
    end if params[:author_id]
  end
end
