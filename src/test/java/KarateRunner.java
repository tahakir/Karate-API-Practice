import com.intuit.karate.junit5.Karate;

public class KarateRunner {

    @Karate.Test
    Karate metaWeatherTest(){
        return new Karate().tags("@meta_weather").relativeTo(getClass());
    }

    @Karate.Test
    Karate bookItRoomTest(){
        return new Karate().tags("@bookit").relativeTo(getClass());
    }

    @Karate.Test
    Karate zippopotamTest(){
        return new Karate().tags("@zippopotam").relativeTo(getClass());
    }

    @Karate.Test
    Karate omdbTest(){
        return new Karate().tags("@omdb").relativeTo(getClass());
    }

}
