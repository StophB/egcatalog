$(document).ready(function () {
    // Initial setup
    $("#showMoreBtn").on("click", showMore);
    $("#showLessBtn").on("click", showLess);
});

function showMore() {
    $("#pagesContainer").hide();
    $("#allPagesContainer").show();
}

function showLess() {
    $("#pagesContainer").show();
    $("#allPagesContainer").hide();
}
