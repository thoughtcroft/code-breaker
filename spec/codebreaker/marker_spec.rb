module Codebreaker
  describe Marker do
    describe '#exact_match_count' do
      context 'with no matches' do
        it 'returns 0' do
          marker = Marker.new('1234', '5555')
          expect(marker.exact_match_count).to eq(0)
        end
      end

      context 'with 1 exact match' do
        it 'returns 1' do
          marker = Marker.new('1234', '1555')
          expect(marker.exact_match_count).to eq(1)
        end
      end

      context 'with 1 number match' do
        it 'returns 0' do
          marker = Marker.new('1234', '2555')
          expect(marker.exact_match_count).to eq(0)
        end
      end

      context 'with 1 exact match and 1 number match' do
        it 'returns 1' do
          marker = Marker.new('1234', '1525')
          expect(marker.exact_match_count).to eq(1)
        end
      end
    end

    describe '#number_match_count' do
      context 'with no matches' do
        it 'returns 0' do
          marker = Marker.new('1234', '5555')
          expect(marker.number_match_count).to eq(0)
        end
      end

      context 'with 1 number match' do
        it 'returns 1' do
          marker = Marker.new('1234', '2555')
          expect(marker.number_match_count).to eq(1)
        end
      end

      context 'with 1 exact match' do
        it 'returns 0' do
          marker = Marker.new('1234', '1555')
          expect(marker.number_match_count).to eq(0)
        end
      end

      context 'with 1 exact match and 1 number match' do
        it 'returns 1' do
          marker = Marker.new('1234', '1525')
          expect(marker.number_match_count).to eq(1)
        end
      end

      context 'with 1 exact match duplicated in guess' do
        it 'returns 0' do
          marker = Marker.new('1234', '1155')
          expect(marker.number_match_count).to eq(0)
        end
      end
    end

    describe '#guess_is_correct?' do
      context 'when the guess is incorrect' do
        it 'returns false' do
          marker = Marker.new('1234', '4321')
          expect(marker.guess_is_correct?).not_to be
        end
      end

      context 'when the guess is correct' do
        it 'returns true' do
          marker = Marker.new('1234', '1234')
          expect(marker.guess_is_correct?).to be
        end
      end
    end
  end
end
