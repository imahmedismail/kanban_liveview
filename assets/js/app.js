import "../css/app.css"
import "phoenix_html"
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})

liveSocket.connect()
dragula(Array.from(document.querySelectorAll('.column')));
dragula(Array.from(document.querySelectorAll('.column')))
  .on('drop', (element, target) => {
    fetch('/cards/' + element.dataset.cardId, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
        'x-csrf-token': csrfToken
      },
      body: JSON.stringify({
        target_column_id: target.dataset.columnId
      })
    }).then(_res => console.log('created!'))
  });
  
window.liveSocket = liveSocket

