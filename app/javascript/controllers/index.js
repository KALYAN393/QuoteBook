// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application";

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

$(".material-symbols-outlined").on("click", function () {
  var post_id = $(this).data("id");
  console.log("POST ID " + post_id);
  $.ajax({
    url: "/post/like/" + post_id,
    method: "GET",
    // // data: { post_id: post_id },
    // headers: {
    //   "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
    // },
  }).done(function (response) {
    console.log(response);
  });
});
