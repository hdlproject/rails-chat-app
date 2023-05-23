import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
    consumer.subscriptions.create(
        {
            channel: "ChatsChannel",
            room_id: $("#chat_room_id").val()
        }, {
            received(data) {
                this.appendLine(data)
            },

            appendLine(data) {
                const user_id = $("#chat_user_id").val()
                const html = this.createLine(data, user_id)
                const element = $("#chat_list")
                $(html).appendTo(element)
                $("#chat_message").val("")
                $("#no_message").remove()
            },

            createLine(data, user_id) {
                let text = `<ul>`

                if (data["sender_id"] === parseInt(user_id)) {
                    text += `.......... `
                }

                text += `${data["message"]}</ul>`

                return text
            }
        }
    )
})
