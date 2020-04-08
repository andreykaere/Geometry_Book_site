
//$(document).ready(main);
//



function main() {
    let localStorage = window.localStorage;
    
	if (isFirst(localStorage)) {
		let theme = localStorage.getItem("mdbook-theme");
	    let windowTheme = generateWindowTheme(theme);
        
		showHint(windowTheme);
    }

}


main();
