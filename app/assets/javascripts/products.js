var product;
function init(){

    product = 
        $('.product').ThreeSixty({
        totalFrames: gon.total_frames, // Total no. of image you have for 360 slider
        endFrame: gon.total_frames, // end frame for the auto spin animation
        currentFrame: 1, // This the start frame for auto spin
        imgList: '.threesixty_images', // selector for image list
        progress: '.spinner', // selector to show the loading progress
        imagePath: gon.image_path, // path of the image assets
        filePrefix: '', // file prefix if any
        ext: gon.file_extension, // extention for the assets
        height: gon.display_height,
        width: gon.display_width,
        navigation: true,
        responsive: true
    });
}

window.onload = function() {
    init();
};

$('input[type=range]').change(applyFilters);

function applyFilters() {
  var brightness = parseInt($('#brightness').val());
  var contrast = parseInt($('#contrast').val());
  var saturation = parseInt($('#saturation').val());
  var vibrance = parseInt($('#vibrance').val());
  var exposure = parseInt($('#exposure').val());
  console.log(contrast)
    Caman('#canvas', 'display_1.jpg', function() {
      this.revert(false);
      this.brightness(brightness);
      this.contrast(contrast);
      this.saturation(saturation);
      this.vibrance(vibrance);
      this.exposure(exposure);
      this.render();
    });
    $("#brightnessOutputId").val("Brightness: " + brightness.toString());
    $("#contrastOutputId").val("Contrast: " + contrast.toString());
    $("#saturationOutputId").val("Saturation: " + saturation.toString());
        $("#vibranceOutputId").val("Vibrance: " + vibrance.toString());
        $("#exposureOutputId").val("Exposure: " + exposure.toString());    
}