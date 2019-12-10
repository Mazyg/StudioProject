//实现分页效果
function jumpTo(maxPage,numberPerPage,total){
    var page = $("#jumpTo").val();
    var start=(page-1)*numberPerPage;
    var rest=total-start;
    if(page > maxPage || page < 1){
        alert("对不起，无法到达该页")
    }else{
        if(rest>=numberPerPage){
            window.location.href="../info/findEvent.do?page="+page+"&numberPerPage="+numberPerPage+"&start="+start+"&length="+numberPerPage;
        }
        else {
            window.location.href="../info/findEvent.do?page="+page+"&numberPerPage="+numberPerPage+"&start="+start+"&length="+rest;
        }
    }
}

function change(total){
    var numberPerPage=$("#numberPerPage").val();
    if(numberPerPage > total || numberPerPage < 1){
        alert("对不起，无法设置")
    }else{
        window.location.href="../info/findEvent.do?start=0&page=1"+"&length="+numberPerPage+"&numberPerPage="+numberPerPage;
    }
}