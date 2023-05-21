import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
    consumer.subscriptions.create(
        {
            channel: "ChatsChannel",
            room_id: $("#room_id").val()
        }, {
            received(data) {
                this.appendLine(data)
            },

            appendLine(data) {
                const html = this.createLine(data)
                const element = $("#chat_list")
                $(html).appendTo(element)
                $("#message").val("")
                $("#no_message").remove()
            },

            createLine(data) {
                return `
                  <ul>
                    .......... ${data["message"]}
                  </ul>
                `
            }
        }
    )
})
