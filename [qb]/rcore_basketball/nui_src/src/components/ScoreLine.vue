<template>
    <tr>
        <td>
            <img v-if='isTurn' src='../../public/basketball.png' />
        </td>
        <td>{{ name }}</td>
        <td>{{ displayScore }}</td>
    </tr>
</template>

<script>
export default {
    props: ['name', 'isTurn', 'score', 'throws'],
    computed: {
        translations() {
            return this.$store.state.translations;
        },
        gameMode: function() {
            return this.$store.state.gameMode;
        },
        horseLetters: function() {
            return this.$store.state.horseLetters;
        },
        displayScore: function() {
            if(this.gameMode === 0) { // horse
                let horseLetters = 0;
                for(let pThrow of this.throws) {
                    if(pThrow == -1) {
                        horseLetters += 1;
                    }
                }

                let letters = [];

                for(let i = 1; i <= horseLetters; i++) {
                    letters.push(this.$store.state.horseLetters[i-1])
                }

                return letters.join('-');
            } else if(this.gameMode === 1) { // atw
                let score = 0;

                for(let tGroup of this.throws) {
                    for(let thr of tGroup) {
                        score += thr;
                    }
                }

                return score + ' / ' + this.$store.state.throwPoints.length;
            } else if(this.gameMode === 2) { // free throw
                let score = 0;

                for(let pThrow of this.throws) {
                    score += pThrow;
                }

                return score;
            }

            return '';
        }
    }
}
</script>