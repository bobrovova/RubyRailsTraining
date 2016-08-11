$(document).ready(->
  $('a.like').click((event) ->
    event.preventDefault()
    likeBtn = $(this)

    url = "/likes/like"
    if likeBtn.hasClass('liked')
      url = "/likes/dislike"
    console.log "ajax"
    $.ajax({
      method: "POST",
      url: url,
      data: {
        article_id: likeBtn.data().articleId
      }
      success: ->
        likeBtn.toggleClass('liked')
    })
  )
)