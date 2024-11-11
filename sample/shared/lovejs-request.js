var __LOVE2D_lua_state_ptr = null;
var __LOVE2D_response_queue = {list:[], start:0, end:0, max:100};
function __LOVE2D_set_lua_state_ptr (ptr){
    //console.log("Setting state pointer to: " + ptr);
    __LOVE2D_lua_state_ptr = ptr;
}

function __LOVE2D_eval (str){
    const stringToNewUTF8 = ModuleArgs.stringToNewUTF8;
    ModuleArgs.__JS_eval(__LOVE2D_lua_state_ptr, stringToNewUTF8(str));
}

function __LOVE2D_response_queue_pop (){
    const UTF8ToString = ModuleArgs.UTF8ToString;
    const stringToNewUTF8 = ModuleArgs.stringToNewUTF8;          
    let ret = stringToNewUTF8(__LOVE2D_response_queue.list[__LOVE2D_response_queue.start]);
    __LOVE2D_response_queue.start += 1;
    if (__LOVE2D_response_queue.start >= __LOVE2D_response_queue.max){
        __LOVE2D_response_queue.start = 0;
    }
    return ret;
}

function __LOVE2D_response_queue_popable (){
    if (__LOVE2D_response_queue.start == __LOVE2D_response_queue.end){
        return 0;
    }
    else{
        return 1;
    }
}

function __LOVE2D_http_request (ptr, handle, root, endpoint, action, headers, data) {
    const UTF8ToString = ModuleArgs.UTF8ToString;
    const stringToNewUTF8 = ModuleArgs.stringToNewUTF8;
    if(false) {
        console.log({ptr: ptr,
                     path: UTF8ToString(root) + UTF8ToString(endpoint),
                     handle: UTF8ToString(handle),
                     endpoint: UTF8ToString(endpoint),
                     action : UTF8ToString(action),
                     headers: UTF8ToString(headers),
                     data: UTF8ToString(data)})}
    const path = UTF8ToString(root) + UTF8ToString(endpoint);
    if (ptr == null){
        return 1;
    }
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // this creates a memory leak?
            //                                                  stringToNewUTF8(
            // JSON.encode({handle: handle,
            //              response: root,
            //              headers: endpoint}))
            // ModuleArgs.__JS_http_push_event(ptr,
            //                                 ModuleArgs.stringToNewUTF8(ModuleArgs.UTF8ToString(handle)),
            //                                 stringToNewUTF8(xhttp.responseText),
            //                                  stringToNewUTF8("{}"),
            //                                );
            __LOVE2D_response_queue.list[__LOVE2D_response_queue.end]=
                JSON.stringify({handle: UTF8ToString(handle),
                                response: xhttp.responseText,
                                headers: UTF8ToString(headers)});
            __LOVE2D_response_queue.end += 1;
            if (__LOVE2D_response_queue.end >= __LOVE2D_response_queue.max){
                __LOVE2D_response_queue.end = 0;
            }
            ModuleArgs.__JS_eval(__LOVE2D_lua_state_ptr,
                                 "(love.event.push "+
                                 UTF8ToString(handle) +
                                 " " +
                                 xhttp.responseText +
                                 " " +
                                 UTF8ToString(headers) +
                                 ")"
                                );
        }
    };    
    if (headers != null) {
        Object.keys(JSON.parse(UTF8ToString(headers))).forEach(function(key, index) {
            headers[key] *= 2;
        });
    }    
    if (action != null){
        xhttp.open(UTF8ToString(action), path, true);
    }
    else {
        xhttp.open('GET', path, true);
    }
    
    if (data != null){
        xhttp.send(UTF8ToString(data));
    }
    else {
        xhttp.send();
    }
    return 0;
}
