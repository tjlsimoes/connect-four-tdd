require_relative "../lib/node"

describe Node do
  subject(:node) { described_class.new(36, "\u26dD")}

  describe "#children" do
    context "when it has no children" do
      it "returns array of 8 elements" do
        output = node.children

        expect(output.length).to eq(8)
      end

      it "returns array of 8 nil elements" do
        output = node.children

        expect(output.compact).to eq([])
      end
    end
  end 

  describe "node.instance_variables" do
    it "returns all instance variables: id, symbol and children" do
      output = node.instance_variables
      expected = [:@id, :@symbol, :@child1, :@child2, :@child3, :@child4, :@child5, :@child6, :@child7, :@child8]
      expect(output).to eq(expected)
    end
  end
end
