gh pr create --base plan --title "Merge feature" --body "Merge feature" && \
~/Setup/helpers/mwg.sh && \
git switch plan && \
git fetch && git pull && \
gh pr create --base development --title "Merge plan" --body "Merge plan" && \
~/Setup/helpers/mwg.sh && \
git switch development && \
git fetch && git pull && \
gh pr create --base stage --title "Merge development" --body "Merge development" && \
~/Setup/helpers/mwg.sh && \
git switch stage && \
git fetch && git pull && \
gh pr create --base production --title "Merge stage" --body "Merge stage" && \
~/Setup/helpers/mwg.sh
