#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_2C [[id(6)]];
    sampler vp_t_tcb_2CSmplr [[id(7)]];
    texture2d<float> vp_t_tcb_28 [[id(8)]];
    sampler vp_t_tcb_28Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    sampler vp_t_tcb_2CSmplr_w [[id(12)]];
    sampler vp_t_tcb_28Smplr_w [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(0)]];
    float4 m_51 [[attribute(2)]];
    float4 m_41 [[attribute(3)]];
    float4 m_46 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1506 = false;
    bool _462 = false;
    bool _312 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_41.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    if (!_96)
    {
        out.m_44.x = 0.0;
    }
    int _102 = 0;
    if (!_96)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1790 = as_type<float>(_106);
        out.gl_Position.z = _1790;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_46.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_92);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_44.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1859 = as_type<float>(_144);
        out.gl_Position.z = _1859;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = as_type<float>(int(gl_VertexIndex));
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    int _154 = as_type<int>(_146) & 1;
    bool _156 = _154 != 0;
    int _158 = as_type<int>(_146) & 2;
    bool _160 = _158 != 0;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _166 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _168 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _170 = !_160;
    float _172 = _170 ? (-0.5) : 0.5;
    float _174 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _164);
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _166);
    float _178 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _180 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _182 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _176);
    float _184 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _178);
    bool _186 = !_156;
    float _188 = _186 ? (-0.5) : 0.5;
    bool _190 = !_162;
    float _208;
    if (!_190)
    {
        float _192 = in.m_53.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        float _212 = float(_92);
        float _214 = 1.0 / _212;
        float _216 = _124 * _214;
        _208 = _216;
    }
    _210 = false;
    float _218 = _208;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -_234;
    float _242 = _240 + 1.0;
    bool _244 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_218);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _238;
    float _264 = _254 * _242;
    float _266 = -_254;
    float _268 = _266 + 1.0;
    float _270 = _222 * _262;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = _276 * _264;
    float _282 = _278 * _264;
    float _284 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _286 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _282);
    float _288 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _284);
    float _290 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _286);
    bool _292 = !_260;
    float _310;
    if (!_292)
    {
        float _294 = in.m_53.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _124 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _324 = _320 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _330 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _332 = isnan(_320);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _346 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _348 = isnan(_320);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _358;
    bool _362 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _364 = isnan(_320);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _328;
    float _376 = -_340;
    float _378 = _376 + 1.0;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _382 = _356 * _378;
    float _384 = -_356;
    float _386 = _384 + 1.0;
    float _388 = 1.0 / _344;
    float _390 = _360 * _374;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _396 = fma(_390, _324, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _398 = -_372;
    float _400 = _398 + 1.0;
    float _402 = _396 * _382;
    float _404 = _394 * _388;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _408 = _320 + _406;
    float _410 = _340 * _400;
    float _412 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _414 = fma(_404, _408, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _416 = fma(_414, _410, _412);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[117].x, _416);
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = in.m_55.x;
    float _436 = in.m_55.y;
    out.m_57.x = _426;
    out.m_57.y = _428;
    out.m_57.z = _432;
    out.m_57.w = _430;
    float _438 = _290 * _436;
    float _440 = _288 * _434;
    bool _442 = !_380;
    float _460;
    if (!_442)
    {
        float _444 = in.m_53.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_92);
        float _466 = 1.0 / _464;
        float _468 = _124 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = in.m_41.x;
    float _474 = in.m_41.y;
    float _476 = in.m_41.z;
    float _478 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _188);
    float _482 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _172);
    float _486 = _478 * _480;
    float _488 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _490 = _482 * _484;
    float _492 = _488 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _494 = _488 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _496 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[10].x, _492);
    float _498 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[8].x, _494);
    float _500 = -_490;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[10].z, _496);
    float _504 = -_490;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _498);
    float _508 = _474 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _510 = _474 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _512 = _474 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _514 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[6].x, _508);
    float _516 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    float _518 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[5].x, _512);
    float _520 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[6].z, _514);
    float _522 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[4].z, _516);
    float _524 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[5].z, _518);
    float _526 = _520 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _528 = _522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _530 = _524 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _532 = _526 + _502;
    float _534 = _528 + _506;
    float _536 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _538 = fma(_526, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _540 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _542 = _532 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _546 = _534 + _544;
    float _548 = floor(_536);
    float _550 = _542 * _542;
    float _552 = fma(_546, _546, _550);
    float _554 = floor(_538);
    float _556 = sqrt(_552);
    float _558 = -_554;
    float _560 = _538 + _558;
    bool _562 = _556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _566 = _556 + _564;
    float _568 = _520;
    float _570 = _556;
    float _572 = _566;
    float _574 = _534;
    float _576 = _532;
    if (_562)
    {
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _568 = _578;
    }
    float _580 = _568;
    float _582 = _580;
    if (_562)
    {
        float _584 = _566 * _580;
        _570 = _584;
    }
    float _586 = _570;
    if (_562)
    {
        float _588 = rsqrt(_552);
        _582 = _588;
    }
    float _590 = _582;
    float _592 = _590;
    if (_562)
    {
        float _594 = _586 * 0.15915493667125701904296875;
        _572 = _594;
    }
    float _596 = _572;
    float _598 = _488 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _600 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[9].x, _598);
    float _602 = _488;
    if (_562)
    {
        float _604 = _596 * 6.283185482025146484375;
        float _606 = sin(_604);
        _602 = _606;
    }
    float _608 = _602;
    float _610 = -_490;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[9].z, _600);
    float _614 = _530 + _612;
    float _616 = -_548;
    float _618 = _536 + _616;
    float _620 = _614;
    if (_562)
    {
        float _622 = _614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _622;
    }
    float _624 = _620;
    float _626 = _608;
    if (_562)
    {
        float _628 = fma(_608, _624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _626 = _628;
    }
    float _630 = _626;
    if (_562)
    {
        float _632 = _590 * _630;
        _592 = _632;
    }
    float _634 = _592;
    if (_562)
    {
        float _636 = fma(_546, _634, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _574 = _636;
    }
    float _638 = _574;
    float _640 = _638;
    if (_562)
    {
        float _642 = fma(_542, _634, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _576 = _642;
    }
    float _644 = _576;
    float _646 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _648 = _638 + _646;
    float _650 = fma(_638, 6.2500002968590706586837768554688e-05, 0.5);
    float _652 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _654 = _644 + _652;
    float _656 = fma(_644, 6.2500002968590706586837768554688e-05, 0.5);
    float _658 = fma(_648, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _660 = fma(_654, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _2721 = float2(_650, _656);
    float _662 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_2721, float2(0.0), isnan(_2721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_2721, float2(0.0), isnan(_2721)), level(0.0)).y;
    float2 _2731 = float2(_658, _660);
    float _664 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_2731, float2(0.0), isnan(_2731)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_2731, float2(0.0), isnan(_2731)), level(0.0)).x;
    float2 _2739 = float2(_618, _560);
    float _666 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2739, float2(0.0), isnan(_2739)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2739, float2(0.0), isnan(_2739)), level(0.0)).x;
    float _668 = in.m_53.x;
    float _670 = in.m_53.y;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _674 = in.m_53.z;
    float _676 = in.m_53.w;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _680 = _678 != 0;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _690 = _688 != 0;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _694 = _692 != 0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _696;
    float _700 = 1.0 / _684;
    bool _702 = _668 > 0.5;
    float _704 = _668 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _706 = _670 > 0.5;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _710 = _674 > 0.5;
    float _712 = _670 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _714 = -_188;
    int _716 = _702 ? as_type<int>(_714) : as_type<int>(_188);
    float _718 = _674;
    float _720 = _708;
    float _722 = _644;
    if (!_680)
    {
        float _724 = in.m_53.z;
        _718 = _724;
    }
    float _726 = _718;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _734 = -_188;
    int _736 = _710 ? as_type<int>(_734) : as_type<int>(_188);
    float _738 = _698 * _700;
    bool _740 = _676 > 0.5;
    float _742 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[78].z, _732);
    float _744 = -_172;
    float _746 = _706 ? _744 : _172;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _750 = -_188;
    int _752 = _706 ? as_type<int>(_750) : as_type<int>(_188);
    bool _754 = !_690;
    float _756 = _754 ? _188 : as_type<float>(_716);
    bool _758 = !_730;
    float _760 = _758 ? _188 : as_type<float>(_736);
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _772 = _770 != 0;
    float _774 = _188 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _778 = !_768;
    float _780 = _778 ? _188 : as_type<float>(_752);
    float _782 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].y);
    float _784 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[9].x, (*spvDescriptorSet0.vp_c10)._m0[9].y);
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].y);
    float _788 = -_776;
    float _790 = fma(_704, 2.0, _788);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _794 = _470 + _792;
    float _796 = fma(_712, -2.0, _708);
    float _798 = _746;
    if (!_680)
    {
        _720 = _670;
    }
    float _800 = _720;
    float _802 = -_124;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[76].x, _790);
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _808 = fma(_738, _794, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _810 = !_694;
    float _812 = _810 ? _172 : _746;
    float _814 = _686 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _816 = _800;
    if (_680)
    {
        _816 = _668;
    }
    float _818 = _816;
    float _820 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[78].w, _806);
    float _822 = _672 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _824 = _756 + 0.5;
    float _826 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    float _828 = _812 + (-0.5);
    float _830 = _726;
    if (!_680)
    {
        _798 = _726;
    }
    float _832 = _798;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _836 = _832;
    if (_680)
    {
        _836 = _670;
    }
    float _838 = _836;
    float _840 = _780 + 0.5;
    if (_680)
    {
        _830 = _670;
    }
    float _842 = _830;
    float _844 = fma(_822, _824, _804);
    float _846 = -_814;
    float _848 = -_826;
    float _850 = fma(_846, _828, _848);
    bool _852 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _854 = isnan(_470);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[83].w, _834);
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _868 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _870 = isnan(_470);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -_862;
    float _882 = _880 + 1.0;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _886 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[83].z, _866);
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _890 = _818 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _892 = _530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _894 = _878 * _882;
    float _896 = -_888;
    float _898 = fma(_890, 2.0, _896);
    float _900 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _892);
    float _902 = _808 * _894;
    float _904 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _906 = _748 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _908 = _760 + 0.5;
    float _910 = -_124;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _914 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[11].z, _900);
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _918 = -_878;
    float _920 = _918 + 1.0;
    float _922 = fma(_906, _908, _912);
    float _924 = _530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _926 = _914 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _928 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _742);
    float _930 = fma(_904, -2.0, _916);
    float _932 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _924);
    float _934 = 1.0 / _926;
    float _936 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _886);
    float _938 = -_172;
    int _940 = _710 ? as_type<int>(_938) : as_type<int>(_172);
    float _942 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[10].z, _932);
    float _944 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _930);
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[131].x, _902);
    bool _948 = !_772;
    float _950 = _948 ? _172 : as_type<float>(_940);
    float _952 = _942 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _956 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _820);
    float _958 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _864);
    float _960 = _952 + _926;
    float _962 = -_950;
    float _964 = _962 + 0.5;
    float _966 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[132].x, _946);
    float _968 = _840 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _970 = _960 * _934;
    float _972 = _970 * 0.5;
    float _974 = -_172;
    int _976 = _740 ? as_type<int>(_974) : as_type<int>(_172);
    float _978 = _964 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[30].w, _982);
    float _986 = _968 * _884;
    bool _988 = !_764;
    float _990 = _988 ? _172 : as_type<float>(_976);
    float _992 = -_936;
    float _994 = _992 + 1.0;
    float _996 = _954 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _998 = -_958;
    float _1000 = _998 + 1.0;
    float _1002 = -_956;
    float _1004 = _1002 + 1.0;
    float _1006 = 1.0 / _984;
    float _1008 = _990 + (-0.5);
    float _1010 = -_994;
    float _1012 = fma(_760, _1010, _922);
    float _1014 = fma(_812, _1004, _850);
    float _1016 = -_928;
    float _1018 = _1016 + 1.0;
    float _1020 = -_996;
    float _1022 = -_944;
    float _1024 = fma(_1020, _1008, _1022);
    float _1026 = _978 * _980;
    float _1028 = fma(_990, _1000, _1024);
    float _1030 = _172 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1032 = -_1018;
    float _1034 = fma(_756, _1032, _844);
    float _1036 = -_1030;
    float _1038 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].z, _784);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1042 = _1006 * _1040;
    out.m_59.x = _986;
    out.m_59.y = _1026;
    float _1044 = _966 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1046 = -_1030;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[8].z, _782);
    float _1050 = abs(_1042);
    float _1052 = log2(_1050);
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1056 = -_1030;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[10].z, _786);
    out.m_61.x = _1034;
    out.m_61.y = _1014;
    out.m_61.z = _1012;
    out.m_61.w = _1028;
    bool _1060 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1062 = isnan(0.5);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1068 = _1064 || _1066;
    float _1070 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1076 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_63.x = _1076;
    out.m_63.y = _1078;
    out.m_63.z = _1070;
    out.m_63.w = _1044;
    float _1082 = -_526;
    float _1084 = _1082 + _644;
    float _1086 = exp2(_1080);
    bool _1088 = _1042 <= 8000.0;
    bool _1090 = isnan(_1042);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(8000.0);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1102 = precise::clamp(_1100, 0.0, 1.0);
    float _1104 = fma(_1102, -2.0, 3.0);
    float _1106 = _1102 * _1102;
    float _1108 = _1106 * _1104;
    float _1110 = fma(_662, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1112 = fma(_664, 100.0, _1110);
    float _1114 = -_528;
    float _1116 = _1114 + _638;
    float _1118 = -_530;
    float _1120 = _1118 + _1112;
    float _1122 = _1120 * _1120;
    float _1124 = fma(_1116, _1116, _1122);
    float _1126 = fma(_1084, _1084, _1124);
    float _1128 = sqrt(_1126);
    bool _1130 = _1128 > 0.0;
    float _1132 = -_1108;
    float _1134 = _1132 + 1.0;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1108);
    float _1138 = _1098 * _1136;
    float _1140 = _1108;
    float _1142 = _1136;
    float _1144 = _1104;
    if (!_1130)
    {
        _1140 = _1112;
    }
    float _1146 = _1140;
    bool _1148 = !_1130;
    float _1150 = _1146;
    if (!_1148)
    {
        float _1152 = _182 * _182;
        float _1154 = rsqrt(_1126);
        float _1156 = fma(_180, _180, _1152);
        float _1158 = fma(_184, _184, _1156);
        float _1160 = sqrt(_1158);
        float _1162 = _1116 * _1154;
        float _1164 = _1120 * _1154;
        float _1166 = _1084 * _1154;
        bool _1168 = _1160 > 0.0;
        float _1170 = _1160;
        _1142 = _1154;
        _1144 = _1158;
        if (!_1168)
        {
            _1170 = _1112;
        }
        float _1172 = _1170;
        bool _1174 = !_1168;
        _1150 = _1172;
        if (!_1174)
        {
            float _1176 = rsqrt(_1158);
            float _1178 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1180 = _182 * _1176;
            float _1182 = _180 * _1176;
            float _1184 = _184 * _1176;
            float _1186 = _1164 * _1180;
            float _1188 = fma(_1162, _1182, _1186);
            float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1192 = fma(_1166, _1184, _1188);
            float _1194 = _1192 * _1190;
            float _1196 = fma(_180, _1194, _638);
            float _1198 = fma(_182, _1194, _1112);
            float _1200 = fma(_184, _1194, _644);
            _640 = _1196;
            _722 = _1200;
            _1150 = _1198;
            _1142 = _1194;
        }
    }
    float _1202 = _640;
    float _1204 = _722;
    float _1206 = _1150;
    float _1208 = _1142;
    float _1210 = _1144;
    float _1212 = _1208;
    float _1214 = _1210;
    float _1216 = _1206;
    if (_1068)
    {
        _1212 = _1202;
    }
    float _1218 = _1212;
    float _1220 = _1218;
    if (_1068)
    {
        _1214 = _1204;
    }
    float _1222 = _1214;
    float _1224 = _1222;
    if (!_1068)
    {
        float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1228 = _530 + _1226;
        float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1232 = _528 + _1230;
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1236 = _1228 * _1228;
        float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1240 = _526 + _1238;
        float _1242 = fma(_1232, _1232, _1236);
        float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1246 = fma(_1240, _1240, _1242);
        float _1248 = sqrt(_1246);
        float _1250 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1252 = -_526;
        float _1254 = _1252 + _1204;
        float _1256 = precise::min(_1248, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1258 = _1256 * _1244;
        float _1260 = -_528;
        float _1262 = _1260 + _1202;
        float _1264 = _1250 * _1258;
        float _1266 = -_530;
        float _1268 = _1266 + _1206;
        float _1270 = fma(_1262, _1264, _528);
        float _1272 = fma(_1268, _1264, _530);
        float _1274 = fma(_1254, _1264, _526);
        _1216 = _1272;
        _1220 = _1270;
        _1224 = _1274;
    }
    float _1276 = _1216;
    float _1278 = _1220;
    float _1280 = _1224;
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1284 = _1276 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1288 = _1278 + _1286;
    float _1290 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1292 = -_666;
    float _1294 = _1292 + 1.0;
    float _1296 = _1284 * _1284;
    float _1298 = in.m_65.x;
    float _1300 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = _1294 * _1290;
    float _1304 = precise::clamp(_1302, 0.0, 1.0);
    float _1306 = fma(_1288, _1288, _1296);
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1310 = _1280 + _1308;
    float _1312 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1314 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1316 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1318 = fma(_1310, _1310, _1306);
    float _1320 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1322 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1312);
    float _1324 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1314);
    float _1326 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1320);
    float _1328 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1322);
    float _1330 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1316);
    float _1332 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1324);
    float _1334 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1326);
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1340 = -_1304;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1344 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1346 = sqrt(_1318);
    float _1348 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    out.m_67.x = _1048;
    out.m_67.y = _1038;
    out.m_67.z = _1058;
    float _1350 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1352 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1356 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1350);
    float _1360 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1352);
    float _1362 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1354);
    float _1364 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1358);
    float _1368 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1360);
    float _1370 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1372 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1374 = _1342 * _1298;
    float _1376 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1366);
    float _1378 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1368);
    float _1380 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1382 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _1386 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1388 = isnan(_1346);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1394 = _1390 || _1392;
    out.gl_Position.x = _1376;
    out.gl_Position.y = _1378;
    out.gl_Position.z = _1380;
    out.gl_Position.w = _1382;
    out.m_69.x = _1384;
    float _1396 = _1370;
    float _1398 = _1338;
    float _1400 = _1368;
    float _1402 = _1344;
    float _1404 = _1366;
    float _1406 = _1374;
    if (!_1394)
    {
        _1396 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1408 = _1396;
    float _1410 = _1408;
    float _1412 = _1408;
    if (!_1394)
    {
        _1398 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1414 = _1398;
    float _1416 = _1414;
    float _1418 = _1414;
    if (!_1394)
    {
        _1400 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1420 = _1400;
    float _1422 = _1420;
    float _1424 = _1420;
    if (!_1394)
    {
        _1402 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1426 = _1402;
    float _1428 = _1426;
    float _1430 = _1426;
    if (!_1394)
    {
        _1404 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1432 = _1404;
    float _1434 = _1432;
    float _1436 = _1432;
    if (!_1394)
    {
        _1406 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1438 = _1406;
    bool _1440 = !_1394;
    float _1442 = _1438;
    float _1444 = _1438;
    if (!_1440)
    {
        bool _1446 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1448 = isnan(_1346);
        bool _1450 = _1446 || _1448;
        bool _1452 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1454 = _1450 || _1452;
        if (!_1454)
        {
            float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1458 = _1346 + _1456;
            float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1462 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1460;
            float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1466 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1468 = 1.0 / _1462;
            float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1472 = _1470 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1480 = _1478 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1484 = _1482 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1486 = _1458 * _1468;
            float _1488 = precise::clamp(_1486, 0.0, 1.0);
            float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1492 = _1490 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1494 = fma(_1488, _1466, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1496 = fma(_1488, _1492, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1498 = fma(_1488, _1472, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1500 = fma(_1488, _1476, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1502 = fma(_1488, _1480, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1504 = fma(_1488, _1484, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1418 = _1494;
            _1436 = _1502;
            _1412 = _1498;
            _1430 = _1500;
            _1424 = _1496;
            _1444 = _1504;
            _1506 = true;
        }
        else
        {
            bool _1508 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1510 = isnan(_1346);
            bool _1512 = _1508 || _1510;
            bool _1514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1516 = _1512 || _1514;
            if (!_1516)
            {
                _1410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1518 = _1410;
            _1412 = _1518;
            if (!_1516)
            {
                _1416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1520 = _1416;
            _1418 = _1520;
            if (!_1516)
            {
                _1422 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1522 = _1422;
            _1424 = _1522;
            if (!_1516)
            {
                _1428 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1524 = _1428;
            _1430 = _1524;
            if (!_1516)
            {
                _1434 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1526 = _1434;
            _1436 = _1526;
            if (!_1516)
            {
                _1442 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1528 = _1442;
            bool _1530 = !_1516;
            _1444 = _1528;
            if (!_1530)
            {
                bool _1532 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1534 = isnan(_1346);
                bool _1536 = _1532 || _1534;
                bool _1538 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1540 = _1536 || _1538;
                if (!_1540)
                {
                    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1544 = _1346 + _1542;
                    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1548 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1546;
                    float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1554 = 1.0 / _1548;
                    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1558 = _1556 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1562 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1566 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1570 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1572 = _1544 * _1554;
                    float _1574 = precise::clamp(_1572, 0.0, 1.0);
                    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1578 = _1576 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1580 = fma(_1574, _1552, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1582 = fma(_1574, _1578, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1584 = fma(_1574, _1558, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1586 = fma(_1574, _1562, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1588 = fma(_1574, _1566, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1590 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1418 = _1580;
                    _1436 = _1588;
                    _1412 = _1584;
                    _1430 = _1586;
                    _1424 = _1582;
                    _1444 = _1590;
                    _1506 = true;
                }
                else
                {
                    _1418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1436 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1430 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1424 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1444 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1506 = false;
    float _1592 = _1418;
    float _1594 = _1436;
    float _1596 = _1412;
    float _1598 = _1430;
    float _1600 = _1424;
    float _1602 = _1444;
    float _1604 = fma(_1038, -0.5, 0.5);
    float _1606 = precise::clamp(_1604, 0.0, 1.0);
    float _1608 = -_1592;
    float _1610 = _1608 + _1594;
    float _1612 = -_1596;
    float _1614 = _1612 + _1598;
    float _1616 = -_1600;
    float _1618 = _1616 + _1602;
    bool _1620 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1622 = fma(_1606, _1610, _1592);
    float _1624 = fma(_1606, _1614, _1596);
    float _1626 = fma(_1606, _1618, _1600);
    float _1628 = _1622 * 0.586610972881317138671875;
    out.m_71.x = 0.0;
    float _1630 = fma(_1624, 0.298911988735198974609375, _1628);
    out.m_44.x = 1.0;
    float _1632 = fma(_1626, 0.114477999508380889892578125, _1630);
    float _1634 = -_1632;
    float _1636 = _1624 + _1634;
    float _1638 = -_1632;
    float _1640 = _1622 + _1638;
    float _1642 = -_1632;
    float _1644 = _1626 + _1642;
    float _1646 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1648 = fma(_1636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1632);
    float _1650 = fma(_1640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1632);
    float _1652 = fma(_1644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1632);
    out.m_69.w = _1646;
    out.m_73.x = _1648;
    out.m_73.y = _1650;
    out.m_73.z = _1652;
    if (!_1620)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1654 = -_1276;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1658 = -_1278;
    float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1662 = -_1280;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1666 = _1656 * _1656;
    float _1668 = fma(_1660, _1660, _1666);
    float _1670 = fma(_1664, _1664, _1668);
    float _1672 = sqrt(_1670);
    float _1674 = rsqrt(_1670);
    float _1676 = -_1672;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1680 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1682 = precise::clamp(_1680, 0.0, 1.0);
    float _1684 = _1660 * _1674;
    float _1686 = _1656 * _1674;
    float _1688 = abs(_1682);
    float _1690 = log2(_1688);
    float _1692 = _1664 * _1674;
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1696 = _1038 * _1686;
    float _1698 = -_1686;
    float _1700 = -_1694;
    float _1702 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1700);
    float _1704 = fma(_1048, _1684, _1696);
    float _1706 = -_1692;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1702);
    float _1710 = fma(_1058, _1692, _1704);
    float _1712 = precise::clamp(_1710, 0.0, 1.0);
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1716 = _1708 + _1714;
    float _1718 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1722 = precise::clamp(_1720, 0.0, 1.0);
    float _1724 = exp2(_1718);
    float _1726 = _1724 * _1722;
    float _1728 = _1712 * _1726;
    float _1730 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1732 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1734 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_71.x = _1730;
    out.m_71.y = _1732;
    out.m_71.z = _1734;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1506 = false;
    bool _462 = false;
    bool _312 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_41.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    if (!_96)
    {
        out.m_44.x = 0.0;
    }
    int _102 = 0;
    if (!_96)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1790 = as_type<float>(_106);
        out.gl_Position.z = _1790;
    }
    if (!_96)
    {
        return out;
    }
    float _110 = in.m_46.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_92);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_44.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1859 = as_type<float>(_144);
        out.gl_Position.z = _1859;
    }
    if (_136)
    {
        return out;
    }
    float _146 = as_type<float>(int(gl_VertexIndex));
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    int _154 = as_type<int>(_146) & 1;
    bool _156 = _154 != 0;
    int _158 = as_type<int>(_146) & 2;
    bool _160 = _158 != 0;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _166 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _168 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _170 = !_160;
    float _172 = _170 ? (-0.5) : 0.5;
    float _174 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _164);
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _166);
    float _178 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _180 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _182 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _176);
    float _184 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _178);
    bool _186 = !_156;
    float _188 = _186 ? (-0.5) : 0.5;
    bool _190 = !_162;
    float _208;
    if (!_190)
    {
        float _192 = in.m_53.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        float _212 = float(_92);
        float _214 = 1.0 / _212;
        float _216 = _124 * _214;
        _208 = _216;
    }
    _210 = false;
    float _218 = _208;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -_234;
    float _242 = _240 + 1.0;
    bool _244 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_218);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _238;
    float _264 = _254 * _242;
    float _266 = -_254;
    float _268 = _266 + 1.0;
    float _270 = _222 * _262;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = _276 * _264;
    float _282 = _278 * _264;
    float _284 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _286 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _282);
    float _288 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _284);
    float _290 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _286);
    bool _292 = !_260;
    float _310;
    if (!_292)
    {
        float _294 = in.m_53.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _124 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _324 = _320 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _330 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _332 = isnan(_320);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _346 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _348 = isnan(_320);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _358;
    bool _362 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _364 = isnan(_320);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _328;
    float _376 = -_340;
    float _378 = _376 + 1.0;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _382 = _356 * _378;
    float _384 = -_356;
    float _386 = _384 + 1.0;
    float _388 = 1.0 / _344;
    float _390 = _360 * _374;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _396 = fma(_390, _324, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _398 = -_372;
    float _400 = _398 + 1.0;
    float _402 = _396 * _382;
    float _404 = _394 * _388;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _408 = _320 + _406;
    float _410 = _340 * _400;
    float _412 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _414 = fma(_404, _408, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _416 = fma(_414, _410, _412);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[117].x, _416);
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = in.m_55.x;
    float _436 = in.m_55.y;
    out.m_57.x = _426;
    out.m_57.y = _428;
    out.m_57.z = _432;
    out.m_57.w = _430;
    float _438 = _290 * _436;
    float _440 = _288 * _434;
    bool _442 = !_380;
    float _460;
    if (!_442)
    {
        float _444 = in.m_53.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_92);
        float _466 = 1.0 / _464;
        float _468 = _124 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = in.m_41.x;
    float _474 = in.m_41.y;
    float _476 = in.m_41.z;
    float _478 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _188);
    float _482 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _172);
    float _486 = _478 * _480;
    float _488 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _490 = _482 * _484;
    float _492 = _488 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _494 = _488 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _496 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[10].x, _492);
    float _498 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[8].x, _494);
    float _500 = -_490;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[10].z, _496);
    float _504 = -_490;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _498);
    float _508 = _474 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _510 = _474 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _512 = _474 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _514 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[6].x, _508);
    float _516 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    float _518 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[5].x, _512);
    float _520 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[6].z, _514);
    float _522 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[4].z, _516);
    float _524 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[5].z, _518);
    float _526 = _520 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _528 = _522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _530 = _524 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _532 = _526 + _502;
    float _534 = _528 + _506;
    float _536 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _538 = fma(_526, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _540 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _542 = _532 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _546 = _534 + _544;
    float _548 = floor(_536);
    float _550 = _542 * _542;
    float _552 = fma(_546, _546, _550);
    float _554 = floor(_538);
    float _556 = sqrt(_552);
    float _558 = -_554;
    float _560 = _538 + _558;
    bool _562 = _556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _566 = _556 + _564;
    float _568 = _520;
    float _570 = _556;
    float _572 = _566;
    float _574 = _534;
    float _576 = _532;
    if (_562)
    {
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _568 = _578;
    }
    float _580 = _568;
    float _582 = _580;
    if (_562)
    {
        float _584 = _566 * _580;
        _570 = _584;
    }
    float _586 = _570;
    if (_562)
    {
        float _588 = rsqrt(_552);
        _582 = _588;
    }
    float _590 = _582;
    float _592 = _590;
    if (_562)
    {
        float _594 = _586 * 0.15915493667125701904296875;
        _572 = _594;
    }
    float _596 = _572;
    float _598 = _488 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _600 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[9].x, _598);
    float _602 = _488;
    if (_562)
    {
        float _604 = _596 * 6.283185482025146484375;
        float _606 = sin(_604);
        _602 = _606;
    }
    float _608 = _602;
    float _610 = -_490;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[9].z, _600);
    float _614 = _530 + _612;
    float _616 = -_548;
    float _618 = _536 + _616;
    float _620 = _614;
    if (_562)
    {
        float _622 = _614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _622;
    }
    float _624 = _620;
    float _626 = _608;
    if (_562)
    {
        float _628 = fma(_608, _624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _626 = _628;
    }
    float _630 = _626;
    if (_562)
    {
        float _632 = _590 * _630;
        _592 = _632;
    }
    float _634 = _592;
    if (_562)
    {
        float _636 = fma(_546, _634, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _574 = _636;
    }
    float _638 = _574;
    float _640 = _638;
    if (_562)
    {
        float _642 = fma(_542, _634, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _576 = _642;
    }
    float _644 = _576;
    float _646 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _648 = _638 + _646;
    float _650 = fma(_638, 6.2500002968590706586837768554688e-05, 0.5);
    float _652 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _654 = _644 + _652;
    float _656 = fma(_644, 6.2500002968590706586837768554688e-05, 0.5);
    float _658 = fma(_648, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _660 = fma(_654, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _2721 = float2(_650, _656);
    float _662 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_2721, float2(0.0), isnan(_2721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_2721, float2(0.0), isnan(_2721)), level(0.0)).y;
    float2 _2731 = float2(_658, _660);
    float _664 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_2731, float2(0.0), isnan(_2731)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_2731, float2(0.0), isnan(_2731)), level(0.0)).x;
    float2 _2739 = float2(_618, _560);
    float _666 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2739, float2(0.0), isnan(_2739)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2739, float2(0.0), isnan(_2739)), level(0.0)).x;
    float _668 = in.m_53.x;
    float _670 = in.m_53.y;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _674 = in.m_53.z;
    float _676 = in.m_53.w;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _680 = _678 != 0;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _690 = _688 != 0;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _694 = _692 != 0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _696;
    float _700 = 1.0 / _684;
    bool _702 = _668 > 0.5;
    float _704 = _668 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _706 = _670 > 0.5;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _710 = _674 > 0.5;
    float _712 = _670 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _714 = -_188;
    int _716 = _702 ? as_type<int>(_714) : as_type<int>(_188);
    float _718 = _674;
    float _720 = _708;
    float _722 = _644;
    if (!_680)
    {
        float _724 = in.m_53.z;
        _718 = _724;
    }
    float _726 = _718;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _734 = -_188;
    int _736 = _710 ? as_type<int>(_734) : as_type<int>(_188);
    float _738 = _698 * _700;
    bool _740 = _676 > 0.5;
    float _742 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[78].z, _732);
    float _744 = -_172;
    float _746 = _706 ? _744 : _172;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _750 = -_188;
    int _752 = _706 ? as_type<int>(_750) : as_type<int>(_188);
    bool _754 = !_690;
    float _756 = _754 ? _188 : as_type<float>(_716);
    bool _758 = !_730;
    float _760 = _758 ? _188 : as_type<float>(_736);
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _772 = _770 != 0;
    float _774 = _188 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _778 = !_768;
    float _780 = _778 ? _188 : as_type<float>(_752);
    float _782 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].y);
    float _784 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[9].x, (*spvDescriptorSet0.vp_c10)._m0[9].y);
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].y);
    float _788 = -_776;
    float _790 = fma(_704, 2.0, _788);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _794 = _470 + _792;
    float _796 = fma(_712, -2.0, _708);
    float _798 = _746;
    if (!_680)
    {
        _720 = _670;
    }
    float _800 = _720;
    float _802 = -_124;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[76].x, _790);
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _808 = fma(_738, _794, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _810 = !_694;
    float _812 = _810 ? _172 : _746;
    float _814 = _686 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _816 = _800;
    if (_680)
    {
        _816 = _668;
    }
    float _818 = _816;
    float _820 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[78].w, _806);
    float _822 = _672 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _824 = _756 + 0.5;
    float _826 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    float _828 = _812 + (-0.5);
    float _830 = _726;
    if (!_680)
    {
        _798 = _726;
    }
    float _832 = _798;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _836 = _832;
    if (_680)
    {
        _836 = _670;
    }
    float _838 = _836;
    float _840 = _780 + 0.5;
    if (_680)
    {
        _830 = _670;
    }
    float _842 = _830;
    float _844 = fma(_822, _824, _804);
    float _846 = -_814;
    float _848 = -_826;
    float _850 = fma(_846, _828, _848);
    bool _852 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _854 = isnan(_470);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[83].w, _834);
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _868 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _870 = isnan(_470);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -_862;
    float _882 = _880 + 1.0;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _886 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[83].z, _866);
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _890 = _818 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _892 = _530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _894 = _878 * _882;
    float _896 = -_888;
    float _898 = fma(_890, 2.0, _896);
    float _900 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _892);
    float _902 = _808 * _894;
    float _904 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _906 = _748 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _908 = _760 + 0.5;
    float _910 = -_124;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _914 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[11].z, _900);
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _918 = -_878;
    float _920 = _918 + 1.0;
    float _922 = fma(_906, _908, _912);
    float _924 = _530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _926 = _914 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _928 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _742);
    float _930 = fma(_904, -2.0, _916);
    float _932 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _924);
    float _934 = 1.0 / _926;
    float _936 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _886);
    float _938 = -_172;
    int _940 = _710 ? as_type<int>(_938) : as_type<int>(_172);
    float _942 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[10].z, _932);
    float _944 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _930);
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[131].x, _902);
    bool _948 = !_772;
    float _950 = _948 ? _172 : as_type<float>(_940);
    float _952 = _942 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _956 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _820);
    float _958 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _864);
    float _960 = _952 + _926;
    float _962 = -_950;
    float _964 = _962 + 0.5;
    float _966 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[132].x, _946);
    float _968 = _840 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _970 = _960 * _934;
    float _972 = _970 * 0.5;
    float _974 = -_172;
    int _976 = _740 ? as_type<int>(_974) : as_type<int>(_172);
    float _978 = _964 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[30].w, _982);
    float _986 = _968 * _884;
    bool _988 = !_764;
    float _990 = _988 ? _172 : as_type<float>(_976);
    float _992 = -_936;
    float _994 = _992 + 1.0;
    float _996 = _954 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _998 = -_958;
    float _1000 = _998 + 1.0;
    float _1002 = -_956;
    float _1004 = _1002 + 1.0;
    float _1006 = 1.0 / _984;
    float _1008 = _990 + (-0.5);
    float _1010 = -_994;
    float _1012 = fma(_760, _1010, _922);
    float _1014 = fma(_812, _1004, _850);
    float _1016 = -_928;
    float _1018 = _1016 + 1.0;
    float _1020 = -_996;
    float _1022 = -_944;
    float _1024 = fma(_1020, _1008, _1022);
    float _1026 = _978 * _980;
    float _1028 = fma(_990, _1000, _1024);
    float _1030 = _172 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1032 = -_1018;
    float _1034 = fma(_756, _1032, _844);
    float _1036 = -_1030;
    float _1038 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].z, _784);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1042 = _1006 * _1040;
    out.m_59.x = _986;
    out.m_59.y = _1026;
    float _1044 = _966 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1046 = -_1030;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[8].z, _782);
    float _1050 = abs(_1042);
    float _1052 = log2(_1050);
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1056 = -_1030;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[10].z, _786);
    out.m_61.x = _1034;
    out.m_61.y = _1014;
    out.m_61.z = _1012;
    out.m_61.w = _1028;
    bool _1060 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1062 = isnan(0.5);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1068 = _1064 || _1066;
    float _1070 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1076 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_63.x = _1076;
    out.m_63.y = _1078;
    out.m_63.z = _1070;
    out.m_63.w = _1044;
    float _1082 = -_526;
    float _1084 = _1082 + _644;
    float _1086 = exp2(_1080);
    bool _1088 = _1042 <= 8000.0;
    bool _1090 = isnan(_1042);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(8000.0);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1102 = precise::clamp(_1100, 0.0, 1.0);
    float _1104 = fma(_1102, -2.0, 3.0);
    float _1106 = _1102 * _1102;
    float _1108 = _1106 * _1104;
    float _1110 = fma(_662, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1112 = fma(_664, 100.0, _1110);
    float _1114 = -_528;
    float _1116 = _1114 + _638;
    float _1118 = -_530;
    float _1120 = _1118 + _1112;
    float _1122 = _1120 * _1120;
    float _1124 = fma(_1116, _1116, _1122);
    float _1126 = fma(_1084, _1084, _1124);
    float _1128 = sqrt(_1126);
    bool _1130 = _1128 > 0.0;
    float _1132 = -_1108;
    float _1134 = _1132 + 1.0;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1108);
    float _1138 = _1098 * _1136;
    float _1140 = _1108;
    float _1142 = _1136;
    float _1144 = _1104;
    if (!_1130)
    {
        _1140 = _1112;
    }
    float _1146 = _1140;
    bool _1148 = !_1130;
    float _1150 = _1146;
    if (!_1148)
    {
        float _1152 = _182 * _182;
        float _1154 = rsqrt(_1126);
        float _1156 = fma(_180, _180, _1152);
        float _1158 = fma(_184, _184, _1156);
        float _1160 = sqrt(_1158);
        float _1162 = _1116 * _1154;
        float _1164 = _1120 * _1154;
        float _1166 = _1084 * _1154;
        bool _1168 = _1160 > 0.0;
        float _1170 = _1160;
        _1142 = _1154;
        _1144 = _1158;
        if (!_1168)
        {
            _1170 = _1112;
        }
        float _1172 = _1170;
        bool _1174 = !_1168;
        _1150 = _1172;
        if (!_1174)
        {
            float _1176 = rsqrt(_1158);
            float _1178 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1180 = _182 * _1176;
            float _1182 = _180 * _1176;
            float _1184 = _184 * _1176;
            float _1186 = _1164 * _1180;
            float _1188 = fma(_1162, _1182, _1186);
            float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1192 = fma(_1166, _1184, _1188);
            float _1194 = _1192 * _1190;
            float _1196 = fma(_180, _1194, _638);
            float _1198 = fma(_182, _1194, _1112);
            float _1200 = fma(_184, _1194, _644);
            _640 = _1196;
            _722 = _1200;
            _1150 = _1198;
            _1142 = _1194;
        }
    }
    float _1202 = _640;
    float _1204 = _722;
    float _1206 = _1150;
    float _1208 = _1142;
    float _1210 = _1144;
    float _1212 = _1208;
    float _1214 = _1210;
    float _1216 = _1206;
    if (_1068)
    {
        _1212 = _1202;
    }
    float _1218 = _1212;
    float _1220 = _1218;
    if (_1068)
    {
        _1214 = _1204;
    }
    float _1222 = _1214;
    float _1224 = _1222;
    if (!_1068)
    {
        float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1228 = _530 + _1226;
        float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1232 = _528 + _1230;
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1236 = _1228 * _1228;
        float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1240 = _526 + _1238;
        float _1242 = fma(_1232, _1232, _1236);
        float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1246 = fma(_1240, _1240, _1242);
        float _1248 = sqrt(_1246);
        float _1250 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1252 = -_526;
        float _1254 = _1252 + _1204;
        float _1256 = precise::min(_1248, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1258 = _1256 * _1244;
        float _1260 = -_528;
        float _1262 = _1260 + _1202;
        float _1264 = _1250 * _1258;
        float _1266 = -_530;
        float _1268 = _1266 + _1206;
        float _1270 = fma(_1262, _1264, _528);
        float _1272 = fma(_1268, _1264, _530);
        float _1274 = fma(_1254, _1264, _526);
        _1216 = _1272;
        _1220 = _1270;
        _1224 = _1274;
    }
    float _1276 = _1216;
    float _1278 = _1220;
    float _1280 = _1224;
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1284 = _1276 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1288 = _1278 + _1286;
    float _1290 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1292 = -_666;
    float _1294 = _1292 + 1.0;
    float _1296 = _1284 * _1284;
    float _1298 = in.m_65.x;
    float _1300 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = _1294 * _1290;
    float _1304 = precise::clamp(_1302, 0.0, 1.0);
    float _1306 = fma(_1288, _1288, _1296);
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1310 = _1280 + _1308;
    float _1312 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1314 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1316 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1318 = fma(_1310, _1310, _1306);
    float _1320 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1322 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1312);
    float _1324 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1314);
    float _1326 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1320);
    float _1328 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1322);
    float _1330 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1316);
    float _1332 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1324);
    float _1334 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1326);
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1340 = -_1304;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1344 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1346 = sqrt(_1318);
    float _1348 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    out.m_67.x = _1048;
    out.m_67.y = _1038;
    out.m_67.z = _1058;
    float _1350 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1352 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1356 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1350);
    float _1360 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1352);
    float _1362 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1354);
    float _1364 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1358);
    float _1368 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1360);
    float _1370 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1372 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1374 = _1342 * _1298;
    float _1376 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1366);
    float _1378 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1368);
    float _1380 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1382 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _1386 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1388 = isnan(_1346);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1394 = _1390 || _1392;
    out.gl_Position.x = _1376;
    out.gl_Position.y = _1378;
    out.gl_Position.z = _1380;
    out.gl_Position.w = _1382;
    out.m_69.x = _1384;
    float _1396 = _1370;
    float _1398 = _1338;
    float _1400 = _1368;
    float _1402 = _1344;
    float _1404 = _1366;
    float _1406 = _1374;
    if (!_1394)
    {
        _1396 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1408 = _1396;
    float _1410 = _1408;
    float _1412 = _1408;
    if (!_1394)
    {
        _1398 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1414 = _1398;
    float _1416 = _1414;
    float _1418 = _1414;
    if (!_1394)
    {
        _1400 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1420 = _1400;
    float _1422 = _1420;
    float _1424 = _1420;
    if (!_1394)
    {
        _1402 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1426 = _1402;
    float _1428 = _1426;
    float _1430 = _1426;
    if (!_1394)
    {
        _1404 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1432 = _1404;
    float _1434 = _1432;
    float _1436 = _1432;
    if (!_1394)
    {
        _1406 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1438 = _1406;
    bool _1440 = !_1394;
    float _1442 = _1438;
    float _1444 = _1438;
    if (!_1440)
    {
        bool _1446 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1448 = isnan(_1346);
        bool _1450 = _1446 || _1448;
        bool _1452 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1454 = _1450 || _1452;
        if (!_1454)
        {
            float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1458 = _1346 + _1456;
            float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1462 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1460;
            float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1466 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1468 = 1.0 / _1462;
            float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1472 = _1470 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1480 = _1478 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1484 = _1482 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1486 = _1458 * _1468;
            float _1488 = precise::clamp(_1486, 0.0, 1.0);
            float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1492 = _1490 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1494 = fma(_1488, _1466, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1496 = fma(_1488, _1492, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1498 = fma(_1488, _1472, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1500 = fma(_1488, _1476, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1502 = fma(_1488, _1480, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1504 = fma(_1488, _1484, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1418 = _1494;
            _1436 = _1502;
            _1412 = _1498;
            _1430 = _1500;
            _1424 = _1496;
            _1444 = _1504;
            _1506 = true;
        }
        else
        {
            bool _1508 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1510 = isnan(_1346);
            bool _1512 = _1508 || _1510;
            bool _1514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1516 = _1512 || _1514;
            if (!_1516)
            {
                _1410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1518 = _1410;
            _1412 = _1518;
            if (!_1516)
            {
                _1416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1520 = _1416;
            _1418 = _1520;
            if (!_1516)
            {
                _1422 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1522 = _1422;
            _1424 = _1522;
            if (!_1516)
            {
                _1428 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1524 = _1428;
            _1430 = _1524;
            if (!_1516)
            {
                _1434 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1526 = _1434;
            _1436 = _1526;
            if (!_1516)
            {
                _1442 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1528 = _1442;
            bool _1530 = !_1516;
            _1444 = _1528;
            if (!_1530)
            {
                bool _1532 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1534 = isnan(_1346);
                bool _1536 = _1532 || _1534;
                bool _1538 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1540 = _1536 || _1538;
                if (!_1540)
                {
                    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1544 = _1346 + _1542;
                    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1548 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1546;
                    float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1554 = 1.0 / _1548;
                    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1558 = _1556 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1562 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1566 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1570 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1572 = _1544 * _1554;
                    float _1574 = precise::clamp(_1572, 0.0, 1.0);
                    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1578 = _1576 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1580 = fma(_1574, _1552, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1582 = fma(_1574, _1578, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1584 = fma(_1574, _1558, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1586 = fma(_1574, _1562, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1588 = fma(_1574, _1566, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1590 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1418 = _1580;
                    _1436 = _1588;
                    _1412 = _1584;
                    _1430 = _1586;
                    _1424 = _1582;
                    _1444 = _1590;
                    _1506 = true;
                }
                else
                {
                    _1418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1436 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1430 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1424 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1444 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1506 = false;
    float _1592 = _1418;
    float _1594 = _1436;
    float _1596 = _1412;
    float _1598 = _1430;
    float _1600 = _1424;
    float _1602 = _1444;
    float _1604 = fma(_1038, -0.5, 0.5);
    float _1606 = precise::clamp(_1604, 0.0, 1.0);
    float _1608 = -_1592;
    float _1610 = _1608 + _1594;
    float _1612 = -_1596;
    float _1614 = _1612 + _1598;
    float _1616 = -_1600;
    float _1618 = _1616 + _1602;
    bool _1620 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1622 = fma(_1606, _1610, _1592);
    float _1624 = fma(_1606, _1614, _1596);
    float _1626 = fma(_1606, _1618, _1600);
    float _1628 = _1622 * 0.586610972881317138671875;
    out.m_71.x = 0.0;
    float _1630 = fma(_1624, 0.298911988735198974609375, _1628);
    out.m_44.x = 1.0;
    float _1632 = fma(_1626, 0.114477999508380889892578125, _1630);
    float _1634 = -_1632;
    float _1636 = _1624 + _1634;
    float _1638 = -_1632;
    float _1640 = _1622 + _1638;
    float _1642 = -_1632;
    float _1644 = _1626 + _1642;
    float _1646 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1648 = fma(_1636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1632);
    float _1650 = fma(_1640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1632);
    float _1652 = fma(_1644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1632);
    out.m_69.w = _1646;
    out.m_73.x = _1648;
    out.m_73.y = _1650;
    out.m_73.z = _1652;
    if (!_1620)
    {
        return out;
    }
    float _1654 = -_1276;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1658 = -_1278;
    float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1662 = -_1280;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1666 = _1656 * _1656;
    float _1668 = fma(_1660, _1660, _1666);
    float _1670 = fma(_1664, _1664, _1668);
    float _1672 = sqrt(_1670);
    float _1674 = rsqrt(_1670);
    float _1676 = -_1672;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1680 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1682 = precise::clamp(_1680, 0.0, 1.0);
    float _1684 = _1660 * _1674;
    float _1686 = _1656 * _1674;
    float _1688 = abs(_1682);
    float _1690 = log2(_1688);
    float _1692 = _1664 * _1674;
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1696 = _1038 * _1686;
    float _1698 = -_1686;
    float _1700 = -_1694;
    float _1702 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1700);
    float _1704 = fma(_1048, _1684, _1696);
    float _1706 = -_1692;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1702);
    float _1710 = fma(_1058, _1692, _1704);
    float _1712 = precise::clamp(_1710, 0.0, 1.0);
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1716 = _1708 + _1714;
    float _1718 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1722 = precise::clamp(_1720, 0.0, 1.0);
    float _1724 = exp2(_1718);
    float _1726 = _1724 * _1722;
    float _1728 = _1712 * _1726;
    float _1730 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1732 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1734 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_71.x = _1730;
    out.m_71.y = _1732;
    out.m_71.z = _1734;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1506 = false;
    bool _462 = false;
    bool _312 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_41.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    if (!_96)
    {
        out.m_44.x = 0.0;
    }
    int _102 = 0;
    if (!_96)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1790 = as_type<float>(_106);
        out.gl_Position.z = _1790;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_46.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_92);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_44.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1859 = as_type<float>(_144);
        out.gl_Position.z = _1859;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = as_type<float>(int(gl_VertexIndex));
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    int _154 = as_type<int>(_146) & 1;
    bool _156 = _154 != 0;
    int _158 = as_type<int>(_146) & 2;
    bool _160 = _158 != 0;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _166 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _168 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _170 = !_160;
    float _172 = _170 ? (-0.5) : 0.5;
    float _174 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _164);
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _166);
    float _178 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _180 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _182 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _176);
    float _184 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _178);
    bool _186 = !_156;
    float _188 = _186 ? (-0.5) : 0.5;
    bool _190 = !_162;
    float _208;
    if (!_190)
    {
        float _192 = in.m_53.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        float _212 = float(_92);
        float _214 = 1.0 / _212;
        float _216 = _124 * _214;
        _208 = _216;
    }
    _210 = false;
    float _218 = _208;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = _218 + _220;
    bool _224 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_218);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -_234;
    float _242 = _240 + 1.0;
    bool _244 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_218);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _262 = 1.0 / _238;
    float _264 = _254 * _242;
    float _266 = -_254;
    float _268 = _266 + 1.0;
    float _270 = _222 * _262;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    float _276 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _280 = _276 * _264;
    float _282 = _278 * _264;
    float _284 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _286 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _282);
    float _288 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].x, _284);
    float _290 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[144].y, _286);
    bool _292 = !_260;
    float _310;
    if (!_292)
    {
        float _294 = in.m_53.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _124 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _324 = _320 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _330 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _332 = isnan(_320);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _346 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _348 = isnan(_320);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _358;
    bool _362 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _364 = isnan(_320);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = 1.0 / _328;
    float _376 = -_340;
    float _378 = _376 + 1.0;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _382 = _356 * _378;
    float _384 = -_356;
    float _386 = _384 + 1.0;
    float _388 = 1.0 / _344;
    float _390 = _360 * _374;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _396 = fma(_390, _324, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _398 = -_372;
    float _400 = _398 + 1.0;
    float _402 = _396 * _382;
    float _404 = _394 * _388;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _408 = _320 + _406;
    float _410 = _340 * _400;
    float _412 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _414 = fma(_404, _408, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _416 = fma(_414, _410, _412);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[117].x, _416);
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = in.m_55.x;
    float _436 = in.m_55.y;
    out.m_57.x = _426;
    out.m_57.y = _428;
    out.m_57.z = _432;
    out.m_57.w = _430;
    float _438 = _290 * _436;
    float _440 = _288 * _434;
    bool _442 = !_380;
    float _460;
    if (!_442)
    {
        float _444 = in.m_53.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_92);
        float _466 = 1.0 / _464;
        float _468 = _124 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = in.m_41.x;
    float _474 = in.m_41.y;
    float _476 = in.m_41.z;
    float _478 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _188);
    float _482 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _172);
    float _486 = _478 * _480;
    float _488 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _490 = _482 * _484;
    float _492 = _488 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _494 = _488 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _496 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[10].x, _492);
    float _498 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[8].x, _494);
    float _500 = -_490;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[10].z, _496);
    float _504 = -_490;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _498);
    float _508 = _474 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _510 = _474 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _512 = _474 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _514 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[6].x, _508);
    float _516 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    float _518 = fma(_472, (*spvDescriptorSet0.vp_c10)._m0[5].x, _512);
    float _520 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[6].z, _514);
    float _522 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[4].z, _516);
    float _524 = fma(_476, (*spvDescriptorSet0.vp_c10)._m0[5].z, _518);
    float _526 = _520 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _528 = _522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _530 = _524 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _532 = _526 + _502;
    float _534 = _528 + _506;
    float _536 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _538 = fma(_526, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _540 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _542 = _532 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _546 = _534 + _544;
    float _548 = floor(_536);
    float _550 = _542 * _542;
    float _552 = fma(_546, _546, _550);
    float _554 = floor(_538);
    float _556 = sqrt(_552);
    float _558 = -_554;
    float _560 = _538 + _558;
    bool _562 = _556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _566 = _556 + _564;
    float _568 = _520;
    float _570 = _556;
    float _572 = _566;
    float _574 = _534;
    float _576 = _532;
    if (_562)
    {
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _568 = _578;
    }
    float _580 = _568;
    float _582 = _580;
    if (_562)
    {
        float _584 = _566 * _580;
        _570 = _584;
    }
    float _586 = _570;
    if (_562)
    {
        float _588 = rsqrt(_552);
        _582 = _588;
    }
    float _590 = _582;
    float _592 = _590;
    if (_562)
    {
        float _594 = _586 * 0.15915493667125701904296875;
        _572 = _594;
    }
    float _596 = _572;
    float _598 = _488 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _600 = fma(_486, (*spvDescriptorSet0.vp_c10)._m0[9].x, _598);
    float _602 = _488;
    if (_562)
    {
        float _604 = _596 * 6.283185482025146484375;
        float _606 = sin(_604);
        _602 = _606;
    }
    float _608 = _602;
    float _610 = -_490;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[9].z, _600);
    float _614 = _530 + _612;
    float _616 = -_548;
    float _618 = _536 + _616;
    float _620 = _614;
    if (_562)
    {
        float _622 = _614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _622;
    }
    float _624 = _620;
    float _626 = _608;
    if (_562)
    {
        float _628 = fma(_608, _624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _626 = _628;
    }
    float _630 = _626;
    if (_562)
    {
        float _632 = _590 * _630;
        _592 = _632;
    }
    float _634 = _592;
    if (_562)
    {
        float _636 = fma(_546, _634, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _574 = _636;
    }
    float _638 = _574;
    float _640 = _638;
    if (_562)
    {
        float _642 = fma(_542, _634, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _576 = _642;
    }
    float _644 = _576;
    float _646 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _648 = _638 + _646;
    float _650 = fma(_638, 6.2500002968590706586837768554688e-05, 0.5);
    float _652 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _654 = _644 + _652;
    float _656 = fma(_644, 6.2500002968590706586837768554688e-05, 0.5);
    float _658 = fma(_648, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _660 = fma(_654, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _2721 = float2(_650, _656);
    float _662 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_2721, float2(0.0), isnan(_2721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_2721, float2(0.0), isnan(_2721)), level(0.0)).y;
    float2 _2731 = float2(_658, _660);
    float _664 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_2731, float2(0.0), isnan(_2731)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_2731, float2(0.0), isnan(_2731)), level(0.0)).x;
    float2 _2739 = float2(_618, _560);
    float _666 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2739, float2(0.0), isnan(_2739)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2739, float2(0.0), isnan(_2739)), level(0.0)).x;
    float _668 = in.m_53.x;
    float _670 = in.m_53.y;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _674 = in.m_53.z;
    float _676 = in.m_53.w;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _680 = _678 != 0;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _690 = _688 != 0;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _694 = _692 != 0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _696;
    float _700 = 1.0 / _684;
    bool _702 = _668 > 0.5;
    float _704 = _668 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _706 = _670 > 0.5;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _710 = _674 > 0.5;
    float _712 = _670 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _714 = -_188;
    int _716 = _702 ? as_type<int>(_714) : as_type<int>(_188);
    float _718 = _674;
    float _720 = _708;
    float _722 = _644;
    if (!_680)
    {
        float _724 = in.m_53.z;
        _718 = _724;
    }
    float _726 = _718;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _734 = -_188;
    int _736 = _710 ? as_type<int>(_734) : as_type<int>(_188);
    float _738 = _698 * _700;
    bool _740 = _676 > 0.5;
    float _742 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[78].z, _732);
    float _744 = -_172;
    float _746 = _706 ? _744 : _172;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _750 = -_188;
    int _752 = _706 ? as_type<int>(_750) : as_type<int>(_188);
    bool _754 = !_690;
    float _756 = _754 ? _188 : as_type<float>(_716);
    bool _758 = !_730;
    float _760 = _758 ? _188 : as_type<float>(_736);
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _772 = _770 != 0;
    float _774 = _188 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _778 = !_768;
    float _780 = _778 ? _188 : as_type<float>(_752);
    float _782 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].y);
    float _784 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[9].x, (*spvDescriptorSet0.vp_c10)._m0[9].y);
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].y);
    float _788 = -_776;
    float _790 = fma(_704, 2.0, _788);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _794 = _470 + _792;
    float _796 = fma(_712, -2.0, _708);
    float _798 = _746;
    if (!_680)
    {
        _720 = _670;
    }
    float _800 = _720;
    float _802 = -_124;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[76].x, _790);
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _808 = fma(_738, _794, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _810 = !_694;
    float _812 = _810 ? _172 : _746;
    float _814 = _686 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _816 = _800;
    if (_680)
    {
        _816 = _668;
    }
    float _818 = _816;
    float _820 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[78].w, _806);
    float _822 = _672 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _824 = _756 + 0.5;
    float _826 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _796);
    float _828 = _812 + (-0.5);
    float _830 = _726;
    if (!_680)
    {
        _798 = _726;
    }
    float _832 = _798;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _836 = _832;
    if (_680)
    {
        _836 = _670;
    }
    float _838 = _836;
    float _840 = _780 + 0.5;
    if (_680)
    {
        _830 = _670;
    }
    float _842 = _830;
    float _844 = fma(_822, _824, _804);
    float _846 = -_814;
    float _848 = -_826;
    float _850 = fma(_846, _828, _848);
    bool _852 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _854 = isnan(_470);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[83].w, _834);
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _868 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _870 = isnan(_470);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -_862;
    float _882 = _880 + 1.0;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _886 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[83].z, _866);
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _890 = _818 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _892 = _530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _894 = _878 * _882;
    float _896 = -_888;
    float _898 = fma(_890, 2.0, _896);
    float _900 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _892);
    float _902 = _808 * _894;
    float _904 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _906 = _748 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _908 = _760 + 0.5;
    float _910 = -_124;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _914 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[11].z, _900);
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _918 = -_878;
    float _920 = _918 + 1.0;
    float _922 = fma(_906, _908, _912);
    float _924 = _530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _926 = _914 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _928 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _742);
    float _930 = fma(_904, -2.0, _916);
    float _932 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _924);
    float _934 = 1.0 / _926;
    float _936 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _886);
    float _938 = -_172;
    int _940 = _710 ? as_type<int>(_938) : as_type<int>(_172);
    float _942 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[10].z, _932);
    float _944 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _930);
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[131].x, _902);
    bool _948 = !_772;
    float _950 = _948 ? _172 : as_type<float>(_940);
    float _952 = _942 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _956 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _820);
    float _958 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _864);
    float _960 = _952 + _926;
    float _962 = -_950;
    float _964 = _962 + 0.5;
    float _966 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[132].x, _946);
    float _968 = _840 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _970 = _960 * _934;
    float _972 = _970 * 0.5;
    float _974 = -_172;
    int _976 = _740 ? as_type<int>(_974) : as_type<int>(_172);
    float _978 = _964 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[30].w, _982);
    float _986 = _968 * _884;
    bool _988 = !_764;
    float _990 = _988 ? _172 : as_type<float>(_976);
    float _992 = -_936;
    float _994 = _992 + 1.0;
    float _996 = _954 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _998 = -_958;
    float _1000 = _998 + 1.0;
    float _1002 = -_956;
    float _1004 = _1002 + 1.0;
    float _1006 = 1.0 / _984;
    float _1008 = _990 + (-0.5);
    float _1010 = -_994;
    float _1012 = fma(_760, _1010, _922);
    float _1014 = fma(_812, _1004, _850);
    float _1016 = -_928;
    float _1018 = _1016 + 1.0;
    float _1020 = -_996;
    float _1022 = -_944;
    float _1024 = fma(_1020, _1008, _1022);
    float _1026 = _978 * _980;
    float _1028 = fma(_990, _1000, _1024);
    float _1030 = _172 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1032 = -_1018;
    float _1034 = fma(_756, _1032, _844);
    float _1036 = -_1030;
    float _1038 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].z, _784);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1042 = _1006 * _1040;
    out.m_59.x = _986;
    out.m_59.y = _1026;
    float _1044 = _966 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1046 = -_1030;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[8].z, _782);
    float _1050 = abs(_1042);
    float _1052 = log2(_1050);
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1056 = -_1030;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[10].z, _786);
    out.m_61.x = _1034;
    out.m_61.y = _1014;
    out.m_61.z = _1012;
    out.m_61.w = _1028;
    bool _1060 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1062 = isnan(0.5);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1068 = _1064 || _1066;
    float _1070 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1076 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1080 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_63.x = _1076;
    out.m_63.y = _1078;
    out.m_63.z = _1070;
    out.m_63.w = _1044;
    float _1082 = -_526;
    float _1084 = _1082 + _644;
    float _1086 = exp2(_1080);
    bool _1088 = _1042 <= 8000.0;
    bool _1090 = isnan(_1042);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(8000.0);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1102 = precise::clamp(_1100, 0.0, 1.0);
    float _1104 = fma(_1102, -2.0, 3.0);
    float _1106 = _1102 * _1102;
    float _1108 = _1106 * _1104;
    float _1110 = fma(_662, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1112 = fma(_664, 100.0, _1110);
    float _1114 = -_528;
    float _1116 = _1114 + _638;
    float _1118 = -_530;
    float _1120 = _1118 + _1112;
    float _1122 = _1120 * _1120;
    float _1124 = fma(_1116, _1116, _1122);
    float _1126 = fma(_1084, _1084, _1124);
    float _1128 = sqrt(_1126);
    bool _1130 = _1128 > 0.0;
    float _1132 = -_1108;
    float _1134 = _1132 + 1.0;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1108);
    float _1138 = _1098 * _1136;
    float _1140 = _1108;
    float _1142 = _1136;
    float _1144 = _1104;
    if (!_1130)
    {
        _1140 = _1112;
    }
    float _1146 = _1140;
    bool _1148 = !_1130;
    float _1150 = _1146;
    if (!_1148)
    {
        float _1152 = _182 * _182;
        float _1154 = rsqrt(_1126);
        float _1156 = fma(_180, _180, _1152);
        float _1158 = fma(_184, _184, _1156);
        float _1160 = sqrt(_1158);
        float _1162 = _1116 * _1154;
        float _1164 = _1120 * _1154;
        float _1166 = _1084 * _1154;
        bool _1168 = _1160 > 0.0;
        float _1170 = _1160;
        _1142 = _1154;
        _1144 = _1158;
        if (!_1168)
        {
            _1170 = _1112;
        }
        float _1172 = _1170;
        bool _1174 = !_1168;
        _1150 = _1172;
        if (!_1174)
        {
            float _1176 = rsqrt(_1158);
            float _1178 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1180 = _182 * _1176;
            float _1182 = _180 * _1176;
            float _1184 = _184 * _1176;
            float _1186 = _1164 * _1180;
            float _1188 = fma(_1162, _1182, _1186);
            float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1192 = fma(_1166, _1184, _1188);
            float _1194 = _1192 * _1190;
            float _1196 = fma(_180, _1194, _638);
            float _1198 = fma(_182, _1194, _1112);
            float _1200 = fma(_184, _1194, _644);
            _640 = _1196;
            _722 = _1200;
            _1150 = _1198;
            _1142 = _1194;
        }
    }
    float _1202 = _640;
    float _1204 = _722;
    float _1206 = _1150;
    float _1208 = _1142;
    float _1210 = _1144;
    float _1212 = _1208;
    float _1214 = _1210;
    float _1216 = _1206;
    if (_1068)
    {
        _1212 = _1202;
    }
    float _1218 = _1212;
    float _1220 = _1218;
    if (_1068)
    {
        _1214 = _1204;
    }
    float _1222 = _1214;
    float _1224 = _1222;
    if (!_1068)
    {
        float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1228 = _530 + _1226;
        float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1232 = _528 + _1230;
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1236 = _1228 * _1228;
        float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1240 = _526 + _1238;
        float _1242 = fma(_1232, _1232, _1236);
        float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1246 = fma(_1240, _1240, _1242);
        float _1248 = sqrt(_1246);
        float _1250 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1252 = -_526;
        float _1254 = _1252 + _1204;
        float _1256 = precise::min(_1248, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1258 = _1256 * _1244;
        float _1260 = -_528;
        float _1262 = _1260 + _1202;
        float _1264 = _1250 * _1258;
        float _1266 = -_530;
        float _1268 = _1266 + _1206;
        float _1270 = fma(_1262, _1264, _528);
        float _1272 = fma(_1268, _1264, _530);
        float _1274 = fma(_1254, _1264, _526);
        _1216 = _1272;
        _1220 = _1270;
        _1224 = _1274;
    }
    float _1276 = _1216;
    float _1278 = _1220;
    float _1280 = _1224;
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1284 = _1276 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1288 = _1278 + _1286;
    float _1290 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1292 = -_666;
    float _1294 = _1292 + 1.0;
    float _1296 = _1284 * _1284;
    float _1298 = in.m_65.x;
    float _1300 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = _1294 * _1290;
    float _1304 = precise::clamp(_1302, 0.0, 1.0);
    float _1306 = fma(_1288, _1288, _1296);
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1310 = _1280 + _1308;
    float _1312 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1314 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1316 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1318 = fma(_1310, _1310, _1306);
    float _1320 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1322 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1312);
    float _1324 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1314);
    float _1326 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1320);
    float _1328 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1322);
    float _1330 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1316);
    float _1332 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1324);
    float _1334 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1326);
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1340 = -_1304;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1344 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1346 = sqrt(_1318);
    float _1348 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    out.m_67.x = _1048;
    out.m_67.y = _1038;
    out.m_67.z = _1058;
    float _1350 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1352 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1356 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1350);
    float _1360 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1352);
    float _1362 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1354);
    float _1364 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1358);
    float _1368 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1360);
    float _1370 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1372 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1374 = _1342 * _1298;
    float _1376 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1366);
    float _1378 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1368);
    float _1380 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1382 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _1386 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1388 = isnan(_1346);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1394 = _1390 || _1392;
    out.gl_Position.x = _1376;
    out.gl_Position.y = _1378;
    out.gl_Position.z = _1380;
    out.gl_Position.w = _1382;
    out.m_69.x = _1384;
    float _1396 = _1370;
    float _1398 = _1338;
    float _1400 = _1368;
    float _1402 = _1344;
    float _1404 = _1366;
    float _1406 = _1374;
    if (!_1394)
    {
        _1396 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1408 = _1396;
    float _1410 = _1408;
    float _1412 = _1408;
    if (!_1394)
    {
        _1398 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1414 = _1398;
    float _1416 = _1414;
    float _1418 = _1414;
    if (!_1394)
    {
        _1400 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1420 = _1400;
    float _1422 = _1420;
    float _1424 = _1420;
    if (!_1394)
    {
        _1402 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1426 = _1402;
    float _1428 = _1426;
    float _1430 = _1426;
    if (!_1394)
    {
        _1404 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1432 = _1404;
    float _1434 = _1432;
    float _1436 = _1432;
    if (!_1394)
    {
        _1406 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1438 = _1406;
    bool _1440 = !_1394;
    float _1442 = _1438;
    float _1444 = _1438;
    if (!_1440)
    {
        bool _1446 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1448 = isnan(_1346);
        bool _1450 = _1446 || _1448;
        bool _1452 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1454 = _1450 || _1452;
        if (!_1454)
        {
            float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1458 = _1346 + _1456;
            float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1462 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1460;
            float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1466 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1468 = 1.0 / _1462;
            float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1472 = _1470 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1480 = _1478 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1484 = _1482 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1486 = _1458 * _1468;
            float _1488 = precise::clamp(_1486, 0.0, 1.0);
            float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1492 = _1490 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1494 = fma(_1488, _1466, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1496 = fma(_1488, _1492, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1498 = fma(_1488, _1472, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1500 = fma(_1488, _1476, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1502 = fma(_1488, _1480, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1504 = fma(_1488, _1484, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1418 = _1494;
            _1436 = _1502;
            _1412 = _1498;
            _1430 = _1500;
            _1424 = _1496;
            _1444 = _1504;
            _1506 = true;
        }
        else
        {
            bool _1508 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1510 = isnan(_1346);
            bool _1512 = _1508 || _1510;
            bool _1514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1516 = _1512 || _1514;
            if (!_1516)
            {
                _1410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1518 = _1410;
            _1412 = _1518;
            if (!_1516)
            {
                _1416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1520 = _1416;
            _1418 = _1520;
            if (!_1516)
            {
                _1422 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1522 = _1422;
            _1424 = _1522;
            if (!_1516)
            {
                _1428 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1524 = _1428;
            _1430 = _1524;
            if (!_1516)
            {
                _1434 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1526 = _1434;
            _1436 = _1526;
            if (!_1516)
            {
                _1442 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1528 = _1442;
            bool _1530 = !_1516;
            _1444 = _1528;
            if (!_1530)
            {
                bool _1532 = _1346 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1534 = isnan(_1346);
                bool _1536 = _1532 || _1534;
                bool _1538 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1540 = _1536 || _1538;
                if (!_1540)
                {
                    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1544 = _1346 + _1542;
                    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1548 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1546;
                    float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1554 = 1.0 / _1548;
                    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1558 = _1556 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1562 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1566 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1570 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1572 = _1544 * _1554;
                    float _1574 = precise::clamp(_1572, 0.0, 1.0);
                    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1578 = _1576 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1580 = fma(_1574, _1552, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1582 = fma(_1574, _1578, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1584 = fma(_1574, _1558, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1586 = fma(_1574, _1562, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1588 = fma(_1574, _1566, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1590 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1418 = _1580;
                    _1436 = _1588;
                    _1412 = _1584;
                    _1430 = _1586;
                    _1424 = _1582;
                    _1444 = _1590;
                    _1506 = true;
                }
                else
                {
                    _1418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1436 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1430 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1424 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1444 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1506 = false;
    float _1592 = _1418;
    float _1594 = _1436;
    float _1596 = _1412;
    float _1598 = _1430;
    float _1600 = _1424;
    float _1602 = _1444;
    float _1604 = fma(_1038, -0.5, 0.5);
    float _1606 = precise::clamp(_1604, 0.0, 1.0);
    float _1608 = -_1592;
    float _1610 = _1608 + _1594;
    float _1612 = -_1596;
    float _1614 = _1612 + _1598;
    float _1616 = -_1600;
    float _1618 = _1616 + _1602;
    bool _1620 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1622 = fma(_1606, _1610, _1592);
    float _1624 = fma(_1606, _1614, _1596);
    float _1626 = fma(_1606, _1618, _1600);
    float _1628 = _1622 * 0.586610972881317138671875;
    out.m_71.x = 0.0;
    float _1630 = fma(_1624, 0.298911988735198974609375, _1628);
    out.m_44.x = 1.0;
    float _1632 = fma(_1626, 0.114477999508380889892578125, _1630);
    float _1634 = -_1632;
    float _1636 = _1624 + _1634;
    float _1638 = -_1632;
    float _1640 = _1622 + _1638;
    float _1642 = -_1632;
    float _1644 = _1626 + _1642;
    float _1646 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1648 = fma(_1636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1632);
    float _1650 = fma(_1640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1632);
    float _1652 = fma(_1644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1632);
    out.m_69.w = _1646;
    out.m_73.x = _1648;
    out.m_73.y = _1650;
    out.m_73.z = _1652;
    if (!_1620)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1654 = -_1276;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1658 = -_1278;
    float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1662 = -_1280;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1666 = _1656 * _1656;
    float _1668 = fma(_1660, _1660, _1666);
    float _1670 = fma(_1664, _1664, _1668);
    float _1672 = sqrt(_1670);
    float _1674 = rsqrt(_1670);
    float _1676 = -_1672;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1680 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1682 = precise::clamp(_1680, 0.0, 1.0);
    float _1684 = _1660 * _1674;
    float _1686 = _1656 * _1674;
    float _1688 = abs(_1682);
    float _1690 = log2(_1688);
    float _1692 = _1664 * _1674;
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1696 = _1038 * _1686;
    float _1698 = -_1686;
    float _1700 = -_1694;
    float _1702 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1700);
    float _1704 = fma(_1048, _1684, _1696);
    float _1706 = -_1692;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1702);
    float _1710 = fma(_1058, _1692, _1704);
    float _1712 = precise::clamp(_1710, 0.0, 1.0);
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1716 = _1708 + _1714;
    float _1718 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1722 = precise::clamp(_1720, 0.0, 1.0);
    float _1724 = exp2(_1718);
    float _1726 = _1724 * _1722;
    float _1728 = _1712 * _1726;
    float _1730 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1732 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1734 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_71.x = _1730;
    out.m_71.y = _1732;
    out.m_71.z = _1734;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

