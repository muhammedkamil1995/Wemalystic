$(function(){
    $('form').on('submit', function(e){
        e.preventDefault();
        let form = $(this)
        if(form.attr('method') == 'get'){
            window.location.href = "/" + form.attr('action') + "&" + form.serialize();
        }
    })
})