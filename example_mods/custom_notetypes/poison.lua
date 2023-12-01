function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is the note it is
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'poison' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'mechanics/poison'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

local healthDrain = 0;
local drain = false;

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == "poison" then
        	healthDrain = healthDrain + 0.005;
		drain = true
	end
end

function onUpdate(elapsed)
	if drain == true then
		setProperty('health', getProperty('health') - healthDrain)
	end
end