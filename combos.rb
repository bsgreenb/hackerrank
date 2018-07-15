# You have a list of stores and the fish they have
# Return a list of combos of stores that have all the fish

stores = [
  [0],
  [0,1,2],
  [2],
  [3,4],
  [4],
]
fishToStores = [
  [0,1],
  [1,4],
  [1, 2],
  [3],
  [3,4]
]

needed_fish = [0,1,2,3,4]

def getCombos(fishToStores, stores, needed_fish)
    return [] if needed_fish.length == 0

    needed_f = needed_fish.shift
    combos = []

    fishToStores[needed_f].each do |storeThatHasFish|
        subsequentCombos = getCombos(fishToStores, stores, needed_fish - stores[storeThatHasFish])
        if subsequentCombos.length > 0
          subsequentCombos.each do |sc|
            combos.push([storeThatHasFish] + sc)
          end
        else
          combos.push([storeThatHasFish])
        end
    end

    combos
end

puts getCombos(fishToStores, stores, needed_fish).inspect
