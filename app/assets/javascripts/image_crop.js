var Crop = (function() {
    function avatarUpload() {
        var $uploadCrop;

        function readFile(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $uploadCrop.croppie('bind', {
                        url: e.target.result
                    });
                    $('.upload-demo').addClass('ready');
                }

                reader.readAsDataURL(input.files[0]);
            }
            else {
                swal("Sorry - you're browser doesn't support the FileReader API");
            }
        }

        $uploadCrop = $('#upload-demo').croppie({
            viewport: {
                width: 150,
                height: 150,
                type: 'circle'
            },
            boundary: {
                width: 200,
                height: 200
            }
        });

        $('#upload').on('change', function () {
            $('#upload-demo').show();
            readFile(this);
        });
        $('.upload-result').on('click', function (ev) {
            ev.preventDefault();
            $uploadCrop.croppie('result', {
                type: 'canvas',
                size: 'viewport'
            }).then(function (resp) {
                $('#example').html('<img src="' + resp + '" /><img src="' + resp + '" width="50" height="50" />');
                $('#person_avatar').val(resp);
            });
        });
    }


    function init() {
        avatarUpload();
    }

    return {
        init: init
    }
})();

