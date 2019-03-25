/* --- Processes postcode checker contact forms --- */
window.PostcodeCheck = {};
window.OrderURL = 'http://order.laundrapp.com';

jQuery(document).ready(function ($) {

    $(".wpcf7").on('submit.wpcf', function(event){

        console.log(event);

        if( (event.currentTarget.id.indexOf('24553') !== -1) ||
            (event.currentTarget.id.indexOf('6922') !== -1)
        ) {

            var postcodeEntered = event.target[5].value;
            PostcodeCheck.coveragePageIsCovered(postcodeEntered);
        }

    });


    /* - URLs we redirect to  - */
    PostcodeCheck.instantBookingURL = OrderURL + '/booking/';
    PostcodeCheck.itemsURL = OrderURL + '/?postcode=';
    if($('#postcodesJSON').length) {
        $('#postcodesJSON').text(JSON.stringify(postcodes));
        PostcodeCheck.districts = $.parseJSON($('#postcodesJSON').html());
    } else {
        PostcodeCheck.districts = "";
    }


    /* - Postcode formatters - */
    PostcodeCheck.formatToUppercase = function(postcode) {
        if(typeof(postcode) === 'undefined') {
            postcode = $("#coverage-postcode-store").val();
        }
        return postcode.replace(/[^a-zA-Z0-9]/gi,'').toUpperCase().trim();
    };

    PostcodeCheck.getOuterPostcode = function(postcode) {
        var matches = postcode.match(/([A-Z]{1,2}[0-9][0-9A-Z]?)\s?([0-9][A-Z]{2})/);

        if (matches == null) {
            matches = postcode.match(/([A-Z]{1,2}[0-9][0-9A-Z]?)/);
        }

        if (matches != null) {
            return matches[1];
        }

        return null;
    };

    PostcodeCheck.getCleanOuterPostcode = function($postcode) {
        $postcode = this.formatToUppercase($postcode);
        $postcode = this.getOuterPostcode($postcode);
        return $postcode;
    };


    /*
        Checks if postcode is covered
        @return bool
     */
    PostcodeCheck.isCovered = function(postcode) {

        var cleaned = this.getCleanOuterPostcode(postcode);

        if($.inArray(cleaned, this.districts) > 0) {
            return true;
        }
        return false;
    };

    /*
        Checks if postcode is covered and redirects to appropriate URL
        For use on Laundrapp.com/Coverage
     */
    PostcodeCheck.coveragePageIsCovered = function(postcode) {

        var cleaned = this.getCleanOuterPostcode(postcode);

        var is_safari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);

        if ($.inArray(cleaned, this.districts) > 0) {
            window.location.href = OrderURL + '/?postcode='+ postcode;
            url = OrderURL + '/?postcode='+ postcode;
            return false;
        }
        else {

            if(is_safari) {

                var testTimerID;

                testTimerID = window.setTimeout(function(){
                    window.location.href = '/coverage?status=lookup&postcode_region=' + cleaned +'&postcode='+ postcode;
                }, 1000 );

            } else {

                window.location.href = '/coverage?status=lookup&postcode_region=' + cleaned +'&postcode='+ postcode;
            }

            url = '/coverage?status=lookup&postcode_region=' + cleaned +'&postcode='+ postcode + '&ait';
            //console.log('not in array'+url);
            return false;
        }
    };


    /* --- COVERAGE PAGE - Contact Form ID 6922 --- */
    PostcodeCheck.coverageCheckerSelectors = '#wpcf7-f6922-o1, #wpcf7-f6922-o2, #wpcf7-f6922-o3, #wpcf7-f6922-o4, #wpcf7-f6922-o5, #wpcf7-f6922-o6, #wpcf7-f6922-o7, #wpcf7-f6922-o8, #wpcf7-f6922-o9';
    PostcodeCheck.coverageCheckerSubmittingSelectors = '#wpcf7-f6922-o1 .submitting, #wpcf7-f6922-o2 .submitting, #wpcf7-f6922-o3 .submitting, #wpcf7-f6922-o4 .submitting, #wpcf7-f6922-o5 .submitting, #wpcf7-f6922-o6 .submitting, #wpcf7-f6922-o7 .submitting, #wpcf7-f6922-o8 .submitting, #wpcf7-f6922-o9 .submitting';

    /* - Store value in hidden input - */
    $('#bringlaundrapp input#postcode').on('keyup keydown change change focus focusin focusout keypress mouseenter mousemove mouseover', function() {
        $('#coverage-postcode-store').val(PostcodeCheck.formatToUppercase(this.value));
    });

    /* - UI response - */
    $(PostcodeCheck.coverageCheckerSelectors).on('submit.wpcf7', function (e) {
        e.preventDefault();
        $(PostcodeCheck.coverageCheckerSelectors).html("<div class='wrap'>One moment, checking postcode...</div>");
    });

    /* - Redirect - */
    $(PostcodeCheck.coverageCheckerSelectors).on('mailsent.wpcf7', function () {
        PostcodeCheck.coveragePageIsCovered( $("#coverage-postcode-store").val() );
    });


    /* --- ORDER ONLINE - Contact Form ID 24553 --- */
    PostcodeCheck.postcodeCheckerSelectors = '#wpcf7-f24553-o1, #wpcf7-f24553-o2, #wpcf7-f24553-o3, #wpcf7-f24553-o4, #wpcf7-f24553-o5, #wpcf7-f24553-o6, #wpcf7-f24553-o7, #wpcf7-f24553-o8, #wpcf7-f24553-o9';
    PostcodeCheck.postcodeCheckerSubmittingSelectors = '#wpcf7-f24553-o1 .submitting, #wpcf7-f24553-o2 .submitting, #wpcf7-f24553-o3 .submitting, #wpcf7-f24553-o4 .submitting, #wpcf7-f24553-o5 .submitting, #wpcf7-f24553-o6 .submitting, #wpcf7-f24553-o7 .submitting, #wpcf7-f24553-o8 .submitting, #wpcf7-f24553-o9 .submitting';

    /* - UI response - */
    $(PostcodeCheck.postcodeCheckerSelectors).on('submit.wpcf7', function (e) {

        e.preventDefault();
        $('.submitting', this).html("<div class='wrap'>One moment, checking postcode...</div>");
        $('#postcode-store').val($("#postcode", this).val());

    });

    /* - Redirect to appropriate URL - */
    $(PostcodeCheck.postcodeCheckerSelectors).on('mailsent.wpcf7', function () {

        var postcode = $('#postcode-store').val();
        var outerPostcode = PostcodeCheck.getCleanOuterPostcode(postcode);

        if(PostcodeCheck.isCovered(postcode)) {
            window.location.href = PostcodeCheck.itemsURL + PostcodeCheck.formatToUppercase(postcode);
        } else {
            window.location.href = 'https://laundrapp.com/vote?status=lookup&postcode_region='+outerPostcode+'&postcode='+postcode;
        }

    });


    /* --- ORDER ONLINE - Contact Form ID 57154 --- */
    $("div[id*='wpcf7-f57154-']").on('submit.wpcf7', function (e) {

        if($('#io-section-1') && document.getElementById('io-section-1').dataset.orderurl.length) {
            PostcodeCheck.instantBookingURL = document.getElementById('io-section-1').dataset.orderurl;
        }

        e.preventDefault();
        $('.submitting', this).html("<div class='wrap'>One moment, checking postcode...</div>");
        $('#postcode-store').val($("#postcode", this).val());

        /* - Redirect to appropriate URL - */
        var postcode = $('#postcode-store').val();
        var outerPostcode = PostcodeCheck.getCleanOuterPostcode(postcode);

        if(PostcodeCheck.isCovered(postcode)) {
            window.location.href = PostcodeCheck.instantBookingURL + PostcodeCheck.formatToUppercase(postcode);
        } else {
            window.location.href = 'https://laundrapp.com/vote?status=lookup&postcode_region='+outerPostcode+'&postcode='+postcode;
        }

    });

});