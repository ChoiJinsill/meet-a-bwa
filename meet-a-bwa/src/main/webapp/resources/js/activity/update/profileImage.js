/**
 * @author 최진실
 */

$(function () {
    function readURL(input) {
        if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function(e) {
              $('#image').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);

            if($("#image").attr('src') != "/meet-a-bwa/resources/img/placeholder1.webp"){
               $('#delete-file1').css('display','block');
               $('#delete-file1').css('opacity','1');
                  
               $('#imgWrap').hover(function(){
                  if($("#image").attr('src')!="/meet-a-bwa/resources/img/default-image2.png"){
                     $('#delete-file2').css('display','block');
                     $('#delete-file2').css('opacity','1');
                  }
               });
               
               $('#imgWrap').mouseleave(function(){
                  $('#delete-file2').css('opacity','0');
               });
   
            }
        }
     }
     
      $("#input-file").off().on("change", function(){
		 if (this.files && this.files[0]) {
			 var maxSize = 10 * 1024 * 1024; // 10MB
	    	 var fileSize = this.files[0].size;

			if(fileSize > maxSize){
		    	  $(".image-popup").removeClass("blind");
		    	  $(this).val('');
		    	  
				  $(".ok").on("click", function(){
				  	$(".image-popup").addClass("blind");
				  });
				 
				 return false;
		    }
		}
	});
     
     $("#input-file").change(function() {
        readURL(this);
     });
     
     $('#delete-file1').click(function(){
		$('#image').attr('src',"/meet-a-bwa/resources/img/placeholder1.webp");
		$('#delete-file1').css('display','none');
	});

	$('#delete-file2').click(function(){
		$('#image').attr('src',"/meet-a-bwa/resources/img/default-image2.png");
		$('#delete-file2').css('display','none');
	});
     
});