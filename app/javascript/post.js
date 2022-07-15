// $(".material-symbols-outlined").on("click", function () {
//   var post_id = $(this).data("id");
//   console.log("POST ID " + post_id);
//   $.ajax({
//     url: "/post/like/" + post_id,
//     method: "POST",
//     beforeSend: function (xhr) {
//       xhr.setRequestHeader(
//         "X-CSRF-Token",
//         $('meta[name="csrf-token"]').attr("content")
//       );
//     },
//   }).done(function (response) {
//     console.log(response);
//   });
// });
