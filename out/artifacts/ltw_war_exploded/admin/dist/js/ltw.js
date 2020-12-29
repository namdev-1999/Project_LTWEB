$(document).ready(function () {
    // var remainVal = $(".remain").val();
    $("button.edit").click(function () {
        $(".remain").prop('disabled',"false").removeClass("border-0");
        $(".remain").removeAttr('disabled');
        $(".edit").addClass("d-none");
        $(".add").addClass("d-none");
        $(".save").removeClass("d-none");
        $(".back").removeClass("d-none")
    })
    $(".back").click(function () {
        // $(".remain").val(remainVal);
        $(".remain").prop('disabled',"true").addClass("border-0");
        $(".remain").attr('disabled','disabled');
        $(".edit").removeClass("d-none");
        $(".add").removeClass("d-none");
        $(".save").addClass("d-none");
        $(".back").addClass("d-none")
    })
    $(".checkbox-menu").on("change", "input[type='checkbox']", function() {
        $(this).closest("li").toggleClass("active", this.checked);
    });

    $(document).on('click', '.allow-focus', function (e) {
        e.stopPropagation();
    });
    Popper.Defaults.modifiers.preventOverflow = { enabled: false };
})