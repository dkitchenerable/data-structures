require_relative '../linked_list.rb'
require_relative '../node.rb'

describe LinkedList do
  describe "#push_front" do
    before (:each) do
      @list = LinkedList.new
      @node1 = Node.new(1, 2)
      @node2 = Node.new(1, 1)
    end

    context "empty list" do
      it "head should point to new node" do
        @list.push_front(@node1)
        expect(@list.head).to eq(@node1)
      end

      it "tail should point to new node" do
        @list.push_front(@node1)
        expect(@list.tail).to eq(@node1)
      end

      it "size is incremented" do
        @list.push_front(@node1)
        expect(@list.size).to eq(1)
      end
    end

    context "non-empty list" do
      it "head should point to new node" do
        @list.push_front(@node1)
        @list.push_front(@node2)
        expect(@list.head).to eq(@node2)
      end

      it "tail should point to old node" do
        @list.push_front(@node1)
        @list.push_front(@node2)
        expect(@list.tail).to eq(@node1)
      end

      it "size is incremented" do
        @list.push_front(@node1)
        @list.push_front(@node2)
        expect(@list.size).to eq(2)
      end
    end
  end

  describe "#pop_front" do
    before (:each) do
      @list = LinkedList.new
      @node1 = Node.new(1, 2)
      @node2 = Node.new(1, 1)
    end

    context "empty list" do
      it "should handle by returning nil" do
        expect(@list.pop_front).to be_nil
      end
    end

    context "non-empty list" do
      it "should return head" do
        @list.push_front(@node1)
        head = @list.head
        expect(@list.pop_front).to eq(head)
      end

      it "tail should be nil after popping" do
        @list.push_front(@node1)
        @list.pop_front
        expect(@list.tail).to be_nil
      end

      it "head should be nil after popping" do
        @list.push_front(@node1)
        @list.pop_front
        expect(@list.head).to be_nil
      end

      it "size is decremented" do
        @list.push_front(@node1)
        @list.pop_front
        expect(@list.size).to eq(0)
      end

      it "head and tail update accordingly with multi key list" do
        @list.push_front(@node1)
        @list.push_front(@node2)
        @list.pop_front
        expect(@list.tail).to eq(@node1)
        expect(@list.head).to eq(@node1)
      end

    end
  end
end