Jekyll::Hooks.register :site, :pre_render do |site, payload|
  config = site.config['hooks'] || {}

  unless config['disabled']
    for action in config['actions'] do
      aType = action['type']
      aExts = action['exts']
      aFind = action['find']
      aReplace = action['replace'] || ''
      aCaseInsensitive = action['case-insensitive']
      aDisabled = action['disabled']

      if aDisabled
        next
      end

      if ['posts', 'pages', 'documents'].include?(aType)
        for item in site.send(aType) do
          if aExts
            docExt = item.extname.tr('.', '')
            unless aExts.include?(docExt)
              next
            end
          end

          unless aFind
            next
          end

          unless aCaseInsensitive
            aFind = Regexp.new aFind
          else
            aFind = Regexp.new aFind, Regexp::IGNORECASE
          end

          newContent = item.content.gsub(aFind, aReplace)
          item.content = newContent
        end
      end

    end
  end
end
