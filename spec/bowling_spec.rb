# frozen_string_literal: true

require 'bowling'

RSpec.describe BowlingGame do
  it 'has a roll method' do
    expect(subject).to respond_to(:roll)
  end

  it 'has a score method' do
    expect(subject).to respond_to(:score)
  end

  it 'has a score of zero with all rolls of zero' do
    20.times { subject.roll(0) }
    expect(subject.score).to eq(0)
  end

  it 'has a score of twenty with all rolls of one' do
    20.times { subject.roll(1) }
    expect(subject.score).to eq(20)
  end

  it 'scores a spare correctly' do
    10.times { subject.roll(1) }
    2.times { subject.roll(5) }
    subject.roll(3)
    7.times { subject.roll(1) }
    expect(subject.score).to eq(33)
  end

  it 'scores a strike correctly' do
    10.times { subject.roll(3) }
    subject.roll(10)
    2.times { subject.roll(2) }
    6.times { subject.roll(1) }
    expect(subject.score).to eq(54)
  end

  it 'scores a spare in the last frame correctly' do
    18.times { subject.roll(1) }
    2.times { subject.roll(5) }
    subject.roll(3)
    expect(subject.score).to eq(31)
  end

  it 'scores a strike in the last frame correctly' do
    18.times { subject.roll(1) }
    subject.roll(10)
    2.times { subject.roll(4) }
    expect(subject.score).to eq(36)
  end
end
