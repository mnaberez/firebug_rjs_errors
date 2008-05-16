module ActionView::Helpers::PrototypeHelper::JavaScriptGenerator::GeneratorMethods

  def to_s #:nodoc:
    returning javascript = @lines * $/ do
      if ActionView::Base.debug_rjs
        source = javascript.dup
        javascript.replace "try {\n#{source}\n} catch (e) "
        javascript << "{ console.log('RJS error:\\n\\n' + e.toString()); console.log('#{source.gsub('\\','\0\0').gsub(/\r\n|\n|\r/, "\\n").gsub(/["']/) { |m| "\\#{m}" }}'); throw e }"
      end
    end
  end

end