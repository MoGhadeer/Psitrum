//......................................................................
//...Function to colorize the circuit gates according to their colors...
//......................................................................
function Light() {
    for (i = 0; i <= QuNum; i++) {
        for (j = 0; j <= StageNum; j++) {
            GateName = "gate_" + i + "_" + j;
            //console.log(GateName);
            Gate = document.getElementById(GateName);
            Gate.style.color = "#000000";
            switch (Gate.value) {
                case "I":
                    Gate.style.backgroundColor = "#8D8D8D"; break;
                case "H":
                    Gate.style.backgroundColor = "#c2343b"; break;
                case "Ctrl":
                case "-":
                case "X":
                case "SWP":
                    Gate.style.backgroundColor = "#0e91ba"; break;
                case "Y":
                case "Z":
                case "S":
                case "T":
                case "DS":
                case "DT":
                case "SX":
                case "DSX":
                    Gate.style.backgroundColor = "#BAE6FF"; break;
                case "RX":
                case "RY":
                case "RZ":
                case "U1":
                case "U2":
                case "U3":
                    Gate.style.backgroundColor = "#ff86babd"; break;
                default:
                    Gate.style.backgroundColor = "#027699"; break;
            }
        }
    }
}
//......................................................................
QuNum = 0;		// Global Variable to maintain nmber of Qubits
StageNum = 0;	// Global Variable to maintain nmber of Stages
//......................................................................
//......Functionton Clear the circuit and return to default state.......
//......................................................................
function ClearCircuit() {
    QuNum = 0;
    StageNum = 0;
    L = document.getElementById("Lines");
    L.textContent = '';
    A = document.getElementById("chooseQubit");
    A.textContent = '';
    temp = "<option value='" + QuNum + "'>&nbsp&nbsp&nbspQubit " + QuNum + "</option>";
    A.appendChild(createElementFromHTML(temp));
    SS = document.getElementById("chooseStage");
    SS.textContent = '';
    temp2 = "<option value='" + StageNum + "'>&nbsp&nbsp&nbspStage " + StageNum + "</option>";
    SS.appendChild(createElementFromHTML(temp2));
    temp = ""
        + "<div class='flex-container Line'><div class='d-flex flex-nowrap noiseLine' id='NoiseParameters'>"
        + "<div class='NoiseOperation'><div class='stageNum'>Noise</div>"
        + "<select id='NoiseTypeID' class='noiseType'><option value='Dep'> Depolarizing </option>"
        + "</select></div><div class='operation'><div class='stageNum'>Type</div>"
        + "<select id='NoiseMethodID' class='Noisefield'><option value='Stoc'> Random </option>"
        + "<option value='Over'> Overshoot </option></select></div>"
        + "<div class='operation' id='NP_0'><div class='stageNum'>P<sub>0</sub></div>"
        + "<input type='text' class='Noisefield' id='Noise0' value='0'></div></div></div>" 
        + "<div class='flex-container Line' id='line" + QuNum + "'><div class='qubit' id='q" + QuNum + "'><h7><b>q<sub>" + QuNum + "</sub></b></h7></div>"
        + "<div class='d-flex flex-nowrap operations' id='ops" + QuNum + "'>"
        + "<div class='operation'><div class='MeasureName'>Initial</div>"
        + "<select id='I" + QuNum + "' class='initial'><option value='Zero'> &#8739 0 ></option>"
        + "<option value='One'> &#8739 1 ></option></select></div>"
        + "<div class='operation' id='op" + QuNum + "_" + 0 + "'>"
        + "<div class='stageNum' id='st" + QuNum + "_" + 0 + "'>S<sub>0</sub></div><select id='gate_" + QuNum + "_" + StageNum + "' class='gate'>"
        + "<option value='Def'>Def</option>"
        + "<option value='I' selected>I</option>"
        + "<option value='H'>H</option>"
        + "<option value='Ctrl'>Ctrl</option>"
        + "<option value='-'>-</option>"
        + "<option value='X'>X</option>"
        + "<option value='SWP'>SWP</option>"
        + "<option value='Y'>Y</option>"
        + "<option value='Z'>Z</option>"
        + "<option value='S'>S</option>"
        + "<option value='DS'>DS</option>"
        + "<option value='T'>T</option>"
        + "<option value='DT'>DT</option>"
        + "<option value='SX'>SX</option>"
        + "<option value='DSX'>DSX</option>"
        + "<option value='RX'>RX</option>"
        + "<option value='RY'>RY</option>"
        + "<option value='RZ'>RZ</option>"
        + "<option value='U1'>U1</option>"
        + "<option value='U2'>U2</option>"
        + "<option value='U3'>U3</option>"
        + "</select></div>"
        + "<div class='operation'><div class='MeasureName'>Measure</div>"
        + "<select id='M" + QuNum + "' class='measure'><option value='MY'>Yes</option>"
        + "<option value='MN'>No</option></select></div>"
        + "</div></div>";
        
    L.appendChild(createElementFromHTML(temp));
    temp = ""
        + "<div class='flex-container Line' id='line" + QuNum + "'><div class='qubit' id='q" + QuNum + "'><h7><b>q<sub>" + QuNum + "</sub></b></h7></div>"
        + "<div class='d-flex flex-nowrap operations' id='ops" + QuNum + "'>"
        + "<div class='operation'><div class='MeasureName'>Initial</div>"
        + "<select id='I" + QuNum + "' class='initial'><option value='Zero'> &#8739 0 ></option>"
        + "<option value='One'> &#8739 1 ></option></select></div>"
        + "<div class='operation' id='op" + QuNum + "_" + 0 + "'>"
        + "<div class='stageNum' id='st" + QuNum + "_" + 0 + "'>S<sub>0</sub></div><select id='gate_" + QuNum + "_" + StageNum + "' class='gate'>"
        + "<option value='Def'>Def</option>"
        + "<option value='I' selected>I</option>"
        + "<option value='H'>H</option>"
        + "<option value='Ctrl'>Ctrl</option>"
        + "<option value='-'>-</option>"
        + "<option value='X'>X</option>"
        + "<option value='SWP'>SWP</option>"
        + "<option value='Y'>Y</option>"
        + "<option value='Z'>Z</option>"
        + "<option value='S'>S</option>"
        + "<option value='DS'>DS</option>"
        + "<option value='T'>T</option>"
        + "<option value='DT'>DT</option>"
        + "<option value='SX'>SX</option>"
        + "<option value='DSX'>DSX</option>"
        + "<option value='RX'>RX</option>"
        + "<option value='RY'>RY</option>"
        + "<option value='RZ'>RZ</option>"
        + "<option value='U1'>U1</option>"
        + "<option value='U2'>U2</option>"
        + "<option value='U3'>U3</option>"
        + "</select></div>"
        + "<div class='operation'><div class='MeasureName'>Measure</div>"
        + "<select id='M" + QuNum + "' class='measure'><option value='MY'>Yes</option>"
        + "<option value='MN'>No</option></select></div>"
        + "</div></div>";
    
    L.appendChild(createElementFromHTML(temp));
    AlgorithmMatrix = {};
}
//......................................................................
//....................Function to add new qubit line...................
//......................................................................
function addQubit() {
    QuNum++;
    L = document.getElementById("Lines");
    temp = "<div class='flex-container Line' id='line" + QuNum + "'><div class='qubit' id='q" + QuNum + "'><h7><b>q<sub>" + QuNum + "</sub></b></h7></div>"
        + "<div class='d-flex flex-nowrap operations' id='ops" + QuNum + "'>"
        + "<div class='operation'><div class='MeasureName'>Initial</div>"
        + "<select id='I" + QuNum + "' class='initial'><option value='Zero'> &#8739 0 ></option>"
        + "<option value='One'> &#8739 1 ></option></select></div>"
        + "<div class='operation' id='op" + QuNum + "_" + 0 + "'>"
        + "<div class='stageNum' id='st" + QuNum + "_" + 0 + "'>S<sub>0</sub></div><select id='gate_" + QuNum + "_" + 0 + "' class='gate'>"
        + "<option value='Def'>Def</option>"
        + "<option value='I' selected>I</option>"
        + "<option value='H'>H</option>"
        + "<option value='Ctrl'>Ctrl</option>"
        + "<option value='-'>-</option>"
        + "<option value='X'>X</option>"
        + "<option value='SWP'>SWP</option>"
        + "<option value='Y'>Y</option>"
        + "<option value='Z'>Z</option>"
        + "<option value='S'>S</option>"
        + "<option value='DS'>DS</option>"
        + "<option value='T'>T</option>"
        + "<option value='DT'>DT</option>"
        + "<option value='SX'>SX</option>"
        + "<option value='DSX'>DSX</option>"
        + "<option value='RX'>RX</option>"
        + "<option value='RY'>RY</option>"
        + "<option value='RZ'>RZ</option>"
        + "<option value='U1'>U1</option>"
        + "<option value='U2'>U2</option>"
        + "<option value='U3'>U3</option>"
        + "</select></div>"
        + "<div class='operation'><div class='MeasureName'>Measure</div>"
        + "<select id='M" + QuNum + "' class='measure'><option value='MY'>Yes</option>"
        + "<option value='MN'>No</option></select></div>"
        + "</div></div>";
    L.appendChild(createElementFromHTML(temp));
    if (StageNum > 0) {
        k = "ops" + QuNum;
        O = document.getElementById(k);
        for (i = 1; i <= StageNum; i++) {
            temp = "<div class='operation' id='op" + QuNum + "_" + i + "'>"
                + "<div class='stageNum' id='st" + QuNum + "_" + i + "'>S<sub>" + i + "</sub></div><select id='gate_" + QuNum + "_" + i + "' class='gate'>"
                + "<option value='Def'>Def</option>"
                + "<option value='I' selected>I</option>"
                + "<option value='H'>H</option>"
                + "<option value='Ctrl'>Ctrl</option>"
                + "<option value='-'>-</option>"
                + "<option value='X'>X</option>"
                + "<option value='SWP'>SWP</option>"
                + "<option value='Y'>Y</option>"
                + "<option value='Z'>Z</option>"
                + "<option value='S'>S</option>"
                + "<option value='DS'>DS</option>"
                + "<option value='T'>T</option>"
                + "<option value='DT'>DT</option>"
                + "<option value='SX'>SX</option>"
                + "<option value='DSX'>DSX</option>"
                + "<option value='RX'>RX</option>"
                + "<option value='RY'>RY</option>"
                + "<option value='RZ'>RZ</option>"
                + "<option value='U1'>U1</option>"
                + "<option value='U2'>U2</option>"
                + "<option value='U3'>U3</option>"
                + "</select></div>";
            O.insertBefore(createElementFromHTML(temp), O.lastElementChild);
        }
    }
    A = document.getElementById("chooseQubit");
    temp = "<option value='" + QuNum + "'>&nbsp&nbsp&nbspq<sub>" + QuNum + "</sub></option>";
    A.appendChild(createElementFromHTML(temp));
};
//......................................................................
//....................Function to add new Stage Line....................
//......................................................................
function addStage() {
    StageNum++;
    SS = document.getElementById("chooseStage");
    temp2 = "<option value='" + StageNum + "'>&nbsp&nbsp&nbspS<sub>" + StageNum + "</sub></option>";
    SS.appendChild(createElementFromHTML(temp2));
    
    NP= document.getElementById("NoiseParameters");
    temp = "<div class='operation' id='NP_"+StageNum+"'>"
    + "<div class='stageNum'>P<sub>"+StageNum+"</sub></div>"
    + "<input type='text' class='Noisefield' id='Noise_"+StageNum+"' value='0'></div>";
    NP.appendChild(createElementFromHTML(temp));

    S = document.getElementsByClassName("operations");
    Q = 0;
    for (x in S) {
        temp = "<div class='operation' id='op" + Q + "_" + StageNum + "'>"
            + "<div class='stageNum' id='st" + Q + "_" + StageNum + "'>S<sub>" + StageNum + "</sub></div><select id='gate_" + Q + "_" + StageNum + "' class='gate'>"
            + "<option value='Def'>Def</option>"
            + "<option value='I' selected>I</option>"
            + "<option value='H'>H</option>"
            + "<option value='Ctrl'>Ctrl</option>"
            + "<option value='-'>-</option>"
            + "<option value='X'>X</option>"
            + "<option value='SWP'>SWP</option>"
            + "<option value='Y'>Y</option>"
            + "<option value='Z'>Z</option>"
            + "<option value='S'>S</option>"
            + "<option value='DS'>DS</option>"
            + "<option value='T'>T</option>"
            + "<option value='DT'>DT</option>"
            + "<option value='SX'>SX</option>"
            + "<option value='DSX'>DSX</option>"
            + "<option value='RX'>RX</option>"
            + "<option value='RY'>RY</option>"
            + "<option value='RZ'>RZ</option>"
            + "<option value='U1'>U1</option>"
            + "<option value='U2'>U2</option>"
            + "<option value='U3'>U3</option>"
            + "</select></div>";
        S[x].insertBefore(createElementFromHTML(temp), S[x].lastElementChild);
        Q++;
    }
};
//......................................................................
//..................Function to drop Qubit from circuit.................
//......................................................................
function dropQubit() {
    if (QuNum != 0) {
        temp = "line" + QuNum;
        L = document.getElementById(temp);
        L.remove();
        A = document.getElementById("chooseQubit");
        A.removeChild(A.lastChild);
        QuNum--;
    }
};
//......................................................................
//..................Function to drop Stage from circuit.................
//......................................................................
function dropStage() {
    if (StageNum != 0) {
        for (i = 0; i <= QuNum; i++) {
            temp = "op" + i + "_" + StageNum;
            S = document.getElementById(temp);
            S.remove();
        }
        StageNum--;
        SS = document.getElementById("chooseStage");
        SS.removeChild(SS.lastChild);
        NP= document.getElementById("NoiseParameters");
        NP.removeChild(NP.lastChild);
    }
};
//......................................................................
var AlgorithmMatrix = {};	// Global Variable to store circuit
flag = 0;					// Global Flag to trace errors 
//......................................................................
//........Function to build Algorithm Matrix from the Circuit...........
//......................................................................
function simulate() {
    Light()
    AlgorithmMatrix = {};
    flag = 0;
    document.getElementById("ErrorDiv").innerHTML = "";

    var AlgorithmVector = [];
    AlgorithmVector.push(document.getElementById("NoiseTypeID").value);

    AlgorithmVector.push(document.getElementById("NoiseMethodID").value);

    for(i=0; i<= StageNum; i++){
        temp= "Noise_"+ i;
        AlgorithmVector.push(document.getElementById(temp).value);
    }

    AlgorithmMatrix[0] = AlgorithmVector;

    for (i = 0; i <= QuNum; i++) {
        AlgorithmVector = [];
        Gate = 0;
        GateName = "I" + i;
        Gate = document.getElementById(GateName).value;
        AlgorithmVector.push(Gate);
        for (j = 0; j <= StageNum; j++) {
            GateName = "gate_" + i + "_" + j;
            Gate = document.getElementById(GateName).value;
            if (Gate == "Ctrl")
                Gate = ".";
            else if (Gate == "-")
                Gate = "";
            else if (Gate == "U1" || Gate == "U2" || Gate == "U3" || Gate == "RX" || Gate == "RY" || Gate == "RZ" || Gate == "EXP") {
                flag = 1;
                document.getElementById("ErrorDiv").innerHTML = "Error: Gate: (" + Gate + ") at operation(Q" + i + ", S" + j + ") Require Extra Parameters !!";
                break;
            } else if (Gate == "Def") {
                flag = 1;
                document.getElementById("ErrorDiv").innerHTML = "Error: Choose a Gate at operation (Q" + i + ", S" + j + ")";
                break;
            }
            AlgorithmVector.push(Gate);
        }
        GateName = "M" + i;
        Gate = document.getElementById(GateName).value;
        AlgorithmVector.push(Gate);
        if (flag == 1) {
            break;
        } else {
            AlgorithmMatrix[i+1] = AlgorithmVector;
        }
    }
};
//......................................................................
//...............Callback Function between Matlab & HTML................
//......................................................................
function setup(htmlComponent) {
    // Get the initial 'Data' value from MATLAB
    var initialData = htmlComponent.Data;
    // Code response to data changes in MATLAB
    htmlComponent.addEventListener("DataChanged", function (event) {
        var changedData = htmlComponent.Data;
        //document.getElementById("Title").innerHTML= changedData;
    });
    // Update 'Data' in MATLAB and trigger the 'DataChangedFcn' callback function
    document.getElementById("Sim").addEventListener("click", function (event) {
        if (flag == 0) {
            htmlComponent.Data = JSON.stringify(AlgorithmMatrix);
        }
    });
}
//......................................................................
//...........Function to produce DOM object from a variable.............
//......................................................................
function createElementFromHTML(htmlString) {
    var div = document.createElement('div');
    div.innerHTML = htmlString.trim();
    // Change this to div.childNodes to support multiple top-level nodes
    return div.firstChild;
}
//......................................................................
//..........Function to add parameters to the specified gate............
//......................................................................
function addParameters() {
    GateName = "gate_" + document.getElementById("chooseQubit").value + "_" + document.getElementById("chooseStage").value;
    G = document.getElementById(GateName);
    Theta = parseFloat(document.getElementById("enterTheta").value);
    Phi = parseFloat(document.getElementById("enterPhi").value);
    Lambda = parseFloat(document.getElementById("enterLambda").value);
    console.log(G.firstElementChild.value);
    if (G.value != "Def") {
        if (G.value == "U1" || G.value == "U2" || G.value == "U3" || G.value == "RX" || G.value == "RY" || G.value == "RZ" || G.value == "EXP") {
            document.getElementById("ErrorDiv").innerHTML = "";
            if (G.value == "U2") {
                if(Theta != 0.000000000 & Phi != 0.000000000){
                    v = G.value + "|" + Theta + "|" + Phi;
                }else{
                    document.getElementById("ErrorDiv").innerHTML = "Error: Gate : Parameters Cannot Be Zero !!";
                }
            } else if (G.value == "U3") {
                if(Theta != 0.000000000 & Phi != 0.000000000 & Lambda != 0.000000000){
                    v = G.value + "|" + Theta + "|" + Phi + "|" + Lambda;
                }else{
                    document.getElementById("ErrorDiv").innerHTML = "Error: Gate : Parameters Cannot Be Zero !!";
                }
            } else {
                if(Theta != 0.000000000){
                    v = G.value + "|" + Theta;
                }else{
                    document.getElementById("ErrorDiv").innerHTML = "Error: Gate : Parameters Cannot Be Zero !!";
                }
            }
            G.firstElementChild.value = v;
            G.firstElementChild.innerHTML = v;
            G.selectedIndex = 0;
        } else {
            document.getElementById("ErrorDiv").innerHTML = "Error: Gate : (" + G.value + ") Does NOT Accept Parameters !!";
        }
    } else {
        document.getElementById("ErrorDiv").innerHTML = "Error: Please Choose Gate to Add Parameter !!";
    }
}
//......................................................................
//..........Function to Remove parameters to the specified gate............
//......................................................................
function removeParameters() {
    Theta = document.getElementById("enterTheta");
    Phi = document.getElementById("enterPhi");
    Lambda = document.getElementById("enterLambda");
    Theta.value = "0";
    Phi.value = "0";
    Lambda.value = "0";
    GateName = "gate_" + document.getElementById("chooseQubit").value + "_" + document.getElementById("chooseStage").value;
    G = document.getElementById(GateName);
    G.firstElementChild.value = "Def";
    G.firstElementChild.innerHTML = "Def";
    document.getElementById("ErrorDiv").innerHTML = "";
}