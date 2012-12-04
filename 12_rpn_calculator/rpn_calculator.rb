class RPNCalculator

  attr_reader :value

  def initialize
    @stack   ||= []
    @value   ||= nil
    @op_hash = {:+ => :plus,
                :- => :minus,
                :* => :times,
                :/ => :divide}
  end

  def push(number)
    @stack.push(number.to_f)
  end

  def plus
    unless stack_is_empty?
      @value = push(pop + pop).last
    end
  end

  def minus
    unless stack_is_empty?
      @value = push(pop - pop).last
    end
  end

  def times
    unless stack_is_empty?
      @value = push(pop * pop).last
    end
  end

  def divide
    unless stack_is_empty?
      @value = push(pop / pop).last
    end
  end

  def method_missing(method, *args, &block)
    if %w[push pop].include? method.to_s
      @stack.send(method.to_sym, *args, &block)
    else
      super
    end
  end

  def tokens(str)
    str.split.map do |t|
      case t
      when "+", "-", "*", "/"
        t.to_sym
      else
        t.to_f
      end
    end
  end


  def evaluate(str)
    tokens(str).each { |tk| (tk.is_a? Symbol) ? send(@op_hash[tk]) : push(tk) }
    value
  end

  private

  def stack_is_empty?
    @stack.length < 2 ?
      raise("calculator is empty") : false
  end
end
