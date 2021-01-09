require 'colorize'

ping_filtered = []


mac_address = ""

def connect_wifi()
`netsh wlan connect name="xfinitywifi"`
sleep(7)
end


def ping_check(mac_address)
ping = `ping 8.8.8.8 -n 4`
ping_filtered = ping.split('\n')


if ping.include?("100% loss")
puts "BROKEN".red
puts ping_filtered.last

elsif
ping.include?("unreachable")
puts "BROKEN".red
puts ping_filtered.last

else
puts "FOUND!".green
puts mac_address.blue
File.open("out.txt", 'a') {|f| f.write(mac_address + "\n") }
puts ping_filtered.last
end
end


def mac_swap(mac_address)
`tmac.exe -n Wireless Network Connection -r02 -re -s`
sleep(5)
puts "Mac changed!".light_blue
end

for a in 0..255
	for b in 0..255
		for c in 0..255
			for d in 0..255
				for e in 8..255
					for f in 0..255
						mac_address = [2.to_s(16).rjust(2, '0'), b.to_s(16).rjust(2, '0'), c.to_s(16).rjust(2, '0'), d.to_s(16).rjust(2, '0'), e.to_s(16).rjust(2, '0'), f.to_s(16).rjust(2, '0')].join(':')
						puts mac_address.yellow
						mac_swap(mac_address)
						connect_wifi()
						ping_check(mac_address)
						
					end
				end
			end
		end
	end
end

