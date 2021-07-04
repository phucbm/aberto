module Jekyll

  # tag single page
  class TagIndex < Page
    def initialize(site, base, dir, tag, relatedTags)
      @site = site
      @base = base
      @dir = '/'+dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tags.html')
      self.data['tag'] = tag
      self.data['description'] = tag
      self.data['relatedTags'] = relatedTags
    end
  end

  # tag archive page
  class TagsIndex < Page
    def initialize(site, base, dir, tags)
      @site = site
      @base = base
      @dir = '/'+dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag-archive.html')
      self.data['tags'] = tags
    end
  end

  class TagGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'tags'
        dir = 'tags'
        site.tags.keys.each do |tag|
          write_tag_index(site, File.join(dir, tag), tag)
        end
      end
      write_tags_index(site, dir)
    end

    def write_tags_index(site, dir)
      tags = write_tags_list(site)
      index = TagsIndex.new(site, site.source, dir, tags)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end

    def write_tag_index(site, dir, tag)
      relatedTags = write_relatedTags(site, tag)
      index = TagIndex.new(site, site.source, dir, tag, relatedTags)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end

    def write_tags_list(site)
      tags = Array.new
      site.posts.docs.each do |post|
        post.tags.each do |tags_list|
          tags.push(tags_list)
        end
      end
      return tags.uniq
    end

    def write_relatedTags(site, tag)
      relatedTags = Array.new
      site.posts.docs.each do |post|
        if post.tags.include?(tag)
          post.tags.each do |tags_list|
            relatedTags.push(tags_list)
          end
        end
      end
      return relatedTags.uniq
    end

  end

end