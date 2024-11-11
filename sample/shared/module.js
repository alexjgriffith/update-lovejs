(var game_module {"package_uuid":
                  "b089b360-e752-4878-91c7-a71c0d3b80fa",
                  "remote_package_size":61794,
                  "files":[{"filename":"/game.love","crunched":0,"start":0,
                            "end":61794,"audio":false}]})

function goFullScreen(){
    var canvas = document.getElementById("canvas");
    if(canvas.requestFullScreen)
        canvas.requestFullScreen();
    else if(canvas.webkitRequestFullScreen)
        canvas.webkitRequestFullScreen();
    else if(canvas.mozRequestFullScreen)
        canvas.mozRequestFullScreen();
}

function closeFullScreen() {
    if (document.exitFullscreen) {
        document.exitFullscreen();
    } else if (document.webkitExitFullscreen) { /* Safari */
        document.webkitExitFullscreen();
    } else if (document.msExitFullscreen) { /* IE11 */
        document.msExitFullscreen();
    }
}

function toggleFullScreen(){
    if((window.fullScreen) || /* firefox */
       (window.innerWidth == screen.width &&  /* everything else */
        window.innerHeight == screen.height)) {
        closeFullScreen();
    } else {
        goFullScreen();
    }
}

var loadingContext = document.getElementById('loadingCanvas').getContext('2d');
var complete = false;

function drawLoadingText(text, soFar, total) {
    var canvas = loadingContext.canvas;
    var ratio = complete ? 1 : 0;
    if (soFar && total){
        ratio = soFar / total
    }
    if (ratio == 1){
        complete = true
    }
    //
    loadingContext.fillStyle = "rgb(54,69,79)";
    loadingContext.fillRect(0, 0, canvas.scrollWidth, canvas.scrollHeight);

    loadingContext.font = '2em arial';
    loadingContext.textAlign = 'center'
    //
    loadingContext.fillStyle = "rgb(240,234,214)";
    loadingContext.fillText(text, canvas.scrollWidth / 2, (canvas.scrollHeight / 2) - 40);
    //
    loadingContext.beginPath();
    loadingContext.strokeStyle = "rgb(240,234,214)";
    loadingContext.rect((canvas.scrollWidth / 2) - 200,
                        ( canvas.scrollHeight / 2) - 20,
                        400,
                        40
                        
                        
                       );
    loadingContext.stroke();
    loadingContext.beginPath();
    loadingContext.rect((canvas.scrollWidth / 2) - 200,
                        ( canvas.scrollHeight / 2) - 20,
                        400 * ratio,
                        40
                        
                        
                       );
    loadingContext.fill();
    loadingContext.font = '4em arial';
    loadingContext.fillText("Change Me", canvas.scrollWidth / 2, canvas.scrollHeight / 4);
    loadingContext.font = '2em arial';
    loadingContext.fillText("0.1.0", canvas.scrollWidth / 2, (canvas.scrollHeight / 4 + 45));
    loadingContext.font = '1em arial';
    loadingContext.textAlign = 'left'
    loadingContext.fillText("Powered By LÖVE", canvas.scrollWidth / 2 - 300, canvas.scrollHeight / 4 * 3);
    loadingContext.textAlign = 'right'
    loadingContext.fillText("Game By: Your Name", canvas.scrollWidth / 2 + 300, canvas.scrollHeight / 4 * 3);
}

window.onload = function () { window.focus(); };
window.onclick = function () { window.focus(); };

/* window.addEventListener("keydown", function(e) {
 *     // space and arrow keys
 *     if([32, 37, 38, 39, 40].indexOf(e.keyCode) > -1) {
 *         e.preventDefault();
 *     }
 * }, false);
 */
var ModuleArgs = {
    arguments: ["game.love","web"],
    thisProgram: "game.love",
    INITIAL_MEMORY: 0,
    printErr: console.error.bind(console),
    canvas: (function() {
        var canvas = document.getElementById('canvas');

        // As a default initial behavior, pop up an alert when webgl context is lost. To make your
        // application robust, you may want to override this behavior before shipping!
        // See http://www.khronos.org/registry/webgl/specs/latest/1.0/#5.15.2
        canvas.addEventListener("webglcontextlost", function(e) { alert('WebGL context lost. You will need to reload the page.'); e.preventDefault(); }, false);

        return canvas;
    })(),
    setStatus: function(text, soFar, total) {
        if (text) {
            drawLoadingText(text, soFar, total);
        } else if (ModuleArgs.remainingDependencies === 0) {
            document.getElementById('loadingCanvas').style.display = 'none';
            document.getElementById('canvas').style.display = 'block';
        }
    },
    totalDependencies: 0,
    remainingDependencies: 0,
    monitorRunDependencies: function(left) {
        this.remainingDependencies = left;
        this.totalDependencies = Math.max(this.totalDependencies, left);
        ModuleArgs.setStatus(left ? 'Preparing... (' + (this.totalDependencies-left) + '/' + this.totalDependencies + ')' : 'All downloads complete.',
                             this.totalDependencies-left,
                             this.totalDependencies);
    }
};
ModuleArgs.setStatus('Downloading...');
window.onerror = function(event) {
    // TODO: do not warn on ok events like simulating an infinite loop or exitStatus
    ModuleArgs.setStatus('Exception thrown, see JavaScript console');
    ModuleArgs.setStatus = function(text) {
        if (text) ModuleArgs.printErr('[post-exception status] ' + text);
    };
};

var applicationLoad = function(e) {
    function preRunCallback (Module) {
        loadPackage(Module, game_module)
    }
    ModuleArgs.expectedDataFileDownloads = 0;
    ModuleArgs.finishedDataFileDownloads = 0;
    ModuleArgs['preRun'] = preRunCallback;
    Love(ModuleArgs).then((x)=>{});
}
