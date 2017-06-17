require_relative '../max_priority_queue.rb'

describe MaxPriorityQueue do
  before(:each) do
    @pq = MaxPriorityQueue.new
  end

  describe "#insert" do
    context "empty" do
      it "should update size" do
        @pq.insert(1)
        expect(@pq.size).to eq(1)
      end
    end

    context "non-empty" do
      it "should maintain order" do
        @pq.insert(1)
        @pq.insert(2)
        @pq.insert(3)
        expect(@pq.max).to eq(3)
      end
    end
  end

  describe "#delete_max" do
    context "empty" do
      it "should return nil" do
        expect(@pq.delete_max).to be_nil
      end
    end

    context "non-empty" do
      it "one element queue should return only element" do
        @pq.insert(1)
        expect(@pq.delete_max).to eq(1)
      end

      it "should update size correctly" do
        @pq.insert(1)
        @pq.delete_max
        expect(@pq.size).to eq(0)
      end

      it "should maintain heap order" do
        @pq.insert(1)
        @pq.insert(2)
        @pq.insert(3)
        @pq.insert(1)
        expect(@pq.delete_max).to eq(3)
        expect(@pq.delete_max).to eq(2)
        expect(@pq.size).to eq(2)
      end
    end
  end
end
