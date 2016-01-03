class Person
    @@people ||= []
    
    attr_accessor :f_name, :l_name, :assigned, :ss
    
    def initialize(first_name, last_name, email, assigned=false)
        @f_name = first_name
        @l_name = last_name
        @email = email
        @assigned = assigned
        @ss = ''
        @@people << self
    end
    
    def assign
        until @assigned == true
            num = rand(@@people.size)
            other = @@people[num]
            if other == nil
                puts "no more people"
                break
            else
                if other.assigned == false && other.l_name != @l_name
                    @ss = other
                    other.ss = self
                    @assigned = true
                    other.assigned = true
                end
                puts "#{@f_name}'s secret santa is #{@ss.f_name}"
            end
        end
    end
    
end
