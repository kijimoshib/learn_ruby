class XmlDocument

  def initialize(multi_l=false)
    @allow_tegs = %w(hello goodbye come_back ok_fine)
    @multi_line = multi_l
    @deep_level = 0
  end

  def method_missing(method_name, *args, &block)
    if (@allow_tegs.include? method_name.to_s) ||
       (/^[a-z_]{1,10}$/.match(method_name.to_s))

      tag_arguments = {}
      tag_name      = method_name
      tag_arguments = args[0] if args[0]

      result_str = ""
      result_str << ("  " * @deep_level) if @multi_line
      result_str << "<#{tag_name}"
      tag_arguments.each_pair do |k, v|
        result_str << " #{k}='#{v}'"
      end

      if block_given?
        result_str << ">#{"\n" if @multi_line}"

        @deep_level   += 1
        block_content = yield
        result_str << block_content if block_content
        @deep_level -= 1

        result_str << "  " * @deep_level if @multi_line
        result_str << "</#{tag_name}>#{"\n" if @multi_line}"
      else
        result_str << "/>#{"\n" if @multi_line}"
      end

      result_str
    else
      super
    end
  end
end
