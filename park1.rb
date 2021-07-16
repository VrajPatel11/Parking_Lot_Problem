class Park1
  $id=0
    def create_parking_lot
      $slot = Array.new
        puts "Enter the no of parking slots to be created"
        $lot_size = gets.chomp.to_i
        # puts "Created parking lot with #{@lot_size} slots"
        lp = 0
        while lp < $lot_size
          parking = Hash.new
          puts "Number plate of car"
          num_plate = gets.chomp
          puts "Color of car"
          color = gets.chomp
          parking['id'] = $id += 1
          parking['num_plate'] = num_plate
          parking['color'] = color
          parking['slot_allocated'] = true
          lp += 1
          $slot << parking
          puts "Allocated slot #{lp}"
        end
      # puts $slot
    end

    def leave(slot_id)
      slot_id = slot_id.to_i
      $slot [slot_id - 1]['slot_allocated'] = false
      $slot.map do |a|
        if a['slot_allocated'] == false
          next
        end
      end
    end

    def park_slot()
      i=0
      puts "Number plate of car"
      num_plate = gets.chomp
      puts "Color of car"
      color = gets.chomp
      $slot.map do |a|
        if a['slot_allocated'] == false
          i = 1
          a['num_plate'] = num_plate
          a['color'] = color
          puts "Allocated slot #{a['id']}"
          a['slot_allocated'] = true
          break
        end
      end
      if i.zero?
        puts "The parking is full"
      end
    end

    def status
      puts "Slot No. | Number Plate | Color"
      $slot.map do |a|
        if a['slot_allocated'] == false
          next
        end
        puts "#{a['id']} | #{a['num_plate']} | #{a['color']}"
      end
    end

    def plate_numbers_for_cars_with_color(car_color)
      puts "Number plates of car with color #{car_color} : "
      $slot.map do |a|
        if a['color'] == car_color
          puts "#{a['num_plate']}"
        end
      end
    end

    def slot_numbers_for_cars_with_colour(car_color)
      puts "Slot Numbers of car with color #{car_color} : "
      $slot.map do |a|
        if a['color'] == car_color
          print "#{a['id']} "
          puts ""

        end
      end
    end

    def slot_number_for_registration_number(reg_no)
      $slot.map do |a|
        if a['num_plate'] == reg_no
          puts "Slot Number of car with number #{reg_no} : #{a['id']}"
        else
          puts "Slot Number of car with number #{reg_no} : Not Found"
          break
        end
      end
    end

end

p1 = Park1.new()
p1.create_parking_lot
p1.status
p1.leave(3)
p1.status
p1.park_slot
p1.status
p1.plate_numbers_for_cars_with_color('White')
p1.slot_numbers_for_cars_with_colour('White')
p1.slot_number_for_registration_number('ABC-123')
