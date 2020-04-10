/*
let TO_ENGLISH = {
    "Доказательство": "proof",
    "Рисунок": "picture",
	"Подсказка": "hint",
};
*/

//cut off "-hidden" or "-visible"
/*
window.onload = function() {
    main();
}
*/



function getContentName(content) {
	let reg = /(.*)-/ //new RegExp('.g');
	return content.id.match(reg)[1]; //take name without ending char "-"
}


function getState(content) {
    let reg = /.*-(.*)/;
	return content.id.match(reg)[1];
}


function getSectionName(content) {
    let reg = /(.*?)_/;//let reg = /(.*)_.*_/
	return content.id.match(reg)[1];
}

function getOppositeState(state) {
    if (state == "visible") {
		return "hidden";
	}
    return "visible";
}

function changeToggleFunctionArg(content, state) {
    let section = document.getElementById(getSectionName(content))
		                  .children[0].children[0];
	//console.log(section);
    let callFunction = section.getAttribute("onclick");
    
	//console.log(callFunction);
    callFunction = callFunction.replace(getOppositeState(state), state);
    /*
	if (state == "hidden") {
        callFunction = callFunction.replace("visible", "hidden");
	} else {
        callFunction = callFunction.replace("hidden", "visible");
	}
    */
	//console.log("final " + callFunction);
	
	section.setAttribute("onclick", callFunction);

}


function changeState(content) {
	let state = getState(content);
    return getContentName(content) + "-" + getOppositeState(state);
}


function setVisibleState(content) {
	let visibleState = changeState(content);
    
	content.id = visibleState;
	content.style.display = '';
	
}



function showSectionContent(content, storage) {
	let sectionId = getSectionName(content);
	setVisibleState(content);

    changeToggleFunctionArg(content, getState(content));
    changeArrows(document.getElementById(sectionId), getState(content));

	storage.setItem(getContentName(content), "visible");
}



function setHiddenState(content) {
    let hiddenState = changeState(content);

    content.id = hiddenState;
    content.style.display = 'none';
	
}

function hideSectionContent(content, storage) {
	let sectionId = getSectionName(content);
	
	setHiddenState(content)
	
    changeToggleFunctionArg(content, getState(content));
    changeArrows(document.getElementById(sectionId), getState(content));
    //changeArrows(section, "hidden");
	storage.setItem(getContentName(content), "hidden");
}


function sectionToggle(contentName, storage) {
    //alert("State was changed");//
	let content = document.getElementById(contentName);
	
	if (getState(content) == "visible"){
		hideSectionContent(content, storage);
	} else {
		//console.log("content will be shown");//
		showSectionContent(content, storage);
	}
}


function setHorisontalArrows(section) {

    let title = section.getElementsByTagName("*")[0];
    let path  = "#" + section.id + " " + title.tagName + "::before ";

	//console.log(path);
    addStyle(path, {
        transform: "rotate(0deg)",
        top: "0px",
		position: "initial",
	});
}

function setVerticalArrows(section) {
    let title = section.getElementsByTagName("*")[0];
    let path  = "#" + section.id + " " + title.tagName + "::before ";

	//console.log(path);
    addStyle(path, {
        transform: "rotate(90deg)",
        top: "8px",
		position: "relative",
	});
}


function changeArrows(section, state) {
    if (state == "hidden") {
        setHorisontalArrows(section);
	} else {
        setVerticalArrows(section);
	}
}




let addStyle = (function (style) {
    let sheet = document.head.appendChild(style).sheet;
    return function (selector, css) {
        let propText = typeof css === "string" ? css : Object.keys(css).map(function (p) {
            return p + ":" + (p === "content" ? "'" + css[p] + "'" : css[p]);
        }).join(";");
        sheet.insertRule(selector + "{" + propText + "}", sheet.cssRules.length);
    };
})(document.createElement("style"));



function setInitialState(elementsNames, storage) {
    
	for (index in elementsNames) {
        let elementName = elementsNames[index];
		let element     = document.getElementById(elementName);
        

		//ignore elements which is not contained by this page
		if (!element) {continue;}

		let contentName = getContentName(element);
		let state       = getState(element);
        
        //console.log(contentName, state);

/*
		if (!storage.getItem(contentName)){
			 //console.log(contentName, 2);
			 storage.setItem(contentName, "hidden");
		}
		//console.log(element.id);
*/		
		//if need, make visible some elements, because then we hide all elements, 
		//so we hide them here, and then they will be visible, when all will be hidden
		if (storage.getItem(contentName) === "visible") {
            sectionToggle(element.id, storage); //show section, if it's need
		}
		
		//sectionToggle(element.id, storage); // hide all elements    
        

	}
             

}

