
$(document).ready(function(){
    var annotationUrl = getParameterByName('u');
    $(":input[name='tbxAnnotationUrl']").attr('value',annotationUrl);
        
    $("#close").click(function() {
        window.location.replace($(":input[name='tbxAnnotationUrl']").attr('value'));
    });

    var data = readCookie('memofire');
        
    $.get("/ws/Member.asmx/GetID",
    {
        data:data
    },
    function(xml) {
        var ID = $(xml).find('string').text();
        $(":input[name='tbxID']").attr('value',ID);
    },
    "xml");

    $.get("/ws/Member.asmx/GetGreeting",
    {
        data:data
    },
    function(xml) {
        var greeting = $(xml).find('string').text();
    //alert(greeting);
    },
    "xml");
        
    var winWidth = pageWidth() + 'px';
    var winHeight = (pageHeight() - 145) + 'px';
    $("#divArticle").css('width',winWidth);
    $("#divArticle").css('height',winHeight);

    $("#divArticle").html('<iframe id="articleFrame" src="' + annotationUrl + '" frameborder="0" height="100%" width="100%" scrolling="auto"></iframe>');

    GetFlashcardByUrl(annotationUrl);
   
    $(window).bind('resize', function () {
        var winWidth = pageWidth() + 'px';
        var winHeight = (pageHeight() - 145) + 'px';

        $("#divArticle").css('width',winWidth);
        $("#divArticle").css('height',winHeight);
    });

    $("body input, textarea").keypress(function(e){
        if ( e.keyCode == 13 )
            ProcessAction();
    });
        
    $('#mfClose a').tooltip({
        track: false,
        delay: 0,
        showURL: false,
        extraClass: "tooltip",
        showBody: " - ",
        fade: 250,
        fixPNG: true,
        top:-15,
        left:5
    });

    $('#mfFlip a').tooltip({
        track: false,
        delay: 0,
        showURL: false,
        extraClass: "tooltip",
        showBody: " - ",
        fade: 250,
        fixPNG: true,
        top:-15,
        left:15
    });

    $('#cardAction').tooltip({
        track: false,
        delay: 0,
        showURL: false,
        extraClass: "tooltip",
        showBody: " - ",
        fade: 250,
        fixPNG: true,
        top:-15,
        left:15
    });
        
    /* auto resize for the q and a text boxes
        $(":input[name='tbxQ']").autoResize({
            // On resize:
            onResize : function() {
                $(this).css({opacity:0.8});
            },
            // After resize:
            animateCallback : function() {
                $(this).css({opacity:1});
            },
            // Quite slow animation:
            animateDuration : 300,
            // More extra space:
            extraSpace : 40
        });
        */
        
    $(document).bind('keydown', 'ctrl+t', function(){
        $(":input[name='tbxTitle']").focus();
        return false;
    });
    $(document).bind('keydown', 'ctrl+s', function(){
        $(":input[name='tbxSubject']").focus();
        return false;
    });
    $(document).bind('keydown', 'ctrl+q', function(){
        $(":input[name='tbxQ']").focus();
        return false;
    });
    $(document).bind('keydown', 'ctrl+a', function(){
        $(":input[name='tbxA']").focus();
        return false;
    });


});
    
function ProcessAction()
{
    var validInput = ValidateInput();
        
    if ( validInput )
    {
        $("#divMsgs").addClass('messaging');
        $("#divMsgs").html('Working...');
        if ( $(":input[name='tbxFlashcardID']").attr('value') == "0" )
            CreateFlashcard();
        else
            UpdateFlashcard();
    }
    else
    {
        $("#divMsgs").addClass('messaging');
        $("#divMsgs").html('Please make sure all the information is complete.');
    }
}
    
function pageWidth() 
{
    return window.innerWidth != null? window.innerWidth: document.body != null? document.body.clientWidth:null;
}
    
