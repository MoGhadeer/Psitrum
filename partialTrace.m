%-------------------------- Auxilary Function ----------------------------  
% ------- Name: partialTrace ---------------------------------------------
% ------- Goal: It traces out a subsytem in a system and return the 
%               partial trace for the remaining system
% ------- Inputs: --------------------------------------------------------
% -------  1. OutQuState (Complex 1D-array/Vector): it represents
%             a quantum state.
% -------- 2. SubSystem (Integer 1D-array/Vector): it represents the
%             indecies for qubits to be traced out.
% -------- 3. SystemDimension (Integer 1D-array/Vector): it represents the
%             dimension of each qubit vector (e.g. |000> == [2 2 2].
% ------- Outputs: -------------------------------------------------------
% -------- 1. ResultSystem (Complex 2D-array/Matrix): it represents
%             the matrix resulted from tracing out the subsystem.
% ------- Example: -------------------------------------------------------
%           partialTrace([1 0 0 0]', [1], [2 2])= [1 0; 0 0]
%-------------------------------------------------------------------------
function ResultSystem = partialTrace(InputState,SubSystem,SystemDimension)
    % check arguments
    if any(SubSystem > length(SystemDimension)) || any(SubSystem < 0)
      error('Invalid subsystem in SYS');
    end
    if (length(SystemDimension) == 1 && mod(length(InputState)/SystemDimension,1) ~= 0)...
      || length(InputState) ~= prod(SystemDimension)
      error('Size of state PSI inconsistent with DIM');
    end
    % remove singleton dimensions
    if exist('setdiff')
      % matlab
      SubSystem = setdiff(SubSystem,find(SystemDimension == 1));
    else
      % octave
      SubSystem = complement(find(SystemDimension == 1),SubSystem);
    end
    SystemDimension = SystemDimension(find(SystemDimension ~= 1));
    % calculate systems, dimensions, etc.
    n = length(SystemDimension);
    rdim = SystemDimension(end:-1:1);
    keep = [1:n];
    keep(SubSystem) = [];
    dimtrace = prod(SystemDimension(SubSystem));
    dimkeep = length(InputState)/dimtrace;
    if any(size(InputState) == 1)
      % state vector
      if size(InputState,1) == 1
        InputState = InputState';
      end
      % reshape state vector to "reverse" ket on traced subsystems into a bra,
      % then take outer product
      perm = n+1-[keep(end:-1:1),SubSystem];
      ResultSystem = reshape(permute(reshape(InputState,rdim),perm),[dimkeep,dimtrace]);
      ResultSystem = ResultSystem*ResultSystem';
    else
      % density matrix
      % reshape density matrix into tensor with one row and one column index
      % for each subsystem, permute traced subsystem indices to the end,
      % reshape again so that first two indices are row and column
      % multi-indices for kept subsystems and third index is a flattened index
      % for traced subsystems, then sum third index over "diagonal" entries
      perm = n+1-[keep(end:-1:1),keep(end:-1:1)-n,SubSystem,SubSystem-n];
      ResultSystem = reshape(permute(reshape(InputState,[rdim,rdim]),perm),...
                  [dimkeep,dimkeep,dimtrace^2]);
      ResultSystem = sum(ResultSystem(:,:,[1:dimtrace+1:dimtrace^2]),3);
    end
end