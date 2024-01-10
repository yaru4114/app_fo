'use strict';

$(function(){

    let loop = $('.g-html').length;
    for (let i = 0; i < $('.g-html').length; i++) {
         let target = $('.g-html').eq(i).html();
        $('.g-html').eq(i).append('<pre><div class="code"></div></pre>');
        $('.g-html').eq(i).find('.code').text(target);
    }

});

/* Header */
$(document).on('click', '.g-header a', function(){
    let trigger = $(this).attr('href');
    let chkTarget = $(this).attr('target');
    if (chkTarget == '_iframe') {
        $('.g-container').addClass('hasList');
    } else {
        $('.g-container').removeClass('hasList');
        $(trigger).addClass('on').siblings().removeClass('on');
        switch (trigger) {
            case '#guide':
                $('.ifr-con').attr('src','guide.html');
                break;
            case '#elements':
                $('.ifr-con').attr('src','html/g-button.html');
                break;
            case '#components':
                $('.ifr-con').attr('src','');
                break;
            default:
                $('.ifr-con').attr('src','');
                break;
        }
    }
});

