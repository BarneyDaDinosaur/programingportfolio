import java.util.Scanner;
public class WordCreator
{
    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);
        System.out.println("How many words would you like to generate? ");
        int wordNum = scanner.nextInt();  //it will break in not int for now
        
        String[] pre = {"un","anti","inter","intra","exter","extra","non","iso","ped","mani","bi","pre","phon","octo","pyro","derm","hyper","hypo","pro","opti","post","path","mid","auto","hetero","en"};
        String[] root = {"fract","aud","dict","ject","mater","mal","mort","voc","phil","aut","jud","scrib","therm","nerd","violin","gross","glass","god","pork","grump","death","happy","joy","peril","human","fish","medical","mainiac","short","witch","ginger"};
        String[] suf = {"ly","ology","tain","ous","ity","ess","al","an","ile","osis","glyte","phobia","philia","ing","est","ist","oid","ment","ite","ious"};
        
        String[] preDef = {"the opposite of","against","between or among","on the inside or within","on the outside of or far away from","beyond or more than","not","equal","relating to feet","relating to the hands","twice or two","before or prior to","sound or voice","eight","fire and or heat","realting to the skin","over or excessivly","beneath or below","acceptance or for, not against","sight","after","feeling or disease","halfway, or in the middle of","about one self","different or other","within"};
        String[] rootDef = {"breaking","to hear","to say or tell","to throw","mother(s)","bad or a big fat meany","death","about voices","love","many or more than one","judgement","to write","heat","smart people with acne and glasses","high-pitched squecky string instruments","yucky or unappealing","see through breakable substances made out of melted sand","omnipotent being","tasty food that comes from a pig","downers or narcissists","the action when a person stops living","joyful and smile inducing feelings","happy and fuzzy feelings","being in a dangerous and stressful situation","hairless apes who have social media","sea creatures with scales and gills","medicine and doctors","crazy or insane beings","the atrribute of being small and vertically challenged","mistic or a sorceress, usually having red hair","red haired human, a sign of being a witch"};
        String[] sufDef = {"like or in the manner of","the study of","to hold on to","full of","the quality or state of","a female who","the kind of or having the form or character of","belong to or on the behalf of","expressing capability for or of","disease or condition of","something that is capable decomposing","the fear of","the love for","the action of","the most or greatest","relating to or of a specific quality","resembleing and/or similar to","the act of or having the feeling of","resident of or follower of","full of or possesing the quality of"};
    
        for(int i = 0; i < wordNum; i++){
        int x = (int)(Math.random() * pre.length-1) + 0;
        int y = (int)(Math.random() * root.length-1) + 0;
        int z = (int)(Math.random() * suf.length-1) + 0;
        System.out.println("\n" + pre[x] + "-" + root[y] + "-" + suf[z] + ": " + sufDef[z] + " " + preDef[x] + " " + rootDef[y]);
        }
    }
}