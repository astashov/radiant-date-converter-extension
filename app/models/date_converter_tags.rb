module DateConverterTags
  include Radiant::Taggable

  desc %{
    Converts date from one format to another. It has only two attributes: @from@ and @to@. 
    They use usual format of the strftime or strptime.

    *Usage:*

    <pre><code><r:date_converter from='%Y%m%d' to='%Y-%m-%d'>20090203</r:date_converter></code></pre>
  }
  tag 'date_converter' do |tag|
    date_string = tag.expand
    begin
      from_date = Date.strptime(date_string, tag.attr['from'])
      from_date.strftime(tag.attr['to'])
    rescue
      logger.warn(
        "\033[1;31mConverting date '#{date_string}' from '#{tag.attr['from']}' to '#{tag.attr['to']}' was unsuccessful\033[0m"
      )
      ""
    end
  end
  
end