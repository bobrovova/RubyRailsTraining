$(document).ready(->
  $('a.like').click((event) ->
    event.preventDefault()
    likeBtn = $(this)

    url = "/likes"
    method = "POST"
    if likeBtn.hasClass('liked')
      url = "/likes/0"
      method = "DELETE"

    $.ajax({
      method: method,
      url: url,
      data: {
        article_id: likeBtn.data().articleId
      }
      success: ->
        likeBtn.toggleClass('liked')
    })
  )
)