function main() {
    //let section1 = document.getElementById("Доказательство");
	//section1.onload = function() {
	//sectionToggle("Доказательство_problem1_div-visible");

	let storage = window.localStorage;

    //all elements is visible by default and then we make them hidden
<<<<<<< HEAD
	let elementsNames = ['Доказательства-свойств_homothetic_div-hidden', 'Доказательство_fact3_div-hidden', 'Подсказка_fact10_div-hidden', 'Рисунок_problem3_div-hidden', 'Доказательства-свойств_print_div-hidden', 'Доказательство_problem3_div-hidden', 'Рисунок_fact2_div-hidden', 'Доказательство_fact11_div-hidden', 'Доказательство_fact7_div-hidden', 'Рисунок_fact11_div-hidden', 'Подсказка_problem1_div-hidden', 'Подсказка_fact2_div-hidden', 'Подсказка_fact5_div-hidden', 'Рисунок_problem4_div-hidden', 'Доказательство_problem5_div-hidden', 'Подсказка_fact4_div-hidden', 'Доказательство_fact4_div-hidden', 'Рисунок_fact4_div-hidden', 'Рисунок_fact9_div-hidden', 'Подсказка_fact12_div-hidden', 'Рисунок_fact13_div-hidden', 'Подсказка_fact9_div-hidden', 'Рисунок_problem2_div-hidden', 'Доказательство_fact6_div-hidden', 'Подсказка_fact13_div-hidden', 'Доказательство_problem2_div-hidden', 'Подсказка_fact8_div-hidden', 'Подсказка_fact3_div-hidden', 'Доказательство_fact9_div-hidden', 'Рисунок_fact8_div-hidden', 'Подсказка_problem2_div-hidden', 'Доказательство_fact10_div-hidden', 'Доказательство_fact13_div-hidden', 'Подсказка_fact11_div-hidden', 'Рисунок_fact5_div-hidden', 'Подсказка_fact1_div-hidden', 'Доказательство_print_div-hidden', 'Подсказка_problem3_div-hidden', 'Подсказка_fact7_div-hidden', 'Рисунок_fact12_div-hidden', 'Рисунок_fact1_div-hidden', 'Рисунок_fact7_div-hidden', 'Подсказка_fact6_div-hidden', 'Доказательства-свойств_orthocenter_div-hidden', 'Подсказка_problem5_div-hidden', 'Рисунок_print_div-hidden', 'Рисунок_fact6_div-hidden', 'Доказательство_problem1_div-hidden', 'Рисунок_problem5_div-hidden', 'Решение_print_div-hidden', 'Решение_problem4_div-hidden', 'Доказательство_fact5_div-hidden', 'Доказательство_fact2_div-hidden', 'Доказательство_fact1_div-hidden', 'Доказательства-свойств_inversion_div-hidden', 'Рисунок_fact10_div-hidden', 'Подсказка_problem4_div-hidden', 'Доказательство_fact8_div-hidden', 'Рисунок_fact3_div-hidden', 'Доказательство_fact12_div-hidden', 'Подсказка_print_div-hidden', 'Рисунок_problem1_div-hidden'];
=======
	let elementsNames = ['Доказательства-свойств_homothetic_div-hidden', 'Доказательство_fact3_div-hidden', 'Подсказка_fact10_div-hidden', 'Рисунок_problem3_div-hidden', 'Доказательства-свойств_print_div-hidden', 'Доказательство_problem3_div-hidden', 'Рисунок_fact2_div-hidden', 'Доказательство_fact11_div-hidden', 'Доказательство_fact7_div-hidden', 'Рисунок_fact11_div-hidden', 'Подсказка_problem1_div-hidden', 'Подсказка_fact2_div-hidden', 'Подсказка_fact5_div-hidden', 'Рисунок_problem4_div-hidden', 'Доказательство_problem5_div-hidden', 'Подсказка_fact4_div-hidden', 'Доказательство_fact4_div-hidden', 'Рисунок_fact4_div-hidden', 'Рисунок_fact9_div-hidden', 'Подсказка_fact12_div-hidden', 'Рисунок_fact13_div-hidden', 'Подсказка_fact9_div-hidden', 'Рисунок_problem2_div-hidden', 'Доказательство_fact6_div-hidden', 'Подсказка_fact13_div-hidden', 'Доказательство_problem2_div-hidden', 'Подсказка_fact8_div-hidden', 'Подсказка_fact3_div-hidden', 'Доказательство_fact9_div-hidden', 'Рисунок_fact8_div-hidden', 'Подсказка_problem2_div-hidden', 'Доказательство_fact10_div-hidden', 'Доказательство_fact13_div-hidden', 'Подсказка_fact11_div-hidden', 'Рисунок_fact5_div-hidden', 'Подсказка_fact1_div-hidden', 'Доказательство_print_div-hidden', 'Подсказка_problem3_div-hidden', 'Подсказка_fact7_div-hidden', 'Рисунок_fact12_div-hidden', 'Рисунок_fact1_div-hidden', 'Рисунок_fact7_div-hidden', 'Подсказка_fact6_div-hidden', 'Доказательства-свойств_orthocenter_div-hidden', 'Подсказка_problem5_div-hidden', 'Рисунок_print_div-hidden', 'Рисунок_fact6_div-hidden', 'Доказательство_problem1_div-hidden', 'Рисунок_problem5_div-hidden', 'Решение_print_div-hidden', 'Решение_problem4_div-hidden', 'Доказательство_fact5_div-hidden', 'Доказательство_fact2_div-hidden', 'Доказательство_fact1_div-hidden', 'Доказательства-свойств_inversion_div-hidden', 'Рисунок_fact10_div-hidden', 'Подсказка_problem4_div-hidden', 'Доказательство_fact8_div-hidden', 'Рисунок_fact3_div-hidden', 'Доказательство_fact12_div-hidden', 'Подсказка_print_div-hidden', 'Рисунок_problem1_div-hidden'];
>>>>>>> 39bd249a2b60cc33804306b18d4299a41e6c318c

	setInitialState(elementsNames, storage);
}

main();

//console.log("reload");


