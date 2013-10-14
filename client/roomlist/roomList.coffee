roomdata = []
for i in [0..4]
  roomdata[i] = {
    id:i,
    name: "room#{i}"
  }

Template.roomList.helpers
  rooms: roomdata