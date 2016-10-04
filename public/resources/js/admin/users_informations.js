$(document).ready(function(){

    if($('.btn-action[value="new_user"]').length>0) {

        $('.btn-action[value="new_user"]').click(function () {
            if ($('.table-primary tr').hasClass('info')) {
                var val = [];
                $('.table-primary tr.info .adminCheckboxRow').each(function (key, value) {
                    val.push($(this).val());
                });

                var action = $(this).data('action');
                var data={'user_info_id':val};


                    $.ajax({
                        url: action,
                        data: data,
                        cache: false,
                        type: 'POST',
                        success: function (data) {
                           // debugger;
                        },
                        error: function (jqXhr) {
                           // debugger;
                        }
                    });

             //   debugger;
            }
        });
    }
});