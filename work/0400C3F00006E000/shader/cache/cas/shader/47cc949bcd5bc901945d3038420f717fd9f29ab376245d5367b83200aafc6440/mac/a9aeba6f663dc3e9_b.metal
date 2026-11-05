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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_69 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_81 [[user(locn13)]];
    float4 m_65 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _870 = false;
    bool _762 = false;
    bool _626 = false;
    bool _464 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2349 = as_type<float>(_120);
        out.gl_Position.z = _2349;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2413 = as_type<float>(_154);
        out.gl_Position.z = _2413;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = 1.0 / _126;
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _160 = _130 * _156;
    bool _162 = !_158;
    float _180;
    if (!_162)
    {
        float _164 = in.m_51.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        _180 = _160;
    }
    _182 = false;
    float _184 = _180;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _188 = _184 + _186;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _192 = _184 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _196 = _184 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = 1.0 / _200;
    float _216 = 1.0 / _204;
    bool _218 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _220 = 1.0 / _212;
    float _222 = _188 * _214;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _226 = _184 + _224;
    float _228 = 1.0 / _208;
    float _230 = _192 * _216;
    bool _232 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _234 = isnan(_184);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _244;
    float _248 = -_242;
    float _250 = _248 + 1.0;
    float _252 = _226 * _220;
    bool _254 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _256 = isnan(_184);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = fma(_246, _222, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _268 = _264 * _250;
    float _270 = -_264;
    float _272 = _270 + 1.0;
    float _274 = _196 * _228;
    bool _276 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _278 = isnan(_184);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    bool _296 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_184);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = _286 * _272;
    float _310 = -_286;
    float _312 = _310 + 1.0;
    float _314 = fma(_290, _222, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _316 = fma(_294, _222, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _318 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_184);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_306;
    float _332 = _330 + 1.0;
    float _334 = _306 * _312;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = _328 * _332;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = fma(_338, _230, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _352 = -_328;
    float _354 = _352 + 1.0;
    float _356 = _314 * _344;
    float _358 = _316 * _344;
    float _360 = _266 * _344;
    float _362 = in.m_53.x;
    float _364 = in.m_53.y;
    float _366 = in.m_53.z;
    float _368 = fma(_342, _230, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _370 = fma(_348, _230, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _372 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].x, _356);
    float _374 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].y, _358);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].z, _360);
    float _390 = fma(_350, _334, _372);
    float _392 = fma(_368, _334, _374);
    float _394 = fma(_378, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _396 = fma(_382, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_386, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _412 = fma(_370, _334, _388);
    float _414 = fma(_402, _252, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _416 = fma(_406, _252, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _418 = fma(_410, _252, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _420 = fma(_394, _308, _390);
    float _422 = fma(_396, _308, _392);
    float _424 = fma(_398, _308, _412);
    float _426 = fma(_414, _268, _420);
    float _428 = fma(_416, _268, _422);
    float _430 = fma(_418, _268, _424);
    float _432 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[147].x, _426);
    float _434 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[147].y, _428);
    float _436 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[147].z, _430);
    float _438 = _432 * _362;
    float _440 = _434 * _364;
    float _442 = _436 * _366;
    bool _444 = !_218;
    float _462;
    if (!_444)
    {
        float _446 = in.m_51.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        _462 = _160;
    }
    _464 = false;
    float _466 = _462;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = _466 + _468;
    bool _472 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_466);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _466 + _484;
    bool _488 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _490 = isnan(_466);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _508 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _510 = isnan(_466);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_482;
    float _522 = _520 + 1.0;
    float _524 = 1.0 / _506;
    float _526 = _518 * _522;
    float _528 = -_518;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _532;
    bool _536 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _538 = 1.0 / _502;
    float _540 = _498 * _530;
    float _542 = -_498;
    float _544 = _542 + 1.0;
    float _546 = _486 * _524;
    float _548 = _470 * _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _554;
    float _558 = fma(_534, _548, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _560 = fma(_552, _548, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _562 = fma(_556, _548, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _564 = _558 * _540;
    float _566 = _560 * _540;
    float _568 = _562 * _540;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _582 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].x, _564);
    float _584 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].y, _566);
    float _586 = fma(_572, _546, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _588 = fma(_576, _546, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _590 = fma(_580, _546, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _592 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].z, _568);
    float _594 = fma(_586, _526, _582);
    float _596 = fma(_588, _526, _584);
    float _598 = fma(_590, _526, _592);
    float _600 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[109].x, _594);
    float _602 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[109].y, _596);
    float _604 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[109].z, _598);
    bool _606 = !_536;
    float _624;
    if (!_606)
    {
        float _608 = in.m_51.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        _624 = _160;
    }
    _626 = false;
    float _628 = _624;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _628 + _630;
    float _634 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _640 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _642 = isnan(_628);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _656 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _658 = isnan(_628);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _668;
    bool _672 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = isnan(_628);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = 1.0 / _638;
    float _686 = -_650;
    float _688 = _686 + 1.0;
    bool _690 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _692 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _694 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _696 = _666 * _688;
    float _698 = -_666;
    float _700 = _698 + 1.0;
    float _702 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = 1.0 / _654;
    float _706 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _670 * _684;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _716 = fma(_710, _632, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _718 = _714 * _704;
    float _720 = _716 * _696;
    float _722 = -_682;
    float _724 = _722 + 1.0;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = _628 + _726;
    float _730 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[115].x, _720);
    float _732 = _650 * _724;
    float _734 = fma(_718, _728, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _736 = fma(_734, _732, _730);
    float _738 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[117].x, _736);
    float _740 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _742 = !_690;
    float _760;
    if (!_742)
    {
        float _744 = in.m_51.x;
        float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _748 = _744 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _752 = _750 * _746;
        float _754 = floor(_752);
        float _756 = -_754;
        float _758 = _752 + _756;
        _760 = _758;
        _762 = true;
    }
    else
    {
        _760 = _160;
    }
    _762 = false;
    float _764 = _760;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = _764 + _766;
    bool _770 = _764 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _772 = isnan(_764);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _782;
    bool _786 = _764 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _788 = isnan(_764);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = -_780;
    float _800 = _798 + 1.0;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _802;
    float _806 = 1.0 / _784;
    bool _808 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _810 = _796 * _800;
    float _812 = -_796;
    float _814 = _812 + 1.0;
    float _816 = _768 * _806;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _818;
    float _822 = fma(_804, _816, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _824;
    float _828 = fma(_820, _816, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _830 = _822 * _810;
    float _832 = fma(_826, _816, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _834 = _828 * _810;
    float _836 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[123].x, _830);
    float _838 = _832 * _810;
    float _840 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[123].z, _834);
    float _842 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[124].x, _836);
    float _844 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[123].y, _838);
    float _846 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[124].y, _844);
    float _848 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[124].z, _840);
    bool _850 = !_808;
    float _868;
    if (!_850)
    {
        float _852 = in.m_51.x;
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _856 = _852 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _858 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _860 = _858 * _854;
        float _862 = floor(_860);
        float _864 = -_862;
        float _866 = _860 + _864;
        _868 = _866;
        _870 = true;
    }
    else
    {
        _868 = _160;
    }
    _870 = false;
    float _872 = _868;
    float _874 = in.m_44.x;
    float _876 = in.m_44.y;
    float _878 = in.m_44.z;
    float _880 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _882 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _884 = in.m_55.x;
    float _886 = in.m_55.y;
    float _888 = in.m_55.z;
    float _890 = _880 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _892 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _894 = in.m_57.y;
    float _896 = _876 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _898 = _876 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _900 = _876 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _902 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[5].x, _896);
    float _904 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[4].x, _898);
    float _906 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[6].x, _900);
    float _908 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[5].z, _902);
    float _910 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[4].z, _904);
    float _912 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[6].z, _906);
    float _914 = -_894;
    float _916 = _914 + 1.0;
    float _918 = _908 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _920 = _910 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _922 = _912 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _926 = _918 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _930 = _920 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _934 = _922 + _932;
    float _936 = _926 * _926;
    float _938 = fma(_930, _930, _936);
    float _940 = fma(_934, _934, _938);
    float _942 = sqrt(_940);
    float _944 = rsqrt(_940);
    float _946 = _942 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _948 = precise::min(_890, _946);
    float _950 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _952 = _944 * _948;
    float _954 = _926 * _952;
    float _956 = _930 * _952;
    float _958 = _934 * _952;
    float _960 = -_954;
    float _962 = _926 + _960;
    float _964 = -_956;
    float _966 = _930 + _964;
    float _968 = -_958;
    float _970 = _934 + _968;
    float _972 = _962 * _962;
    float _974 = fma(_966, _966, _972);
    float _976 = fma(_970, _970, _974);
    float _978 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _950);
    float _980 = sqrt(_976);
    float _982 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _978);
    bool _984 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _986 = isnan(0.5);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _992 = _988 || _990;
    bool _994 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _996 = isnan(0.5);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1002 = _998 || _1000;
    float _1004 = rsqrt(_982);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    float _1008 = _944 * _980;
    float _1010 = _882 * _1008;
    float _1012 = _880 * _1008;
    float _1014 = _892 * _1008;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _884);
    float _1018 = _1010 * _1006;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _888);
    float _1022 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1024 = _1012 * _1016;
    float _1026 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1028 = _1014 * _1020;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1032 = _1022 * _1022;
    float _1034 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1026);
    float _1036 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1030);
    float _1038 = -_1032;
    float _1040 = fma(_1038, _1032, 1.0);
    float _1042 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1034);
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1036);
    float _1046 = _916 * _1040;
    float _1048 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1050 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1052 = _1046 * 0.800000011920928955078125;
    float _1054 = _922 + _1048;
    float _1056 = _160 + 0.20000000298023223876953125;
    float _1058 = _920 + _1050;
    float _1060 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1062 = _1054 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1066 = _1058 + _1064;
    float _1068 = _1062 * _1052;
    float _1070 = _1066 * _1052;
    float _1072 = fma(_1068, _1056, _1054);
    float _1074 = -_958;
    float _1076 = _922 + _1074;
    float _1078 = fma(_1070, _1056, _1058);
    float _1080 = -_954;
    float _1082 = _918 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1086 = _1072 + _1084;
    float _1088 = -_956;
    float _1090 = _920 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1094 = _1078 + _1092;
    float _1096 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1098 = _1086 * _1086;
    float _1100 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1096);
    float _1102 = fma(_1094, _1094, _1098);
    float _1104 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1106 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1100);
    float _1108 = sqrt(_1102);
    float _1110 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1104);
    float _1112 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1114 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1116 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1110);
    float _1118 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1112);
    float _1120 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1122 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1118);
    float _1124 = 1.0 / _1120;
    float _1126 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1128 = _1114 + _1120;
    bool _1130 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = _918 + _1126;
    float _1134 = _1114;
    float _1136 = _1018;
    float _1138 = _1078;
    float _1140 = _1112;
    float _1142 = _954;
    float _1144 = _1072;
    float _1146 = _894;
    if (!_1130)
    {
        _1134 = _1078;
    }
    float _1148 = _1134;
    float _1150 = _1148;
    if (!_1130)
    {
        _1136 = _1072;
    }
    float _1152 = _1136;
    float _1154 = _1152;
    if (!_1130)
    {
        _1138 = _1132;
    }
    float _1156 = _1138;
    bool _1158 = !_1130;
    float _1160 = _1156;
    if (!_1158)
    {
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1166 = _1108 + _1164;
        float _1168 = _1132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = rsqrt(_1102);
        float _1172 = _1166 * _1162;
        float _1174 = _1172 * 0.15915493667125701904296875;
        float _1176 = _1174 * 6.283185482025146484375;
        float _1178 = sin(_1176);
        float _1180 = _1174 * 6.283185482025146484375;
        float _1182 = cos(_1180);
        float _1184 = fma(_1178, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1186 = _1170 * _1184;
        float _1188 = _1182 + (-1.0);
        float _1190 = fma(_1094, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1192 = fma(_1086, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1194 = _1188 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = fma(_1132, _1182, _1194);
        _1150 = _1190;
        _1160 = _1196;
        _1154 = _1192;
        _1140 = _1194;
    }
    float _1198 = _1150;
    float _1200 = _1160;
    float _1202 = _1154;
    float _1204 = _1140;
    float _1206 = -_956;
    float _1208 = _1206 + _1198;
    float _1210 = -_954;
    float _1212 = _1210 + _1200;
    float _1214 = -_958;
    float _1216 = _1214 + _1202;
    float _1218 = _1128 * _1124;
    float _1220 = _1218 * 0.5;
    float _1222 = _1204;
    float _1224 = _1200;
    float _1226 = _1212;
    float _1228 = _1216;
    float _1230 = _1198;
    if (_1002)
    {
        _1222 = 1.0;
    }
    float _1232 = _1222;
    float _1234 = _1232;
    if (_992)
    {
        _1142 = _1208;
    }
    float _1236 = _1142;
    float _1238 = _1236;
    if (!_992)
    {
        float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1242 = _1082 + _1240;
        float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1246 = _1090 + _1244;
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = -_920;
        float _1252 = _1250 + _1198;
        float _1254 = _1242 * _1242;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1258 = _1076 + _1256;
        float _1260 = -_918;
        float _1262 = _1260 + _1200;
        float _1264 = -_922;
        float _1266 = _1264 + _1202;
        float _1268 = fma(_1246, _1246, _1254);
        float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1272 = fma(_1258, _1258, _1268);
        float _1274 = sqrt(_1272);
        float _1276 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1278 = precise::min(_1274, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1280 = _1278 * _1270;
        float _1282 = _1276 * _1280;
        float _1284 = fma(_1252, _1282, _1090);
        float _1286 = fma(_1262, _1282, _1082);
        float _1288 = fma(_1266, _1282, _1076);
        _1224 = _1262;
        _1226 = _1286;
        _1238 = _1284;
        _1228 = _1288;
        _1230 = _1252;
    }
    float _1290 = _1224;
    float _1292 = _1226;
    float _1294 = _1238;
    float _1296 = _1228;
    float _1298 = _1230;
    float _1300 = _1290;
    float _1302 = _1298;
    if (!_1002)
    {
        float _1304 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1306 = _1304 * 0.15915493667125701904296875;
        float _1308 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1312 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1310);
        float _1314 = _1306 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = _1308 * 0.15915493667125701904296875;
        float _1320 = _1306 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = 1.0 / _1316;
        float _1326 = _1318 * 6.283185482025146484375;
        float _1328 = cos(_1326);
        float _1330 = _1322 * _1324;
        float _1332 = _1318 * 6.283185482025146484375;
        float _1334 = sin(_1332);
        float _1336 = _1328 * _1330;
        float _1338 = 1.0 / _1312;
        float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1342 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1340;
        float _1344 = 1.0 / _1336;
        float _1346 = 1.0 / _1342;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1350 = _1338 * _1348;
        float _1352 = _1334 * _1344;
        float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1356 = fma(_1352, _1350, _1354);
        float _1358 = _1356 * _1346;
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        _1300 = _1346;
        _1234 = _1360;
    }
    float _1362 = _1300;
    float _1364 = _1234;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1368 = _1292 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _1294 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1376 = _1296 + _1374;
    float _1378 = _1368 * _1368;
    float _1380 = fma(_1372, _1372, _1378);
    float _1382 = fma(_1376, _1376, _1380);
    float _1384 = rsqrt(_1382);
    float _1386 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1388 = _1372 * _1386;
    float _1390 = _1376 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 * _1390;
    float _1396 = _1392 + _1394;
    float _1398 = sqrt(_1396);
    bool _1400 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = _1398 + _1402;
    float _1406 = _1384;
    float _1408 = _1396;
    float _1410 = _1404;
    float _1412 = _1362;
    float _1414 = _1368;
    if (_1400)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1406 = _1416;
    }
    float _1418 = _1406;
    if (_1400)
    {
        float _1420 = rsqrt(_1396);
        _1408 = _1420;
    }
    float _1422 = _1408;
    float _1424 = _1422;
    if (_1400)
    {
        float _1426 = _1404 * _1418;
        _1410 = _1426;
    }
    float _1428 = _1410;
    if (_1400)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1412 = _1430;
    }
    float _1432 = _1412;
    float _1434 = _1376;
    if (_1400)
    {
        float _1436 = _1432 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        _1434 = _1438;
    }
    float _1440 = _1434;
    float _1442 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1444 = precise::max(0.0, _1442);
    float _1446 = _1418;
    float _1448 = _1444;
    if (_1400)
    {
        float _1450 = _1432 * 6.283185482025146484375;
        float _1452 = cos(_1450);
        _1446 = _1452;
    }
    float _1454 = _1446;
    float _1456 = -_1386;
    float _1458 = -_1444;
    float _1460 = fma(_1368, _1456, _1458);
    if (_1400)
    {
        float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1462;
    }
    float _1464 = _1414;
    float _1466 = _1464;
    float _1468 = _1440;
    if (_1400)
    {
        float _1470 = fma(_1440, _1464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1466 = _1470;
    }
    float _1472 = _1466;
    float _1474 = _1472;
    if (!_1400)
    {
        _1468 = _1388;
    }
    float _1476 = _1468;
    float _1478 = _1476;
    float _1480 = _1454;
    if (_1400)
    {
        float _1482 = _1454 + (-1.0);
        _1448 = _1482;
    }
    float _1484 = _1448;
    float _1486 = _1484;
    if (_1400)
    {
        float _1488 = _1422 * _1472;
        _1144 = _1488;
    }
    float _1490 = _1144;
    if (!_1400)
    {
        _1424 = _1392;
    }
    float _1492 = _1424;
    float _1494 = sqrt(_1382);
    float _1496 = _1492;
    if (_1400)
    {
        float _1498 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1302 = _1498;
    }
    float _1500 = _1302;
    if (_1400)
    {
        float _1502 = _1388 * _1490;
        _1478 = _1502;
    }
    float _1504 = _1478;
    if (!_1400)
    {
        _1474 = _1460;
    }
    float _1506 = _1474;
    float _1508 = _1506;
    if (!_1400)
    {
        _1486 = _1390;
    }
    float _1510 = _1486;
    float _1512 = _1510;
    if (_1400)
    {
        float _1514 = fma(_1460, _1454, _1500);
        _1508 = _1514;
    }
    float _1516 = _1508;
    if (_1400)
    {
        float _1518 = _1390 * _1490;
        _1512 = _1518;
    }
    float _1520 = _1512;
    if (_1400)
    {
        float _1522 = _1504 * _1504;
        _1496 = _1522;
    }
    float _1524 = _1496;
    if (!_1400)
    {
        _1480 = _1394;
    }
    float _1526 = _1480;
    float _1528 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1530 = _1526;
    if (_1400)
    {
        float _1532 = _1520 * _1520;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1516, _1516, _1524);
    float _1538 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1528);
    float _1540 = _1536 + _1534;
    float _1542 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1538);
    float _1552 = rsqrt(_1540);
    float _1554 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1556 = -_1548;
    float _1558 = _1556 + 1.0;
    float _1560 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1562 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1564 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1554);
    float _1566 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1568 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1570 = abs(_1558);
    float _1572 = log2(_1570);
    float _1574 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1576 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1566);
    float _1578 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1562);
    float _1580 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1582 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1576);
    float _1584 = _1552 * _1504;
    float _1586 = _1552 * _1516;
    float _1588 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1590 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1594 = -_1580;
    float _1596 = fma(_1594, _1568, 1.0);
    float _1598 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1578);
    float _1600 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1590);
    float _1602 = _1552 * _1520;
    float _1604 = -_1592;
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1604);
    float _1608 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1610 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1600);
    float _1612 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1614 = -_1602;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1606);
    float _1618 = log2(_1596);
    float _1620 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1610);
    float _1622 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1624 = fma(_1616, -0.5, 0.5);
    float _1626 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = fma(_1616, 0.5, 0.5);
    float _1630 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1622);
    float _1632 = _1586 + 1.0;
    float _1634 = 1.0 / _1620;
    float _1636 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1638 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1640 = fma(_1628, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1642 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1644 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1646 = fma(_1628, _1640, -0.212114393711090087890625);
    float _1648 = exp2(_1612);
    float _1650 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1642);
    float _1652 = _1618 * 0.693147182464599609375;
    float _1654 = fma(_1628, _1646, 1.570728778839111328125);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1658 = sqrt(_1624);
    float _1660 = _1644 * _1634;
    float _1662 = _1650 * _1634;
    float _1664 = fma(_1660, 0.5, 0.5);
    float _1666 = fma(_1662, -0.5, 0.5);
    float _1668 = -_1586;
    float _1670 = fma(_1648, _1632, _1668);
    float3 _4875 = float3(_1664, _1666, _1656);
    float _1672 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4875, float3(0.0), isnan(_4875)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4875, float3(0.0), isnan(_4875)), level(0.0)).x;
    float _1674 = fma(_1670, 0.5, 0.5);
    float _1676 = _1658 * 0.636619746685028076171875;
    float _1678 = -_1654;
    float _1680 = fma(_1676, _1678, 1.0);
    float3 _4896 = float3(_1664, _1666, _1656);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4896, float3(0.0), isnan(_4896)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4896, float3(0.0), isnan(_4896)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _4913 = float2(_1680, _1674);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4913, float2(0.0), isnan(_4913)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4913, float2(0.0), isnan(_4913)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = in.m_51.w;
    float _1705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1707 = in.m_59.x;
    float _1709 = in.m_59.y;
    float _1711 = in.m_59.z;
    float _1713 = in.m_59.w;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1721 = _1719 != 0;
    float _1723 = in.m_51.y;
    float _1725 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1727 = 1.0 / _1717;
    float _1729 = in.m_51.z;
    int _1731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1733 = _1731 != 0;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1737 = _1735 != 0;
    out.m_61.x = _702;
    out.m_61.y = _706;
    out.m_61.z = _708;
    out.m_61.w = _740;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1741 = _1739 != 0;
    float _1743 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1747 = _1745 != 0;
    float _1749 = in.m_57.x;
    int _1751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1753 = _1751 != 0;
    float _1755 = exp2(_1725);
    bool _1757 = _1703 > 0.5;
    float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1759;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1765 = _1763 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1767 = in.m_51.x;
    float _1769 = _1757 ? _916 : _894;
    float _1771 = _1761 * _1727;
    float _1773 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1777 = _1775 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1779 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1781 = _1723 > 0.5;
    float _1783 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1785 = 1.0 / _1777;
    float _1787 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1779);
    int _1789 = _1781 ? as_type<int>(_916) : as_type<int>(_894);
    float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1793 = _872 + _1791;
    float _1795 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1773);
    float _1797 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1787);
    float _1799 = _1741 ? as_type<float>(_1789) : _894;
    float _1801 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1783);
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1805 = _1803 != 0;
    float _1807 = fma(_1771, _1793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1809 = _1747 ? as_type<int>(_1769) : as_type<int>(_894);
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1813 = _872 + _1811;
    bool _1815 = _1729 > 0.5;
    float _1817 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1795);
    float _1819 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1801);
    float _1821 = _1795;
    float _1823 = _1771;
    float _1825 = _1769;
    bool _1827 = _1753;
    int _1829 = _1809;
    float _1831 = _1807;
    float _1833 = _1801;
    float _1835 = _1729;
    if (!_1721)
    {
        _1821 = _1749;
    }
    float _1837 = _1821;
    float _1839 = _1765 * _1785;
    float _1841 = _1837;
    if (_1753)
    {
        float _1843 = _1815 ? _916 : _894;
        _1146 = _1843;
    }
    float _1845 = _1146;
    float _1847 = -_1755;
    float _1849 = _1847 + 1.0;
    float _1851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1853 = fma(_1839, _1813, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1855 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1857 = isnan(_872);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    out.m_63.x = _1797;
    out.m_63.y = _1817;
    out.m_63.z = _1819;
    int _1867 = as_type<int>(_1845);
    if (!_1721)
    {
        _1823 = _1837;
    }
    float _1869 = _1823;
    float _1871 = _1869;
    if (_1721)
    {
        _1841 = _1749;
    }
    float _1873 = _1841;
    float _1875 = -_1865;
    float _1877 = _1875 + 1.0;
    out.m_65.x = _1090;
    out.m_65.y = _1082;
    out.m_65.z = _1076;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1881 = _1873;
    if (!_1805)
    {
        _1825 = _1723;
    }
    float _1883 = _1825;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1887 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1889 = isnan(_872);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1901 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1903 = isnan(_872);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = fma(_1743, _1845, -0.5);
    float _1915 = _1883;
    if (_1733)
    {
        float _1917 = -_1873;
        float _1919 = _1917 + 1.0;
        _1867 = as_type<int>(_1919);
    }
    int _1921 = _1867;
    float _1923 = _1897 * _1877;
    float _1925 = -_1897;
    float _1927 = _1925 + 1.0;
    float _1929 = fma(as_type<float>(_1809), _1899, -0.5);
    float _1931 = as_type<float>(_1921);
    if (_1721)
    {
        bool _1933 = _1767 > 0.5;
        _1827 = _1933;
    }
    bool _1935 = _1827;
    if (_1737)
    {
        float _1937 = -_1873;
        float _1939 = _1937 + 1.0;
        _1829 = as_type<int>(_1939);
    }
    int _1941 = _1829;
    float _1943 = _1911 * _1927;
    int _1945 = as_type<int>(_1943);
    if (_1805)
    {
        _1915 = _1767;
    }
    float _1947 = _1915;
    float _1949 = -_1911;
    float _1951 = _1949 + 1.0;
    float _1953 = _1807 * _1943;
    float _1955 = _1947;
    if (_1721)
    {
        float _1957 = -_1873;
        float _1959 = _1957 + 1.0;
        _1945 = as_type<int>(_1959);
    }
    int _1961 = _1945;
    if (!_1733)
    {
        _1831 = _1873;
    }
    float _1963 = _1831;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1967 = _1963;
    if (_1733)
    {
        float _1969 = _1815 ? as_type<float>(_1921) : _1873;
        _1967 = _1969;
    }
    float _1971 = _1967;
    float _1973 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1879);
    if (_1721)
    {
        float _1975 = _1935 ? as_type<float>(_1961) : _1873;
        _1871 = _1975;
    }
    float _1977 = _1871;
    float _1979 = fma(_1951, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1953);
    if (_1737)
    {
        float _1981 = _1781 ? as_type<float>(_1941) : _1873;
        _1881 = _1981;
    }
    float _1983 = _1881;
    float _1985 = in.m_67.x;
    float _1987 = in.m_67.y;
    float _1989 = in.m_67.z;
    float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1993 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1885);
    float _1995 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1805)
    {
        _1955 = _1723;
    }
    float _1997 = _1955;
    float _1999 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1965);
    float _2001 = _1997;
    if (_1805)
    {
        _1833 = _1767;
    }
    float _2003 = _1833;
    float _2005 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1993);
    float _2007 = _2003;
    if (!_1805)
    {
        _2001 = _1767;
    }
    float _2009 = _2001;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2013 = _886 != 0.0;
    bool _2015 = isnan(_886);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(0.0);
    bool _2021 = _2017 || _2019;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2025 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1999);
    bool _2027 = _884 == 0.0;
    bool _2029 = !_2021;
    bool _2031 = _2027 && _2029;
    float _2033 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1973);
    float _2035 = _2011;
    if (!_1805)
    {
        _2007 = _1729;
    }
    float _2037 = _2007;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2041 = _888 == 0.0;
    bool _2043 = _2041 && _2031;
    float _2045 = _1991 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2047 = _2037 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2049 = _2047;
    if (!_1805)
    {
        _1931 = _1729;
    }
    float _2051 = _1931;
    float _2053 = -_2039;
    float _2055 = fma(_1995, 2.0, _2053);
    float _2057 = _2051;
    if (_1805)
    {
        _1835 = _1723;
    }
    float _2059 = _1835;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2063 = fma(_2045, _1971, -0.5);
    float _2065 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2067 = -_130;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2055);
    float _2071 = -_2061;
    float _2073 = fma(_2047, 2.0, _2071);
    if (_1805)
    {
        _2057 = _1723;
    }
    float _2075 = _2057;
    float _2077 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2079 = fma(_1853, _1923, _1979);
    float _2081 = _2075;
    if (_2043)
    {
        _2049 = _1985;
    }
    float _2083 = _2049;
    float _2085 = fma(_2065, _1983, -0.5);
    float _2087 = -_130;
    float _2089 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2073);
    float _2091 = _2083;
    if (!_2043)
    {
        float _2093 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1985);
        _2091 = _2093;
    }
    float _2095 = _2091;
    float _2097 = fma(_2005, _2063, _2069);
    float _2099 = _1707 * _1987;
    float _2101 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2011);
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_2043)
    {
        _2035 = _1987;
    }
    float _2105 = _2035;
    float _2107 = fma(_2025, _2085, _2089);
    float _2109 = _2105;
    if (!_2043)
    {
        float _2111 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1987);
        _2109 = _2111;
    }
    float _2113 = _2109;
    float _2115 = _1711 * _1985;
    float _2117 = _1709 * _1989;
    float _2119 = -_2099;
    float _2121 = fma(_1709, _1985, _2119);
    float _2123 = fma(_2077, -2.0, _2103);
    float _2125 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_2043)
    {
        _2081 = _1989;
    }
    float _2127 = _2081;
    float _2129 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2131 = _2127;
    if (!_2043)
    {
        float _2133 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1989);
        _2131 = _2133;
    }
    float _2135 = _2131;
    float _2137 = -_2115;
    float _2139 = fma(_1707, _1989, _2137);
    float _2141 = -_2117;
    float _2143 = fma(_1711, _1987, _2141);
    float _2145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2147 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2101);
    float _2149 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2123);
    float _2151 = fma(_2129, -2.0, _2125);
    float _2153 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2079);
    float _2155 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2157 = -_2149;
    float _2159 = fma(_2147, _1929, _2157);
    float _2161 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2151);
    float _2163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2165 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2167 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2169 = _2139 * _1713;
    float _2171 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2155);
    float _2173 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2165);
    float _2175 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2177 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2167);
    float _2179 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2181 = _848 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2183 = _2143 * _1713;
    float _2185 = _2121 * _1713;
    float _2187 = -_2161;
    float _2189 = fma(_2033, _1913, _2187);
    float _2191 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2193 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2195 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2197 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2199 = _2175 * _2145;
    float _2201 = _2179 * _2163;
    float _2203 = _2097 + 0.5;
    float _2205 = _2159 + 0.5;
    float _2207 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2191);
    float _2209 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2193);
    float _2211 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2195);
    float _2213 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2197);
    float _2215 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2173);
    float _2217 = _842 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2219 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2221 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2171);
    float _2223 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2177);
    out.m_69.x = _2201;
    out.m_69.y = _2199;
    out.m_69.z = _2203;
    out.m_69.w = _2205;
    float _2225 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2213);
    float _2227 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2229 = _2217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2231 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2233 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2235 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _2215;
    out.m_71.y = _2221;
    out.m_71.z = _2223;
    float _2237 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2225);
    bool _2239 = _1364 > 0.0;
    bool _2241 = isnan(_1364);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(0.0);
    bool _2247 = _2243 || _2245;
    float _2249 = -_2227;
    float _2251 = _2249 + 1.0;
    out.m_73.x = _2229;
    out.m_73.y = _2231;
    out.m_73.z = _2233;
    out.m_73.w = _2235;
    float _2253 = _2107 + 0.5;
    float _2255 = _2189 + 0.5;
    float _2257 = _2237 + _1620;
    out.m_75.x = _1012;
    float _2259 = _1620 * 0.5;
    float _2261 = _2257 * 0.5;
    out.m_77.x = _2253;
    out.m_77.y = _2255;
    float _2263 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2207);
    float _2265 = _1364 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2267 = _1644 + _1620;
    out.m_79.x = _1294;
    out.m_79.y = _1292;
    out.m_79.z = _1296;
    float _2269 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2209);
    float _2271 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2211);
    float _2273 = fma(_1650, -0.5, _2259);
    float _2275 = _2267 * 0.5;
    float _2277 = _2265 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.w = _948;
    out.m_83.x = _2263;
    out.m_83.y = _2269;
    out.m_83.z = _2271;
    out.gl_Position.x = _1644;
    out.gl_Position.y = _1650;
    out.gl_Position.z = _2237;
    out.gl_Position.w = _1620;
    out.m_85.x = _2275;
    out.m_85.y = _2273;
    out.m_85.z = _2261;
    out.m_85.w = _1620;
    out.m_47.x = _2277;
    float _2279 = _2227 * _1672;
    float _2281 = _1691 * _2279;
    float _2283 = _1691 * _2251;
    float _2285 = _1701 * _2279;
    float _2287 = fma(_1697, _2281, _1685);
    float _2289 = fma(_1699, _2281, _1687);
    float _2291 = fma(_1691, _2285, _1689);
    out.m_87.x = _2287;
    out.m_87.y = _2289;
    out.m_87.z = _2291;
    out.m_87.w = _2283;
    if (_2247)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2293 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2293;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _870 = false;
    bool _762 = false;
    bool _626 = false;
    bool _464 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2349 = as_type<float>(_120);
        out.gl_Position.z = _2349;
    }
    if (!_110)
    {
        return out;
    }
    float _124 = in.m_49.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2413 = as_type<float>(_154);
        out.gl_Position.z = _2413;
    }
    if (_146)
    {
        return out;
    }
    float _156 = 1.0 / _126;
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _160 = _130 * _156;
    bool _162 = !_158;
    float _180;
    if (!_162)
    {
        float _164 = in.m_51.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        _180 = _160;
    }
    _182 = false;
    float _184 = _180;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _188 = _184 + _186;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _192 = _184 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _196 = _184 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = 1.0 / _200;
    float _216 = 1.0 / _204;
    bool _218 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _220 = 1.0 / _212;
    float _222 = _188 * _214;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _226 = _184 + _224;
    float _228 = 1.0 / _208;
    float _230 = _192 * _216;
    bool _232 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _234 = isnan(_184);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _244;
    float _248 = -_242;
    float _250 = _248 + 1.0;
    float _252 = _226 * _220;
    bool _254 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _256 = isnan(_184);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = fma(_246, _222, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _268 = _264 * _250;
    float _270 = -_264;
    float _272 = _270 + 1.0;
    float _274 = _196 * _228;
    bool _276 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _278 = isnan(_184);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    bool _296 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_184);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = _286 * _272;
    float _310 = -_286;
    float _312 = _310 + 1.0;
    float _314 = fma(_290, _222, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _316 = fma(_294, _222, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _318 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_184);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_306;
    float _332 = _330 + 1.0;
    float _334 = _306 * _312;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = _328 * _332;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = fma(_338, _230, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _352 = -_328;
    float _354 = _352 + 1.0;
    float _356 = _314 * _344;
    float _358 = _316 * _344;
    float _360 = _266 * _344;
    float _362 = in.m_53.x;
    float _364 = in.m_53.y;
    float _366 = in.m_53.z;
    float _368 = fma(_342, _230, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _370 = fma(_348, _230, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _372 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].x, _356);
    float _374 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].y, _358);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].z, _360);
    float _390 = fma(_350, _334, _372);
    float _392 = fma(_368, _334, _374);
    float _394 = fma(_378, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _396 = fma(_382, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_386, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _412 = fma(_370, _334, _388);
    float _414 = fma(_402, _252, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _416 = fma(_406, _252, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _418 = fma(_410, _252, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _420 = fma(_394, _308, _390);
    float _422 = fma(_396, _308, _392);
    float _424 = fma(_398, _308, _412);
    float _426 = fma(_414, _268, _420);
    float _428 = fma(_416, _268, _422);
    float _430 = fma(_418, _268, _424);
    float _432 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[147].x, _426);
    float _434 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[147].y, _428);
    float _436 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[147].z, _430);
    float _438 = _432 * _362;
    float _440 = _434 * _364;
    float _442 = _436 * _366;
    bool _444 = !_218;
    float _462;
    if (!_444)
    {
        float _446 = in.m_51.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        _462 = _160;
    }
    _464 = false;
    float _466 = _462;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = _466 + _468;
    bool _472 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_466);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _466 + _484;
    bool _488 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _490 = isnan(_466);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _508 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _510 = isnan(_466);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_482;
    float _522 = _520 + 1.0;
    float _524 = 1.0 / _506;
    float _526 = _518 * _522;
    float _528 = -_518;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _532;
    bool _536 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _538 = 1.0 / _502;
    float _540 = _498 * _530;
    float _542 = -_498;
    float _544 = _542 + 1.0;
    float _546 = _486 * _524;
    float _548 = _470 * _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _554;
    float _558 = fma(_534, _548, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _560 = fma(_552, _548, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _562 = fma(_556, _548, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _564 = _558 * _540;
    float _566 = _560 * _540;
    float _568 = _562 * _540;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _582 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].x, _564);
    float _584 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].y, _566);
    float _586 = fma(_572, _546, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _588 = fma(_576, _546, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _590 = fma(_580, _546, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _592 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].z, _568);
    float _594 = fma(_586, _526, _582);
    float _596 = fma(_588, _526, _584);
    float _598 = fma(_590, _526, _592);
    float _600 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[109].x, _594);
    float _602 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[109].y, _596);
    float _604 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[109].z, _598);
    bool _606 = !_536;
    float _624;
    if (!_606)
    {
        float _608 = in.m_51.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        _624 = _160;
    }
    _626 = false;
    float _628 = _624;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _628 + _630;
    float _634 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _640 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _642 = isnan(_628);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _656 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _658 = isnan(_628);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _668;
    bool _672 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = isnan(_628);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = 1.0 / _638;
    float _686 = -_650;
    float _688 = _686 + 1.0;
    bool _690 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _692 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _694 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _696 = _666 * _688;
    float _698 = -_666;
    float _700 = _698 + 1.0;
    float _702 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = 1.0 / _654;
    float _706 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _670 * _684;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _716 = fma(_710, _632, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _718 = _714 * _704;
    float _720 = _716 * _696;
    float _722 = -_682;
    float _724 = _722 + 1.0;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = _628 + _726;
    float _730 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[115].x, _720);
    float _732 = _650 * _724;
    float _734 = fma(_718, _728, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _736 = fma(_734, _732, _730);
    float _738 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[117].x, _736);
    float _740 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _742 = !_690;
    float _760;
    if (!_742)
    {
        float _744 = in.m_51.x;
        float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _748 = _744 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _752 = _750 * _746;
        float _754 = floor(_752);
        float _756 = -_754;
        float _758 = _752 + _756;
        _760 = _758;
        _762 = true;
    }
    else
    {
        _760 = _160;
    }
    _762 = false;
    float _764 = _760;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = _764 + _766;
    bool _770 = _764 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _772 = isnan(_764);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _782;
    bool _786 = _764 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _788 = isnan(_764);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = -_780;
    float _800 = _798 + 1.0;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _802;
    float _806 = 1.0 / _784;
    bool _808 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _810 = _796 * _800;
    float _812 = -_796;
    float _814 = _812 + 1.0;
    float _816 = _768 * _806;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _818;
    float _822 = fma(_804, _816, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _824;
    float _828 = fma(_820, _816, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _830 = _822 * _810;
    float _832 = fma(_826, _816, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _834 = _828 * _810;
    float _836 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[123].x, _830);
    float _838 = _832 * _810;
    float _840 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[123].z, _834);
    float _842 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[124].x, _836);
    float _844 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[123].y, _838);
    float _846 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[124].y, _844);
    float _848 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[124].z, _840);
    bool _850 = !_808;
    float _868;
    if (!_850)
    {
        float _852 = in.m_51.x;
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _856 = _852 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _858 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _860 = _858 * _854;
        float _862 = floor(_860);
        float _864 = -_862;
        float _866 = _860 + _864;
        _868 = _866;
        _870 = true;
    }
    else
    {
        _868 = _160;
    }
    _870 = false;
    float _872 = _868;
    float _874 = in.m_44.x;
    float _876 = in.m_44.y;
    float _878 = in.m_44.z;
    float _880 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _882 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _884 = in.m_55.x;
    float _886 = in.m_55.y;
    float _888 = in.m_55.z;
    float _890 = _880 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _892 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _894 = in.m_57.y;
    float _896 = _876 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _898 = _876 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _900 = _876 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _902 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[5].x, _896);
    float _904 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[4].x, _898);
    float _906 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[6].x, _900);
    float _908 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[5].z, _902);
    float _910 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[4].z, _904);
    float _912 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[6].z, _906);
    float _914 = -_894;
    float _916 = _914 + 1.0;
    float _918 = _908 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _920 = _910 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _922 = _912 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _926 = _918 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _930 = _920 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _934 = _922 + _932;
    float _936 = _926 * _926;
    float _938 = fma(_930, _930, _936);
    float _940 = fma(_934, _934, _938);
    float _942 = sqrt(_940);
    float _944 = rsqrt(_940);
    float _946 = _942 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _948 = precise::min(_890, _946);
    float _950 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _952 = _944 * _948;
    float _954 = _926 * _952;
    float _956 = _930 * _952;
    float _958 = _934 * _952;
    float _960 = -_954;
    float _962 = _926 + _960;
    float _964 = -_956;
    float _966 = _930 + _964;
    float _968 = -_958;
    float _970 = _934 + _968;
    float _972 = _962 * _962;
    float _974 = fma(_966, _966, _972);
    float _976 = fma(_970, _970, _974);
    float _978 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _950);
    float _980 = sqrt(_976);
    float _982 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _978);
    bool _984 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _986 = isnan(0.5);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _992 = _988 || _990;
    bool _994 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _996 = isnan(0.5);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1002 = _998 || _1000;
    float _1004 = rsqrt(_982);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    float _1008 = _944 * _980;
    float _1010 = _882 * _1008;
    float _1012 = _880 * _1008;
    float _1014 = _892 * _1008;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _884);
    float _1018 = _1010 * _1006;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _888);
    float _1022 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1024 = _1012 * _1016;
    float _1026 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1028 = _1014 * _1020;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1032 = _1022 * _1022;
    float _1034 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1026);
    float _1036 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1030);
    float _1038 = -_1032;
    float _1040 = fma(_1038, _1032, 1.0);
    float _1042 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1034);
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1036);
    float _1046 = _916 * _1040;
    float _1048 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1050 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1052 = _1046 * 0.800000011920928955078125;
    float _1054 = _922 + _1048;
    float _1056 = _160 + 0.20000000298023223876953125;
    float _1058 = _920 + _1050;
    float _1060 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1062 = _1054 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1066 = _1058 + _1064;
    float _1068 = _1062 * _1052;
    float _1070 = _1066 * _1052;
    float _1072 = fma(_1068, _1056, _1054);
    float _1074 = -_958;
    float _1076 = _922 + _1074;
    float _1078 = fma(_1070, _1056, _1058);
    float _1080 = -_954;
    float _1082 = _918 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1086 = _1072 + _1084;
    float _1088 = -_956;
    float _1090 = _920 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1094 = _1078 + _1092;
    float _1096 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1098 = _1086 * _1086;
    float _1100 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1096);
    float _1102 = fma(_1094, _1094, _1098);
    float _1104 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1106 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1100);
    float _1108 = sqrt(_1102);
    float _1110 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1104);
    float _1112 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1114 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1116 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1110);
    float _1118 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1112);
    float _1120 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1122 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1118);
    float _1124 = 1.0 / _1120;
    float _1126 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1128 = _1114 + _1120;
    bool _1130 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = _918 + _1126;
    float _1134 = _1114;
    float _1136 = _1018;
    float _1138 = _1078;
    float _1140 = _1112;
    float _1142 = _954;
    float _1144 = _1072;
    float _1146 = _894;
    if (!_1130)
    {
        _1134 = _1078;
    }
    float _1148 = _1134;
    float _1150 = _1148;
    if (!_1130)
    {
        _1136 = _1072;
    }
    float _1152 = _1136;
    float _1154 = _1152;
    if (!_1130)
    {
        _1138 = _1132;
    }
    float _1156 = _1138;
    bool _1158 = !_1130;
    float _1160 = _1156;
    if (!_1158)
    {
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1166 = _1108 + _1164;
        float _1168 = _1132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = rsqrt(_1102);
        float _1172 = _1166 * _1162;
        float _1174 = _1172 * 0.15915493667125701904296875;
        float _1176 = _1174 * 6.283185482025146484375;
        float _1178 = sin(_1176);
        float _1180 = _1174 * 6.283185482025146484375;
        float _1182 = cos(_1180);
        float _1184 = fma(_1178, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1186 = _1170 * _1184;
        float _1188 = _1182 + (-1.0);
        float _1190 = fma(_1094, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1192 = fma(_1086, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1194 = _1188 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = fma(_1132, _1182, _1194);
        _1150 = _1190;
        _1160 = _1196;
        _1154 = _1192;
        _1140 = _1194;
    }
    float _1198 = _1150;
    float _1200 = _1160;
    float _1202 = _1154;
    float _1204 = _1140;
    float _1206 = -_956;
    float _1208 = _1206 + _1198;
    float _1210 = -_954;
    float _1212 = _1210 + _1200;
    float _1214 = -_958;
    float _1216 = _1214 + _1202;
    float _1218 = _1128 * _1124;
    float _1220 = _1218 * 0.5;
    float _1222 = _1204;
    float _1224 = _1200;
    float _1226 = _1212;
    float _1228 = _1216;
    float _1230 = _1198;
    if (_1002)
    {
        _1222 = 1.0;
    }
    float _1232 = _1222;
    float _1234 = _1232;
    if (_992)
    {
        _1142 = _1208;
    }
    float _1236 = _1142;
    float _1238 = _1236;
    if (!_992)
    {
        float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1242 = _1082 + _1240;
        float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1246 = _1090 + _1244;
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = -_920;
        float _1252 = _1250 + _1198;
        float _1254 = _1242 * _1242;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1258 = _1076 + _1256;
        float _1260 = -_918;
        float _1262 = _1260 + _1200;
        float _1264 = -_922;
        float _1266 = _1264 + _1202;
        float _1268 = fma(_1246, _1246, _1254);
        float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1272 = fma(_1258, _1258, _1268);
        float _1274 = sqrt(_1272);
        float _1276 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1278 = precise::min(_1274, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1280 = _1278 * _1270;
        float _1282 = _1276 * _1280;
        float _1284 = fma(_1252, _1282, _1090);
        float _1286 = fma(_1262, _1282, _1082);
        float _1288 = fma(_1266, _1282, _1076);
        _1224 = _1262;
        _1226 = _1286;
        _1238 = _1284;
        _1228 = _1288;
        _1230 = _1252;
    }
    float _1290 = _1224;
    float _1292 = _1226;
    float _1294 = _1238;
    float _1296 = _1228;
    float _1298 = _1230;
    float _1300 = _1290;
    float _1302 = _1298;
    if (!_1002)
    {
        float _1304 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1306 = _1304 * 0.15915493667125701904296875;
        float _1308 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1312 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1310);
        float _1314 = _1306 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = _1308 * 0.15915493667125701904296875;
        float _1320 = _1306 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = 1.0 / _1316;
        float _1326 = _1318 * 6.283185482025146484375;
        float _1328 = cos(_1326);
        float _1330 = _1322 * _1324;
        float _1332 = _1318 * 6.283185482025146484375;
        float _1334 = sin(_1332);
        float _1336 = _1328 * _1330;
        float _1338 = 1.0 / _1312;
        float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1342 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1340;
        float _1344 = 1.0 / _1336;
        float _1346 = 1.0 / _1342;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1350 = _1338 * _1348;
        float _1352 = _1334 * _1344;
        float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1356 = fma(_1352, _1350, _1354);
        float _1358 = _1356 * _1346;
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        _1300 = _1346;
        _1234 = _1360;
    }
    float _1362 = _1300;
    float _1364 = _1234;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1368 = _1292 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _1294 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1376 = _1296 + _1374;
    float _1378 = _1368 * _1368;
    float _1380 = fma(_1372, _1372, _1378);
    float _1382 = fma(_1376, _1376, _1380);
    float _1384 = rsqrt(_1382);
    float _1386 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1388 = _1372 * _1386;
    float _1390 = _1376 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 * _1390;
    float _1396 = _1392 + _1394;
    float _1398 = sqrt(_1396);
    bool _1400 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = _1398 + _1402;
    float _1406 = _1384;
    float _1408 = _1396;
    float _1410 = _1404;
    float _1412 = _1362;
    float _1414 = _1368;
    if (_1400)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1406 = _1416;
    }
    float _1418 = _1406;
    if (_1400)
    {
        float _1420 = rsqrt(_1396);
        _1408 = _1420;
    }
    float _1422 = _1408;
    float _1424 = _1422;
    if (_1400)
    {
        float _1426 = _1404 * _1418;
        _1410 = _1426;
    }
    float _1428 = _1410;
    if (_1400)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1412 = _1430;
    }
    float _1432 = _1412;
    float _1434 = _1376;
    if (_1400)
    {
        float _1436 = _1432 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        _1434 = _1438;
    }
    float _1440 = _1434;
    float _1442 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1444 = precise::max(0.0, _1442);
    float _1446 = _1418;
    float _1448 = _1444;
    if (_1400)
    {
        float _1450 = _1432 * 6.283185482025146484375;
        float _1452 = cos(_1450);
        _1446 = _1452;
    }
    float _1454 = _1446;
    float _1456 = -_1386;
    float _1458 = -_1444;
    float _1460 = fma(_1368, _1456, _1458);
    if (_1400)
    {
        float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1462;
    }
    float _1464 = _1414;
    float _1466 = _1464;
    float _1468 = _1440;
    if (_1400)
    {
        float _1470 = fma(_1440, _1464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1466 = _1470;
    }
    float _1472 = _1466;
    float _1474 = _1472;
    if (!_1400)
    {
        _1468 = _1388;
    }
    float _1476 = _1468;
    float _1478 = _1476;
    float _1480 = _1454;
    if (_1400)
    {
        float _1482 = _1454 + (-1.0);
        _1448 = _1482;
    }
    float _1484 = _1448;
    float _1486 = _1484;
    if (_1400)
    {
        float _1488 = _1422 * _1472;
        _1144 = _1488;
    }
    float _1490 = _1144;
    if (!_1400)
    {
        _1424 = _1392;
    }
    float _1492 = _1424;
    float _1494 = sqrt(_1382);
    float _1496 = _1492;
    if (_1400)
    {
        float _1498 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1302 = _1498;
    }
    float _1500 = _1302;
    if (_1400)
    {
        float _1502 = _1388 * _1490;
        _1478 = _1502;
    }
    float _1504 = _1478;
    if (!_1400)
    {
        _1474 = _1460;
    }
    float _1506 = _1474;
    float _1508 = _1506;
    if (!_1400)
    {
        _1486 = _1390;
    }
    float _1510 = _1486;
    float _1512 = _1510;
    if (_1400)
    {
        float _1514 = fma(_1460, _1454, _1500);
        _1508 = _1514;
    }
    float _1516 = _1508;
    if (_1400)
    {
        float _1518 = _1390 * _1490;
        _1512 = _1518;
    }
    float _1520 = _1512;
    if (_1400)
    {
        float _1522 = _1504 * _1504;
        _1496 = _1522;
    }
    float _1524 = _1496;
    if (!_1400)
    {
        _1480 = _1394;
    }
    float _1526 = _1480;
    float _1528 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1530 = _1526;
    if (_1400)
    {
        float _1532 = _1520 * _1520;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1516, _1516, _1524);
    float _1538 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1528);
    float _1540 = _1536 + _1534;
    float _1542 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1538);
    float _1552 = rsqrt(_1540);
    float _1554 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1556 = -_1548;
    float _1558 = _1556 + 1.0;
    float _1560 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1562 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1564 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1554);
    float _1566 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1568 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1570 = abs(_1558);
    float _1572 = log2(_1570);
    float _1574 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1576 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1566);
    float _1578 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1562);
    float _1580 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1582 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1576);
    float _1584 = _1552 * _1504;
    float _1586 = _1552 * _1516;
    float _1588 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1590 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1594 = -_1580;
    float _1596 = fma(_1594, _1568, 1.0);
    float _1598 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1578);
    float _1600 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1590);
    float _1602 = _1552 * _1520;
    float _1604 = -_1592;
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1604);
    float _1608 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1610 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1600);
    float _1612 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1614 = -_1602;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1606);
    float _1618 = log2(_1596);
    float _1620 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1610);
    float _1622 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1624 = fma(_1616, -0.5, 0.5);
    float _1626 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = fma(_1616, 0.5, 0.5);
    float _1630 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1622);
    float _1632 = _1586 + 1.0;
    float _1634 = 1.0 / _1620;
    float _1636 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1638 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1640 = fma(_1628, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1642 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1644 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1646 = fma(_1628, _1640, -0.212114393711090087890625);
    float _1648 = exp2(_1612);
    float _1650 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1642);
    float _1652 = _1618 * 0.693147182464599609375;
    float _1654 = fma(_1628, _1646, 1.570728778839111328125);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1658 = sqrt(_1624);
    float _1660 = _1644 * _1634;
    float _1662 = _1650 * _1634;
    float _1664 = fma(_1660, 0.5, 0.5);
    float _1666 = fma(_1662, -0.5, 0.5);
    float _1668 = -_1586;
    float _1670 = fma(_1648, _1632, _1668);
    float3 _4875 = float3(_1664, _1666, _1656);
    float _1672 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4875, float3(0.0), isnan(_4875)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4875, float3(0.0), isnan(_4875)), level(0.0)).x;
    float _1674 = fma(_1670, 0.5, 0.5);
    float _1676 = _1658 * 0.636619746685028076171875;
    float _1678 = -_1654;
    float _1680 = fma(_1676, _1678, 1.0);
    float3 _4896 = float3(_1664, _1666, _1656);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4896, float3(0.0), isnan(_4896)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4896, float3(0.0), isnan(_4896)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _4913 = float2(_1680, _1674);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4913, float2(0.0), isnan(_4913)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4913, float2(0.0), isnan(_4913)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = in.m_51.w;
    float _1705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1707 = in.m_59.x;
    float _1709 = in.m_59.y;
    float _1711 = in.m_59.z;
    float _1713 = in.m_59.w;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1721 = _1719 != 0;
    float _1723 = in.m_51.y;
    float _1725 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1727 = 1.0 / _1717;
    float _1729 = in.m_51.z;
    int _1731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1733 = _1731 != 0;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1737 = _1735 != 0;
    out.m_61.x = _702;
    out.m_61.y = _706;
    out.m_61.z = _708;
    out.m_61.w = _740;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1741 = _1739 != 0;
    float _1743 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1747 = _1745 != 0;
    float _1749 = in.m_57.x;
    int _1751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1753 = _1751 != 0;
    float _1755 = exp2(_1725);
    bool _1757 = _1703 > 0.5;
    float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1759;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1765 = _1763 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1767 = in.m_51.x;
    float _1769 = _1757 ? _916 : _894;
    float _1771 = _1761 * _1727;
    float _1773 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1777 = _1775 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1779 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1781 = _1723 > 0.5;
    float _1783 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1785 = 1.0 / _1777;
    float _1787 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1779);
    int _1789 = _1781 ? as_type<int>(_916) : as_type<int>(_894);
    float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1793 = _872 + _1791;
    float _1795 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1773);
    float _1797 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1787);
    float _1799 = _1741 ? as_type<float>(_1789) : _894;
    float _1801 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1783);
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1805 = _1803 != 0;
    float _1807 = fma(_1771, _1793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1809 = _1747 ? as_type<int>(_1769) : as_type<int>(_894);
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1813 = _872 + _1811;
    bool _1815 = _1729 > 0.5;
    float _1817 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1795);
    float _1819 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1801);
    float _1821 = _1795;
    float _1823 = _1771;
    float _1825 = _1769;
    bool _1827 = _1753;
    int _1829 = _1809;
    float _1831 = _1807;
    float _1833 = _1801;
    float _1835 = _1729;
    if (!_1721)
    {
        _1821 = _1749;
    }
    float _1837 = _1821;
    float _1839 = _1765 * _1785;
    float _1841 = _1837;
    if (_1753)
    {
        float _1843 = _1815 ? _916 : _894;
        _1146 = _1843;
    }
    float _1845 = _1146;
    float _1847 = -_1755;
    float _1849 = _1847 + 1.0;
    float _1851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1853 = fma(_1839, _1813, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1855 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1857 = isnan(_872);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    out.m_63.x = _1797;
    out.m_63.y = _1817;
    out.m_63.z = _1819;
    int _1867 = as_type<int>(_1845);
    if (!_1721)
    {
        _1823 = _1837;
    }
    float _1869 = _1823;
    float _1871 = _1869;
    if (_1721)
    {
        _1841 = _1749;
    }
    float _1873 = _1841;
    float _1875 = -_1865;
    float _1877 = _1875 + 1.0;
    out.m_65.x = _1090;
    out.m_65.y = _1082;
    out.m_65.z = _1076;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1881 = _1873;
    if (!_1805)
    {
        _1825 = _1723;
    }
    float _1883 = _1825;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1887 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1889 = isnan(_872);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1901 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1903 = isnan(_872);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = fma(_1743, _1845, -0.5);
    float _1915 = _1883;
    if (_1733)
    {
        float _1917 = -_1873;
        float _1919 = _1917 + 1.0;
        _1867 = as_type<int>(_1919);
    }
    int _1921 = _1867;
    float _1923 = _1897 * _1877;
    float _1925 = -_1897;
    float _1927 = _1925 + 1.0;
    float _1929 = fma(as_type<float>(_1809), _1899, -0.5);
    float _1931 = as_type<float>(_1921);
    if (_1721)
    {
        bool _1933 = _1767 > 0.5;
        _1827 = _1933;
    }
    bool _1935 = _1827;
    if (_1737)
    {
        float _1937 = -_1873;
        float _1939 = _1937 + 1.0;
        _1829 = as_type<int>(_1939);
    }
    int _1941 = _1829;
    float _1943 = _1911 * _1927;
    int _1945 = as_type<int>(_1943);
    if (_1805)
    {
        _1915 = _1767;
    }
    float _1947 = _1915;
    float _1949 = -_1911;
    float _1951 = _1949 + 1.0;
    float _1953 = _1807 * _1943;
    float _1955 = _1947;
    if (_1721)
    {
        float _1957 = -_1873;
        float _1959 = _1957 + 1.0;
        _1945 = as_type<int>(_1959);
    }
    int _1961 = _1945;
    if (!_1733)
    {
        _1831 = _1873;
    }
    float _1963 = _1831;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1967 = _1963;
    if (_1733)
    {
        float _1969 = _1815 ? as_type<float>(_1921) : _1873;
        _1967 = _1969;
    }
    float _1971 = _1967;
    float _1973 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1879);
    if (_1721)
    {
        float _1975 = _1935 ? as_type<float>(_1961) : _1873;
        _1871 = _1975;
    }
    float _1977 = _1871;
    float _1979 = fma(_1951, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1953);
    if (_1737)
    {
        float _1981 = _1781 ? as_type<float>(_1941) : _1873;
        _1881 = _1981;
    }
    float _1983 = _1881;
    float _1985 = in.m_67.x;
    float _1987 = in.m_67.y;
    float _1989 = in.m_67.z;
    float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1993 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1885);
    float _1995 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1805)
    {
        _1955 = _1723;
    }
    float _1997 = _1955;
    float _1999 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1965);
    float _2001 = _1997;
    if (_1805)
    {
        _1833 = _1767;
    }
    float _2003 = _1833;
    float _2005 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1993);
    float _2007 = _2003;
    if (!_1805)
    {
        _2001 = _1767;
    }
    float _2009 = _2001;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2013 = _886 != 0.0;
    bool _2015 = isnan(_886);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(0.0);
    bool _2021 = _2017 || _2019;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2025 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1999);
    bool _2027 = _884 == 0.0;
    bool _2029 = !_2021;
    bool _2031 = _2027 && _2029;
    float _2033 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1973);
    float _2035 = _2011;
    if (!_1805)
    {
        _2007 = _1729;
    }
    float _2037 = _2007;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2041 = _888 == 0.0;
    bool _2043 = _2041 && _2031;
    float _2045 = _1991 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2047 = _2037 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2049 = _2047;
    if (!_1805)
    {
        _1931 = _1729;
    }
    float _2051 = _1931;
    float _2053 = -_2039;
    float _2055 = fma(_1995, 2.0, _2053);
    float _2057 = _2051;
    if (_1805)
    {
        _1835 = _1723;
    }
    float _2059 = _1835;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2063 = fma(_2045, _1971, -0.5);
    float _2065 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2067 = -_130;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2055);
    float _2071 = -_2061;
    float _2073 = fma(_2047, 2.0, _2071);
    if (_1805)
    {
        _2057 = _1723;
    }
    float _2075 = _2057;
    float _2077 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2079 = fma(_1853, _1923, _1979);
    float _2081 = _2075;
    if (_2043)
    {
        _2049 = _1985;
    }
    float _2083 = _2049;
    float _2085 = fma(_2065, _1983, -0.5);
    float _2087 = -_130;
    float _2089 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2073);
    float _2091 = _2083;
    if (!_2043)
    {
        float _2093 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1985);
        _2091 = _2093;
    }
    float _2095 = _2091;
    float _2097 = fma(_2005, _2063, _2069);
    float _2099 = _1707 * _1987;
    float _2101 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2011);
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_2043)
    {
        _2035 = _1987;
    }
    float _2105 = _2035;
    float _2107 = fma(_2025, _2085, _2089);
    float _2109 = _2105;
    if (!_2043)
    {
        float _2111 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1987);
        _2109 = _2111;
    }
    float _2113 = _2109;
    float _2115 = _1711 * _1985;
    float _2117 = _1709 * _1989;
    float _2119 = -_2099;
    float _2121 = fma(_1709, _1985, _2119);
    float _2123 = fma(_2077, -2.0, _2103);
    float _2125 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_2043)
    {
        _2081 = _1989;
    }
    float _2127 = _2081;
    float _2129 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2131 = _2127;
    if (!_2043)
    {
        float _2133 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1989);
        _2131 = _2133;
    }
    float _2135 = _2131;
    float _2137 = -_2115;
    float _2139 = fma(_1707, _1989, _2137);
    float _2141 = -_2117;
    float _2143 = fma(_1711, _1987, _2141);
    float _2145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2147 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2101);
    float _2149 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2123);
    float _2151 = fma(_2129, -2.0, _2125);
    float _2153 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2079);
    float _2155 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2157 = -_2149;
    float _2159 = fma(_2147, _1929, _2157);
    float _2161 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2151);
    float _2163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2165 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2167 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2169 = _2139 * _1713;
    float _2171 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2155);
    float _2173 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2165);
    float _2175 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2177 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2167);
    float _2179 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2181 = _848 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2183 = _2143 * _1713;
    float _2185 = _2121 * _1713;
    float _2187 = -_2161;
    float _2189 = fma(_2033, _1913, _2187);
    float _2191 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2193 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2195 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2197 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2199 = _2175 * _2145;
    float _2201 = _2179 * _2163;
    float _2203 = _2097 + 0.5;
    float _2205 = _2159 + 0.5;
    float _2207 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2191);
    float _2209 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2193);
    float _2211 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2195);
    float _2213 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2197);
    float _2215 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2173);
    float _2217 = _842 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2219 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2221 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2171);
    float _2223 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2177);
    out.m_69.x = _2201;
    out.m_69.y = _2199;
    out.m_69.z = _2203;
    out.m_69.w = _2205;
    float _2225 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2213);
    float _2227 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2229 = _2217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2231 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2233 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2235 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _2215;
    out.m_71.y = _2221;
    out.m_71.z = _2223;
    float _2237 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2225);
    bool _2239 = _1364 > 0.0;
    bool _2241 = isnan(_1364);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(0.0);
    bool _2247 = _2243 || _2245;
    float _2249 = -_2227;
    float _2251 = _2249 + 1.0;
    out.m_73.x = _2229;
    out.m_73.y = _2231;
    out.m_73.z = _2233;
    out.m_73.w = _2235;
    float _2253 = _2107 + 0.5;
    float _2255 = _2189 + 0.5;
    float _2257 = _2237 + _1620;
    out.m_75.x = _1012;
    float _2259 = _1620 * 0.5;
    float _2261 = _2257 * 0.5;
    out.m_77.x = _2253;
    out.m_77.y = _2255;
    float _2263 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2207);
    float _2265 = _1364 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2267 = _1644 + _1620;
    out.m_79.x = _1294;
    out.m_79.y = _1292;
    out.m_79.z = _1296;
    float _2269 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2209);
    float _2271 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2211);
    float _2273 = fma(_1650, -0.5, _2259);
    float _2275 = _2267 * 0.5;
    float _2277 = _2265 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.w = _948;
    out.m_83.x = _2263;
    out.m_83.y = _2269;
    out.m_83.z = _2271;
    out.gl_Position.x = _1644;
    out.gl_Position.y = _1650;
    out.gl_Position.z = _2237;
    out.gl_Position.w = _1620;
    out.m_85.x = _2275;
    out.m_85.y = _2273;
    out.m_85.z = _2261;
    out.m_85.w = _1620;
    out.m_47.x = _2277;
    float _2279 = _2227 * _1672;
    float _2281 = _1691 * _2279;
    float _2283 = _1691 * _2251;
    float _2285 = _1701 * _2279;
    float _2287 = fma(_1697, _2281, _1685);
    float _2289 = fma(_1699, _2281, _1687);
    float _2291 = fma(_1691, _2285, _1689);
    out.m_87.x = _2287;
    out.m_87.y = _2289;
    out.m_87.z = _2291;
    out.m_87.w = _2283;
    if (_2247)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2293 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2293;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _870 = false;
    bool _762 = false;
    bool _626 = false;
    bool _464 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2349 = as_type<float>(_120);
        out.gl_Position.z = _2349;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    float _126 = float(_106);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _124;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2413 = as_type<float>(_154);
        out.gl_Position.z = _2413;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = 1.0 / _126;
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _160 = _130 * _156;
    bool _162 = !_158;
    float _180;
    if (!_162)
    {
        float _164 = in.m_51.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        _180 = _160;
    }
    _182 = false;
    float _184 = _180;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _188 = _184 + _186;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _192 = _184 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _196 = _184 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = 1.0 / _200;
    float _216 = 1.0 / _204;
    bool _218 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _220 = 1.0 / _212;
    float _222 = _188 * _214;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _226 = _184 + _224;
    float _228 = 1.0 / _208;
    float _230 = _192 * _216;
    bool _232 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _234 = isnan(_184);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _244;
    float _248 = -_242;
    float _250 = _248 + 1.0;
    float _252 = _226 * _220;
    bool _254 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _256 = isnan(_184);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = fma(_246, _222, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _268 = _264 * _250;
    float _270 = -_264;
    float _272 = _270 + 1.0;
    float _274 = _196 * _228;
    bool _276 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _278 = isnan(_184);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    bool _296 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_184);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = _286 * _272;
    float _310 = -_286;
    float _312 = _310 + 1.0;
    float _314 = fma(_290, _222, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _316 = fma(_294, _222, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _318 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_184);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_306;
    float _332 = _330 + 1.0;
    float _334 = _306 * _312;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = _328 * _332;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = fma(_338, _230, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _352 = -_328;
    float _354 = _352 + 1.0;
    float _356 = _314 * _344;
    float _358 = _316 * _344;
    float _360 = _266 * _344;
    float _362 = in.m_53.x;
    float _364 = in.m_53.y;
    float _366 = in.m_53.z;
    float _368 = fma(_342, _230, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _370 = fma(_348, _230, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _372 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].x, _356);
    float _374 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].y, _358);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _384;
    float _388 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[143].z, _360);
    float _390 = fma(_350, _334, _372);
    float _392 = fma(_368, _334, _374);
    float _394 = fma(_378, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _396 = fma(_382, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _398 = fma(_386, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _412 = fma(_370, _334, _388);
    float _414 = fma(_402, _252, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _416 = fma(_406, _252, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _418 = fma(_410, _252, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _420 = fma(_394, _308, _390);
    float _422 = fma(_396, _308, _392);
    float _424 = fma(_398, _308, _412);
    float _426 = fma(_414, _268, _420);
    float _428 = fma(_416, _268, _422);
    float _430 = fma(_418, _268, _424);
    float _432 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[147].x, _426);
    float _434 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[147].y, _428);
    float _436 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[147].z, _430);
    float _438 = _432 * _362;
    float _440 = _434 * _364;
    float _442 = _436 * _366;
    bool _444 = !_218;
    float _462;
    if (!_444)
    {
        float _446 = in.m_51.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        _462 = _160;
    }
    _464 = false;
    float _466 = _462;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = _466 + _468;
    bool _472 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_466);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _466 + _484;
    bool _488 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _490 = isnan(_466);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _508 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _510 = isnan(_466);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_482;
    float _522 = _520 + 1.0;
    float _524 = 1.0 / _506;
    float _526 = _518 * _522;
    float _528 = -_518;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _532;
    bool _536 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _538 = 1.0 / _502;
    float _540 = _498 * _530;
    float _542 = -_498;
    float _544 = _542 + 1.0;
    float _546 = _486 * _524;
    float _548 = _470 * _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _554;
    float _558 = fma(_534, _548, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _560 = fma(_552, _548, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _562 = fma(_556, _548, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _564 = _558 * _540;
    float _566 = _560 * _540;
    float _568 = _562 * _540;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _582 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].x, _564);
    float _584 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].y, _566);
    float _586 = fma(_572, _546, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _588 = fma(_576, _546, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _590 = fma(_580, _546, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _592 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].z, _568);
    float _594 = fma(_586, _526, _582);
    float _596 = fma(_588, _526, _584);
    float _598 = fma(_590, _526, _592);
    float _600 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[109].x, _594);
    float _602 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[109].y, _596);
    float _604 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[109].z, _598);
    bool _606 = !_536;
    float _624;
    if (!_606)
    {
        float _608 = in.m_51.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        _624 = _160;
    }
    _626 = false;
    float _628 = _624;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _628 + _630;
    float _634 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _640 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _642 = isnan(_628);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _656 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _658 = isnan(_628);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _668;
    bool _672 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = isnan(_628);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = 1.0 / _638;
    float _686 = -_650;
    float _688 = _686 + 1.0;
    bool _690 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _692 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _694 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _696 = _666 * _688;
    float _698 = -_666;
    float _700 = _698 + 1.0;
    float _702 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = 1.0 / _654;
    float _706 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _670 * _684;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _716 = fma(_710, _632, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _718 = _714 * _704;
    float _720 = _716 * _696;
    float _722 = -_682;
    float _724 = _722 + 1.0;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = _628 + _726;
    float _730 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[115].x, _720);
    float _732 = _650 * _724;
    float _734 = fma(_718, _728, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _736 = fma(_734, _732, _730);
    float _738 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[117].x, _736);
    float _740 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _742 = !_690;
    float _760;
    if (!_742)
    {
        float _744 = in.m_51.x;
        float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _748 = _744 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _752 = _750 * _746;
        float _754 = floor(_752);
        float _756 = -_754;
        float _758 = _752 + _756;
        _760 = _758;
        _762 = true;
    }
    else
    {
        _760 = _160;
    }
    _762 = false;
    float _764 = _760;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = _764 + _766;
    bool _770 = _764 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _772 = isnan(_764);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _782;
    bool _786 = _764 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _788 = isnan(_764);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = -_780;
    float _800 = _798 + 1.0;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _802;
    float _806 = 1.0 / _784;
    bool _808 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _810 = _796 * _800;
    float _812 = -_796;
    float _814 = _812 + 1.0;
    float _816 = _768 * _806;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _818;
    float _822 = fma(_804, _816, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _824;
    float _828 = fma(_820, _816, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _830 = _822 * _810;
    float _832 = fma(_826, _816, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _834 = _828 * _810;
    float _836 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[123].x, _830);
    float _838 = _832 * _810;
    float _840 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[123].z, _834);
    float _842 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[124].x, _836);
    float _844 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[123].y, _838);
    float _846 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[124].y, _844);
    float _848 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[124].z, _840);
    bool _850 = !_808;
    float _868;
    if (!_850)
    {
        float _852 = in.m_51.x;
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _856 = _852 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _858 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _860 = _858 * _854;
        float _862 = floor(_860);
        float _864 = -_862;
        float _866 = _860 + _864;
        _868 = _866;
        _870 = true;
    }
    else
    {
        _868 = _160;
    }
    _870 = false;
    float _872 = _868;
    float _874 = in.m_44.x;
    float _876 = in.m_44.y;
    float _878 = in.m_44.z;
    float _880 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _882 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _884 = in.m_55.x;
    float _886 = in.m_55.y;
    float _888 = in.m_55.z;
    float _890 = _880 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _892 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _894 = in.m_57.y;
    float _896 = _876 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _898 = _876 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _900 = _876 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _902 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[5].x, _896);
    float _904 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[4].x, _898);
    float _906 = fma(_874, (*spvDescriptorSet0.vp_c10)._m0[6].x, _900);
    float _908 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[5].z, _902);
    float _910 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[4].z, _904);
    float _912 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[6].z, _906);
    float _914 = -_894;
    float _916 = _914 + 1.0;
    float _918 = _908 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _920 = _910 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _922 = _912 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _926 = _918 + _924;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _930 = _920 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _934 = _922 + _932;
    float _936 = _926 * _926;
    float _938 = fma(_930, _930, _936);
    float _940 = fma(_934, _934, _938);
    float _942 = sqrt(_940);
    float _944 = rsqrt(_940);
    float _946 = _942 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _948 = precise::min(_890, _946);
    float _950 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _952 = _944 * _948;
    float _954 = _926 * _952;
    float _956 = _930 * _952;
    float _958 = _934 * _952;
    float _960 = -_954;
    float _962 = _926 + _960;
    float _964 = -_956;
    float _966 = _930 + _964;
    float _968 = -_958;
    float _970 = _934 + _968;
    float _972 = _962 * _962;
    float _974 = fma(_966, _966, _972);
    float _976 = fma(_970, _970, _974);
    float _978 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _950);
    float _980 = sqrt(_976);
    float _982 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _978);
    bool _984 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _986 = isnan(0.5);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _992 = _988 || _990;
    bool _994 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _996 = isnan(0.5);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1002 = _998 || _1000;
    float _1004 = rsqrt(_982);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    float _1008 = _944 * _980;
    float _1010 = _882 * _1008;
    float _1012 = _880 * _1008;
    float _1014 = _892 * _1008;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _884);
    float _1018 = _1010 * _1006;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _888);
    float _1022 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1024 = _1012 * _1016;
    float _1026 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1028 = _1014 * _1020;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1032 = _1022 * _1022;
    float _1034 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1026);
    float _1036 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1030);
    float _1038 = -_1032;
    float _1040 = fma(_1038, _1032, 1.0);
    float _1042 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1034);
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1036);
    float _1046 = _916 * _1040;
    float _1048 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1050 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1052 = _1046 * 0.800000011920928955078125;
    float _1054 = _922 + _1048;
    float _1056 = _160 + 0.20000000298023223876953125;
    float _1058 = _920 + _1050;
    float _1060 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1062 = _1054 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1066 = _1058 + _1064;
    float _1068 = _1062 * _1052;
    float _1070 = _1066 * _1052;
    float _1072 = fma(_1068, _1056, _1054);
    float _1074 = -_958;
    float _1076 = _922 + _1074;
    float _1078 = fma(_1070, _1056, _1058);
    float _1080 = -_954;
    float _1082 = _918 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1086 = _1072 + _1084;
    float _1088 = -_956;
    float _1090 = _920 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1094 = _1078 + _1092;
    float _1096 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1098 = _1086 * _1086;
    float _1100 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1096);
    float _1102 = fma(_1094, _1094, _1098);
    float _1104 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1106 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1100);
    float _1108 = sqrt(_1102);
    float _1110 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1104);
    float _1112 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1114 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1116 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1110);
    float _1118 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1112);
    float _1120 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1122 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1118);
    float _1124 = 1.0 / _1120;
    float _1126 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1128 = _1114 + _1120;
    bool _1130 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1132 = _918 + _1126;
    float _1134 = _1114;
    float _1136 = _1018;
    float _1138 = _1078;
    float _1140 = _1112;
    float _1142 = _954;
    float _1144 = _1072;
    float _1146 = _894;
    if (!_1130)
    {
        _1134 = _1078;
    }
    float _1148 = _1134;
    float _1150 = _1148;
    if (!_1130)
    {
        _1136 = _1072;
    }
    float _1152 = _1136;
    float _1154 = _1152;
    if (!_1130)
    {
        _1138 = _1132;
    }
    float _1156 = _1138;
    bool _1158 = !_1130;
    float _1160 = _1156;
    if (!_1158)
    {
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1166 = _1108 + _1164;
        float _1168 = _1132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = rsqrt(_1102);
        float _1172 = _1166 * _1162;
        float _1174 = _1172 * 0.15915493667125701904296875;
        float _1176 = _1174 * 6.283185482025146484375;
        float _1178 = sin(_1176);
        float _1180 = _1174 * 6.283185482025146484375;
        float _1182 = cos(_1180);
        float _1184 = fma(_1178, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1186 = _1170 * _1184;
        float _1188 = _1182 + (-1.0);
        float _1190 = fma(_1094, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1192 = fma(_1086, _1186, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1194 = _1188 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = fma(_1132, _1182, _1194);
        _1150 = _1190;
        _1160 = _1196;
        _1154 = _1192;
        _1140 = _1194;
    }
    float _1198 = _1150;
    float _1200 = _1160;
    float _1202 = _1154;
    float _1204 = _1140;
    float _1206 = -_956;
    float _1208 = _1206 + _1198;
    float _1210 = -_954;
    float _1212 = _1210 + _1200;
    float _1214 = -_958;
    float _1216 = _1214 + _1202;
    float _1218 = _1128 * _1124;
    float _1220 = _1218 * 0.5;
    float _1222 = _1204;
    float _1224 = _1200;
    float _1226 = _1212;
    float _1228 = _1216;
    float _1230 = _1198;
    if (_1002)
    {
        _1222 = 1.0;
    }
    float _1232 = _1222;
    float _1234 = _1232;
    if (_992)
    {
        _1142 = _1208;
    }
    float _1236 = _1142;
    float _1238 = _1236;
    if (!_992)
    {
        float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1242 = _1082 + _1240;
        float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1246 = _1090 + _1244;
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = -_920;
        float _1252 = _1250 + _1198;
        float _1254 = _1242 * _1242;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1258 = _1076 + _1256;
        float _1260 = -_918;
        float _1262 = _1260 + _1200;
        float _1264 = -_922;
        float _1266 = _1264 + _1202;
        float _1268 = fma(_1246, _1246, _1254);
        float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1272 = fma(_1258, _1258, _1268);
        float _1274 = sqrt(_1272);
        float _1276 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1278 = precise::min(_1274, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1280 = _1278 * _1270;
        float _1282 = _1276 * _1280;
        float _1284 = fma(_1252, _1282, _1090);
        float _1286 = fma(_1262, _1282, _1082);
        float _1288 = fma(_1266, _1282, _1076);
        _1224 = _1262;
        _1226 = _1286;
        _1238 = _1284;
        _1228 = _1288;
        _1230 = _1252;
    }
    float _1290 = _1224;
    float _1292 = _1226;
    float _1294 = _1238;
    float _1296 = _1228;
    float _1298 = _1230;
    float _1300 = _1290;
    float _1302 = _1298;
    if (!_1002)
    {
        float _1304 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1306 = _1304 * 0.15915493667125701904296875;
        float _1308 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1312 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1310);
        float _1314 = _1306 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = _1308 * 0.15915493667125701904296875;
        float _1320 = _1306 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = 1.0 / _1316;
        float _1326 = _1318 * 6.283185482025146484375;
        float _1328 = cos(_1326);
        float _1330 = _1322 * _1324;
        float _1332 = _1318 * 6.283185482025146484375;
        float _1334 = sin(_1332);
        float _1336 = _1328 * _1330;
        float _1338 = 1.0 / _1312;
        float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1342 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1340;
        float _1344 = 1.0 / _1336;
        float _1346 = 1.0 / _1342;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1350 = _1338 * _1348;
        float _1352 = _1334 * _1344;
        float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1356 = fma(_1352, _1350, _1354);
        float _1358 = _1356 * _1346;
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        _1300 = _1346;
        _1234 = _1360;
    }
    float _1362 = _1300;
    float _1364 = _1234;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1368 = _1292 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _1294 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1376 = _1296 + _1374;
    float _1378 = _1368 * _1368;
    float _1380 = fma(_1372, _1372, _1378);
    float _1382 = fma(_1376, _1376, _1380);
    float _1384 = rsqrt(_1382);
    float _1386 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1388 = _1372 * _1386;
    float _1390 = _1376 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 * _1390;
    float _1396 = _1392 + _1394;
    float _1398 = sqrt(_1396);
    bool _1400 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = _1398 + _1402;
    float _1406 = _1384;
    float _1408 = _1396;
    float _1410 = _1404;
    float _1412 = _1362;
    float _1414 = _1368;
    if (_1400)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1406 = _1416;
    }
    float _1418 = _1406;
    if (_1400)
    {
        float _1420 = rsqrt(_1396);
        _1408 = _1420;
    }
    float _1422 = _1408;
    float _1424 = _1422;
    if (_1400)
    {
        float _1426 = _1404 * _1418;
        _1410 = _1426;
    }
    float _1428 = _1410;
    if (_1400)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1412 = _1430;
    }
    float _1432 = _1412;
    float _1434 = _1376;
    if (_1400)
    {
        float _1436 = _1432 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        _1434 = _1438;
    }
    float _1440 = _1434;
    float _1442 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1444 = precise::max(0.0, _1442);
    float _1446 = _1418;
    float _1448 = _1444;
    if (_1400)
    {
        float _1450 = _1432 * 6.283185482025146484375;
        float _1452 = cos(_1450);
        _1446 = _1452;
    }
    float _1454 = _1446;
    float _1456 = -_1386;
    float _1458 = -_1444;
    float _1460 = fma(_1368, _1456, _1458);
    if (_1400)
    {
        float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1462;
    }
    float _1464 = _1414;
    float _1466 = _1464;
    float _1468 = _1440;
    if (_1400)
    {
        float _1470 = fma(_1440, _1464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1466 = _1470;
    }
    float _1472 = _1466;
    float _1474 = _1472;
    if (!_1400)
    {
        _1468 = _1388;
    }
    float _1476 = _1468;
    float _1478 = _1476;
    float _1480 = _1454;
    if (_1400)
    {
        float _1482 = _1454 + (-1.0);
        _1448 = _1482;
    }
    float _1484 = _1448;
    float _1486 = _1484;
    if (_1400)
    {
        float _1488 = _1422 * _1472;
        _1144 = _1488;
    }
    float _1490 = _1144;
    if (!_1400)
    {
        _1424 = _1392;
    }
    float _1492 = _1424;
    float _1494 = sqrt(_1382);
    float _1496 = _1492;
    if (_1400)
    {
        float _1498 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1302 = _1498;
    }
    float _1500 = _1302;
    if (_1400)
    {
        float _1502 = _1388 * _1490;
        _1478 = _1502;
    }
    float _1504 = _1478;
    if (!_1400)
    {
        _1474 = _1460;
    }
    float _1506 = _1474;
    float _1508 = _1506;
    if (!_1400)
    {
        _1486 = _1390;
    }
    float _1510 = _1486;
    float _1512 = _1510;
    if (_1400)
    {
        float _1514 = fma(_1460, _1454, _1500);
        _1508 = _1514;
    }
    float _1516 = _1508;
    if (_1400)
    {
        float _1518 = _1390 * _1490;
        _1512 = _1518;
    }
    float _1520 = _1512;
    if (_1400)
    {
        float _1522 = _1504 * _1504;
        _1496 = _1522;
    }
    float _1524 = _1496;
    if (!_1400)
    {
        _1480 = _1394;
    }
    float _1526 = _1480;
    float _1528 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1530 = _1526;
    if (_1400)
    {
        float _1532 = _1520 * _1520;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1516, _1516, _1524);
    float _1538 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1528);
    float _1540 = _1536 + _1534;
    float _1542 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1538);
    float _1552 = rsqrt(_1540);
    float _1554 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1556 = -_1548;
    float _1558 = _1556 + 1.0;
    float _1560 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1562 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1564 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1554);
    float _1566 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1568 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1570 = abs(_1558);
    float _1572 = log2(_1570);
    float _1574 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1576 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1566);
    float _1578 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1562);
    float _1580 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1582 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1576);
    float _1584 = _1552 * _1504;
    float _1586 = _1552 * _1516;
    float _1588 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1590 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1594 = -_1580;
    float _1596 = fma(_1594, _1568, 1.0);
    float _1598 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1578);
    float _1600 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1590);
    float _1602 = _1552 * _1520;
    float _1604 = -_1592;
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1604);
    float _1608 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1610 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1600);
    float _1612 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1614 = -_1602;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1606);
    float _1618 = log2(_1596);
    float _1620 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1610);
    float _1622 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1624 = fma(_1616, -0.5, 0.5);
    float _1626 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = fma(_1616, 0.5, 0.5);
    float _1630 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1622);
    float _1632 = _1586 + 1.0;
    float _1634 = 1.0 / _1620;
    float _1636 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1638 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1630);
    float _1640 = fma(_1628, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1642 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1644 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1646 = fma(_1628, _1640, -0.212114393711090087890625);
    float _1648 = exp2(_1612);
    float _1650 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1642);
    float _1652 = _1618 * 0.693147182464599609375;
    float _1654 = fma(_1628, _1646, 1.570728778839111328125);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1658 = sqrt(_1624);
    float _1660 = _1644 * _1634;
    float _1662 = _1650 * _1634;
    float _1664 = fma(_1660, 0.5, 0.5);
    float _1666 = fma(_1662, -0.5, 0.5);
    float _1668 = -_1586;
    float _1670 = fma(_1648, _1632, _1668);
    float3 _4875 = float3(_1664, _1666, _1656);
    float _1672 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4875, float3(0.0), isnan(_4875)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4875, float3(0.0), isnan(_4875)), level(0.0)).x;
    float _1674 = fma(_1670, 0.5, 0.5);
    float _1676 = _1658 * 0.636619746685028076171875;
    float _1678 = -_1654;
    float _1680 = fma(_1676, _1678, 1.0);
    float3 _4896 = float3(_1664, _1666, _1656);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4896, float3(0.0), isnan(_4896)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4896, float3(0.0), isnan(_4896)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float2 _4913 = float2(_1680, _1674);
    float3 _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4913, float2(0.0), isnan(_4913)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4913, float2(0.0), isnan(_4913)), level(0.0)).xyz;
    float _1697 = _1695.x;
    float _1699 = _1695.y;
    float _1701 = _1695.z;
    float _1703 = in.m_51.w;
    float _1705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1707 = in.m_59.x;
    float _1709 = in.m_59.y;
    float _1711 = in.m_59.z;
    float _1713 = in.m_59.w;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1721 = _1719 != 0;
    float _1723 = in.m_51.y;
    float _1725 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1727 = 1.0 / _1717;
    float _1729 = in.m_51.z;
    int _1731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1733 = _1731 != 0;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1737 = _1735 != 0;
    out.m_61.x = _702;
    out.m_61.y = _706;
    out.m_61.z = _708;
    out.m_61.w = _740;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1741 = _1739 != 0;
    float _1743 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1747 = _1745 != 0;
    float _1749 = in.m_57.x;
    int _1751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1753 = _1751 != 0;
    float _1755 = exp2(_1725);
    bool _1757 = _1703 > 0.5;
    float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1759;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1765 = _1763 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1767 = in.m_51.x;
    float _1769 = _1757 ? _916 : _894;
    float _1771 = _1761 * _1727;
    float _1773 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1777 = _1775 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1779 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1781 = _1723 > 0.5;
    float _1783 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1785 = 1.0 / _1777;
    float _1787 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1779);
    int _1789 = _1781 ? as_type<int>(_916) : as_type<int>(_894);
    float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1793 = _872 + _1791;
    float _1795 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1773);
    float _1797 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1787);
    float _1799 = _1741 ? as_type<float>(_1789) : _894;
    float _1801 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1783);
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1805 = _1803 != 0;
    float _1807 = fma(_1771, _1793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1809 = _1747 ? as_type<int>(_1769) : as_type<int>(_894);
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1813 = _872 + _1811;
    bool _1815 = _1729 > 0.5;
    float _1817 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1795);
    float _1819 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1801);
    float _1821 = _1795;
    float _1823 = _1771;
    float _1825 = _1769;
    bool _1827 = _1753;
    int _1829 = _1809;
    float _1831 = _1807;
    float _1833 = _1801;
    float _1835 = _1729;
    if (!_1721)
    {
        _1821 = _1749;
    }
    float _1837 = _1821;
    float _1839 = _1765 * _1785;
    float _1841 = _1837;
    if (_1753)
    {
        float _1843 = _1815 ? _916 : _894;
        _1146 = _1843;
    }
    float _1845 = _1146;
    float _1847 = -_1755;
    float _1849 = _1847 + 1.0;
    float _1851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1853 = fma(_1839, _1813, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1855 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1857 = isnan(_872);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    out.m_63.x = _1797;
    out.m_63.y = _1817;
    out.m_63.z = _1819;
    int _1867 = as_type<int>(_1845);
    if (!_1721)
    {
        _1823 = _1837;
    }
    float _1869 = _1823;
    float _1871 = _1869;
    if (_1721)
    {
        _1841 = _1749;
    }
    float _1873 = _1841;
    float _1875 = -_1865;
    float _1877 = _1875 + 1.0;
    out.m_65.x = _1090;
    out.m_65.y = _1082;
    out.m_65.z = _1076;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1881 = _1873;
    if (!_1805)
    {
        _1825 = _1723;
    }
    float _1883 = _1825;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1887 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1889 = isnan(_872);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1901 = _872 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1903 = isnan(_872);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = fma(_1743, _1845, -0.5);
    float _1915 = _1883;
    if (_1733)
    {
        float _1917 = -_1873;
        float _1919 = _1917 + 1.0;
        _1867 = as_type<int>(_1919);
    }
    int _1921 = _1867;
    float _1923 = _1897 * _1877;
    float _1925 = -_1897;
    float _1927 = _1925 + 1.0;
    float _1929 = fma(as_type<float>(_1809), _1899, -0.5);
    float _1931 = as_type<float>(_1921);
    if (_1721)
    {
        bool _1933 = _1767 > 0.5;
        _1827 = _1933;
    }
    bool _1935 = _1827;
    if (_1737)
    {
        float _1937 = -_1873;
        float _1939 = _1937 + 1.0;
        _1829 = as_type<int>(_1939);
    }
    int _1941 = _1829;
    float _1943 = _1911 * _1927;
    int _1945 = as_type<int>(_1943);
    if (_1805)
    {
        _1915 = _1767;
    }
    float _1947 = _1915;
    float _1949 = -_1911;
    float _1951 = _1949 + 1.0;
    float _1953 = _1807 * _1943;
    float _1955 = _1947;
    if (_1721)
    {
        float _1957 = -_1873;
        float _1959 = _1957 + 1.0;
        _1945 = as_type<int>(_1959);
    }
    int _1961 = _1945;
    if (!_1733)
    {
        _1831 = _1873;
    }
    float _1963 = _1831;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1967 = _1963;
    if (_1733)
    {
        float _1969 = _1815 ? as_type<float>(_1921) : _1873;
        _1967 = _1969;
    }
    float _1971 = _1967;
    float _1973 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1879);
    if (_1721)
    {
        float _1975 = _1935 ? as_type<float>(_1961) : _1873;
        _1871 = _1975;
    }
    float _1977 = _1871;
    float _1979 = fma(_1951, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1953);
    if (_1737)
    {
        float _1981 = _1781 ? as_type<float>(_1941) : _1873;
        _1881 = _1981;
    }
    float _1983 = _1881;
    float _1985 = in.m_67.x;
    float _1987 = in.m_67.y;
    float _1989 = in.m_67.z;
    float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1993 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1885);
    float _1995 = _1947 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1805)
    {
        _1955 = _1723;
    }
    float _1997 = _1955;
    float _1999 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1965);
    float _2001 = _1997;
    if (_1805)
    {
        _1833 = _1767;
    }
    float _2003 = _1833;
    float _2005 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1993);
    float _2007 = _2003;
    if (!_1805)
    {
        _2001 = _1767;
    }
    float _2009 = _2001;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2013 = _886 != 0.0;
    bool _2015 = isnan(_886);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan(0.0);
    bool _2021 = _2017 || _2019;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2025 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1999);
    bool _2027 = _884 == 0.0;
    bool _2029 = !_2021;
    bool _2031 = _2027 && _2029;
    float _2033 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1973);
    float _2035 = _2011;
    if (!_1805)
    {
        _2007 = _1729;
    }
    float _2037 = _2007;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2041 = _888 == 0.0;
    bool _2043 = _2041 && _2031;
    float _2045 = _1991 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2047 = _2037 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2049 = _2047;
    if (!_1805)
    {
        _1931 = _1729;
    }
    float _2051 = _1931;
    float _2053 = -_2039;
    float _2055 = fma(_1995, 2.0, _2053);
    float _2057 = _2051;
    if (_1805)
    {
        _1835 = _1723;
    }
    float _2059 = _1835;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2063 = fma(_2045, _1971, -0.5);
    float _2065 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2067 = -_130;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2055);
    float _2071 = -_2061;
    float _2073 = fma(_2047, 2.0, _2071);
    if (_1805)
    {
        _2057 = _1723;
    }
    float _2075 = _2057;
    float _2077 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2079 = fma(_1853, _1923, _1979);
    float _2081 = _2075;
    if (_2043)
    {
        _2049 = _1985;
    }
    float _2083 = _2049;
    float _2085 = fma(_2065, _1983, -0.5);
    float _2087 = -_130;
    float _2089 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2073);
    float _2091 = _2083;
    if (!_2043)
    {
        float _2093 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1985);
        _2091 = _2093;
    }
    float _2095 = _2091;
    float _2097 = fma(_2005, _2063, _2069);
    float _2099 = _1707 * _1987;
    float _2101 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2011);
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_2043)
    {
        _2035 = _1987;
    }
    float _2105 = _2035;
    float _2107 = fma(_2025, _2085, _2089);
    float _2109 = _2105;
    if (!_2043)
    {
        float _2111 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1987);
        _2109 = _2111;
    }
    float _2113 = _2109;
    float _2115 = _1711 * _1985;
    float _2117 = _1709 * _1989;
    float _2119 = -_2099;
    float _2121 = fma(_1709, _1985, _2119);
    float _2123 = fma(_2077, -2.0, _2103);
    float _2125 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_2043)
    {
        _2081 = _1989;
    }
    float _2127 = _2081;
    float _2129 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2131 = _2127;
    if (!_2043)
    {
        float _2133 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1989);
        _2131 = _2133;
    }
    float _2135 = _2131;
    float _2137 = -_2115;
    float _2139 = fma(_1707, _1989, _2137);
    float _2141 = -_2117;
    float _2143 = fma(_1711, _1987, _2141);
    float _2145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2147 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2101);
    float _2149 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2123);
    float _2151 = fma(_2129, -2.0, _2125);
    float _2153 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2079);
    float _2155 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2157 = -_2149;
    float _2159 = fma(_2147, _1929, _2157);
    float _2161 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2151);
    float _2163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2165 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2167 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2169 = _2139 * _1713;
    float _2171 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2155);
    float _2173 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2165);
    float _2175 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2177 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2167);
    float _2179 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2181 = _848 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2183 = _2143 * _1713;
    float _2185 = _2121 * _1713;
    float _2187 = -_2161;
    float _2189 = fma(_2033, _1913, _2187);
    float _2191 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2193 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2195 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2197 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2199 = _2175 * _2145;
    float _2201 = _2179 * _2163;
    float _2203 = _2097 + 0.5;
    float _2205 = _2159 + 0.5;
    float _2207 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2191);
    float _2209 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2193);
    float _2211 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2195);
    float _2213 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2197);
    float _2215 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2173);
    float _2217 = _842 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2219 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2221 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2171);
    float _2223 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2177);
    out.m_69.x = _2201;
    out.m_69.y = _2199;
    out.m_69.z = _2203;
    out.m_69.w = _2205;
    float _2225 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2213);
    float _2227 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2229 = _2217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2231 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2233 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2235 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _2215;
    out.m_71.y = _2221;
    out.m_71.z = _2223;
    float _2237 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2225);
    bool _2239 = _1364 > 0.0;
    bool _2241 = isnan(_1364);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(0.0);
    bool _2247 = _2243 || _2245;
    float _2249 = -_2227;
    float _2251 = _2249 + 1.0;
    out.m_73.x = _2229;
    out.m_73.y = _2231;
    out.m_73.z = _2233;
    out.m_73.w = _2235;
    float _2253 = _2107 + 0.5;
    float _2255 = _2189 + 0.5;
    float _2257 = _2237 + _1620;
    out.m_75.x = _1012;
    float _2259 = _1620 * 0.5;
    float _2261 = _2257 * 0.5;
    out.m_77.x = _2253;
    out.m_77.y = _2255;
    float _2263 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2207);
    float _2265 = _1364 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2267 = _1644 + _1620;
    out.m_79.x = _1294;
    out.m_79.y = _1292;
    out.m_79.z = _1296;
    float _2269 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2209);
    float _2271 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2211);
    float _2273 = fma(_1650, -0.5, _2259);
    float _2275 = _2267 * 0.5;
    float _2277 = _2265 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.w = _948;
    out.m_83.x = _2263;
    out.m_83.y = _2269;
    out.m_83.z = _2271;
    out.gl_Position.x = _1644;
    out.gl_Position.y = _1650;
    out.gl_Position.z = _2237;
    out.gl_Position.w = _1620;
    out.m_85.x = _2275;
    out.m_85.y = _2273;
    out.m_85.z = _2261;
    out.m_85.w = _1620;
    out.m_47.x = _2277;
    float _2279 = _2227 * _1672;
    float _2281 = _1691 * _2279;
    float _2283 = _1691 * _2251;
    float _2285 = _1701 * _2279;
    float _2287 = fma(_1697, _2281, _1685);
    float _2289 = fma(_1699, _2281, _1687);
    float _2291 = fma(_1691, _2285, _1689);
    out.m_87.x = _2287;
    out.m_87.y = _2289;
    out.m_87.z = _2291;
    out.m_87.w = _2283;
    if (_2247)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2293 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2293;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

