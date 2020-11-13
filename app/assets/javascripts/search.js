$(function() {
  let search_list = $(".Tweetdate");
  function appendTweet(tweet) {
    console.log(tweet)
    let html = `<a class="tweet" href="/tweets/${tweet.id}"data-method="get">
                  <div class="Tweet__content__right__tweet">
                    <div class="Form__left">
                      <img class="tweetimage" src="${tweet.image}">
                    </div>
                    <div class="Form__right">
                      <div class="Form__right__name">
                        ${tweet.name}
                      </div>
                      <div class="Form__right__text">
                        <h2 class="text-name">内容：</h2>
                        <div class="content">
                          ${tweet.text}
                        </div>
                      </div>
                    </div>
                  </div>
                </a>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".tweet-search").on("keyup", function() {
    let input = $(".tweet-search").val();
    $.ajax({
      type: 'GET',
      url: '/tweets/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(tweets) {
      search_list.empty();
      $(".Tweetdate").empty();
      if (tweets.length !== 0) {
        tweets.forEach(function(tweet){
          appendTweet(tweet);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});