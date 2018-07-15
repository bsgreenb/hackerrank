"""Example 1:
Input:
Jon owes Ben $10
Vishnu owes Ben $5
Vishnu owes Jon $20

Output:
Vishnu owes Jon $10
Vishnu owes Ben $15

Jon | -10
Ben | +10
Vishnu | -5
Ben | +5
Vishnu | - 20
Jon | + 20

Sam | 10
Jon | 10
Ben | 15
Vishnu | -25
Bill | -10

loop through money owed until no money owed
  pay debts

"""


debts = [
  ["Jon", "Ben", 10],
  ["Vishnu", "Ben", 5],
  ["Vishnu", "Jon", 20]
]

def simplifyDebts(debts)
  # First step is to identify the delta for each person
  deltas = {}
  debts.each do |debt|
    personOwing = debt[0]
    personOwed = debt[1]
    amount = debt[2]

    if (!deltas[personOwing])
      deltas[personOwing] = -1 * amount
    else
      deltas[personOwing] = deltas[personOwing] - amount
    end

    if (!deltas[personOwed])
      deltas[personOwed] = amount
    else
      deltas[personOwed] = deltas[personOwed] + amount
    end

  end

  newDebts = []

  # Jon | 10
  # Ben | 15
  # Vishnu | -25
  orderedDeltas = []
  deltas.each do |k, v|
    orderedDeltas.push([k, v])
  end

  orderedDeltas = orderedDeltas.sort_by {|delta| delta[1] }

  # [["Vishnu", -25], ["Dan", -5], ["Jon", 10], ["Ben", 15]]

  orderedDeltas.each_with_index do |delta, i|
    person = delta[0]
    amount = delta[1]

    break if amount == 0
    if amount > 0
      puts orderedDeltas.inspect
      raise "Error"
    end

    for j in (i + 1..orderedDeltas.length - 1) do
      if orderedDeltas[i][1] == 0
        # We've given out all the money
        break
      end

      if orderedDeltas[i][1] >= orderedDeltas[j][1]
        newDebts.push([person, orderedDeltas[j][0], orderedDeltas[j][1]])
        orderedDeltas[i][1] += orderedDeltas[j][1]
        orderedDeltas[j][1] = 0
      else
        newDebts.push([person, orderedDeltas[j][0], orderedDeltas[i][1]])
        orderedDeltas[j][1] += orderedDeltas[i][1]
        orderedDeltas[i][1] = 0
      end
    end
  end

  newDebts
end

puts simplifyDebts(debts).inspect
  
