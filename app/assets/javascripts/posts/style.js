$(document).on('turbolinks:load', function() {


    $('#feed').on( 'mouseenter', '.single-post-list', function() {
        $(this).css('border-color', showColor()); 
    });

    $('#feed').on( 'mouseleave', '.single-post-list', function() {
        $(this).css('border-color', 'rgba(0, 0 , 0, 0.05)');    
    });

    $('#main-content').on( 'mouseenter', '.single-post-list', function() {
        $(this).css('border-color', showColor()); 
    });

    $('#main-content').on( 'mouseleave', '.single-post-list', function() {
        $(this).css('border-color', 'rgba(0, 0 , 0, 0.05)');    
    });


});

var colorSet = randomColorSet();
var mode = Math.floor(Math.random() * 2);


//  returns a color from an array of colors
function showColor() {
    var color = '#4C9BFF';
    return color;
}