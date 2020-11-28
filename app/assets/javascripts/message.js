$(function(){
  function buildHTML(message){
    if ( message.image ) {
      if (message.user_name == "町民"){
        let html =
          `<div class="Message__box__center__text">
              <span class="Message__box__center__text__question">Q</span>
            <div class="Message__box__center__text__info">
              <div class="Comment-name">
                <div class="Name">
                  ${message.user_name}
                </div>
                <div class="Time">
                  ${message.created_at}
                </div>
              </div>
              <div class="Comment-text">
                <div class="Textmessage">
                  <p class="Textmessage__content">
                    ${message.content}
                  </p>
                    <img class="Message__image" src="${message.image}">
                </div>
              </div>
            </div>
          </div>`
        return html;
      }else if(message.user_name != "町民"){
        let html =
          `<div class="Message__box__center__text">
              <span class="Message__box__center__text__anser">A</span>
            <div class="Message__box__center__text__info">
              <div class="Comment-name">
                <div class="Name">
                  ${message.user_name}
                </div>
                <div class="Time">
                  ${message.created_at}
                </div>
              </div>
              <div class="Comment-text">
                <div class="Textmessage">
                  <p class="Textmessage__content">
                    ${message.content}
                  </p>
                    <img class="Message__image" src="${message.image}">
                </div>
              </div>
            </div>
          </div>`
        return html;
    }} else {
      if (message.user_name == "町民"){
        let html =
          `<div class="Message__box__center__text">
              <span class="Message__box__center__text__question">Q</span>
            <div class="Message__box__center__text__info">
              <div class="Comment-name">
                <div class="Name">
                  ${message.user_name}
                </div>
                <div class="Time">
                  ${message.created_at}
                </div>
              </div>
              <div class="Comment-text">
                <div class="Textmessage">
                  <p class="Textmessage__content">
                    ${message.content}
                  </p>
                </div>
              </div>
            </div>
          </div>`
        return html;
      }else if(message.user_name != "町民"){
        let html =
          `<div class="Message__box__center__text">
              <span class="Message__box__center__text__anser">A</span>
            <div class="Message__box__center__text__info">
              <div class="Comment-name">
                <div class="Name">
                  ${message.user_name}
                </div>
                <div class="Time">
                  ${message.created_at}
                </div>
              </div>
              <div class="Comment-text">
                <div class="Textmessage">
                  <p class="Textmessage__content">
                    ${message.content}
                  </p>
                </div>
              </div>
            </div>
          </div>`
        return html;
    }};
  }
  $('#new_message').on('submit',function(e){
    e.preventDefault()
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,  
      type: 'POST',  
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.Message__box__center').append(html);
      $('.Message__box__center').animate({ scrollTop: $('.Message__box__center')[0].scrollHeight});
      $('form')[0].reset();
      $('.Form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert("メッセージ送信に失敗しました");
      $('.Form__submit').prop("disabled", false);
    })
  })
});