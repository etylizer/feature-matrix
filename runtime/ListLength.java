import scraper.annotations.*;
import scraper.api.*;
import java.util.*;


@NodePlugin("0.1.0") public class ListLength<A> implements FunctionalNode {
    @FlowKey T<List<A>> in  = new T<>(){};
    @FlowKey L<String> out = new L<>(){};

    @Override public void modify(FunctionalNodeContainer n, FlowMap o) {
        List<A> l = o.eval(in);
        String length = "" + l.size();
        o.output(out, length);
    }
}
