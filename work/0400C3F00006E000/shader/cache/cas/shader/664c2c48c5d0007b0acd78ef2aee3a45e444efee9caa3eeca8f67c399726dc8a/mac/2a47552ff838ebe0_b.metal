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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1539 = false;
    bool _808 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    float _118 = _116;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_124);
        out.gl_Position.z = _1840;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_106);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _114;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1909 = as_type<float>(_160);
        out.gl_Position.z = _1909;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _168 = in.m_48.x;
    float _170 = in.m_48.y;
    float _172 = in.m_48.z;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _180 = _178 != 0;
    float _182 = in.m_55.w;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _186 = _184 != 0;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _192 = _190 != 0;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _202 = in.m_59.x;
    float _204 = in.m_59.y;
    int _206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _208 = _206 != 0;
    float _210 = in.m_61.y;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _214 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _216 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _218 = in.m_59.z;
    bool _220 = _164 > 0.5;
    float _222 = -_188;
    float _224 = fma(_214, 2.0, _222);
    float _226 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _228 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _230 = _182 > 0.5;
    float _232 = fma(_216, -2.0, _212);
    float _234 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _226);
    float _236 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.083333335816860198974609375;
    float _238 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _240 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _242 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _244 = _198 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.16666667163372039794921875;
    float _248 = _198;
    bool _250 = _220;
    bool _252 = _180;
    if (_176)
    {
        float _254 = in.m_55.x;
        _248 = _254;
    }
    float _256 = _248;
    float _258 = -_236;
    float _260 = fma(_202, 18.84955596923828125, _258);
    float _262 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _242);
    float _264 = fma(_202, 31.415927886962890625, _246);
    float _266 = 0.0;
    float _268 = _210;
    if (_186)
    {
        float _270 = in.m_55.z;
        _266 = _270;
    }
    float _272 = _266;
    float _274 = _260 * 0.15915493667125701904296875;
    float _276 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _228);
    float _278 = _264 * 0.15915493667125701904296875;
    float _280 = in.m_61.x;
    float _282 = -_210;
    float _284 = _282 + 1.0;
    float _286 = _274 * 6.283185482025146484375;
    float _288 = sin(_286);
    float _290 = _202 * 6.283185482025146484375;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _294 = _220 ? _284 : _210;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _298 = _294;
    if (!_208)
    {
        float _300 = in.m_55.z;
        _296 = _300;
    }
    float _302 = _296;
    float _304 = _290 * 0.15915493667125701904296875;
    float _306 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _292);
    float _308 = _278 * 6.283185482025146484375;
    float _310 = sin(_308);
    float _312 = _244 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _314 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _262);
    float _316 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _234);
    float _318 = _256;
    float _320 = 0.75;
    float _322 = _314;
    if (_176)
    {
        bool _324 = _256 > 0.5;
        _250 = _324;
    }
    bool _326 = _250;
    float _328 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _276);
    if (!_208)
    {
        _318 = _164;
    }
    float _330 = _318;
    float _332 = _304 * 6.283185482025146484375;
    float _334 = cos(_332);
    float _336 = _330;
    if (_208)
    {
        _336 = _162;
    }
    float _338 = _336;
    float _340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _218);
    float _342 = _180 ? _294 : _210;
    float _344 = -_142;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[76].x, _224);
    if (_186)
    {
        bool _348 = _272 > 0.5;
        _252 = _348;
    }
    bool _350 = _252;
    float _352 = _340 * _312;
    if (!_176)
    {
        _298 = _280;
    }
    float _354 = _298;
    float _356 = _310 + _288;
    float _358 = _304 * 6.283185482025146484375;
    float _360 = sin(_358);
    float _362 = fma(_204, 0.75, 0.25);
    float _364 = _354;
    float _366 = _362;
    if (!_176)
    {
        _320 = _354;
    }
    float _368 = _320;
    float _370 = _356 * 0.100000001490116119384765625;
    float _372 = _166 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _376 = _368;
    if (_176)
    {
        _364 = _280;
    }
    float _378 = _364;
    float _380 = fma(_370, _362, _204);
    float _382 = fma(_372, _342, -0.5);
    float _384 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].w, _374);
    float _386 = _238 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _388 = _380 + 0.4000000059604644775390625;
    float _390 = _302;
    if (!_208)
    {
        _366 = _302;
    }
    float _392 = _366;
    float _394 = _240 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _396 = _392;
    if (_208)
    {
        _396 = _164;
    }
    float _398 = _396;
    float _400 = _388 * _334;
    float _402 = _388 * _360;
    if (_208)
    {
        _390 = _164;
    }
    float _404 = _390;
    float _406 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _384);
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _400);
    float _410 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _232);
    float _412 = -_402;
    float _414 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _412);
    int _416 = as_type<int>(_404);
    if (_192)
    {
        float _418 = _230 ? _284 : _210;
        _268 = _418;
    }
    float _420 = _268;
    float _422 = _408 * _386;
    float _424 = -_410;
    float _426 = fma(_406, _382, _424);
    float _428 = _414 * _394;
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _432 = _422 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].x, _430);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[10].x, _432);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _442 = _328 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _444 = _316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _446 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[8].z, _436);
    float _448 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[10].z, _438);
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _452 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[83].z, _440);
    float _454 = _338 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _456 = _444 + _446;
    float _458 = _442 + _448;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _462 = -_450;
    float _464 = fma(_454, 2.0, _462);
    float _466 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _468 = _456 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _472 = _458 + _470;
    float _474 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[83].w, _460);
    float _476 = _434 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _478 = _468 * _468;
    float _480 = _472 * _472;
    int _482 = as_type<int>(_446);
    float _484 = _476;
    float _486 = _452;
    if (_176)
    {
        float _488 = -_378;
        float _490 = _488 + 1.0;
        _416 = as_type<int>(_490);
    }
    int _492 = _416;
    float _494 = fma(_476, _420, -0.5);
    if (_186)
    {
        float _496 = -_378;
        float _498 = _496 + 1.0;
        _482 = as_type<int>(_498);
    }
    int _500 = _482;
    float _502 = _478 + _480;
    float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_186)
    {
        _484 = _378;
    }
    float _506 = _484;
    float _508 = _422 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _510 = _506;
    if (_176)
    {
        float _512 = _326 ? as_type<float>(_492) : _378;
        _376 = _512;
    }
    float _514 = _376;
    float _516 = _398 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_186)
    {
        float _518 = _350 ? as_type<float>(_500) : _378;
        _510 = _518;
    }
    float _520 = _510;
    float _522 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[9].x, _508);
    float _524 = in.m_63.x;
    float _526 = in.m_63.y;
    float _528 = in.m_63.z;
    float _530 = sqrt(_502);
    bool _532 = _400 != 0.0;
    bool _534 = isnan(_400);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _452);
    float _544 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[9].z, _522);
    bool _546 = _402 == 0.0;
    bool _548 = !_540;
    bool _550 = _546 && _548;
    float _552 = _314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _556 = _218 == 0.0;
    bool _558 = _556 && _550;
    float _560 = _504 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _562 = _200 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _564 = fma(_516, -2.0, _554);
    float _566 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _474);
    float _568 = fma(_560, _514, -0.5);
    float _570 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _306);
    bool _572 = _530 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _574 = -_142;
    float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[81].x, _464);
    float _578 = fma(_562, _520, -0.5);
    float _580 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _564);
    float _582 = fma(_570, _568, _346);
    float _584 = _552 + _544;
    float _586 = fma(_542, _578, _576);
    float _588 = -_580;
    float _590 = fma(_566, _494, _588);
    float _592 = _526;
    float _594 = _542;
    float _596 = _584;
    float _598 = _524;
    float _600 = _528;
    float _602 = _586;
    if (!_558)
    {
        float _604 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _592 = _604;
    }
    float _606 = _592;
    if (!_572)
    {
        _322 = _480;
    }
    float _608 = _322;
    float _610 = _608;
    if (!_572)
    {
        _144 = _478;
    }
    float _612 = _144;
    float _614 = _612;
    if (!_572)
    {
        _486 = _456;
    }
    float _616 = _486;
    float _618 = _616;
    if (!_572)
    {
        _594 = _458;
    }
    float _620 = _594;
    bool _622 = !_572;
    float _624 = _620;
    if (!_622)
    {
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _630 = _530 + _628;
        float _632 = rsqrt(_502);
        float _634 = _630 * _626;
        float _636 = _584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _638 = _634 * 0.15915493667125701904296875;
        float _640 = _638 * 6.283185482025146484375;
        float _642 = sin(_640);
        float _644 = _638 * 6.283185482025146484375;
        float _646 = cos(_644);
        float _648 = fma(_642, _636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _650 = _632 * _648;
        float _652 = _646 + (-1.0);
        float _654 = fma(_468, _650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _656 = fma(_472, _650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _658 = _652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _662 = _654 + _660;
        float _664 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _666 = _656 + _664;
        float _668 = fma(_584, _646, _658);
        float _670 = _662 * _662;
        float _672 = _666 * _666;
        _596 = _668;
        _614 = _670;
        _610 = _672;
        _618 = _654;
        _624 = _656;
    }
    float _674 = _596;
    float _676 = _614;
    float _678 = _610;
    float _680 = _618;
    float _682 = _624;
    float _684 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _686 = _674 + _684;
    float _688 = in.m_65.w;
    float _690 = _680;
    if (!_558)
    {
        float _692 = -_402;
        float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _598 = _694;
    }
    float _696 = _598;
    float _698 = _606 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _700 = fma(_686, _686, _676);
    float _702 = _606 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_558)
    {
        float _704 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _600 = _704;
    }
    float _706 = _600;
    float _708 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[9].x, _698);
    float _710 = _700 + _678;
    float _712 = _606 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _714 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[8].x, _702);
    float _716 = sqrt(_710);
    float _718 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[10].x, _712);
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _732 = fma(_706, (*spvDescriptorSet0.vp_c10)._m0[8].z, _714);
    float _734 = fma(_706, (*spvDescriptorSet0.vp_c10)._m0[9].z, _708);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _738 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _426 + 0.5;
    float _752 = _582 + 0.5;
    float _754 = _586 + 0.5;
    float _756 = _590 + 0.5;
    float _758 = fma(_706, (*spvDescriptorSet0.vp_c10)._m0[10].z, _718);
    out.m_67.w = _688;
    bool _760 = _716 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _762 = isnan(_716);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _768 = _764 || _766;
    out.m_69.x = _738;
    out.m_69.y = _740;
    out.m_69.z = _742;
    out.m_69.w = _736;
    out.m_71.x = _744;
    out.m_71.y = _746;
    out.m_71.z = _748;
    out.m_73.x = _752;
    out.m_73.y = _750;
    out.m_73.z = _754;
    out.m_73.w = _756;
    float _770 = _752;
    float _772 = _750;
    if (!_768)
    {
        _602 = 1.0;
    }
    float _774 = _602;
    out.m_75.x = _732;
    out.m_75.y = _734;
    out.m_75.z = _758;
    bool _776 = !_768;
    float _778 = _774;
    if (!_776)
    {
        bool _780 = _716 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _782 = isnan(_716);
        bool _784 = _780 || _782;
        bool _786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _788 = _784 || _786;
        if (!_788)
        {
            float _790 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _792 = _716 + _790;
            float _794 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _796 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _794;
            float _798 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _800 = _798 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _802 = 1.0 / _796;
            float _804 = _792 * _802;
            float _806 = fma(_804, _800, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _778 = _806;
            _808 = true;
        }
        else
        {
            bool _810 = _716 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _812 = isnan(_716);
            bool _814 = _810 || _812;
            bool _816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _818 = _814 || _816;
            if (!_818)
            {
                float _820 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _822 = _716 + _820;
                float _824 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _826 = _824 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _828 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _830 = _828 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _832 = 1.0 / _826;
                float _834 = _822 * _832;
                float _836 = fma(_834, _830, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _778 = _836;
                _808 = true;
            }
            else
            {
                _778 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _808 = false;
    float _838 = _778;
    float _840 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _842 = _674 + _840;
    float _844 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _846 = _680 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _850 = _682 + _848;
    float _852 = fma(_842, _838, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _854 = fma(_846, _838, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _856 = fma(_850, _838, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _852 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = _854 + _862;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _868 = _856 + _866;
    float _870 = _860 * _860;
    float _872 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _874 = fma(_864, _864, _870);
    float _876 = fma(_444, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _878 = fma(_868, _868, _874);
    float _880 = floor(_876);
    float _882 = rsqrt(_878);
    float _884 = sqrt(_878);
    float _886 = _882 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _888 = _864 * _886;
    float _890 = _868 * _886;
    float _892 = _888 * _888;
    float _894 = _890 * _890;
    float _896 = _892 + _894;
    float _898 = sqrt(_896);
    bool _900 = _898 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _904 = _898 + _902;
    float _906 = _882;
    float _908 = _904;
    float _910 = _860;
    if (_900)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _912;
    }
    float _914 = _906;
    if (_900)
    {
        float _916 = rsqrt(_896);
        _770 = _916;
    }
    float _918 = _770;
    float _920 = _918;
    if (_900)
    {
        float _922 = _904 * _914;
        _908 = _922;
    }
    float _924 = _908;
    if (_900)
    {
        float _926 = _924 * 0.15915493667125701904296875;
        _772 = _926;
    }
    float _928 = _772;
    float _930 = _914;
    if (_900)
    {
        float _932 = _928 * 6.283185482025146484375;
        float _934 = sin(_932);
        _930 = _934;
    }
    float _936 = _930;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _940 = precise::max(0.0, _938);
    float _942 = _868;
    float _944 = _940;
    if (_900)
    {
        float _946 = _928 * 6.283185482025146484375;
        float _948 = cos(_946);
        _942 = _948;
    }
    float _950 = _942;
    float _952 = -_886;
    float _954 = -_940;
    float _956 = fma(_860, _952, _954);
    float _958 = _956;
    if (_900)
    {
        float _960 = _956 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _960;
    }
    float _962 = _944;
    float _964 = _852 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _966 = _936;
    float _968 = _962;
    if (_900)
    {
        float _970 = fma(_936, _962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _966 = _970;
    }
    float _972 = _966;
    float _974 = _972;
    if (_900)
    {
        float _976 = _950 + (-1.0);
        _968 = _976;
    }
    float _978 = _968;
    float _980 = _978;
    if (_900)
    {
        float _982 = _918 * _972;
        _690 = _982;
    }
    float _984 = _690;
    if (!_900)
    {
        _974 = _888;
    }
    float _986 = _974;
    float _988 = _986;
    if (_900)
    {
        float _990 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _990;
    }
    float _992 = _910;
    float _994 = _992;
    if (_900)
    {
        float _996 = _888 * _984;
        _988 = _996;
    }
    float _998 = _988;
    if (!_900)
    {
        _920 = _890;
    }
    float _1000 = _920;
    float _1002 = _1000;
    if (_900)
    {
        float _1004 = _890 * _984;
        _1002 = _1004;
    }
    float _1006 = _1002;
    if (!_900)
    {
        _980 = _892;
    }
    float _1008 = _980;
    float _1010 = _1008;
    if (_900)
    {
        float _1012 = fma(_956, _950, _992);
        _958 = _1012;
    }
    float _1014 = _958;
    if (_900)
    {
        float _1016 = _998 * _998;
        _1010 = _1016;
    }
    float _1018 = _1010;
    if (!_900)
    {
        _994 = _894;
    }
    float _1020 = _994;
    float _1022 = _1020;
    if (_900)
    {
        float _1024 = _1006 * _1006;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _852 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = fma(_1014, _1014, _1018);
    float _1032 = _852 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1034 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1028);
    float _1036 = _1030 + _1026;
    float _1038 = _852 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1040 = fma(_442, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1042 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1032);
    float _1044 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[0].x, _964);
    float _1046 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1034);
    float _1048 = rsqrt(_1036);
    float _1050 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1042);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1054 = fma(_884, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1052);
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1044);
    float _1060 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1062 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1064 = -_1056;
    float _1066 = _1064 + 1.0;
    float _1068 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1038);
    float _1070 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1072 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1076 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1068);
    float _1078 = abs(_1066);
    float _1080 = log2(_1078);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1072);
    float _1084 = -_1074;
    float _1086 = fma(_1084, _872, 1.0);
    float _1088 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1090 = _1048 * _1006;
    float _1092 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1082);
    float _1094 = _1048 * _998;
    float _1096 = floor(_1040);
    float _1098 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1092);
    float _1100 = _1048 * _1014;
    float _1102 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1104 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1106 = -_880;
    float _1108 = _876 + _1106;
    float _1110 = -_1102;
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1110);
    float _1114 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1116 = log2(_1086);
    float _1118 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1104);
    float _1120 = -_1090;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1112);
    float _1124 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1126 = fma(_1122, -0.5, 0.5);
    float _1128 = fma(_1122, 0.5, 0.5);
    float _1130 = exp2(_1114);
    float _1132 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1124);
    float _1134 = -_1096;
    float _1136 = _1040 + _1134;
    float _1138 = _1100 + 1.0;
    float _1140 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1118);
    float _1142 = 1.0 / _1098;
    float _1144 = fma(_1128, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1146 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1132);
    float _1148 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1140);
    float _1150 = _1116 * 0.693147182464599609375;
    float _1152 = fma(_1128, _1144, -0.212114393711090087890625);
    float _1154 = sqrt(_1126);
    float _1156 = -_1100;
    float _1158 = fma(_1130, _1138, _1156);
    float _1160 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1146);
    float _1162 = fma(_1128, _1152, 1.570728778839111328125);
    float _1164 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1166 = fma(_1158, 0.5, 0.5);
    float _1168 = _1148 * _1142;
    float _1170 = _1160 * _1142;
    float _1172 = fma(_1168, 0.5, 0.5);
    float _1174 = fma(_1170, -0.5, 0.5);
    float _1176 = _1154 * 0.636619746685028076171875;
    float2 _3668 = float2(_1108, _1136);
    float _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3668, float2(0.0), isnan(_3668)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3668, float2(0.0), isnan(_3668)), level(0.0)).x;
    float _1180 = -_1162;
    float _1182 = fma(_1176, _1180, 1.0);
    float3 _3684 = float3(_1172, _1174, _1164);
    float _1184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3684, float3(0.0), isnan(_3684)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3684, float3(0.0), isnan(_3684)), level(0.0)).x;
    float3 _3695 = float3(_1172, _1174, _1164);
    float4 _1187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3695, float3(0.0), isnan(_3695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3695, float3(0.0), isnan(_3695)), level(0.0)).xyzw;
    float _1189 = _1187.x;
    float _1191 = _1187.y;
    float _1193 = _1187.z;
    float _1195 = _1187.w;
    float2 _3711 = float2(_1182, _1166);
    float3 _1199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3711, float2(0.0), isnan(_3711)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3711, float2(0.0), isnan(_3711)), level(0.0)).xyz;
    float _1201 = _1199.x;
    float _1203 = _1199.y;
    float _1205 = _1199.z;
    float _1207 = _552 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1209 = _552 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1211 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1213 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1207);
    float _1215 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1209);
    float _1217 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1211);
    float _1219 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1213);
    float _1221 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1215);
    float _1223 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1217);
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1227 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1229 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1223);
    float _1231 = 1.0 / _1225;
    float _1233 = _1227 + _1225;
    out.gl_Position.x = _1148;
    out.gl_Position.y = _1160;
    out.gl_Position.z = _1229;
    out.gl_Position.w = _1098;
    float _1235 = _1233 * _1231;
    float _1237 = _1235 * 0.5;
    float _1239 = _1148 + _1098;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1243 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1241);
    float _1245 = _1239 * 0.5;
    float _1247 = 1.0 / _1243;
    float _1249 = in.m_77.x;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1253 = _1247 * _1251;
    float _1255 = abs(_1253);
    float _1257 = log2(_1255);
    float _1259 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1261 = exp2(_1259);
    float _1263 = fma(_1261, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1265 = precise::clamp(_1263, 0.0, 1.0);
    float _1267 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1269 = _1098 * 0.5;
    float _1271 = fma(_1265, -2.0, 3.0);
    float _1273 = _1265 * _1265;
    bool _1275 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(0.5);
    bool _1283 = _1279 || _1281;
    float _1285 = exp2(_1267);
    bool _1287 = _1253 <= 8000.0;
    bool _1289 = isnan(_1253);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(8000.0);
    bool _1295 = _1291 || _1293;
    float _1297 = float(_1295);
    float _1299 = _1273 * _1271;
    float _1301 = fma(_1160, -0.5, _1269);
    float _1303 = -_1299;
    float _1305 = _1303 + 1.0;
    float _1307 = fma(_1305, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1299);
    float _1309 = _1297 * _1307;
    float _1311 = _1229 + _1098;
    float _1313 = _1311 * 0.5;
    float _1315 = _1311;
    float _1317 = _1098;
    float _1319 = _1301;
    float _1321 = _1313;
    float _1323 = _1253;
    if (_1283)
    {
        _1315 = 1.0;
    }
    float _1325 = _1315;
    float _1327 = _1325;
    if (!_1283)
    {
        float _1329 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1331 = _1329 * 0.15915493667125701904296875;
        float _1333 = _1331 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1339 = _1337 * 0.15915493667125701904296875;
        float _1341 = _1331 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = 1.0 / _1335;
        float _1347 = _1339 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = _1339 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = _1349 * _1351;
        float _1359 = 1.0 / _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1361;
        float _1365 = 1.0 / _1363;
        float _1367 = _1355 * _1359;
        float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1371 = fma(_1253, _1367, _1369);
        float _1373 = _1371 * _1365;
        float _1375 = precise::clamp(_1373, 0.0, 1.0);
        float _1377 = -_1375;
        float _1379 = _1377 + 1.0;
        _1327 = _1379;
    }
    float _1381 = _1327;
    float _1383 = -_1285;
    float _1385 = _1383 + 1.0;
    float _1387 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1389 = -_1178;
    float _1391 = _1389 + 1.0;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _1245;
    out.m_79.y = _1301;
    out.m_79.z = _1313;
    out.m_79.w = _1098;
    float _1395 = _1391 * _1387;
    float _1397 = precise::clamp(_1395, 0.0, 1.0);
    bool _1399 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1401 = isnan(_884);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1407 = _1403 || _1405;
    float _1409 = _1393 * _1184;
    float _1411 = -_1397;
    float _1413 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1415 = _1195 * _1409;
    float _1417 = _1205 * _1409;
    float _1419 = _1413 * _1249;
    float _1421 = fma(_1201, _1415, _1189);
    float _1423 = fma(_1203, _1415, _1191);
    float _1425 = _1419 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1427 = -_1393;
    float _1429 = _1427 + 1.0;
    float _1431 = fma(_1195, _1417, _1193);
    float _1433 = _1429;
    float _1435 = _1419;
    if (!_1407)
    {
        _1317 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1437 = _1317;
    float _1439 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1441 = _1195 * _1429;
    out.m_81.x = _1425;
    float _1443 = _1437;
    float _1445 = _1437;
    if (!_1407)
    {
        _1319 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1447 = _1319;
    float _1449 = _1447;
    float _1451 = _1447;
    if (!_1407)
    {
        _1321 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1453 = _1321;
    out.m_83.x = _1421;
    out.m_83.y = _1423;
    out.m_83.z = _1431;
    out.m_83.w = _1441;
    float _1455 = _1453;
    float _1457 = _1453;
    if (!_1407)
    {
        _1433 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1459 = _1433;
    float _1461 = _1459;
    float _1463 = _1459;
    if (!_1407)
    {
        _1435 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1465 = _1435;
    float _1467 = _1465;
    float _1469 = _1465;
    if (!_1407)
    {
        _1323 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1471 = _1323;
    bool _1473 = !_1407;
    float _1475 = _1471;
    float _1477 = _1471;
    if (!_1473)
    {
        bool _1479 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1481 = isnan(_884);
        bool _1483 = _1479 || _1481;
        bool _1485 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1487 = _1483 || _1485;
        if (!_1487)
        {
            float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1491 = _884 + _1489;
            float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1495 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1493;
            float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1499 = _1497 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1501 = 1.0 / _1495;
            float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1505 = _1503 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1509 = _1507 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1513 = _1511 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1517 = _1515 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1519 = _1491 * _1501;
            float _1521 = precise::clamp(_1519, 0.0, 1.0);
            float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1525 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1527 = fma(_1521, _1499, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1529 = fma(_1521, _1525, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1531 = fma(_1521, _1505, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1533 = fma(_1521, _1509, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1535 = fma(_1521, _1513, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1537 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1451 = _1531;
            _1469 = _1535;
            _1445 = _1527;
            _1463 = _1533;
            _1457 = _1529;
            _1477 = _1537;
            _1539 = true;
        }
        else
        {
            bool _1541 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1543 = isnan(_884);
            bool _1545 = _1541 || _1543;
            bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1549 = _1545 || _1547;
            if (!_1549)
            {
                _1443 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1551 = _1443;
            _1445 = _1551;
            if (!_1549)
            {
                _1449 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1553 = _1449;
            _1451 = _1553;
            if (!_1549)
            {
                _1455 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1555 = _1455;
            _1457 = _1555;
            if (!_1549)
            {
                _1461 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1557 = _1461;
            _1463 = _1557;
            if (!_1549)
            {
                _1467 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1559 = _1467;
            _1469 = _1559;
            if (!_1549)
            {
                _1475 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1561 = _1475;
            bool _1563 = !_1549;
            _1477 = _1561;
            if (!_1563)
            {
                bool _1565 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1567 = isnan(_884);
                bool _1569 = _1565 || _1567;
                bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1573 = _1569 || _1571;
                if (!_1573)
                {
                    float _1575 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1577 = _884 + _1575;
                    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1579;
                    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1585 = _1583 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1587 = 1.0 / _1581;
                    float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1591 = _1589 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1595 = _1593 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1599 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1605 = _1577 * _1587;
                    float _1607 = precise::clamp(_1605, 0.0, 1.0);
                    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1613 = fma(_1607, _1585, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1615 = fma(_1607, _1611, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1617 = fma(_1607, _1591, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1619 = fma(_1607, _1595, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1621 = fma(_1607, _1599, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1623 = fma(_1607, _1603, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1451 = _1617;
                    _1469 = _1621;
                    _1445 = _1613;
                    _1463 = _1619;
                    _1457 = _1615;
                    _1477 = _1623;
                    _1539 = true;
                }
                else
                {
                    _1451 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1469 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1445 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1463 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1457 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1477 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1539 = false;
    float _1625 = _1451;
    float _1627 = _1469;
    float _1629 = _1445;
    float _1631 = _1463;
    float _1633 = _1457;
    float _1635 = _1477;
    float _1637 = fma(_734, -0.5, 0.5);
    float _1639 = precise::clamp(_1637, 0.0, 1.0);
    float _1641 = -_1625;
    float _1643 = _1641 + _1627;
    float _1645 = _1439 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1647 = -_1629;
    float _1649 = _1647 + _1631;
    float _1651 = fma(_1639, _1643, _1625);
    out.m_85.x = 0.0;
    float _1653 = -_1633;
    float _1655 = _1653 + _1635;
    float _1657 = fma(_1639, _1649, _1629);
    float _1659 = _1651 * 0.586610972881317138671875;
    out.m_51.x = _1645;
    bool _1661 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1663 = fma(_1639, _1655, _1633);
    float _1665 = fma(_1657, 0.298911988735198974609375, _1659);
    bool _1667 = _1381 > 0.0;
    bool _1669 = isnan(_1381);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan(0.0);
    bool _1675 = _1671 || _1673;
    float _1677 = fma(_1663, 0.114477999508380889892578125, _1665);
    float _1679 = -_1677;
    float _1681 = _1657 + _1679;
    float _1683 = -_1677;
    float _1685 = _1651 + _1683;
    float _1687 = -_1677;
    float _1689 = _1663 + _1687;
    float _1691 = fma(_1681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1677);
    float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1677);
    float _1695 = fma(_1689, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1677);
    bool _1697 = !_1661;
    if (!_1697)
    {
        float _1699 = -_852;
        float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1703 = -_854;
        float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1707 = -_856;
        float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1711 = _1701 * _1701;
        float _1713 = fma(_1705, _1705, _1711);
        float _1715 = fma(_1709, _1709, _1713);
        float _1717 = sqrt(_1715);
        float _1719 = rsqrt(_1715);
        float _1721 = -_1717;
        float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1725 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1727 = precise::clamp(_1725, 0.0, 1.0);
        float _1729 = _1705 * _1719;
        float _1731 = _1701 * _1719;
        float _1733 = abs(_1727);
        float _1735 = log2(_1733);
        float _1737 = _1709 * _1719;
        float _1739 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1741 = _734 * _1731;
        float _1743 = -_1731;
        float _1745 = -_1739;
        float _1747 = fma(_1743, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1745);
        float _1749 = fma(_732, _1729, _1741);
        float _1751 = -_1737;
        float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1747);
        float _1755 = fma(_758, _1737, _1749);
        float _1757 = precise::clamp(_1755, 0.0, 1.0);
        float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1761 = _1753 + _1759;
        float _1763 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1765 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1767 = precise::clamp(_1765, 0.0, 1.0);
        float _1769 = exp2(_1763);
        float _1771 = _1769 * _1767;
        float _1773 = _1757 * _1771;
        float _1775 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1777 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1779 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _1775;
        out.m_85.y = _1777;
        out.m_85.z = _1779;
    }
    out.m_87.x = _1691;
    out.m_87.y = _1693;
    out.m_87.z = _1695;
    if (_1675)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _1781 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1781;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1539 = false;
    bool _808 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    float _118 = _116;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_124);
        out.gl_Position.z = _1840;
    }
    if (!_110)
    {
        return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_106);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _114;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1909 = as_type<float>(_160);
        out.gl_Position.z = _1909;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _168 = in.m_48.x;
    float _170 = in.m_48.y;
    float _172 = in.m_48.z;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _180 = _178 != 0;
    float _182 = in.m_55.w;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _186 = _184 != 0;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _192 = _190 != 0;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _202 = in.m_59.x;
    float _204 = in.m_59.y;
    int _206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _208 = _206 != 0;
    float _210 = in.m_61.y;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _214 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _216 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _218 = in.m_59.z;
    bool _220 = _164 > 0.5;
    float _222 = -_188;
    float _224 = fma(_214, 2.0, _222);
    float _226 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _228 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _230 = _182 > 0.5;
    float _232 = fma(_216, -2.0, _212);
    float _234 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _226);
    float _236 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.083333335816860198974609375;
    float _238 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _240 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _242 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _244 = _198 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.16666667163372039794921875;
    float _248 = _198;
    bool _250 = _220;
    bool _252 = _180;
    if (_176)
    {
        float _254 = in.m_55.x;
        _248 = _254;
    }
    float _256 = _248;
    float _258 = -_236;
    float _260 = fma(_202, 18.84955596923828125, _258);
    float _262 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _242);
    float _264 = fma(_202, 31.415927886962890625, _246);
    float _266 = 0.0;
    float _268 = _210;
    if (_186)
    {
        float _270 = in.m_55.z;
        _266 = _270;
    }
    float _272 = _266;
    float _274 = _260 * 0.15915493667125701904296875;
    float _276 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _228);
    float _278 = _264 * 0.15915493667125701904296875;
    float _280 = in.m_61.x;
    float _282 = -_210;
    float _284 = _282 + 1.0;
    float _286 = _274 * 6.283185482025146484375;
    float _288 = sin(_286);
    float _290 = _202 * 6.283185482025146484375;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _294 = _220 ? _284 : _210;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _298 = _294;
    if (!_208)
    {
        float _300 = in.m_55.z;
        _296 = _300;
    }
    float _302 = _296;
    float _304 = _290 * 0.15915493667125701904296875;
    float _306 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _292);
    float _308 = _278 * 6.283185482025146484375;
    float _310 = sin(_308);
    float _312 = _244 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _314 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _262);
    float _316 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _234);
    float _318 = _256;
    float _320 = 0.75;
    float _322 = _314;
    if (_176)
    {
        bool _324 = _256 > 0.5;
        _250 = _324;
    }
    bool _326 = _250;
    float _328 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _276);
    if (!_208)
    {
        _318 = _164;
    }
    float _330 = _318;
    float _332 = _304 * 6.283185482025146484375;
    float _334 = cos(_332);
    float _336 = _330;
    if (_208)
    {
        _336 = _162;
    }
    float _338 = _336;
    float _340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _218);
    float _342 = _180 ? _294 : _210;
    float _344 = -_142;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[76].x, _224);
    if (_186)
    {
        bool _348 = _272 > 0.5;
        _252 = _348;
    }
    bool _350 = _252;
    float _352 = _340 * _312;
    if (!_176)
    {
        _298 = _280;
    }
    float _354 = _298;
    float _356 = _310 + _288;
    float _358 = _304 * 6.283185482025146484375;
    float _360 = sin(_358);
    float _362 = fma(_204, 0.75, 0.25);
    float _364 = _354;
    float _366 = _362;
    if (!_176)
    {
        _320 = _354;
    }
    float _368 = _320;
    float _370 = _356 * 0.100000001490116119384765625;
    float _372 = _166 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _376 = _368;
    if (_176)
    {
        _364 = _280;
    }
    float _378 = _364;
    float _380 = fma(_370, _362, _204);
    float _382 = fma(_372, _342, -0.5);
    float _384 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].w, _374);
    float _386 = _238 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _388 = _380 + 0.4000000059604644775390625;
    float _390 = _302;
    if (!_208)
    {
        _366 = _302;
    }
    float _392 = _366;
    float _394 = _240 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _396 = _392;
    if (_208)
    {
        _396 = _164;
    }
    float _398 = _396;
    float _400 = _388 * _334;
    float _402 = _388 * _360;
    if (_208)
    {
        _390 = _164;
    }
    float _404 = _390;
    float _406 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _384);
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _400);
    float _410 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _232);
    float _412 = -_402;
    float _414 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _412);
    int _416 = as_type<int>(_404);
    if (_192)
    {
        float _418 = _230 ? _284 : _210;
        _268 = _418;
    }
    float _420 = _268;
    float _422 = _408 * _386;
    float _424 = -_410;
    float _426 = fma(_406, _382, _424);
    float _428 = _414 * _394;
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _432 = _422 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].x, _430);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[10].x, _432);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _442 = _328 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _444 = _316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _446 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[8].z, _436);
    float _448 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[10].z, _438);
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _452 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[83].z, _440);
    float _454 = _338 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _456 = _444 + _446;
    float _458 = _442 + _448;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _462 = -_450;
    float _464 = fma(_454, 2.0, _462);
    float _466 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _468 = _456 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _472 = _458 + _470;
    float _474 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[83].w, _460);
    float _476 = _434 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _478 = _468 * _468;
    float _480 = _472 * _472;
    int _482 = as_type<int>(_446);
    float _484 = _476;
    float _486 = _452;
    if (_176)
    {
        float _488 = -_378;
        float _490 = _488 + 1.0;
        _416 = as_type<int>(_490);
    }
    int _492 = _416;
    float _494 = fma(_476, _420, -0.5);
    if (_186)
    {
        float _496 = -_378;
        float _498 = _496 + 1.0;
        _482 = as_type<int>(_498);
    }
    int _500 = _482;
    float _502 = _478 + _480;
    float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_186)
    {
        _484 = _378;
    }
    float _506 = _484;
    float _508 = _422 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _510 = _506;
    if (_176)
    {
        float _512 = _326 ? as_type<float>(_492) : _378;
        _376 = _512;
    }
    float _514 = _376;
    float _516 = _398 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_186)
    {
        float _518 = _350 ? as_type<float>(_500) : _378;
        _510 = _518;
    }
    float _520 = _510;
    float _522 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[9].x, _508);
    float _524 = in.m_63.x;
    float _526 = in.m_63.y;
    float _528 = in.m_63.z;
    float _530 = sqrt(_502);
    bool _532 = _400 != 0.0;
    bool _534 = isnan(_400);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _452);
    float _544 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[9].z, _522);
    bool _546 = _402 == 0.0;
    bool _548 = !_540;
    bool _550 = _546 && _548;
    float _552 = _314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _556 = _218 == 0.0;
    bool _558 = _556 && _550;
    float _560 = _504 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _562 = _200 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _564 = fma(_516, -2.0, _554);
    float _566 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _474);
    float _568 = fma(_560, _514, -0.5);
    float _570 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _306);
    bool _572 = _530 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _574 = -_142;
    float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[81].x, _464);
    float _578 = fma(_562, _520, -0.5);
    float _580 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _564);
    float _582 = fma(_570, _568, _346);
    float _584 = _552 + _544;
    float _586 = fma(_542, _578, _576);
    float _588 = -_580;
    float _590 = fma(_566, _494, _588);
    float _592 = _526;
    float _594 = _542;
    float _596 = _584;
    float _598 = _524;
    float _600 = _528;
    float _602 = _586;
    if (!_558)
    {
        float _604 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _592 = _604;
    }
    float _606 = _592;
    if (!_572)
    {
        _322 = _480;
    }
    float _608 = _322;
    float _610 = _608;
    if (!_572)
    {
        _144 = _478;
    }
    float _612 = _144;
    float _614 = _612;
    if (!_572)
    {
        _486 = _456;
    }
    float _616 = _486;
    float _618 = _616;
    if (!_572)
    {
        _594 = _458;
    }
    float _620 = _594;
    bool _622 = !_572;
    float _624 = _620;
    if (!_622)
    {
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _630 = _530 + _628;
        float _632 = rsqrt(_502);
        float _634 = _630 * _626;
        float _636 = _584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _638 = _634 * 0.15915493667125701904296875;
        float _640 = _638 * 6.283185482025146484375;
        float _642 = sin(_640);
        float _644 = _638 * 6.283185482025146484375;
        float _646 = cos(_644);
        float _648 = fma(_642, _636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _650 = _632 * _648;
        float _652 = _646 + (-1.0);
        float _654 = fma(_468, _650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _656 = fma(_472, _650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _658 = _652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _662 = _654 + _660;
        float _664 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _666 = _656 + _664;
        float _668 = fma(_584, _646, _658);
        float _670 = _662 * _662;
        float _672 = _666 * _666;
        _596 = _668;
        _614 = _670;
        _610 = _672;
        _618 = _654;
        _624 = _656;
    }
    float _674 = _596;
    float _676 = _614;
    float _678 = _610;
    float _680 = _618;
    float _682 = _624;
    float _684 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _686 = _674 + _684;
    float _688 = in.m_65.w;
    float _690 = _680;
    if (!_558)
    {
        float _692 = -_402;
        float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _598 = _694;
    }
    float _696 = _598;
    float _698 = _606 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _700 = fma(_686, _686, _676);
    float _702 = _606 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_558)
    {
        float _704 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _600 = _704;
    }
    float _706 = _600;
    float _708 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[9].x, _698);
    float _710 = _700 + _678;
    float _712 = _606 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _714 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[8].x, _702);
    float _716 = sqrt(_710);
    float _718 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[10].x, _712);
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _732 = fma(_706, (*spvDescriptorSet0.vp_c10)._m0[8].z, _714);
    float _734 = fma(_706, (*spvDescriptorSet0.vp_c10)._m0[9].z, _708);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _738 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _426 + 0.5;
    float _752 = _582 + 0.5;
    float _754 = _586 + 0.5;
    float _756 = _590 + 0.5;
    float _758 = fma(_706, (*spvDescriptorSet0.vp_c10)._m0[10].z, _718);
    out.m_67.w = _688;
    bool _760 = _716 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _762 = isnan(_716);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _768 = _764 || _766;
    out.m_69.x = _738;
    out.m_69.y = _740;
    out.m_69.z = _742;
    out.m_69.w = _736;
    out.m_71.x = _744;
    out.m_71.y = _746;
    out.m_71.z = _748;
    out.m_73.x = _752;
    out.m_73.y = _750;
    out.m_73.z = _754;
    out.m_73.w = _756;
    float _770 = _752;
    float _772 = _750;
    if (!_768)
    {
        _602 = 1.0;
    }
    float _774 = _602;
    out.m_75.x = _732;
    out.m_75.y = _734;
    out.m_75.z = _758;
    bool _776 = !_768;
    float _778 = _774;
    if (!_776)
    {
        bool _780 = _716 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _782 = isnan(_716);
        bool _784 = _780 || _782;
        bool _786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _788 = _784 || _786;
        if (!_788)
        {
            float _790 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _792 = _716 + _790;
            float _794 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _796 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _794;
            float _798 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _800 = _798 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _802 = 1.0 / _796;
            float _804 = _792 * _802;
            float _806 = fma(_804, _800, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _778 = _806;
            _808 = true;
        }
        else
        {
            bool _810 = _716 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _812 = isnan(_716);
            bool _814 = _810 || _812;
            bool _816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _818 = _814 || _816;
            if (!_818)
            {
                float _820 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _822 = _716 + _820;
                float _824 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _826 = _824 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _828 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _830 = _828 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _832 = 1.0 / _826;
                float _834 = _822 * _832;
                float _836 = fma(_834, _830, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _778 = _836;
                _808 = true;
            }
            else
            {
                _778 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _808 = false;
    float _838 = _778;
    float _840 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _842 = _674 + _840;
    float _844 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _846 = _680 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _850 = _682 + _848;
    float _852 = fma(_842, _838, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _854 = fma(_846, _838, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _856 = fma(_850, _838, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _852 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = _854 + _862;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _868 = _856 + _866;
    float _870 = _860 * _860;
    float _872 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _874 = fma(_864, _864, _870);
    float _876 = fma(_444, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _878 = fma(_868, _868, _874);
    float _880 = floor(_876);
    float _882 = rsqrt(_878);
    float _884 = sqrt(_878);
    float _886 = _882 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _888 = _864 * _886;
    float _890 = _868 * _886;
    float _892 = _888 * _888;
    float _894 = _890 * _890;
    float _896 = _892 + _894;
    float _898 = sqrt(_896);
    bool _900 = _898 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _904 = _898 + _902;
    float _906 = _882;
    float _908 = _904;
    float _910 = _860;
    if (_900)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _912;
    }
    float _914 = _906;
    if (_900)
    {
        float _916 = rsqrt(_896);
        _770 = _916;
    }
    float _918 = _770;
    float _920 = _918;
    if (_900)
    {
        float _922 = _904 * _914;
        _908 = _922;
    }
    float _924 = _908;
    if (_900)
    {
        float _926 = _924 * 0.15915493667125701904296875;
        _772 = _926;
    }
    float _928 = _772;
    float _930 = _914;
    if (_900)
    {
        float _932 = _928 * 6.283185482025146484375;
        float _934 = sin(_932);
        _930 = _934;
    }
    float _936 = _930;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _940 = precise::max(0.0, _938);
    float _942 = _868;
    float _944 = _940;
    if (_900)
    {
        float _946 = _928 * 6.283185482025146484375;
        float _948 = cos(_946);
        _942 = _948;
    }
    float _950 = _942;
    float _952 = -_886;
    float _954 = -_940;
    float _956 = fma(_860, _952, _954);
    float _958 = _956;
    if (_900)
    {
        float _960 = _956 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _960;
    }
    float _962 = _944;
    float _964 = _852 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _966 = _936;
    float _968 = _962;
    if (_900)
    {
        float _970 = fma(_936, _962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _966 = _970;
    }
    float _972 = _966;
    float _974 = _972;
    if (_900)
    {
        float _976 = _950 + (-1.0);
        _968 = _976;
    }
    float _978 = _968;
    float _980 = _978;
    if (_900)
    {
        float _982 = _918 * _972;
        _690 = _982;
    }
    float _984 = _690;
    if (!_900)
    {
        _974 = _888;
    }
    float _986 = _974;
    float _988 = _986;
    if (_900)
    {
        float _990 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _990;
    }
    float _992 = _910;
    float _994 = _992;
    if (_900)
    {
        float _996 = _888 * _984;
        _988 = _996;
    }
    float _998 = _988;
    if (!_900)
    {
        _920 = _890;
    }
    float _1000 = _920;
    float _1002 = _1000;
    if (_900)
    {
        float _1004 = _890 * _984;
        _1002 = _1004;
    }
    float _1006 = _1002;
    if (!_900)
    {
        _980 = _892;
    }
    float _1008 = _980;
    float _1010 = _1008;
    if (_900)
    {
        float _1012 = fma(_956, _950, _992);
        _958 = _1012;
    }
    float _1014 = _958;
    if (_900)
    {
        float _1016 = _998 * _998;
        _1010 = _1016;
    }
    float _1018 = _1010;
    if (!_900)
    {
        _994 = _894;
    }
    float _1020 = _994;
    float _1022 = _1020;
    if (_900)
    {
        float _1024 = _1006 * _1006;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _852 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = fma(_1014, _1014, _1018);
    float _1032 = _852 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1034 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1028);
    float _1036 = _1030 + _1026;
    float _1038 = _852 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1040 = fma(_442, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1042 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1032);
    float _1044 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[0].x, _964);
    float _1046 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1034);
    float _1048 = rsqrt(_1036);
    float _1050 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1042);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1054 = fma(_884, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1052);
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1044);
    float _1060 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1062 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1064 = -_1056;
    float _1066 = _1064 + 1.0;
    float _1068 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1038);
    float _1070 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1072 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1076 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1068);
    float _1078 = abs(_1066);
    float _1080 = log2(_1078);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1072);
    float _1084 = -_1074;
    float _1086 = fma(_1084, _872, 1.0);
    float _1088 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1090 = _1048 * _1006;
    float _1092 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1082);
    float _1094 = _1048 * _998;
    float _1096 = floor(_1040);
    float _1098 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1092);
    float _1100 = _1048 * _1014;
    float _1102 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1104 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1106 = -_880;
    float _1108 = _876 + _1106;
    float _1110 = -_1102;
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1110);
    float _1114 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1116 = log2(_1086);
    float _1118 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1104);
    float _1120 = -_1090;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1112);
    float _1124 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1126 = fma(_1122, -0.5, 0.5);
    float _1128 = fma(_1122, 0.5, 0.5);
    float _1130 = exp2(_1114);
    float _1132 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1124);
    float _1134 = -_1096;
    float _1136 = _1040 + _1134;
    float _1138 = _1100 + 1.0;
    float _1140 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1118);
    float _1142 = 1.0 / _1098;
    float _1144 = fma(_1128, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1146 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1132);
    float _1148 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1140);
    float _1150 = _1116 * 0.693147182464599609375;
    float _1152 = fma(_1128, _1144, -0.212114393711090087890625);
    float _1154 = sqrt(_1126);
    float _1156 = -_1100;
    float _1158 = fma(_1130, _1138, _1156);
    float _1160 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1146);
    float _1162 = fma(_1128, _1152, 1.570728778839111328125);
    float _1164 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1166 = fma(_1158, 0.5, 0.5);
    float _1168 = _1148 * _1142;
    float _1170 = _1160 * _1142;
    float _1172 = fma(_1168, 0.5, 0.5);
    float _1174 = fma(_1170, -0.5, 0.5);
    float _1176 = _1154 * 0.636619746685028076171875;
    float2 _3668 = float2(_1108, _1136);
    float _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3668, float2(0.0), isnan(_3668)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3668, float2(0.0), isnan(_3668)), level(0.0)).x;
    float _1180 = -_1162;
    float _1182 = fma(_1176, _1180, 1.0);
    float3 _3684 = float3(_1172, _1174, _1164);
    float _1184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3684, float3(0.0), isnan(_3684)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3684, float3(0.0), isnan(_3684)), level(0.0)).x;
    float3 _3695 = float3(_1172, _1174, _1164);
    float4 _1187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3695, float3(0.0), isnan(_3695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3695, float3(0.0), isnan(_3695)), level(0.0)).xyzw;
    float _1189 = _1187.x;
    float _1191 = _1187.y;
    float _1193 = _1187.z;
    float _1195 = _1187.w;
    float2 _3711 = float2(_1182, _1166);
    float3 _1199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3711, float2(0.0), isnan(_3711)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3711, float2(0.0), isnan(_3711)), level(0.0)).xyz;
    float _1201 = _1199.x;
    float _1203 = _1199.y;
    float _1205 = _1199.z;
    float _1207 = _552 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1209 = _552 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1211 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1213 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1207);
    float _1215 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1209);
    float _1217 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1211);
    float _1219 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1213);
    float _1221 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1215);
    float _1223 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1217);
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1227 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1229 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1223);
    float _1231 = 1.0 / _1225;
    float _1233 = _1227 + _1225;
    out.gl_Position.x = _1148;
    out.gl_Position.y = _1160;
    out.gl_Position.z = _1229;
    out.gl_Position.w = _1098;
    float _1235 = _1233 * _1231;
    float _1237 = _1235 * 0.5;
    float _1239 = _1148 + _1098;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1243 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1241);
    float _1245 = _1239 * 0.5;
    float _1247 = 1.0 / _1243;
    float _1249 = in.m_77.x;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1253 = _1247 * _1251;
    float _1255 = abs(_1253);
    float _1257 = log2(_1255);
    float _1259 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1261 = exp2(_1259);
    float _1263 = fma(_1261, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1265 = precise::clamp(_1263, 0.0, 1.0);
    float _1267 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1269 = _1098 * 0.5;
    float _1271 = fma(_1265, -2.0, 3.0);
    float _1273 = _1265 * _1265;
    bool _1275 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(0.5);
    bool _1283 = _1279 || _1281;
    float _1285 = exp2(_1267);
    bool _1287 = _1253 <= 8000.0;
    bool _1289 = isnan(_1253);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(8000.0);
    bool _1295 = _1291 || _1293;
    float _1297 = float(_1295);
    float _1299 = _1273 * _1271;
    float _1301 = fma(_1160, -0.5, _1269);
    float _1303 = -_1299;
    float _1305 = _1303 + 1.0;
    float _1307 = fma(_1305, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1299);
    float _1309 = _1297 * _1307;
    float _1311 = _1229 + _1098;
    float _1313 = _1311 * 0.5;
    float _1315 = _1311;
    float _1317 = _1098;
    float _1319 = _1301;
    float _1321 = _1313;
    float _1323 = _1253;
    if (_1283)
    {
        _1315 = 1.0;
    }
    float _1325 = _1315;
    float _1327 = _1325;
    if (!_1283)
    {
        float _1329 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1331 = _1329 * 0.15915493667125701904296875;
        float _1333 = _1331 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1339 = _1337 * 0.15915493667125701904296875;
        float _1341 = _1331 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = 1.0 / _1335;
        float _1347 = _1339 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = _1339 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = _1349 * _1351;
        float _1359 = 1.0 / _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1361;
        float _1365 = 1.0 / _1363;
        float _1367 = _1355 * _1359;
        float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1371 = fma(_1253, _1367, _1369);
        float _1373 = _1371 * _1365;
        float _1375 = precise::clamp(_1373, 0.0, 1.0);
        float _1377 = -_1375;
        float _1379 = _1377 + 1.0;
        _1327 = _1379;
    }
    float _1381 = _1327;
    float _1383 = -_1285;
    float _1385 = _1383 + 1.0;
    float _1387 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1389 = -_1178;
    float _1391 = _1389 + 1.0;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _1245;
    out.m_79.y = _1301;
    out.m_79.z = _1313;
    out.m_79.w = _1098;
    float _1395 = _1391 * _1387;
    float _1397 = precise::clamp(_1395, 0.0, 1.0);
    bool _1399 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1401 = isnan(_884);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1407 = _1403 || _1405;
    float _1409 = _1393 * _1184;
    float _1411 = -_1397;
    float _1413 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1415 = _1195 * _1409;
    float _1417 = _1205 * _1409;
    float _1419 = _1413 * _1249;
    float _1421 = fma(_1201, _1415, _1189);
    float _1423 = fma(_1203, _1415, _1191);
    float _1425 = _1419 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1427 = -_1393;
    float _1429 = _1427 + 1.0;
    float _1431 = fma(_1195, _1417, _1193);
    float _1433 = _1429;
    float _1435 = _1419;
    if (!_1407)
    {
        _1317 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1437 = _1317;
    float _1439 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1441 = _1195 * _1429;
    out.m_81.x = _1425;
    float _1443 = _1437;
    float _1445 = _1437;
    if (!_1407)
    {
        _1319 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1447 = _1319;
    float _1449 = _1447;
    float _1451 = _1447;
    if (!_1407)
    {
        _1321 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1453 = _1321;
    out.m_83.x = _1421;
    out.m_83.y = _1423;
    out.m_83.z = _1431;
    out.m_83.w = _1441;
    float _1455 = _1453;
    float _1457 = _1453;
    if (!_1407)
    {
        _1433 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1459 = _1433;
    float _1461 = _1459;
    float _1463 = _1459;
    if (!_1407)
    {
        _1435 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1465 = _1435;
    float _1467 = _1465;
    float _1469 = _1465;
    if (!_1407)
    {
        _1323 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1471 = _1323;
    bool _1473 = !_1407;
    float _1475 = _1471;
    float _1477 = _1471;
    if (!_1473)
    {
        bool _1479 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1481 = isnan(_884);
        bool _1483 = _1479 || _1481;
        bool _1485 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1487 = _1483 || _1485;
        if (!_1487)
        {
            float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1491 = _884 + _1489;
            float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1495 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1493;
            float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1499 = _1497 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1501 = 1.0 / _1495;
            float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1505 = _1503 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1509 = _1507 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1513 = _1511 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1517 = _1515 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1519 = _1491 * _1501;
            float _1521 = precise::clamp(_1519, 0.0, 1.0);
            float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1525 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1527 = fma(_1521, _1499, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1529 = fma(_1521, _1525, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1531 = fma(_1521, _1505, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1533 = fma(_1521, _1509, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1535 = fma(_1521, _1513, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1537 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1451 = _1531;
            _1469 = _1535;
            _1445 = _1527;
            _1463 = _1533;
            _1457 = _1529;
            _1477 = _1537;
            _1539 = true;
        }
        else
        {
            bool _1541 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1543 = isnan(_884);
            bool _1545 = _1541 || _1543;
            bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1549 = _1545 || _1547;
            if (!_1549)
            {
                _1443 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1551 = _1443;
            _1445 = _1551;
            if (!_1549)
            {
                _1449 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1553 = _1449;
            _1451 = _1553;
            if (!_1549)
            {
                _1455 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1555 = _1455;
            _1457 = _1555;
            if (!_1549)
            {
                _1461 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1557 = _1461;
            _1463 = _1557;
            if (!_1549)
            {
                _1467 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1559 = _1467;
            _1469 = _1559;
            if (!_1549)
            {
                _1475 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1561 = _1475;
            bool _1563 = !_1549;
            _1477 = _1561;
            if (!_1563)
            {
                bool _1565 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1567 = isnan(_884);
                bool _1569 = _1565 || _1567;
                bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1573 = _1569 || _1571;
                if (!_1573)
                {
                    float _1575 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1577 = _884 + _1575;
                    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1579;
                    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1585 = _1583 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1587 = 1.0 / _1581;
                    float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1591 = _1589 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1595 = _1593 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1599 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1605 = _1577 * _1587;
                    float _1607 = precise::clamp(_1605, 0.0, 1.0);
                    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1613 = fma(_1607, _1585, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1615 = fma(_1607, _1611, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1617 = fma(_1607, _1591, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1619 = fma(_1607, _1595, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1621 = fma(_1607, _1599, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1623 = fma(_1607, _1603, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1451 = _1617;
                    _1469 = _1621;
                    _1445 = _1613;
                    _1463 = _1619;
                    _1457 = _1615;
                    _1477 = _1623;
                    _1539 = true;
                }
                else
                {
                    _1451 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1469 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1445 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1463 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1457 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1477 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1539 = false;
    float _1625 = _1451;
    float _1627 = _1469;
    float _1629 = _1445;
    float _1631 = _1463;
    float _1633 = _1457;
    float _1635 = _1477;
    float _1637 = fma(_734, -0.5, 0.5);
    float _1639 = precise::clamp(_1637, 0.0, 1.0);
    float _1641 = -_1625;
    float _1643 = _1641 + _1627;
    float _1645 = _1439 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1647 = -_1629;
    float _1649 = _1647 + _1631;
    float _1651 = fma(_1639, _1643, _1625);
    out.m_85.x = 0.0;
    float _1653 = -_1633;
    float _1655 = _1653 + _1635;
    float _1657 = fma(_1639, _1649, _1629);
    float _1659 = _1651 * 0.586610972881317138671875;
    out.m_51.x = _1645;
    bool _1661 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1663 = fma(_1639, _1655, _1633);
    float _1665 = fma(_1657, 0.298911988735198974609375, _1659);
    bool _1667 = _1381 > 0.0;
    bool _1669 = isnan(_1381);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan(0.0);
    bool _1675 = _1671 || _1673;
    float _1677 = fma(_1663, 0.114477999508380889892578125, _1665);
    float _1679 = -_1677;
    float _1681 = _1657 + _1679;
    float _1683 = -_1677;
    float _1685 = _1651 + _1683;
    float _1687 = -_1677;
    float _1689 = _1663 + _1687;
    float _1691 = fma(_1681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1677);
    float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1677);
    float _1695 = fma(_1689, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1677);
    bool _1697 = !_1661;
    if (!_1697)
    {
        float _1699 = -_852;
        float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1703 = -_854;
        float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1707 = -_856;
        float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1711 = _1701 * _1701;
        float _1713 = fma(_1705, _1705, _1711);
        float _1715 = fma(_1709, _1709, _1713);
        float _1717 = sqrt(_1715);
        float _1719 = rsqrt(_1715);
        float _1721 = -_1717;
        float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1725 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1727 = precise::clamp(_1725, 0.0, 1.0);
        float _1729 = _1705 * _1719;
        float _1731 = _1701 * _1719;
        float _1733 = abs(_1727);
        float _1735 = log2(_1733);
        float _1737 = _1709 * _1719;
        float _1739 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1741 = _734 * _1731;
        float _1743 = -_1731;
        float _1745 = -_1739;
        float _1747 = fma(_1743, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1745);
        float _1749 = fma(_732, _1729, _1741);
        float _1751 = -_1737;
        float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1747);
        float _1755 = fma(_758, _1737, _1749);
        float _1757 = precise::clamp(_1755, 0.0, 1.0);
        float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1761 = _1753 + _1759;
        float _1763 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1765 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1767 = precise::clamp(_1765, 0.0, 1.0);
        float _1769 = exp2(_1763);
        float _1771 = _1769 * _1767;
        float _1773 = _1757 * _1771;
        float _1775 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1777 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1779 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _1775;
        out.m_85.y = _1777;
        out.m_85.z = _1779;
    }
    out.m_87.x = _1691;
    out.m_87.y = _1693;
    out.m_87.z = _1695;
    if (_1675)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _1781 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1781;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1539 = false;
    bool _808 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    float _118 = _116;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_124);
        out.gl_Position.z = _1840;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_106);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _114;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1909 = as_type<float>(_160);
        out.gl_Position.z = _1909;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _168 = in.m_48.x;
    float _170 = in.m_48.y;
    float _172 = in.m_48.z;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _176 = _174 != 0;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _180 = _178 != 0;
    float _182 = in.m_55.w;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _186 = _184 != 0;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _192 = _190 != 0;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _202 = in.m_59.x;
    float _204 = in.m_59.y;
    int _206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _208 = _206 != 0;
    float _210 = in.m_61.y;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _214 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _216 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _218 = in.m_59.z;
    bool _220 = _164 > 0.5;
    float _222 = -_188;
    float _224 = fma(_214, 2.0, _222);
    float _226 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _228 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _230 = _182 > 0.5;
    float _232 = fma(_216, -2.0, _212);
    float _234 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _226);
    float _236 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.083333335816860198974609375;
    float _238 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _240 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _242 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _244 = _198 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.16666667163372039794921875;
    float _248 = _198;
    bool _250 = _220;
    bool _252 = _180;
    if (_176)
    {
        float _254 = in.m_55.x;
        _248 = _254;
    }
    float _256 = _248;
    float _258 = -_236;
    float _260 = fma(_202, 18.84955596923828125, _258);
    float _262 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _242);
    float _264 = fma(_202, 31.415927886962890625, _246);
    float _266 = 0.0;
    float _268 = _210;
    if (_186)
    {
        float _270 = in.m_55.z;
        _266 = _270;
    }
    float _272 = _266;
    float _274 = _260 * 0.15915493667125701904296875;
    float _276 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _228);
    float _278 = _264 * 0.15915493667125701904296875;
    float _280 = in.m_61.x;
    float _282 = -_210;
    float _284 = _282 + 1.0;
    float _286 = _274 * 6.283185482025146484375;
    float _288 = sin(_286);
    float _290 = _202 * 6.283185482025146484375;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _294 = _220 ? _284 : _210;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _298 = _294;
    if (!_208)
    {
        float _300 = in.m_55.z;
        _296 = _300;
    }
    float _302 = _296;
    float _304 = _290 * 0.15915493667125701904296875;
    float _306 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].z, _292);
    float _308 = _278 * 6.283185482025146484375;
    float _310 = sin(_308);
    float _312 = _244 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _314 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _262);
    float _316 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _234);
    float _318 = _256;
    float _320 = 0.75;
    float _322 = _314;
    if (_176)
    {
        bool _324 = _256 > 0.5;
        _250 = _324;
    }
    bool _326 = _250;
    float _328 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _276);
    if (!_208)
    {
        _318 = _164;
    }
    float _330 = _318;
    float _332 = _304 * 6.283185482025146484375;
    float _334 = cos(_332);
    float _336 = _330;
    if (_208)
    {
        _336 = _162;
    }
    float _338 = _336;
    float _340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _218);
    float _342 = _180 ? _294 : _210;
    float _344 = -_142;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[76].x, _224);
    if (_186)
    {
        bool _348 = _272 > 0.5;
        _252 = _348;
    }
    bool _350 = _252;
    float _352 = _340 * _312;
    if (!_176)
    {
        _298 = _280;
    }
    float _354 = _298;
    float _356 = _310 + _288;
    float _358 = _304 * 6.283185482025146484375;
    float _360 = sin(_358);
    float _362 = fma(_204, 0.75, 0.25);
    float _364 = _354;
    float _366 = _362;
    if (!_176)
    {
        _320 = _354;
    }
    float _368 = _320;
    float _370 = _356 * 0.100000001490116119384765625;
    float _372 = _166 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _376 = _368;
    if (_176)
    {
        _364 = _280;
    }
    float _378 = _364;
    float _380 = fma(_370, _362, _204);
    float _382 = fma(_372, _342, -0.5);
    float _384 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].w, _374);
    float _386 = _238 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _388 = _380 + 0.4000000059604644775390625;
    float _390 = _302;
    if (!_208)
    {
        _366 = _302;
    }
    float _392 = _366;
    float _394 = _240 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _396 = _392;
    if (_208)
    {
        _396 = _164;
    }
    float _398 = _396;
    float _400 = _388 * _334;
    float _402 = _388 * _360;
    if (_208)
    {
        _390 = _164;
    }
    float _404 = _390;
    float _406 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _384);
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _400);
    float _410 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _232);
    float _412 = -_402;
    float _414 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _412);
    int _416 = as_type<int>(_404);
    if (_192)
    {
        float _418 = _230 ? _284 : _210;
        _268 = _418;
    }
    float _420 = _268;
    float _422 = _408 * _386;
    float _424 = -_410;
    float _426 = fma(_406, _382, _424);
    float _428 = _414 * _394;
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _432 = _422 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].x, _430);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[10].x, _432);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _442 = _328 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _444 = _316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _446 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[8].z, _436);
    float _448 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[10].z, _438);
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _452 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[83].z, _440);
    float _454 = _338 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _456 = _444 + _446;
    float _458 = _442 + _448;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _462 = -_450;
    float _464 = fma(_454, 2.0, _462);
    float _466 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _468 = _456 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _472 = _458 + _470;
    float _474 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[83].w, _460);
    float _476 = _434 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _478 = _468 * _468;
    float _480 = _472 * _472;
    int _482 = as_type<int>(_446);
    float _484 = _476;
    float _486 = _452;
    if (_176)
    {
        float _488 = -_378;
        float _490 = _488 + 1.0;
        _416 = as_type<int>(_490);
    }
    int _492 = _416;
    float _494 = fma(_476, _420, -0.5);
    if (_186)
    {
        float _496 = -_378;
        float _498 = _496 + 1.0;
        _482 = as_type<int>(_498);
    }
    int _500 = _482;
    float _502 = _478 + _480;
    float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_186)
    {
        _484 = _378;
    }
    float _506 = _484;
    float _508 = _422 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _510 = _506;
    if (_176)
    {
        float _512 = _326 ? as_type<float>(_492) : _378;
        _376 = _512;
    }
    float _514 = _376;
    float _516 = _398 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_186)
    {
        float _518 = _350 ? as_type<float>(_500) : _378;
        _510 = _518;
    }
    float _520 = _510;
    float _522 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[9].x, _508);
    float _524 = in.m_63.x;
    float _526 = in.m_63.y;
    float _528 = in.m_63.z;
    float _530 = sqrt(_502);
    bool _532 = _400 != 0.0;
    bool _534 = isnan(_400);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _452);
    float _544 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[9].z, _522);
    bool _546 = _402 == 0.0;
    bool _548 = !_540;
    bool _550 = _546 && _548;
    float _552 = _314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _556 = _218 == 0.0;
    bool _558 = _556 && _550;
    float _560 = _504 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _562 = _200 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _564 = fma(_516, -2.0, _554);
    float _566 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _474);
    float _568 = fma(_560, _514, -0.5);
    float _570 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _306);
    bool _572 = _530 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _574 = -_142;
    float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[81].x, _464);
    float _578 = fma(_562, _520, -0.5);
    float _580 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _564);
    float _582 = fma(_570, _568, _346);
    float _584 = _552 + _544;
    float _586 = fma(_542, _578, _576);
    float _588 = -_580;
    float _590 = fma(_566, _494, _588);
    float _592 = _526;
    float _594 = _542;
    float _596 = _584;
    float _598 = _524;
    float _600 = _528;
    float _602 = _586;
    if (!_558)
    {
        float _604 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _592 = _604;
    }
    float _606 = _592;
    if (!_572)
    {
        _322 = _480;
    }
    float _608 = _322;
    float _610 = _608;
    if (!_572)
    {
        _144 = _478;
    }
    float _612 = _144;
    float _614 = _612;
    if (!_572)
    {
        _486 = _456;
    }
    float _616 = _486;
    float _618 = _616;
    if (!_572)
    {
        _594 = _458;
    }
    float _620 = _594;
    bool _622 = !_572;
    float _624 = _620;
    if (!_622)
    {
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _630 = _530 + _628;
        float _632 = rsqrt(_502);
        float _634 = _630 * _626;
        float _636 = _584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _638 = _634 * 0.15915493667125701904296875;
        float _640 = _638 * 6.283185482025146484375;
        float _642 = sin(_640);
        float _644 = _638 * 6.283185482025146484375;
        float _646 = cos(_644);
        float _648 = fma(_642, _636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _650 = _632 * _648;
        float _652 = _646 + (-1.0);
        float _654 = fma(_468, _650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _656 = fma(_472, _650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _658 = _652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _662 = _654 + _660;
        float _664 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _666 = _656 + _664;
        float _668 = fma(_584, _646, _658);
        float _670 = _662 * _662;
        float _672 = _666 * _666;
        _596 = _668;
        _614 = _670;
        _610 = _672;
        _618 = _654;
        _624 = _656;
    }
    float _674 = _596;
    float _676 = _614;
    float _678 = _610;
    float _680 = _618;
    float _682 = _624;
    float _684 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _686 = _674 + _684;
    float _688 = in.m_65.w;
    float _690 = _680;
    if (!_558)
    {
        float _692 = -_402;
        float _694 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _598 = _694;
    }
    float _696 = _598;
    float _698 = _606 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _700 = fma(_686, _686, _676);
    float _702 = _606 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_558)
    {
        float _704 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _600 = _704;
    }
    float _706 = _600;
    float _708 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[9].x, _698);
    float _710 = _700 + _678;
    float _712 = _606 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _714 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[8].x, _702);
    float _716 = sqrt(_710);
    float _718 = fma(_696, (*spvDescriptorSet0.vp_c10)._m0[10].x, _712);
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _732 = fma(_706, (*spvDescriptorSet0.vp_c10)._m0[8].z, _714);
    float _734 = fma(_706, (*spvDescriptorSet0.vp_c10)._m0[9].z, _708);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _738 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _426 + 0.5;
    float _752 = _582 + 0.5;
    float _754 = _586 + 0.5;
    float _756 = _590 + 0.5;
    float _758 = fma(_706, (*spvDescriptorSet0.vp_c10)._m0[10].z, _718);
    out.m_67.w = _688;
    bool _760 = _716 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _762 = isnan(_716);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _768 = _764 || _766;
    out.m_69.x = _738;
    out.m_69.y = _740;
    out.m_69.z = _742;
    out.m_69.w = _736;
    out.m_71.x = _744;
    out.m_71.y = _746;
    out.m_71.z = _748;
    out.m_73.x = _752;
    out.m_73.y = _750;
    out.m_73.z = _754;
    out.m_73.w = _756;
    float _770 = _752;
    float _772 = _750;
    if (!_768)
    {
        _602 = 1.0;
    }
    float _774 = _602;
    out.m_75.x = _732;
    out.m_75.y = _734;
    out.m_75.z = _758;
    bool _776 = !_768;
    float _778 = _774;
    if (!_776)
    {
        bool _780 = _716 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _782 = isnan(_716);
        bool _784 = _780 || _782;
        bool _786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _788 = _784 || _786;
        if (!_788)
        {
            float _790 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _792 = _716 + _790;
            float _794 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _796 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _794;
            float _798 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _800 = _798 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _802 = 1.0 / _796;
            float _804 = _792 * _802;
            float _806 = fma(_804, _800, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _778 = _806;
            _808 = true;
        }
        else
        {
            bool _810 = _716 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _812 = isnan(_716);
            bool _814 = _810 || _812;
            bool _816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _818 = _814 || _816;
            if (!_818)
            {
                float _820 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _822 = _716 + _820;
                float _824 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _826 = _824 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _828 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _830 = _828 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _832 = 1.0 / _826;
                float _834 = _822 * _832;
                float _836 = fma(_834, _830, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _778 = _836;
                _808 = true;
            }
            else
            {
                _778 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _808 = false;
    float _838 = _778;
    float _840 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _842 = _674 + _840;
    float _844 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _846 = _680 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _850 = _682 + _848;
    float _852 = fma(_842, _838, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _854 = fma(_846, _838, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _856 = fma(_850, _838, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _852 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = _854 + _862;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _868 = _856 + _866;
    float _870 = _860 * _860;
    float _872 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _874 = fma(_864, _864, _870);
    float _876 = fma(_444, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _878 = fma(_868, _868, _874);
    float _880 = floor(_876);
    float _882 = rsqrt(_878);
    float _884 = sqrt(_878);
    float _886 = _882 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _888 = _864 * _886;
    float _890 = _868 * _886;
    float _892 = _888 * _888;
    float _894 = _890 * _890;
    float _896 = _892 + _894;
    float _898 = sqrt(_896);
    bool _900 = _898 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _904 = _898 + _902;
    float _906 = _882;
    float _908 = _904;
    float _910 = _860;
    if (_900)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _912;
    }
    float _914 = _906;
    if (_900)
    {
        float _916 = rsqrt(_896);
        _770 = _916;
    }
    float _918 = _770;
    float _920 = _918;
    if (_900)
    {
        float _922 = _904 * _914;
        _908 = _922;
    }
    float _924 = _908;
    if (_900)
    {
        float _926 = _924 * 0.15915493667125701904296875;
        _772 = _926;
    }
    float _928 = _772;
    float _930 = _914;
    if (_900)
    {
        float _932 = _928 * 6.283185482025146484375;
        float _934 = sin(_932);
        _930 = _934;
    }
    float _936 = _930;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _940 = precise::max(0.0, _938);
    float _942 = _868;
    float _944 = _940;
    if (_900)
    {
        float _946 = _928 * 6.283185482025146484375;
        float _948 = cos(_946);
        _942 = _948;
    }
    float _950 = _942;
    float _952 = -_886;
    float _954 = -_940;
    float _956 = fma(_860, _952, _954);
    float _958 = _956;
    if (_900)
    {
        float _960 = _956 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _960;
    }
    float _962 = _944;
    float _964 = _852 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _966 = _936;
    float _968 = _962;
    if (_900)
    {
        float _970 = fma(_936, _962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _966 = _970;
    }
    float _972 = _966;
    float _974 = _972;
    if (_900)
    {
        float _976 = _950 + (-1.0);
        _968 = _976;
    }
    float _978 = _968;
    float _980 = _978;
    if (_900)
    {
        float _982 = _918 * _972;
        _690 = _982;
    }
    float _984 = _690;
    if (!_900)
    {
        _974 = _888;
    }
    float _986 = _974;
    float _988 = _986;
    if (_900)
    {
        float _990 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _990;
    }
    float _992 = _910;
    float _994 = _992;
    if (_900)
    {
        float _996 = _888 * _984;
        _988 = _996;
    }
    float _998 = _988;
    if (!_900)
    {
        _920 = _890;
    }
    float _1000 = _920;
    float _1002 = _1000;
    if (_900)
    {
        float _1004 = _890 * _984;
        _1002 = _1004;
    }
    float _1006 = _1002;
    if (!_900)
    {
        _980 = _892;
    }
    float _1008 = _980;
    float _1010 = _1008;
    if (_900)
    {
        float _1012 = fma(_956, _950, _992);
        _958 = _1012;
    }
    float _1014 = _958;
    if (_900)
    {
        float _1016 = _998 * _998;
        _1010 = _1016;
    }
    float _1018 = _1010;
    if (!_900)
    {
        _994 = _894;
    }
    float _1020 = _994;
    float _1022 = _1020;
    if (_900)
    {
        float _1024 = _1006 * _1006;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _852 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1030 = fma(_1014, _1014, _1018);
    float _1032 = _852 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1034 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1028);
    float _1036 = _1030 + _1026;
    float _1038 = _852 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1040 = fma(_442, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1042 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1032);
    float _1044 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[0].x, _964);
    float _1046 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1034);
    float _1048 = rsqrt(_1036);
    float _1050 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1042);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1054 = fma(_884, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1052);
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1044);
    float _1060 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1062 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1064 = -_1056;
    float _1066 = _1064 + 1.0;
    float _1068 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1038);
    float _1070 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1072 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1076 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1068);
    float _1078 = abs(_1066);
    float _1080 = log2(_1078);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1072);
    float _1084 = -_1074;
    float _1086 = fma(_1084, _872, 1.0);
    float _1088 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1090 = _1048 * _1006;
    float _1092 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1082);
    float _1094 = _1048 * _998;
    float _1096 = floor(_1040);
    float _1098 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1092);
    float _1100 = _1048 * _1014;
    float _1102 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1104 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1106 = -_880;
    float _1108 = _876 + _1106;
    float _1110 = -_1102;
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1110);
    float _1114 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1116 = log2(_1086);
    float _1118 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1104);
    float _1120 = -_1090;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1112);
    float _1124 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1126 = fma(_1122, -0.5, 0.5);
    float _1128 = fma(_1122, 0.5, 0.5);
    float _1130 = exp2(_1114);
    float _1132 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1124);
    float _1134 = -_1096;
    float _1136 = _1040 + _1134;
    float _1138 = _1100 + 1.0;
    float _1140 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1118);
    float _1142 = 1.0 / _1098;
    float _1144 = fma(_1128, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1146 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1132);
    float _1148 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1140);
    float _1150 = _1116 * 0.693147182464599609375;
    float _1152 = fma(_1128, _1144, -0.212114393711090087890625);
    float _1154 = sqrt(_1126);
    float _1156 = -_1100;
    float _1158 = fma(_1130, _1138, _1156);
    float _1160 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1146);
    float _1162 = fma(_1128, _1152, 1.570728778839111328125);
    float _1164 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1166 = fma(_1158, 0.5, 0.5);
    float _1168 = _1148 * _1142;
    float _1170 = _1160 * _1142;
    float _1172 = fma(_1168, 0.5, 0.5);
    float _1174 = fma(_1170, -0.5, 0.5);
    float _1176 = _1154 * 0.636619746685028076171875;
    float2 _3668 = float2(_1108, _1136);
    float _1178 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3668, float2(0.0), isnan(_3668)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3668, float2(0.0), isnan(_3668)), level(0.0)).x;
    float _1180 = -_1162;
    float _1182 = fma(_1176, _1180, 1.0);
    float3 _3684 = float3(_1172, _1174, _1164);
    float _1184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3684, float3(0.0), isnan(_3684)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3684, float3(0.0), isnan(_3684)), level(0.0)).x;
    float3 _3695 = float3(_1172, _1174, _1164);
    float4 _1187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3695, float3(0.0), isnan(_3695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3695, float3(0.0), isnan(_3695)), level(0.0)).xyzw;
    float _1189 = _1187.x;
    float _1191 = _1187.y;
    float _1193 = _1187.z;
    float _1195 = _1187.w;
    float2 _3711 = float2(_1182, _1166);
    float3 _1199 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3711, float2(0.0), isnan(_3711)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3711, float2(0.0), isnan(_3711)), level(0.0)).xyz;
    float _1201 = _1199.x;
    float _1203 = _1199.y;
    float _1205 = _1199.z;
    float _1207 = _552 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1209 = _552 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1211 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1213 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1207);
    float _1215 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1209);
    float _1217 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1211);
    float _1219 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1213);
    float _1221 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1215);
    float _1223 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1217);
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1227 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1229 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1223);
    float _1231 = 1.0 / _1225;
    float _1233 = _1227 + _1225;
    out.gl_Position.x = _1148;
    out.gl_Position.y = _1160;
    out.gl_Position.z = _1229;
    out.gl_Position.w = _1098;
    float _1235 = _1233 * _1231;
    float _1237 = _1235 * 0.5;
    float _1239 = _1148 + _1098;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1243 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1241);
    float _1245 = _1239 * 0.5;
    float _1247 = 1.0 / _1243;
    float _1249 = in.m_77.x;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1253 = _1247 * _1251;
    float _1255 = abs(_1253);
    float _1257 = log2(_1255);
    float _1259 = _1257 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1261 = exp2(_1259);
    float _1263 = fma(_1261, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1265 = precise::clamp(_1263, 0.0, 1.0);
    float _1267 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1269 = _1098 * 0.5;
    float _1271 = fma(_1265, -2.0, 3.0);
    float _1273 = _1265 * _1265;
    bool _1275 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(0.5);
    bool _1283 = _1279 || _1281;
    float _1285 = exp2(_1267);
    bool _1287 = _1253 <= 8000.0;
    bool _1289 = isnan(_1253);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(8000.0);
    bool _1295 = _1291 || _1293;
    float _1297 = float(_1295);
    float _1299 = _1273 * _1271;
    float _1301 = fma(_1160, -0.5, _1269);
    float _1303 = -_1299;
    float _1305 = _1303 + 1.0;
    float _1307 = fma(_1305, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1299);
    float _1309 = _1297 * _1307;
    float _1311 = _1229 + _1098;
    float _1313 = _1311 * 0.5;
    float _1315 = _1311;
    float _1317 = _1098;
    float _1319 = _1301;
    float _1321 = _1313;
    float _1323 = _1253;
    if (_1283)
    {
        _1315 = 1.0;
    }
    float _1325 = _1315;
    float _1327 = _1325;
    if (!_1283)
    {
        float _1329 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1331 = _1329 * 0.15915493667125701904296875;
        float _1333 = _1331 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1339 = _1337 * 0.15915493667125701904296875;
        float _1341 = _1331 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = 1.0 / _1335;
        float _1347 = _1339 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = _1339 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = _1349 * _1351;
        float _1359 = 1.0 / _1357;
        float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1361;
        float _1365 = 1.0 / _1363;
        float _1367 = _1355 * _1359;
        float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1371 = fma(_1253, _1367, _1369);
        float _1373 = _1371 * _1365;
        float _1375 = precise::clamp(_1373, 0.0, 1.0);
        float _1377 = -_1375;
        float _1379 = _1377 + 1.0;
        _1327 = _1379;
    }
    float _1381 = _1327;
    float _1383 = -_1285;
    float _1385 = _1383 + 1.0;
    float _1387 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1389 = -_1178;
    float _1391 = _1389 + 1.0;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _1245;
    out.m_79.y = _1301;
    out.m_79.z = _1313;
    out.m_79.w = _1098;
    float _1395 = _1391 * _1387;
    float _1397 = precise::clamp(_1395, 0.0, 1.0);
    bool _1399 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1401 = isnan(_884);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1407 = _1403 || _1405;
    float _1409 = _1393 * _1184;
    float _1411 = -_1397;
    float _1413 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1415 = _1195 * _1409;
    float _1417 = _1205 * _1409;
    float _1419 = _1413 * _1249;
    float _1421 = fma(_1201, _1415, _1189);
    float _1423 = fma(_1203, _1415, _1191);
    float _1425 = _1419 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1427 = -_1393;
    float _1429 = _1427 + 1.0;
    float _1431 = fma(_1195, _1417, _1193);
    float _1433 = _1429;
    float _1435 = _1419;
    if (!_1407)
    {
        _1317 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1437 = _1317;
    float _1439 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1441 = _1195 * _1429;
    out.m_81.x = _1425;
    float _1443 = _1437;
    float _1445 = _1437;
    if (!_1407)
    {
        _1319 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1447 = _1319;
    float _1449 = _1447;
    float _1451 = _1447;
    if (!_1407)
    {
        _1321 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1453 = _1321;
    out.m_83.x = _1421;
    out.m_83.y = _1423;
    out.m_83.z = _1431;
    out.m_83.w = _1441;
    float _1455 = _1453;
    float _1457 = _1453;
    if (!_1407)
    {
        _1433 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1459 = _1433;
    float _1461 = _1459;
    float _1463 = _1459;
    if (!_1407)
    {
        _1435 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1465 = _1435;
    float _1467 = _1465;
    float _1469 = _1465;
    if (!_1407)
    {
        _1323 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1471 = _1323;
    bool _1473 = !_1407;
    float _1475 = _1471;
    float _1477 = _1471;
    if (!_1473)
    {
        bool _1479 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1481 = isnan(_884);
        bool _1483 = _1479 || _1481;
        bool _1485 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1487 = _1483 || _1485;
        if (!_1487)
        {
            float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1491 = _884 + _1489;
            float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1495 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1493;
            float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1499 = _1497 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1501 = 1.0 / _1495;
            float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1505 = _1503 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1507 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1509 = _1507 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1513 = _1511 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1517 = _1515 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1519 = _1491 * _1501;
            float _1521 = precise::clamp(_1519, 0.0, 1.0);
            float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1525 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1527 = fma(_1521, _1499, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1529 = fma(_1521, _1525, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1531 = fma(_1521, _1505, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1533 = fma(_1521, _1509, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1535 = fma(_1521, _1513, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1537 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1451 = _1531;
            _1469 = _1535;
            _1445 = _1527;
            _1463 = _1533;
            _1457 = _1529;
            _1477 = _1537;
            _1539 = true;
        }
        else
        {
            bool _1541 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1543 = isnan(_884);
            bool _1545 = _1541 || _1543;
            bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1549 = _1545 || _1547;
            if (!_1549)
            {
                _1443 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1551 = _1443;
            _1445 = _1551;
            if (!_1549)
            {
                _1449 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1553 = _1449;
            _1451 = _1553;
            if (!_1549)
            {
                _1455 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1555 = _1455;
            _1457 = _1555;
            if (!_1549)
            {
                _1461 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1557 = _1461;
            _1463 = _1557;
            if (!_1549)
            {
                _1467 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1559 = _1467;
            _1469 = _1559;
            if (!_1549)
            {
                _1475 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1561 = _1475;
            bool _1563 = !_1549;
            _1477 = _1561;
            if (!_1563)
            {
                bool _1565 = _884 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1567 = isnan(_884);
                bool _1569 = _1565 || _1567;
                bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1573 = _1569 || _1571;
                if (!_1573)
                {
                    float _1575 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1577 = _884 + _1575;
                    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1579;
                    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1585 = _1583 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1587 = 1.0 / _1581;
                    float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1591 = _1589 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1595 = _1593 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1599 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1605 = _1577 * _1587;
                    float _1607 = precise::clamp(_1605, 0.0, 1.0);
                    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1613 = fma(_1607, _1585, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1615 = fma(_1607, _1611, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1617 = fma(_1607, _1591, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1619 = fma(_1607, _1595, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1621 = fma(_1607, _1599, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1623 = fma(_1607, _1603, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1451 = _1617;
                    _1469 = _1621;
                    _1445 = _1613;
                    _1463 = _1619;
                    _1457 = _1615;
                    _1477 = _1623;
                    _1539 = true;
                }
                else
                {
                    _1451 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1469 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1445 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1463 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1457 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1477 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1539 = false;
    float _1625 = _1451;
    float _1627 = _1469;
    float _1629 = _1445;
    float _1631 = _1463;
    float _1633 = _1457;
    float _1635 = _1477;
    float _1637 = fma(_734, -0.5, 0.5);
    float _1639 = precise::clamp(_1637, 0.0, 1.0);
    float _1641 = -_1625;
    float _1643 = _1641 + _1627;
    float _1645 = _1439 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1647 = -_1629;
    float _1649 = _1647 + _1631;
    float _1651 = fma(_1639, _1643, _1625);
    out.m_85.x = 0.0;
    float _1653 = -_1633;
    float _1655 = _1653 + _1635;
    float _1657 = fma(_1639, _1649, _1629);
    float _1659 = _1651 * 0.586610972881317138671875;
    out.m_51.x = _1645;
    bool _1661 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1663 = fma(_1639, _1655, _1633);
    float _1665 = fma(_1657, 0.298911988735198974609375, _1659);
    bool _1667 = _1381 > 0.0;
    bool _1669 = isnan(_1381);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan(0.0);
    bool _1675 = _1671 || _1673;
    float _1677 = fma(_1663, 0.114477999508380889892578125, _1665);
    float _1679 = -_1677;
    float _1681 = _1657 + _1679;
    float _1683 = -_1677;
    float _1685 = _1651 + _1683;
    float _1687 = -_1677;
    float _1689 = _1663 + _1687;
    float _1691 = fma(_1681, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1677);
    float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1677);
    float _1695 = fma(_1689, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1677);
    bool _1697 = !_1661;
    if (!_1697)
    {
        float _1699 = -_852;
        float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1703 = -_854;
        float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1707 = -_856;
        float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1711 = _1701 * _1701;
        float _1713 = fma(_1705, _1705, _1711);
        float _1715 = fma(_1709, _1709, _1713);
        float _1717 = sqrt(_1715);
        float _1719 = rsqrt(_1715);
        float _1721 = -_1717;
        float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1725 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1727 = precise::clamp(_1725, 0.0, 1.0);
        float _1729 = _1705 * _1719;
        float _1731 = _1701 * _1719;
        float _1733 = abs(_1727);
        float _1735 = log2(_1733);
        float _1737 = _1709 * _1719;
        float _1739 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1741 = _734 * _1731;
        float _1743 = -_1731;
        float _1745 = -_1739;
        float _1747 = fma(_1743, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1745);
        float _1749 = fma(_732, _1729, _1741);
        float _1751 = -_1737;
        float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1747);
        float _1755 = fma(_758, _1737, _1749);
        float _1757 = precise::clamp(_1755, 0.0, 1.0);
        float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1761 = _1753 + _1759;
        float _1763 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1765 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1767 = precise::clamp(_1765, 0.0, 1.0);
        float _1769 = exp2(_1763);
        float _1771 = _1769 * _1767;
        float _1773 = _1757 * _1771;
        float _1775 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1777 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1779 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _1775;
        out.m_85.y = _1777;
        out.m_85.z = _1779;
    }
    out.m_87.x = _1691;
    out.m_87.y = _1693;
    out.m_87.z = _1695;
    if (_1675)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _1781 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1781;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

