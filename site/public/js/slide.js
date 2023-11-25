let count = 1;
document.getElementById("radio1").checked = true;

setInterval( function(){
    nextImage();
}, 2000)


function nextImage(){
    count++;
    if(counter>4) {
        count = 1;
    }

    document.getElementById("radio"+count).checked = true;
}
