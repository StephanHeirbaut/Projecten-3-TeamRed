# FileServer configuration GPO

1. Group Policy Management --> Forest: red.local --> Domains --> red.local
2. Rechtermuisklik op red.local --> Create GPO in this domain, and Link it here…
3. Naam: FileServer
4. Rechtermuisklik op FileServer --> Edit…
5. User configuration --> Preferences --> Windows Settings --> Dirve Maps
6. Aanmaken drives:

| Aanmaken voor | Action | Location | Use | Hide/Show this drive | Targeting |
| --- | --- | --- | --- | --- | --- |
| <b>ShareVerkoop</b> | Create | [\\lima2\ShareVerkoop](smb://lima2/ShareVerkoop) | S | Show this drive | IT Administratie<br>OR Verkoop<br>OR Ontwikkeling |
| <b>ProfileDirs</b> | Create | [\\lima2\ProfileDirs](smb://lima2/ProfileDirs) | T | Show this drive | Verkoop<br>OR Ontwikkeling<br>OR IT Administratie<br>OR Directie<br>OR Administratie |
| <b>HomeDirs</b> | Create | [\\lima2\HomeDirs](smb://lima2/HomeDirs) | U | Show this drive | Verkoop<br>OR Ontwikkeling<br>OR IT Administratie<br>OR Directie<br>OR Administratie |
| <b>AdminData</b> | Create | [\\lima2\AdminData](smb://lima2/AdminData) | V | Show this drive | Administratie<br>OR IT Administratie |
| <b>DirData</b> | Create | [\\lima2\DirData](smb://lima2/DirData) | W | Show this drive | Directie<br>OR IT Administratie |
| <b>ITData</b> | Create | [\\lima2\ITData](smb://lima2/ITData) | X | Show this drive | IT Administratie |
| <b>OntwikkelingsData</b> | Create | [\\lima2\OntwikkelingsData](smb://lima2/OntwikkelingsData) | Y | Show this drive | Ontwikkeling<br>OR IT Administratie |
| <b>VerkoopData</b> | Create | [\\lima2\VerkoopData](smb://lima2/VerkoopData) | Z | Show this drive | Verkoop<br>OR IT Administratie |
