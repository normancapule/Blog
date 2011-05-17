class Post < ActiveRecord::Base
    validates_presence_of :subject, :content
    validates_uniqueness_of :slug #slug is like permalink
    validates_length_of :content, :minimum=>40

    before_save :trim_content, :generate_slug

    def trim_content
      self.content = content.strip
    end

    def to_param #default is id
      #subject
      slug
    end

    def self.find_by_subject(id) #removes the id in the query and replaces it with the subject
      where(:subject=>id).first
    end

    private
    
    def generate_slug
      slug = subject.parameterize #removes punctuation
      similar_count = Post.where("slug like '#{slug}%'").count
      if similar_count == 0
        self.slug = slug
      else
        self.slug = "#{slug}-#{similar_count+1}"
      end
    end
end
