module Translator
  module SiteTranslationsHelper
    def translation_text_field(locale, key, default_translation)
      options = { :size => (default_translation.size + 20),
                  :id => "translations_#{locale}_#{key}".gsub(/\./, '_') }

      options[:disabled] = "disabled" if Translator.current_store.default_translation?("#{locale}.#{key}")
      text_field_tag("translations[#{locale}.#{key}]", 
                     ActiveSupport::JSON.decode(Translator.current_store["#{locale}.#{key}"] || ""), 
                     options)
    end
  end
end
