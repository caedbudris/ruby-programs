class Tree
    attr_accessor :nodes
    
    def initialize
        @nodes = []
    end
    
    def parse(file)
        #save file to array
        lines = IO.readlines(file)
        
        #parse each line
        lines.each do |line|
            arr = line.split
            
            #if the id is second
            if arr[1].include? '@'
                level = arr[0].to_i
                id = arr[1]
                tag = arr[2]
                level = arr[0]
                
                #put data back together
                if arr[3].nil?
                    data = nil
                else
                    data = ''
                    n = arr.size
                    i = 3
                    while i < n 
                        data = data + ' ' + arr[i]
                        i += 1
                    end
                    data[0] = ''
                end
                Node.new(self, level, id, tag, data)
            
            #if the id is the third
            #elsif !arr[2].nil? && arr[2].include?('@')
            #    level = arr[0].to_i
            #    id = arr[2]
            #    tag = arr[1]
            #    
            #    #put data back together
            #    if arr[3].nil?
            #        data = nil
            #    else
            #        data = ''
            #        n = arr.size
            #        i = 3
            #        while i < n 
            #            data = data + ' ' + arr[i]
            #            i += 1
            #        end
            #        data[0] = ''
            #    end
            #    Node.new(self, level, id, tag, data)
            
            #if there is no id
            else
                level = arr[0].to_i
                tag = arr[1]
                
                #put data back together
                if arr[2].nil?
                    data = nil
                else
                    data = ''
                    n = arr.size
                    i = 2
                    while i < n 
                        data = data + ' ' + arr[i]
                        i += 1
                    end
                    data[0] = ''
                end
                Node.new(self, level, nil, tag, data)
            end
        end
    end
    
    def toxml(file)
        xml = File.open(file, 'w')
        
        nc ||= []
        counter = 0
        @nodes.each do |n|
            if n.id != nil 
                xml.puts ' ' * n.level + '<' + n.tag + ' id=' + n.id + '>'
            else
                xml.puts ' ' * n.level + '<' + n.tag + '>'
            end
            
            if n.data != nil    
                puts ' ' * (n.level + 1)  + n.data
            end
            
            if n.level < @nodes[counter + 1].level
                nc.push n
            elsif n.level > @nodes[counter + 1].level
                c = nc.pop 
                xml.puts ' ' * c.level + '</' + c.tag + '>'
            else
                xml.puts ' ' * n.level + '</' + n.tag + '>'
            end
            counter += 1
        end
        f.close
    end
    
end

class Node
    attr_accessor :level, :tag, :id, :data
    
    def initialize(tree, level, id, tag, data)
        @level = level
        @id = id
        @tag = tag
        @data = data
        tree.nodes << self
    end
    
end

tree = Tree.new
tree.parse('sample.ged')
tree.toxml('sample.xml')