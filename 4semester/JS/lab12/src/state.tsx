
export interface MovieTypeSt{
    imagesrc: string;
    title: string;
    year: string;
    type: string;
}

export const MOVIES: MovieTypeSt[] = [
    {imagesrc:'/images/1+1.png', title:'1+1', year:'2011', type:'movie'},
    {imagesrc:'/images/Interstellar.png', title:'Интерстеллар', year:'2014', type:'movie'},
    {imagesrc:'/images/inception.png', title:'Начало', year:'2010', type:'movie'},
    {imagesrc:'/images/greenMile.png', title:'Зеленая миля', year:'1999', type:'movie'},
    {imagesrc:'/images/forestGump.png', title:'Форест Гамп', year:'1994', type:'movie'},
    {imagesrc:'/images/fightClub.png', title:'Бойцовский клуб', year:'1999', type:'movie'},

    {imagesrc:'/images/gameOfThrones.png', title:'Игра престолов', year:'2011', type:'serial'},
    {imagesrc:'/images/houseOfDragon.png', title:'Дом дракона', year:'2022', type:'serial'},
    {imagesrc:'/images/house.png', title:'Доктор Хаус', year:'2004', type:'serial'},
    {imagesrc:'/images/sherlok.png', title:'Шерлок', year:'2010', type:'serial'},
    {imagesrc:'/images/lookingForAlyaska.png', title:'В поисках аляски', year:'2019', type:'serial'},
    {imagesrc:'/images/Anne.png', title:'Энн', year:'2017', type:'serial'},

    {imagesrc:'/images/Shrek.png', title:'Шрек', year:'2001', type:'cartoon'},
    {imagesrc:'/images/koeNoKatachi.png', title:'Форма голоса', year:'2016', type:'cartoon'},
    {imagesrc:'/images/yourName.png', title:'Твое имя', year:'2016', type:'cartoon'},
    {imagesrc:'/images/titans.png', title:'Атака титанов', year:'2013', type:'cartoon'},
    {imagesrc:'/images/deathNote.png', title:'Тетрадь смерти', year:'2006', type:'cartoon'},
    {imagesrc:'/images/5smASecond.png', title:'5 сантиметров в секудну', year:'2007', type:'cartoon'},
]