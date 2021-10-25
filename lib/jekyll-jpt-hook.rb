Jekyll::Hooks.register :pages, :pre_render do |page, payload|
    docExt = page.extname.tr('.', '')
    # only process if we deal with a markdown file
    if payload['site']['markdown_ext'].include? docExt
        newContent = page.content.gsub(/!\[(.*)\]\(([^\)]+)\)(?:{:([^}]+)})*/, '{% picture \2 --alt \1 %}')
        page.content = newContent
    end
end