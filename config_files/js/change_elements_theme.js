
//$(document).ready(main);



let THEME_COLOR = {'light': '#333333',
                   'rust':  '#262625', 
                   'coal':  '#98a3ad', 
                   'ayu':   '#c5c5c5', 
                   'navy':  '#bcbdd0', 
};



function changeAllIcons(theme) {
    let color = THEME_COLOR[theme];

    let icons = document.querySelectorAll(".header svg");


    for (i in icons) {
		let icon = icons[i];
    
		// if it is "function" or "number" type
		try {
			//console.log(icon, new_theme);
		    icon.style.fill = color;
		} catch(e) {
		    //console.log(e);
		}
	}


}

function changeImgTheme(figure, new_theme) {
    let path = figure.getAttribute('src');
    let reg  = /(.*)_/;
	//console.log(path);

    path = path.match(reg)[0] + new_theme + ".svg";
	//console.log(path);
	

	figure.setAttribute('src', path);
}

function changeAllFigures(new_theme) {
    let figures = document.querySelectorAll(".figure");


    for (i in figures) {
		let figure = figures[i];
    
		// if it is "function" or "number" type
		try {
			//console.log(figure, new_theme);
			changeImgTheme(figure, new_theme);
		} catch(e) {
		    //console.log(e);
		}

		/*
        if (typeof figure !== "function") {
            console.log(figure);
		    console.log(figure.getAttribute('src'));
		}*/
	}

}




function main() {
    let themePopup = document.getElementById('theme-list');
	let theme = window.localStorage.getItem('mdbook-theme');
    
	changeAllFigures(theme);
	changeAllIcons(theme);

	themePopup.addEventListener('click', function (e) {
		let new_theme = e.target.id || e.target.parentElement.id;
        changeAllFigures(new_theme);
		changeAllIcons(new_theme);
    });
}

main();