function pageHeight() 
{
    return window.innerHeight != null? window.innerHeight: document.body != null? document.body.clientHeight:null;
}

function ValidateInput()
{
    var t = $(":input[name='tbxTitle']").attr('value');
    var s = $(":input[name='tbxSubject']").attr('value');
    var q = $(":input[name='tbxQ']").attr('value');
    var a = $(":input[name='tbxA']").attr('value');
    
    if ( t == '' || s == '' || q == '' || a == '' )
        return false;
    else
        return true;
}

function CreateFlashcard()
{
    var ArticleID = $(":input[name='tbxArticleID']").attr('value');
    var t = $(":input[name='tbxTitle']").attr('value');
    var s = $(":input[name='tbxSubject']").attr('value');
    var q = $(":input[name='tbxQ']").attr('value');
    var a = $(":input[name='tbxA']").attr('value');
    var url = $(":input[name='tbxAnnotationUrl']").attr('value');

    if ( ArticleID == '0' )
    {
        // Create article
        $.get("/ws/Article.asmx/CreateArticle",
        {
            uid:1,
            url:url,
            title:t,
            subject:s
        },
        function(xml) {
            var ArticleID = $(xml).find('string').text();
            $(":input[name='tbxArticleID']").attr('value',ArticleID);
            AddFlashcard(q,a);
        },
        "xml");
    }
    else
        AddFlashcard(q,a);
}
       
function AddFlashcard(q, a)
{
    var ArticleID = $(":input[name='tbxArticleID']").attr('value');

    $.get("/ws/flashcard.asmx/CreateFlashcard",
    {
        articleId:ArticleID,
        question:q,
        answer:a
    },
    function(xml){
        var flashcardId = $(xml).find('string').text();
        var ArticleID = $(":input[name='tbxArticleID']").attr('value');
        $.get("/ws/flashcard.asmx/GetFlashcardListByID",
        {
            articleId:ArticleID
        },
        function(xml){
            var cardList = '';
            $(xml).find('ArrayOfArticleFlashcard').find('ArticleFlashcard').each(function(){
                var ID = $(this).find('ID').text();
                var FlashcardNumber = $(this).find('FlashcardNumber').text();
                var Question = $(this).find('Question').text();
                var Answer = $(this).find('Answer').text();
                var QuestionDisplay = Question;
                if ( Question.length > 30 )
                    QuestionDisplay = Question.substring(0,30) + '...';
                                
                cardList = cardList + '<li>(' + FlashcardNumber + ') <a title="' + Question + '" href="javascript:GetFlashcardInfo(' + ID + ');">' + QuestionDisplay + '</a> <a href="#" onclick="javascript:ProcessDelete(' + ID + ');"><img src="../Images/smallDelete.png" style="border:0px;margin-left:4px;" title="Delete" /></a></li>';
            });
            $("#divFlashcardList ul").html(cardList);
            $(":input[name='tbxQ']").attr('value','');
            $(":input[name='tbxA']").attr('value','');
            $(":input[name='tbxFlashcardID']").attr('value','0');
            $(":input[name='tbxQ']").focus();
                        
            $("#divMsgs").addClass('messaging');
            $("#divMsgs").html('Saved');
            setTimeout(function(){
                $("#divMsgs").removeClass('messaging');
                $("#divMsgs").html('');
            },5000);
        },
        "xml");
    },
    "xml");
}

function ProcessDelete(ID)
{
    if ( confirm("This card will be deleted. Are you sure?") )
    {
        // Delete flashcard
        $("#divMsgs").addClass('messaging');
        $("#divMsgs").html('Working...');
        $.get("/ws/Flashcard.asmx/DeleteFlashcard",
        {
            Id:ID
        },
        function(xml) {
            GetFlashcardByUrl();
            $("#divMsgs").addClass('messaging');
            $("#divMsgs").html('Saved');
            setTimeout(function(){
                $("#divMsgs").removeClass('messaging');
                $("#divMsgs").html('');
            },5000);
        },
        "xml");
    }
}
    
