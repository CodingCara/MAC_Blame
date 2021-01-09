require 'colorize'

ping_filtered = []


mac_address = ""

def connect_wifi()
`netsh wlan connect name="xfinitywifi"`
sleep(7)
end


def ping_check()
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
get_mac()
puts ping_filtered.last
end
end

def get_mac()
hello = `ipconfig /all`
there = hello.split("\n")
little = there[13].split(":")
lady = little[1]
lady[0] = ""
File.open("out.txt", 'a') {|f| f.write(lady + "\n") }
end

def mac_swap()
`tmac.exe -n Wireless Network Connection -r02 -re -s`
sleep(5)
puts "Mac changed!".light_blue
end

a=1


loop do
mac_swap()
connect_wifi()
ping_check()
end