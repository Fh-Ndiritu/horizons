// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

// import Trix from "trix"
document.addEventListener('trix-initialize', function(event) {
   
//   alert("Nice")

});

document.addEventListener('trix-attachment-add', function(event) {
    var attachment = event.attachment;

  if (attachment.file) {
    var file = attachment.file;
    var maxSizeInBytes = 6 * 1024 * 1024; // 10 MB
    var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];

    if (file.size > maxSizeInBytes || !allowedTypes.includes(file.type)) {
      alert('Invalid file. Please choose a smaller image file of type JPEG, PNG, or GIF.');
      event.preventDefault();
    }
  }

});

var element = document.querySelector("trix-editor")
element.editor  // is a Trix.Editor instance