function UpdateFlashcard()
{
    var ID = $(":input[name='tbxFlashcardID']").attr('value');
    var aID = $(":input[name='tbxArticleID']").attr('value');
    var q = $(":input[name='tbxQ']").attr('value');
    var a = $(":input[name='tbxA']").attr('value');
        
    // Update flashcard
    $.get("/ws/Flashcard.asmx/UpdateFlashcard",
    {
        Id:ID,
        articleId:aID,
        question:q,
        answer:a
    },
    function(xml) {
        var ArticleID = $(xml).find('string').text();
        GetFlashcardByUrl();
        $(":input[name='tbxQ']").attr('value','');
        $(":input[name='tbxA']").attr('value','');
        $(":input[name='tbxFlashcardID']").attr('value','0');
        $(":input[name='tbxQ']").focus();
                
        $("#divMsgs").addClass('messaging');
        $("#divMsgs").html('Saved');
        setTimeout(function(){
            $("#divMsgs").removeClass('messaging');
            $("#divMsgs").html('');
        },5000);
    },
    "xml");
}
    
function GetFlashcardByUrl()
{
    var url = $(":input[name='tbxAnnotationUrl']").attr('value');
    $.get("/ws/flashcard.asmx/GetFlashcardListByUrl",
    {
        url:url
    },
    function(xml){
        var cardList = '';
        $(xml).find('ArrayOfArticleFlashcard').find('ArticleFlashcard').each(function(){
            var ID = $(this).find('ID').text();
            var FlashcardNumber = $(this).find('FlashcardNumber').text();
            var Question = $(this).find('Question').text();
            var Answer = $(this).find('Answer').text();
            var Title = $(this).find('Title').text();
            var Subject = $(this).find('Subject').text();
            var ArticleID = $(this).find('ArticleID').text();
            var QuestionDisplay = Question;
            if ( Question.length > 30 )
                QuestionDisplay = Question.substring(0,30) + '...';
                    
            $(":input[name='tbxArticleID']").attr('value',ArticleID);
            $(":input[name='tbxTitle']").attr('value',Title);
            $(":input[name='tbxSubject']").attr('value',Subject);
                    

            cardList = cardList + '<li>(' + FlashcardNumber + ') <a title="' + Question + '" href="javascript:GetFlashcardInfo(' + ID + ');">' + QuestionDisplay + '</a> <a href="#" onclick="javascript:ProcessDelete(' + ID + ');"><img src="../Images/smallDelete.png" style="border:0px;margin-left:4px;" title="Delete" /></a></li>';
        });
        $("#divFlashcardList ul").html(cardList);
    },
    "xml");
}
    
function getParameterByName( name )
{
    name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regexS = "[\\?&]"+name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var results = regex.exec( window.location.href );
    if( results == null )
        return "";
    else
        return results[1];
}

function GetFlashcardInfo(id)
{
    $.get("/WS/flashcard.asmx/GetFlashcardByID",
    {
        flashcardId:id
    },
    function(xml){
        var q = $(xml).find('Flashcard').find('Question').text();
        var a = $(xml).find('Flashcard').find('Answer').text();
        var id = $(xml).find('Flashcard').find('ID').text();
        $(":input[name='tbxQ']").attr('value',q);
        $(":input[name='tbxA']").attr('value',a);
        $(":input[name='tbxFlashcardID']").attr('value',id);
    },
    "xml");
} 
    
function FlipQandA()
{
    var temp = $(":input[name='tbxQ']").val();
    $(":input[name='tbxQ']").attr('value',$(":input[name='tbxA']").val());
    $(":input[name='tbxA']").attr('value',temp);
}
    
function CloseMemofire()
{
    document.location.href = $(":input[name='tbxAnnotationUrl']").attr('value');
}
    
// used in annotation page
function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name,"",-1);
}
