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
    float4 m_65 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1200 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1751 = as_type<float>(_104);
        out.gl_Position.z = _1751;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    float _110 = float(_90);
    float _112 = 1.0 / _110;
    float _114 = -_108;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_108);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = _116 * _112;
    bool _130 = _116 >= _110;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    out.m_51.x = _128;
    float _136 = _108;
    float _138 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1823 = as_type<float>(_144);
        out.gl_Position.z = _1823;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_53.y;
    float _148 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_55.w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    float _174 = 0.0;
    float _176 = _148;
    if (!_160)
    {
        float _178 = _148 * _148;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    out.m_57.y = _146;
    bool _190 = !_160;
    float _192 = _188;
    float _194 = _146;
    if (!_190)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _148 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _148);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _224;
    }
    float _226 = _192;
    bool _228 = !_160;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _148 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _176 = _248;
    }
    float _250 = _176;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _162, _254);
    float _262 = fma(_250, _164, _256);
    float _264 = fma(_250, _166, _258);
    float _266 = fma(_260, _150, _168);
    float _268 = fma(_262, _150, _170);
    float _270 = fma(_264, _150, _172);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_59.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        _290 = _128;
    }
    _292 = false;
    float _294 = _290;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _294 + _316;
    bool _320 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _322 = isnan(_294);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = 1.0 / _306;
    bool _334 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = isnan(_294);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_330;
    float _348 = _346 + 1.0;
    bool _350 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _352 = isnan(_294);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _314;
    float _364 = _344 * _348;
    float _366 = -_344;
    float _368 = _366 + 1.0;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _310;
    float _374 = _298 * _332;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _302 * _362;
    bool _386 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_294);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = _318 * _372;
    float _410 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -_396;
    float _418 = _416 + 1.0;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _420;
    float _424 = _396 * _368;
    float _426 = fma(_402, _408, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _428 = fma(_414, _408, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = fma(_406, _408, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = _360 * _418;
    float _434 = fma(_422, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = in.m_55.x;
    float _438 = in.m_55.y;
    float _440 = in.m_55.z;
    float _442 = _410 * _432;
    float _444 = _398 * _432;
    float _446 = -_360;
    float _448 = _446 + 1.0;
    float _450 = _434 * _432;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _464;
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _470 = fma(_454, _384, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _472 = fma(_458, _384, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _474 = fma(_466, _384, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _476 = fma(_426, _424, _460);
    float _478 = fma(_428, _424, _462);
    float _480 = fma(_430, _424, _468);
    float _482 = fma(_470, _364, _476);
    float _484 = fma(_472, _364, _478);
    float _486 = fma(_474, _364, _480);
    float _488 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].x, _482);
    float _490 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].y, _484);
    float _492 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].z, _486);
    float _494 = _488 * _436;
    float _496 = _490 * _438;
    float _498 = _492 * _440;
    bool _500 = !_370;
    if (!_500)
    {
        float _502 = in.m_59.x;
        float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _506 = _502 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _510 = _508 * _504;
        float _512 = floor(_510);
        float _514 = -_512;
        float _516 = _510 + _514;
        _138 = _516;
    }
    float _518 = _138;
    float _520 = in.m_59.w;
    float _522 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _524 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _526 = in.m_59.x;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _530 = _528 != 0;
    float _532 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _536 = _534 != 0;
    float _538 = in.m_59.y;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _542 = _540 != 0;
    float _544 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _548 = _546 != 0;
    float _550 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
    float _552 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _532);
    float _554 = in.m_53.x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    if (_536)
    {
        float _560 = in.m_59.z;
        _558 = _560;
    }
    float _562 = _558;
    float _564 = -_146;
    float _566 = _564 + 1.0;
    float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _570 = _520 > 0.5;
    float _572 = _526 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _574 = _570 ? as_type<int>(_566) : as_type<int>(_146);
    bool _576 = false;
    bool _578 = _570;
    if (_530)
    {
        bool _580 = _526 > 0.5;
        _576 = _580;
    }
    bool _582 = _576;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = -_556;
    float _590 = fma(_572, 2.0, _588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _598 = 1.0 / _586;
    float _600 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _602 = _538 > 0.5;
    float _604 = _542 ? as_type<float>(_574) : _146;
    float _606 = fma(_600, -2.0, _596);
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _610 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
    float _612 = 1.0 / _594;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _620 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[78].z, _608);
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _624 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _618);
    float _626 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _544);
    float _628 = 1.0 / _616;
    float _630 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _550);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _638 = _518 + _636;
    if (_548)
    {
        float _640 = _602 ? _566 : _146;
        _194 = _640;
    }
    float _642 = _194;
    float _644 = _626 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_536)
    {
        bool _646 = _562 > 0.5;
        _578 = _646;
    }
    bool _648 = _578;
    float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = _604 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _662 = _654 * _598;
    float _664 = _658 * _612;
    float _666 = -_116;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    float _670 = _634 * _628;
    float _672 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _620);
    float _674 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _606);
    float _676 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _624);
    float _678 = fma(_662, _638, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _682 = _518 + _680;
    bool _684 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _686 = isnan(_518);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _698 = _518 + _696;
    bool _700 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _702 = isnan(_518);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = fma(_664, _682, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _714 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _716 = isnan(_518);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_694;
    float _728 = _726 + 1.0;
    float _730 = fma(_670, _698, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _732 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _734 = isnan(_518);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _650 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _746 = _724 * _728;
    float _748 = -_724;
    float _750 = _748 + 1.0;
    float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _754 = fma(_744, _642, -0.5);
    float _756 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _758 = _742 * _750;
    float _760 = -_710;
    float _762 = _760 + 1.0;
    int _764 = as_type<int>(_598);
    int _766 = as_type<int>(_758);
    float _768 = _694;
    float _770 = _728;
    if (_530)
    {
        float _772 = -_554;
        float _774 = _772 + 1.0;
        _764 = as_type<int>(_774);
    }
    int _776 = _764;
    float _778 = -_742;
    float _780 = _778 + 1.0;
    float _782 = _678 * _758;
    if (_536)
    {
        float _784 = -_554;
        float _786 = _784 + 1.0;
        _766 = as_type<int>(_786);
    }
    int _788 = _766;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _756 + _790;
    float _794 = _694 * _762;
    if (!_530)
    {
        _768 = _554;
    }
    float _796 = _768;
    float _798 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[115].x, _782);
    float _800 = _796;
    if (!_536)
    {
        _770 = _554;
    }
    float _802 = _770;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _806 = _622 + _804;
    float _808 = _802;
    if (_530)
    {
        float _810 = _582 ? as_type<float>(_776) : _554;
        _800 = _810;
    }
    float _812 = _800;
    float _814 = fma(_712, _746, _798);
    if (_536)
    {
        float _816 = _648 ? as_type<float>(_788) : _554;
        _808 = _816;
    }
    float _818 = _808;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _822 = _644 + _820;
    float _824 = _792 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _826 = _752 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _828 = fma(_730, _794, _814);
    float _830 = -_674;
    float _832 = fma(_676, _754, _830);
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[28].x, _824);
    float _836 = fma(_826, _812, -0.5);
    float _838 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[118].x, _828);
    float _840 = _792 * _792;
    float _842 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[28].z, _834);
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _846 = fma(_672, _836, _668);
    float _848 = fma(_822, _822, _840);
    float _850 = _660 * _568;
    bool _852 = _842 >= 0.0;
    float _854 = _818 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _856 = fma(_806, _806, _848);
    float _858 = rsqrt(_856);
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _870 = _840;
    if (_852)
    {
        _870 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _872 = _870;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _876 = _854 * _844;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _880 = _860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _882 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _832 + 0.5;
    float _894 = _846 + 0.5;
    float _896 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _898 = as_type<int>(_872);
    if (_852)
    {
        float _900 = _872 * 5.0;
        _898 = as_type<int>(_900);
    }
    int _902 = _898;
    out.m_61.x = _886;
    out.m_61.y = _888;
    out.m_61.z = _890;
    out.m_61.w = _878;
    float _904 = _792 * _858;
    float _906 = _822 * _858;
    out.m_63.x = _894;
    out.m_63.y = _892;
    out.m_63.z = _876;
    out.m_63.w = _850;
    out.m_65.x = _880;
    out.m_65.y = _882;
    out.m_65.z = _884;
    out.m_65.w = _896;
    float _908 = as_type<float>(_902);
    if (_852)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3133 = as_type<float>(_902);
        out.gl_Position.z = _3133;
    }
    if (_852)
    {
        out.m_47.x = 0.0;
    }
    if (_852)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _910 = -_904;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _756);
    float _914 = _806 * _858;
    float _916 = -_906;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _644);
    float _920 = -_904;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _926 = _912 + _924;
    float _928 = -_914;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = _918 + _932;
    float _936 = -_906;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _940 = _926 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _944 = _930 + _942;
    float _946 = _922 * _922;
    float _948 = -_914;
    float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _806);
    float _952 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[28].x, _940);
    float _954 = fma(_938, _938, _946);
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[28].z, _952);
    float _958 = fma(_950, _950, _954);
    bool _960 = _956 >= 0.0;
    float _962 = _912;
    float _964 = _914;
    float _966 = _918;
    if (_960)
    {
        _908 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _968 = _908;
    int _970 = as_type<int>(_968);
    if (_960)
    {
        out.m_47.x = 0.0;
    }
    if (_960)
    {
        float _972 = _968 * 5.0;
        _970 = as_type<int>(_972);
    }
    int _974 = _970;
    if (_960)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3262 = as_type<float>(_974);
        out.gl_Position.z = _3262;
    }
    if (_960)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _976 = in.m_67.x;
    float _978 = in.m_67.y;
    float _980 = in.m_67.z;
    float _982 = sqrt(_958);
    float _984 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _988 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _990 = _858 * _982;
    float _992 = _990 * _984;
    float _994 = _990 * _986;
    float _996 = _990 * _988;
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _978);
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _976);
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _980);
    float _1004 = _998 * _992;
    float _1006 = _1000 * _994;
    float _1008 = _1002 * _996;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1012 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1014 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1016 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1010);
    float _1018 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1012);
    float _1020 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1014);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1016);
    float _1024 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1018);
    float _1026 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1020);
    float _1028 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1030 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1032 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1034 = _644 + _1028;
    float _1036 = _622 + _1030;
    float _1038 = _756 + _1032;
    float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1042 = _1034 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1036 + _1044;
    float _1048 = _1042 * _1042;
    float _1050 = _1046 * _1046;
    float _1052 = _1048 + _1050;
    float _1054 = sqrt(_1052);
    bool _1056 = _1054 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1058 = _1032;
    float _1060 = _1048;
    float _1062 = _1026;
    float _1064 = _1008;
    float _1066 = _1050;
    if (!_1056)
    {
        _1058 = _1048;
    }
    float _1068 = _1058;
    float _1070 = _1068;
    if (!_1056)
    {
        _1060 = _1034;
    }
    float _1072 = _1060;
    float _1074 = _1072;
    if (!_1056)
    {
        _1062 = _1036;
    }
    float _1076 = _1062;
    float _1078 = _1076;
    if (!_1056)
    {
        _1064 = _1038;
    }
    float _1080 = _1064;
    bool _1082 = !_1056;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1054 + _1088;
        float _1092 = rsqrt(_1052);
        float _1094 = _1090 * _1086;
        float _1096 = _1038 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = _1094 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1092 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = fma(_1042, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1116 = fma(_1046, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1122 = _1114 + _1120;
        float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1126 = _1116 + _1124;
        float _1128 = fma(_1038, _1106, _1118);
        float _1130 = _1122 * _1122;
        float _1132 = _1126 * _1126;
        _1084 = _1128;
        _1070 = _1130;
        _1066 = _1132;
        _1074 = _1114;
        _1078 = _1116;
    }
    float _1134 = _1084;
    float _1136 = _1070;
    float _1138 = _1066;
    float _1140 = _1074;
    float _1142 = _1078;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1146 = _1134 + _1144;
    float _1148 = fma(_1146, _1146, _1136);
    float _1150 = _1148 + _1138;
    float _1152 = sqrt(_1150);
    bool _1154 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1156 = isnan(_1152);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1162 = _1158 || _1160;
    float _1164 = _1148;
    if (!_1162)
    {
        _1164 = 1.0;
    }
    float _1166 = _1164;
    bool _1168 = !_1162;
    float _1170 = _1166;
    if (!_1168)
    {
        bool _1172 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1174 = isnan(_1152);
        bool _1176 = _1172 || _1174;
        bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1180 = _1176 || _1178;
        if (!_1180)
        {
            float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1184 = _1152 + _1182;
            float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1186;
            float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1194 = 1.0 / _1188;
            float _1196 = _1184 * _1194;
            float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1170 = _1198;
            _1200 = true;
        }
        else
        {
            bool _1202 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1204 = isnan(_1152);
            bool _1206 = _1202 || _1204;
            bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1210 = _1206 || _1208;
            if (!_1210)
            {
                float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1214 = _1152 + _1212;
                float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1218 = _1216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1222 = _1220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1224 = 1.0 / _1218;
                float _1226 = _1214 * _1224;
                float _1228 = fma(_1226, _1222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1170 = _1228;
                _1200 = true;
            }
            else
            {
                _1170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1200 = false;
    float _1230 = _1170;
    float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1234 = _1140 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1238 = _1134 + _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1242 = _1142 + _1240;
    bool _1244 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(0.5);
    bool _1252 = _1248 || _1250;
    float _1254 = fma(_1234, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1256 = fma(_1238, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1258 = fma(_1242, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1260 = -_906;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1254);
    float _1264 = -_904;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1268 = -_914;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    float _1272 = _1266;
    float _1274 = _1262;
    float _1276 = _1270;
    if (!_1252)
    {
        float _1278 = _926 * _926;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1282 = -_622;
        float _1284 = _1282 + _1258;
        float _1286 = -_644;
        float _1288 = _1286 + _1254;
        float _1290 = fma(_934, _934, _1278);
        float _1292 = -_756;
        float _1294 = _1292 + _1256;
        float _1296 = fma(_944, _944, _1290);
        float _1298 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1300 = sqrt(_1296);
        float _1302 = 1.0 / _990;
        float _1304 = precise::min(_1300, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1306 = _1304 * _1280;
        float _1308 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1310 = _1306 * _1302;
        float _1312 = _1308 * _1310;
        float _1314 = _1284 * _1310;
        float _1316 = fma(_1288, _1312, _918);
        float _1318 = fma(_1294, _1312, _912);
        float _1320 = fma(_1308, _1314, _930);
        _1272 = _1318;
        _1274 = _1316;
        _1276 = _1320;
    }
    float _1322 = _1272;
    float _1324 = _1274;
    float _1326 = _1276;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1330 = _1322 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1334 = _1324 + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1338 = _1326 + _1336;
    float _1340 = _1330 * _1330;
    float _1342 = fma(_1334, _1334, _1340);
    float _1344 = fma(_1338, _1338, _1342);
    float _1346 = rsqrt(_1344);
    float _1348 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1350 = _1334 * _1348;
    float _1352 = _1338 * _1348;
    float _1354 = _1350 * _1350;
    float _1356 = _1352 * _1352;
    float _1358 = _1354 + _1356;
    float _1360 = sqrt(_1358);
    bool _1362 = _1360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1366 = _1360 + _1364;
    float _1368 = _1338;
    float _1370 = _1358;
    float _1372 = _1366;
    float _1374 = _1350;
    if (_1362)
    {
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1368 = _1376;
    }
    float _1378 = _1368;
    if (_1362)
    {
        float _1380 = rsqrt(_1358);
        _1370 = _1380;
    }
    float _1382 = _1370;
    if (_1362)
    {
        float _1384 = _1366 * _1378;
        _1372 = _1384;
    }
    float _1386 = _1372;
    if (_1362)
    {
        float _1388 = _1386 * 0.15915493667125701904296875;
        _962 = _1388;
    }
    float _1390 = _962;
    float _1392 = _1340;
    if (_1362)
    {
        float _1394 = _1390 * 6.283185482025146484375;
        float _1396 = sin(_1394);
        _1392 = _1396;
    }
    float _1398 = _1392;
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1402 = precise::max(0.0, _1400);
    float _1404 = _1346;
    float _1406 = _1402;
    float _1408 = _1400;
    if (_1362)
    {
        float _1410 = _1390 * 6.283185482025146484375;
        float _1412 = cos(_1410);
        _1404 = _1412;
    }
    float _1414 = _1404;
    float _1416 = -_1348;
    float _1418 = -_1402;
    float _1420 = fma(_1330, _1416, _1418);
    float _1422 = _1420;
    if (!_1362)
    {
        _1406 = _1352;
    }
    float _1424 = _1406;
    float _1426 = _1424;
    if (_1362)
    {
        float _1428 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1428;
    }
    float _1430 = _1408;
    float _1432 = sqrt(_1344);
    float _1434 = _1398;
    float _1436 = _1430;
    if (_1362)
    {
        float _1438 = fma(_1398, _1430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1434 = _1438;
    }
    float _1440 = _1434;
    float _1442 = _1440;
    if (_1362)
    {
        float _1444 = _1414 + (-1.0);
        _1436 = _1444;
    }
    float _1446 = _1436;
    float _1448 = _1446;
    if (_1362)
    {
        float _1450 = _1382 * _1440;
        _964 = _1450;
    }
    float _1452 = _964;
    if (!_1362)
    {
        _1442 = _1354;
    }
    float _1454 = _1442;
    float _1456 = _1454;
    if (_1362)
    {
        float _1458 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _966 = _1458;
    }
    float _1460 = _966;
    if (_1362)
    {
        float _1462 = _1350 * _1452;
        _1374 = _1462;
    }
    float _1464 = _1374;
    if (_1362)
    {
        float _1466 = _1352 * _1452;
        _1426 = _1466;
    }
    float _1468 = _1426;
    if (!_1362)
    {
        _1448 = _1356;
    }
    float _1470 = _1448;
    float _1472 = _1470;
    if (_1362)
    {
        float _1474 = fma(_1420, _1414, _1460);
        _1422 = _1474;
    }
    float _1476 = _1422;
    if (_1362)
    {
        float _1478 = _1464 * _1464;
        _1456 = _1478;
    }
    float _1480 = _1456;
    if (_1362)
    {
        float _1482 = _1468 * _1468;
        _1472 = _1482;
    }
    float _1484 = _1472;
    float _1486 = fma(_1476, _1476, _1480);
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1490 = fma(_1432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1488);
    float _1492 = precise::clamp(_1490, 0.0, 1.0);
    float _1494 = _1486 + _1484;
    float _1496 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1500 = -_1492;
    float _1502 = _1500 + 1.0;
    float _1504 = rsqrt(_1494);
    float _1506 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    float _1508 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1510 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1498);
    float _1512 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1514 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1516 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1508);
    float _1518 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1510);
    float _1520 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1512);
    float _1522 = abs(_1502);
    float _1524 = log2(_1522);
    float _1526 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1516);
    float _1528 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1530 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1520);
    float _1532 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1538 = _1504 * _1464;
    float _1540 = _1504 * _1476;
    float _1542 = _1504 * _1468;
    float _1544 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1536);
    float _1546 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1550 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1552 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1554 = -_1546;
    float _1556 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1544);
    float _1560 = -_1550;
    float _1562 = fma(_1560, _1548, 1.0);
    float _1564 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1566 = -_1542;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1570 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1558);
    float _1572 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1574 = exp2(_1564);
    float _1576 = fma(_1568, -0.5, 0.5);
    float _1578 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1580 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1572);
    float _1582 = fma(_1568, 0.5, 0.5);
    float _1584 = _1540 + 1.0;
    float _1586 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1578);
    float _1588 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1580);
    float _1590 = log2(_1562);
    float _1592 = fma(_1582, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1594 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1586);
    float _1596 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1588);
    float _1598 = fma(_1582, _1592, -0.212114393711090087890625);
    float _1600 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1594);
    float _1602 = 1.0 / _1570;
    float _1604 = -_1540;
    float _1606 = fma(_1574, _1584, _1604);
    float _1608 = fma(_1582, _1598, 1.570728778839111328125);
    float _1610 = fma(_1606, 0.5, 0.5);
    float _1612 = sqrt(_1576);
    float _1614 = _1590 * 0.693147182464599609375;
    float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1618 = _1596 * _1602;
    float _1620 = _1600 * _1602;
    float _1622 = fma(_1618, 0.5, 0.5);
    float _1624 = fma(_1620, -0.5, 0.5);
    float _1626 = _1612 * 0.636619746685028076171875;
    float3 _4341 = float3(_1622, _1624, _1616);
    float _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4341, float3(0.0), isnan(_4341)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4341, float3(0.0), isnan(_4341)), level(0.0)).x;
    float3 _4352 = float3(_1622, _1624, _1616);
    float4 _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4352, float3(0.0), isnan(_4352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4352, float3(0.0), isnan(_4352)), level(0.0)).xyzw;
    float _1633 = _1631.x;
    float _1635 = _1631.y;
    float _1637 = _1631.z;
    float _1639 = _1631.w;
    float _1641 = -_1608;
    float _1643 = fma(_1626, _1641, 1.0);
    float2 _4374 = float2(_1643, _1610);
    float3 _1647 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4374, float2(0.0), isnan(_4374)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4374, float2(0.0), isnan(_4374)), level(0.0)).xyz;
    float _1649 = _1647.x;
    float _1651 = _1647.y;
    float _1653 = _1647.z;
    float _1655 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1659 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1657);
    float _1661 = exp2(_1655);
    float _1663 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1659);
    float _1665 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1663);
    float _1667 = _1665 + _1570;
    out.gl_Position.x = _1596;
    out.gl_Position.y = _1600;
    out.gl_Position.z = _1665;
    out.gl_Position.w = _1570;
    float _1669 = _1667 * 0.5;
    float _1671 = -_1661;
    float _1673 = _1671 + 1.0;
    float _1675 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1677 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1669;
    out.m_69.w = _1570;
    out.m_47.x = _1675;
    float _1679 = _1677 * _1628;
    float _1681 = -_1677;
    float _1683 = _1681 + 1.0;
    float _1685 = _1639 * _1679;
    float _1687 = _1639 * _1683;
    float _1689 = _1653 * _1679;
    float _1691 = fma(_1649, _1685, _1633);
    float _1693 = fma(_1651, _1685, _1635);
    float _1695 = fma(_1639, _1689, _1637);
    out.m_71.x = _1691;
    out.m_71.y = _1693;
    out.m_71.z = _1695;
    out.m_71.w = _1687;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1200 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1751 = as_type<float>(_104);
        out.gl_Position.z = _1751;
    }
    if (!_94)
    {
        return out;
    }
    float _108 = in.m_49.w;
    float _110 = float(_90);
    float _112 = 1.0 / _110;
    float _114 = -_108;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_108);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = _116 * _112;
    bool _130 = _116 >= _110;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    out.m_51.x = _128;
    float _136 = _108;
    float _138 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1823 = as_type<float>(_144);
        out.gl_Position.z = _1823;
    }
    if (_134)
    {
        return out;
    }
    float _146 = in.m_53.y;
    float _148 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_55.w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    float _174 = 0.0;
    float _176 = _148;
    if (!_160)
    {
        float _178 = _148 * _148;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    out.m_57.y = _146;
    bool _190 = !_160;
    float _192 = _188;
    float _194 = _146;
    if (!_190)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _148 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _148);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _224;
    }
    float _226 = _192;
    bool _228 = !_160;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _148 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _176 = _248;
    }
    float _250 = _176;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _162, _254);
    float _262 = fma(_250, _164, _256);
    float _264 = fma(_250, _166, _258);
    float _266 = fma(_260, _150, _168);
    float _268 = fma(_262, _150, _170);
    float _270 = fma(_264, _150, _172);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_59.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        _290 = _128;
    }
    _292 = false;
    float _294 = _290;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _294 + _316;
    bool _320 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _322 = isnan(_294);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = 1.0 / _306;
    bool _334 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = isnan(_294);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_330;
    float _348 = _346 + 1.0;
    bool _350 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _352 = isnan(_294);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _314;
    float _364 = _344 * _348;
    float _366 = -_344;
    float _368 = _366 + 1.0;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _310;
    float _374 = _298 * _332;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _302 * _362;
    bool _386 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_294);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = _318 * _372;
    float _410 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -_396;
    float _418 = _416 + 1.0;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _420;
    float _424 = _396 * _368;
    float _426 = fma(_402, _408, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _428 = fma(_414, _408, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = fma(_406, _408, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = _360 * _418;
    float _434 = fma(_422, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = in.m_55.x;
    float _438 = in.m_55.y;
    float _440 = in.m_55.z;
    float _442 = _410 * _432;
    float _444 = _398 * _432;
    float _446 = -_360;
    float _448 = _446 + 1.0;
    float _450 = _434 * _432;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _464;
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _470 = fma(_454, _384, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _472 = fma(_458, _384, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _474 = fma(_466, _384, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _476 = fma(_426, _424, _460);
    float _478 = fma(_428, _424, _462);
    float _480 = fma(_430, _424, _468);
    float _482 = fma(_470, _364, _476);
    float _484 = fma(_472, _364, _478);
    float _486 = fma(_474, _364, _480);
    float _488 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].x, _482);
    float _490 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].y, _484);
    float _492 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].z, _486);
    float _494 = _488 * _436;
    float _496 = _490 * _438;
    float _498 = _492 * _440;
    bool _500 = !_370;
    if (!_500)
    {
        float _502 = in.m_59.x;
        float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _506 = _502 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _510 = _508 * _504;
        float _512 = floor(_510);
        float _514 = -_512;
        float _516 = _510 + _514;
        _138 = _516;
    }
    float _518 = _138;
    float _520 = in.m_59.w;
    float _522 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _524 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _526 = in.m_59.x;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _530 = _528 != 0;
    float _532 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _536 = _534 != 0;
    float _538 = in.m_59.y;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _542 = _540 != 0;
    float _544 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _548 = _546 != 0;
    float _550 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
    float _552 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _532);
    float _554 = in.m_53.x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    if (_536)
    {
        float _560 = in.m_59.z;
        _558 = _560;
    }
    float _562 = _558;
    float _564 = -_146;
    float _566 = _564 + 1.0;
    float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _570 = _520 > 0.5;
    float _572 = _526 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _574 = _570 ? as_type<int>(_566) : as_type<int>(_146);
    bool _576 = false;
    bool _578 = _570;
    if (_530)
    {
        bool _580 = _526 > 0.5;
        _576 = _580;
    }
    bool _582 = _576;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = -_556;
    float _590 = fma(_572, 2.0, _588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _598 = 1.0 / _586;
    float _600 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _602 = _538 > 0.5;
    float _604 = _542 ? as_type<float>(_574) : _146;
    float _606 = fma(_600, -2.0, _596);
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _610 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
    float _612 = 1.0 / _594;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _620 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[78].z, _608);
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _624 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _618);
    float _626 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _544);
    float _628 = 1.0 / _616;
    float _630 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _550);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _638 = _518 + _636;
    if (_548)
    {
        float _640 = _602 ? _566 : _146;
        _194 = _640;
    }
    float _642 = _194;
    float _644 = _626 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_536)
    {
        bool _646 = _562 > 0.5;
        _578 = _646;
    }
    bool _648 = _578;
    float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = _604 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _662 = _654 * _598;
    float _664 = _658 * _612;
    float _666 = -_116;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    float _670 = _634 * _628;
    float _672 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _620);
    float _674 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _606);
    float _676 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _624);
    float _678 = fma(_662, _638, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _682 = _518 + _680;
    bool _684 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _686 = isnan(_518);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _698 = _518 + _696;
    bool _700 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _702 = isnan(_518);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = fma(_664, _682, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _714 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _716 = isnan(_518);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_694;
    float _728 = _726 + 1.0;
    float _730 = fma(_670, _698, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _732 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _734 = isnan(_518);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _650 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _746 = _724 * _728;
    float _748 = -_724;
    float _750 = _748 + 1.0;
    float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _754 = fma(_744, _642, -0.5);
    float _756 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _758 = _742 * _750;
    float _760 = -_710;
    float _762 = _760 + 1.0;
    int _764 = as_type<int>(_598);
    int _766 = as_type<int>(_758);
    float _768 = _694;
    float _770 = _728;
    if (_530)
    {
        float _772 = -_554;
        float _774 = _772 + 1.0;
        _764 = as_type<int>(_774);
    }
    int _776 = _764;
    float _778 = -_742;
    float _780 = _778 + 1.0;
    float _782 = _678 * _758;
    if (_536)
    {
        float _784 = -_554;
        float _786 = _784 + 1.0;
        _766 = as_type<int>(_786);
    }
    int _788 = _766;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _756 + _790;
    float _794 = _694 * _762;
    if (!_530)
    {
        _768 = _554;
    }
    float _796 = _768;
    float _798 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[115].x, _782);
    float _800 = _796;
    if (!_536)
    {
        _770 = _554;
    }
    float _802 = _770;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _806 = _622 + _804;
    float _808 = _802;
    if (_530)
    {
        float _810 = _582 ? as_type<float>(_776) : _554;
        _800 = _810;
    }
    float _812 = _800;
    float _814 = fma(_712, _746, _798);
    if (_536)
    {
        float _816 = _648 ? as_type<float>(_788) : _554;
        _808 = _816;
    }
    float _818 = _808;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _822 = _644 + _820;
    float _824 = _792 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _826 = _752 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _828 = fma(_730, _794, _814);
    float _830 = -_674;
    float _832 = fma(_676, _754, _830);
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[28].x, _824);
    float _836 = fma(_826, _812, -0.5);
    float _838 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[118].x, _828);
    float _840 = _792 * _792;
    float _842 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[28].z, _834);
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _846 = fma(_672, _836, _668);
    float _848 = fma(_822, _822, _840);
    float _850 = _660 * _568;
    bool _852 = _842 >= 0.0;
    float _854 = _818 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _856 = fma(_806, _806, _848);
    float _858 = rsqrt(_856);
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _870 = _840;
    if (_852)
    {
        _870 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _872 = _870;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _876 = _854 * _844;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _880 = _860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _882 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _832 + 0.5;
    float _894 = _846 + 0.5;
    float _896 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _898 = as_type<int>(_872);
    if (_852)
    {
        float _900 = _872 * 5.0;
        _898 = as_type<int>(_900);
    }
    int _902 = _898;
    out.m_61.x = _886;
    out.m_61.y = _888;
    out.m_61.z = _890;
    out.m_61.w = _878;
    float _904 = _792 * _858;
    float _906 = _822 * _858;
    out.m_63.x = _894;
    out.m_63.y = _892;
    out.m_63.z = _876;
    out.m_63.w = _850;
    out.m_65.x = _880;
    out.m_65.y = _882;
    out.m_65.z = _884;
    out.m_65.w = _896;
    float _908 = as_type<float>(_902);
    if (_852)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3133 = as_type<float>(_902);
        out.gl_Position.z = _3133;
    }
    if (_852)
    {
        out.m_47.x = 0.0;
    }
    if (_852)
    {
        return out;
    }
    float _910 = -_904;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _756);
    float _914 = _806 * _858;
    float _916 = -_906;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _644);
    float _920 = -_904;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _926 = _912 + _924;
    float _928 = -_914;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = _918 + _932;
    float _936 = -_906;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _940 = _926 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _944 = _930 + _942;
    float _946 = _922 * _922;
    float _948 = -_914;
    float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _806);
    float _952 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[28].x, _940);
    float _954 = fma(_938, _938, _946);
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[28].z, _952);
    float _958 = fma(_950, _950, _954);
    bool _960 = _956 >= 0.0;
    float _962 = _912;
    float _964 = _914;
    float _966 = _918;
    if (_960)
    {
        _908 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _968 = _908;
    int _970 = as_type<int>(_968);
    if (_960)
    {
        out.m_47.x = 0.0;
    }
    if (_960)
    {
        float _972 = _968 * 5.0;
        _970 = as_type<int>(_972);
    }
    int _974 = _970;
    if (_960)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3262 = as_type<float>(_974);
        out.gl_Position.z = _3262;
    }
    if (_960)
    {
        return out;
    }
    float _976 = in.m_67.x;
    float _978 = in.m_67.y;
    float _980 = in.m_67.z;
    float _982 = sqrt(_958);
    float _984 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _988 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _990 = _858 * _982;
    float _992 = _990 * _984;
    float _994 = _990 * _986;
    float _996 = _990 * _988;
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _978);
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _976);
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _980);
    float _1004 = _998 * _992;
    float _1006 = _1000 * _994;
    float _1008 = _1002 * _996;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1012 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1014 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1016 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1010);
    float _1018 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1012);
    float _1020 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1014);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1016);
    float _1024 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1018);
    float _1026 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1020);
    float _1028 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1030 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1032 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1034 = _644 + _1028;
    float _1036 = _622 + _1030;
    float _1038 = _756 + _1032;
    float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1042 = _1034 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1036 + _1044;
    float _1048 = _1042 * _1042;
    float _1050 = _1046 * _1046;
    float _1052 = _1048 + _1050;
    float _1054 = sqrt(_1052);
    bool _1056 = _1054 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1058 = _1032;
    float _1060 = _1048;
    float _1062 = _1026;
    float _1064 = _1008;
    float _1066 = _1050;
    if (!_1056)
    {
        _1058 = _1048;
    }
    float _1068 = _1058;
    float _1070 = _1068;
    if (!_1056)
    {
        _1060 = _1034;
    }
    float _1072 = _1060;
    float _1074 = _1072;
    if (!_1056)
    {
        _1062 = _1036;
    }
    float _1076 = _1062;
    float _1078 = _1076;
    if (!_1056)
    {
        _1064 = _1038;
    }
    float _1080 = _1064;
    bool _1082 = !_1056;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1054 + _1088;
        float _1092 = rsqrt(_1052);
        float _1094 = _1090 * _1086;
        float _1096 = _1038 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = _1094 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1092 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = fma(_1042, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1116 = fma(_1046, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1122 = _1114 + _1120;
        float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1126 = _1116 + _1124;
        float _1128 = fma(_1038, _1106, _1118);
        float _1130 = _1122 * _1122;
        float _1132 = _1126 * _1126;
        _1084 = _1128;
        _1070 = _1130;
        _1066 = _1132;
        _1074 = _1114;
        _1078 = _1116;
    }
    float _1134 = _1084;
    float _1136 = _1070;
    float _1138 = _1066;
    float _1140 = _1074;
    float _1142 = _1078;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1146 = _1134 + _1144;
    float _1148 = fma(_1146, _1146, _1136);
    float _1150 = _1148 + _1138;
    float _1152 = sqrt(_1150);
    bool _1154 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1156 = isnan(_1152);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1162 = _1158 || _1160;
    float _1164 = _1148;
    if (!_1162)
    {
        _1164 = 1.0;
    }
    float _1166 = _1164;
    bool _1168 = !_1162;
    float _1170 = _1166;
    if (!_1168)
    {
        bool _1172 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1174 = isnan(_1152);
        bool _1176 = _1172 || _1174;
        bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1180 = _1176 || _1178;
        if (!_1180)
        {
            float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1184 = _1152 + _1182;
            float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1186;
            float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1194 = 1.0 / _1188;
            float _1196 = _1184 * _1194;
            float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1170 = _1198;
            _1200 = true;
        }
        else
        {
            bool _1202 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1204 = isnan(_1152);
            bool _1206 = _1202 || _1204;
            bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1210 = _1206 || _1208;
            if (!_1210)
            {
                float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1214 = _1152 + _1212;
                float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1218 = _1216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1222 = _1220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1224 = 1.0 / _1218;
                float _1226 = _1214 * _1224;
                float _1228 = fma(_1226, _1222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1170 = _1228;
                _1200 = true;
            }
            else
            {
                _1170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1200 = false;
    float _1230 = _1170;
    float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1234 = _1140 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1238 = _1134 + _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1242 = _1142 + _1240;
    bool _1244 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(0.5);
    bool _1252 = _1248 || _1250;
    float _1254 = fma(_1234, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1256 = fma(_1238, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1258 = fma(_1242, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1260 = -_906;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1254);
    float _1264 = -_904;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1268 = -_914;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    float _1272 = _1266;
    float _1274 = _1262;
    float _1276 = _1270;
    if (!_1252)
    {
        float _1278 = _926 * _926;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1282 = -_622;
        float _1284 = _1282 + _1258;
        float _1286 = -_644;
        float _1288 = _1286 + _1254;
        float _1290 = fma(_934, _934, _1278);
        float _1292 = -_756;
        float _1294 = _1292 + _1256;
        float _1296 = fma(_944, _944, _1290);
        float _1298 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1300 = sqrt(_1296);
        float _1302 = 1.0 / _990;
        float _1304 = precise::min(_1300, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1306 = _1304 * _1280;
        float _1308 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1310 = _1306 * _1302;
        float _1312 = _1308 * _1310;
        float _1314 = _1284 * _1310;
        float _1316 = fma(_1288, _1312, _918);
        float _1318 = fma(_1294, _1312, _912);
        float _1320 = fma(_1308, _1314, _930);
        _1272 = _1318;
        _1274 = _1316;
        _1276 = _1320;
    }
    float _1322 = _1272;
    float _1324 = _1274;
    float _1326 = _1276;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1330 = _1322 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1334 = _1324 + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1338 = _1326 + _1336;
    float _1340 = _1330 * _1330;
    float _1342 = fma(_1334, _1334, _1340);
    float _1344 = fma(_1338, _1338, _1342);
    float _1346 = rsqrt(_1344);
    float _1348 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1350 = _1334 * _1348;
    float _1352 = _1338 * _1348;
    float _1354 = _1350 * _1350;
    float _1356 = _1352 * _1352;
    float _1358 = _1354 + _1356;
    float _1360 = sqrt(_1358);
    bool _1362 = _1360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1366 = _1360 + _1364;
    float _1368 = _1338;
    float _1370 = _1358;
    float _1372 = _1366;
    float _1374 = _1350;
    if (_1362)
    {
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1368 = _1376;
    }
    float _1378 = _1368;
    if (_1362)
    {
        float _1380 = rsqrt(_1358);
        _1370 = _1380;
    }
    float _1382 = _1370;
    if (_1362)
    {
        float _1384 = _1366 * _1378;
        _1372 = _1384;
    }
    float _1386 = _1372;
    if (_1362)
    {
        float _1388 = _1386 * 0.15915493667125701904296875;
        _962 = _1388;
    }
    float _1390 = _962;
    float _1392 = _1340;
    if (_1362)
    {
        float _1394 = _1390 * 6.283185482025146484375;
        float _1396 = sin(_1394);
        _1392 = _1396;
    }
    float _1398 = _1392;
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1402 = precise::max(0.0, _1400);
    float _1404 = _1346;
    float _1406 = _1402;
    float _1408 = _1400;
    if (_1362)
    {
        float _1410 = _1390 * 6.283185482025146484375;
        float _1412 = cos(_1410);
        _1404 = _1412;
    }
    float _1414 = _1404;
    float _1416 = -_1348;
    float _1418 = -_1402;
    float _1420 = fma(_1330, _1416, _1418);
    float _1422 = _1420;
    if (!_1362)
    {
        _1406 = _1352;
    }
    float _1424 = _1406;
    float _1426 = _1424;
    if (_1362)
    {
        float _1428 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1428;
    }
    float _1430 = _1408;
    float _1432 = sqrt(_1344);
    float _1434 = _1398;
    float _1436 = _1430;
    if (_1362)
    {
        float _1438 = fma(_1398, _1430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1434 = _1438;
    }
    float _1440 = _1434;
    float _1442 = _1440;
    if (_1362)
    {
        float _1444 = _1414 + (-1.0);
        _1436 = _1444;
    }
    float _1446 = _1436;
    float _1448 = _1446;
    if (_1362)
    {
        float _1450 = _1382 * _1440;
        _964 = _1450;
    }
    float _1452 = _964;
    if (!_1362)
    {
        _1442 = _1354;
    }
    float _1454 = _1442;
    float _1456 = _1454;
    if (_1362)
    {
        float _1458 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _966 = _1458;
    }
    float _1460 = _966;
    if (_1362)
    {
        float _1462 = _1350 * _1452;
        _1374 = _1462;
    }
    float _1464 = _1374;
    if (_1362)
    {
        float _1466 = _1352 * _1452;
        _1426 = _1466;
    }
    float _1468 = _1426;
    if (!_1362)
    {
        _1448 = _1356;
    }
    float _1470 = _1448;
    float _1472 = _1470;
    if (_1362)
    {
        float _1474 = fma(_1420, _1414, _1460);
        _1422 = _1474;
    }
    float _1476 = _1422;
    if (_1362)
    {
        float _1478 = _1464 * _1464;
        _1456 = _1478;
    }
    float _1480 = _1456;
    if (_1362)
    {
        float _1482 = _1468 * _1468;
        _1472 = _1482;
    }
    float _1484 = _1472;
    float _1486 = fma(_1476, _1476, _1480);
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1490 = fma(_1432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1488);
    float _1492 = precise::clamp(_1490, 0.0, 1.0);
    float _1494 = _1486 + _1484;
    float _1496 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1500 = -_1492;
    float _1502 = _1500 + 1.0;
    float _1504 = rsqrt(_1494);
    float _1506 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    float _1508 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1510 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1498);
    float _1512 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1514 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1516 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1508);
    float _1518 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1510);
    float _1520 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1512);
    float _1522 = abs(_1502);
    float _1524 = log2(_1522);
    float _1526 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1516);
    float _1528 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1530 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1520);
    float _1532 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1538 = _1504 * _1464;
    float _1540 = _1504 * _1476;
    float _1542 = _1504 * _1468;
    float _1544 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1536);
    float _1546 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1550 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1552 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1554 = -_1546;
    float _1556 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1544);
    float _1560 = -_1550;
    float _1562 = fma(_1560, _1548, 1.0);
    float _1564 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1566 = -_1542;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1570 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1558);
    float _1572 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1574 = exp2(_1564);
    float _1576 = fma(_1568, -0.5, 0.5);
    float _1578 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1580 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1572);
    float _1582 = fma(_1568, 0.5, 0.5);
    float _1584 = _1540 + 1.0;
    float _1586 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1578);
    float _1588 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1580);
    float _1590 = log2(_1562);
    float _1592 = fma(_1582, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1594 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1586);
    float _1596 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1588);
    float _1598 = fma(_1582, _1592, -0.212114393711090087890625);
    float _1600 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1594);
    float _1602 = 1.0 / _1570;
    float _1604 = -_1540;
    float _1606 = fma(_1574, _1584, _1604);
    float _1608 = fma(_1582, _1598, 1.570728778839111328125);
    float _1610 = fma(_1606, 0.5, 0.5);
    float _1612 = sqrt(_1576);
    float _1614 = _1590 * 0.693147182464599609375;
    float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1618 = _1596 * _1602;
    float _1620 = _1600 * _1602;
    float _1622 = fma(_1618, 0.5, 0.5);
    float _1624 = fma(_1620, -0.5, 0.5);
    float _1626 = _1612 * 0.636619746685028076171875;
    float3 _4341 = float3(_1622, _1624, _1616);
    float _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4341, float3(0.0), isnan(_4341)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4341, float3(0.0), isnan(_4341)), level(0.0)).x;
    float3 _4352 = float3(_1622, _1624, _1616);
    float4 _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4352, float3(0.0), isnan(_4352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4352, float3(0.0), isnan(_4352)), level(0.0)).xyzw;
    float _1633 = _1631.x;
    float _1635 = _1631.y;
    float _1637 = _1631.z;
    float _1639 = _1631.w;
    float _1641 = -_1608;
    float _1643 = fma(_1626, _1641, 1.0);
    float2 _4374 = float2(_1643, _1610);
    float3 _1647 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4374, float2(0.0), isnan(_4374)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4374, float2(0.0), isnan(_4374)), level(0.0)).xyz;
    float _1649 = _1647.x;
    float _1651 = _1647.y;
    float _1653 = _1647.z;
    float _1655 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1659 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1657);
    float _1661 = exp2(_1655);
    float _1663 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1659);
    float _1665 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1663);
    float _1667 = _1665 + _1570;
    out.gl_Position.x = _1596;
    out.gl_Position.y = _1600;
    out.gl_Position.z = _1665;
    out.gl_Position.w = _1570;
    float _1669 = _1667 * 0.5;
    float _1671 = -_1661;
    float _1673 = _1671 + 1.0;
    float _1675 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1677 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1669;
    out.m_69.w = _1570;
    out.m_47.x = _1675;
    float _1679 = _1677 * _1628;
    float _1681 = -_1677;
    float _1683 = _1681 + 1.0;
    float _1685 = _1639 * _1679;
    float _1687 = _1639 * _1683;
    float _1689 = _1653 * _1679;
    float _1691 = fma(_1649, _1685, _1633);
    float _1693 = fma(_1651, _1685, _1635);
    float _1695 = fma(_1639, _1689, _1637);
    out.m_71.x = _1691;
    out.m_71.y = _1693;
    out.m_71.z = _1695;
    out.m_71.w = _1687;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1200 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1751 = as_type<float>(_104);
        out.gl_Position.z = _1751;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    float _110 = float(_90);
    float _112 = 1.0 / _110;
    float _114 = -_108;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_108);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = _116 * _112;
    bool _130 = _116 >= _110;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    out.m_51.x = _128;
    float _136 = _108;
    float _138 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1823 = as_type<float>(_144);
        out.gl_Position.z = _1823;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_53.y;
    float _148 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_55.w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    float _174 = 0.0;
    float _176 = _148;
    if (!_160)
    {
        float _178 = _148 * _148;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    out.m_57.y = _146;
    bool _190 = !_160;
    float _192 = _188;
    float _194 = _146;
    if (!_190)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _148 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _148);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _224;
    }
    float _226 = _192;
    bool _228 = !_160;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _148 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _176 = _248;
    }
    float _250 = _176;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _162, _254);
    float _262 = fma(_250, _164, _256);
    float _264 = fma(_250, _166, _258);
    float _266 = fma(_260, _150, _168);
    float _268 = fma(_262, _150, _170);
    float _270 = fma(_264, _150, _172);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_59.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        _290 = _128;
    }
    _292 = false;
    float _294 = _290;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _294 + _316;
    bool _320 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _322 = isnan(_294);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = 1.0 / _306;
    bool _334 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = isnan(_294);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_330;
    float _348 = _346 + 1.0;
    bool _350 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _352 = isnan(_294);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _314;
    float _364 = _344 * _348;
    float _366 = -_344;
    float _368 = _366 + 1.0;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _310;
    float _374 = _298 * _332;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _302 * _362;
    bool _386 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_294);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = _318 * _372;
    float _410 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -_396;
    float _418 = _416 + 1.0;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _420;
    float _424 = _396 * _368;
    float _426 = fma(_402, _408, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _428 = fma(_414, _408, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = fma(_406, _408, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = _360 * _418;
    float _434 = fma(_422, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = in.m_55.x;
    float _438 = in.m_55.y;
    float _440 = in.m_55.z;
    float _442 = _410 * _432;
    float _444 = _398 * _432;
    float _446 = -_360;
    float _448 = _446 + 1.0;
    float _450 = _434 * _432;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _464;
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _470 = fma(_454, _384, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _472 = fma(_458, _384, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _474 = fma(_466, _384, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _476 = fma(_426, _424, _460);
    float _478 = fma(_428, _424, _462);
    float _480 = fma(_430, _424, _468);
    float _482 = fma(_470, _364, _476);
    float _484 = fma(_472, _364, _478);
    float _486 = fma(_474, _364, _480);
    float _488 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].x, _482);
    float _490 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].y, _484);
    float _492 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[146].z, _486);
    float _494 = _488 * _436;
    float _496 = _490 * _438;
    float _498 = _492 * _440;
    bool _500 = !_370;
    if (!_500)
    {
        float _502 = in.m_59.x;
        float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _506 = _502 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _510 = _508 * _504;
        float _512 = floor(_510);
        float _514 = -_512;
        float _516 = _510 + _514;
        _138 = _516;
    }
    float _518 = _138;
    float _520 = in.m_59.w;
    float _522 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _524 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _526 = in.m_59.x;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _530 = _528 != 0;
    float _532 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _536 = _534 != 0;
    float _538 = in.m_59.y;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _542 = _540 != 0;
    float _544 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _548 = _546 != 0;
    float _550 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _524);
    float _552 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _532);
    float _554 = in.m_53.x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    if (_536)
    {
        float _560 = in.m_59.z;
        _558 = _560;
    }
    float _562 = _558;
    float _564 = -_146;
    float _566 = _564 + 1.0;
    float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _570 = _520 > 0.5;
    float _572 = _526 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _574 = _570 ? as_type<int>(_566) : as_type<int>(_146);
    bool _576 = false;
    bool _578 = _570;
    if (_530)
    {
        bool _580 = _526 > 0.5;
        _576 = _580;
    }
    bool _582 = _576;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _588 = -_556;
    float _590 = fma(_572, 2.0, _588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _598 = 1.0 / _586;
    float _600 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _602 = _538 > 0.5;
    float _604 = _542 ? as_type<float>(_574) : _146;
    float _606 = fma(_600, -2.0, _596);
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _610 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
    float _612 = 1.0 / _594;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _620 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[78].z, _608);
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _624 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _618);
    float _626 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _544);
    float _628 = 1.0 / _616;
    float _630 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _550);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _638 = _518 + _636;
    if (_548)
    {
        float _640 = _602 ? _566 : _146;
        _194 = _640;
    }
    float _642 = _194;
    float _644 = _626 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_536)
    {
        bool _646 = _562 > 0.5;
        _578 = _646;
    }
    bool _648 = _578;
    float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = _604 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _662 = _654 * _598;
    float _664 = _658 * _612;
    float _666 = -_116;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[76].x, _590);
    float _670 = _634 * _628;
    float _672 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _620);
    float _674 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _606);
    float _676 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _624);
    float _678 = fma(_662, _638, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _682 = _518 + _680;
    bool _684 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _686 = isnan(_518);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _698 = _518 + _696;
    bool _700 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _702 = isnan(_518);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = fma(_664, _682, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _714 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _716 = isnan(_518);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_694;
    float _728 = _726 + 1.0;
    float _730 = fma(_670, _698, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _732 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _734 = isnan(_518);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _650 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _746 = _724 * _728;
    float _748 = -_724;
    float _750 = _748 + 1.0;
    float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _754 = fma(_744, _642, -0.5);
    float _756 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _758 = _742 * _750;
    float _760 = -_710;
    float _762 = _760 + 1.0;
    int _764 = as_type<int>(_598);
    int _766 = as_type<int>(_758);
    float _768 = _694;
    float _770 = _728;
    if (_530)
    {
        float _772 = -_554;
        float _774 = _772 + 1.0;
        _764 = as_type<int>(_774);
    }
    int _776 = _764;
    float _778 = -_742;
    float _780 = _778 + 1.0;
    float _782 = _678 * _758;
    if (_536)
    {
        float _784 = -_554;
        float _786 = _784 + 1.0;
        _766 = as_type<int>(_786);
    }
    int _788 = _766;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _756 + _790;
    float _794 = _694 * _762;
    if (!_530)
    {
        _768 = _554;
    }
    float _796 = _768;
    float _798 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[115].x, _782);
    float _800 = _796;
    if (!_536)
    {
        _770 = _554;
    }
    float _802 = _770;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _806 = _622 + _804;
    float _808 = _802;
    if (_530)
    {
        float _810 = _582 ? as_type<float>(_776) : _554;
        _800 = _810;
    }
    float _812 = _800;
    float _814 = fma(_712, _746, _798);
    if (_536)
    {
        float _816 = _648 ? as_type<float>(_788) : _554;
        _808 = _816;
    }
    float _818 = _808;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _822 = _644 + _820;
    float _824 = _792 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _826 = _752 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _828 = fma(_730, _794, _814);
    float _830 = -_674;
    float _832 = fma(_676, _754, _830);
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[28].x, _824);
    float _836 = fma(_826, _812, -0.5);
    float _838 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[118].x, _828);
    float _840 = _792 * _792;
    float _842 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[28].z, _834);
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _846 = fma(_672, _836, _668);
    float _848 = fma(_822, _822, _840);
    float _850 = _660 * _568;
    bool _852 = _842 >= 0.0;
    float _854 = _818 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _856 = fma(_806, _806, _848);
    float _858 = rsqrt(_856);
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _870 = _840;
    if (_852)
    {
        _870 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _872 = _870;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _876 = _854 * _844;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _880 = _860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _882 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _892 = _832 + 0.5;
    float _894 = _846 + 0.5;
    float _896 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _898 = as_type<int>(_872);
    if (_852)
    {
        float _900 = _872 * 5.0;
        _898 = as_type<int>(_900);
    }
    int _902 = _898;
    out.m_61.x = _886;
    out.m_61.y = _888;
    out.m_61.z = _890;
    out.m_61.w = _878;
    float _904 = _792 * _858;
    float _906 = _822 * _858;
    out.m_63.x = _894;
    out.m_63.y = _892;
    out.m_63.z = _876;
    out.m_63.w = _850;
    out.m_65.x = _880;
    out.m_65.y = _882;
    out.m_65.z = _884;
    out.m_65.w = _896;
    float _908 = as_type<float>(_902);
    if (_852)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3133 = as_type<float>(_902);
        out.gl_Position.z = _3133;
    }
    if (_852)
    {
        out.m_47.x = 0.0;
    }
    if (_852)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _910 = -_904;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _756);
    float _914 = _806 * _858;
    float _916 = -_906;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _644);
    float _920 = -_904;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _926 = _912 + _924;
    float _928 = -_914;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = _918 + _932;
    float _936 = -_906;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _940 = _926 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _944 = _930 + _942;
    float _946 = _922 * _922;
    float _948 = -_914;
    float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _806);
    float _952 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[28].x, _940);
    float _954 = fma(_938, _938, _946);
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[28].z, _952);
    float _958 = fma(_950, _950, _954);
    bool _960 = _956 >= 0.0;
    float _962 = _912;
    float _964 = _914;
    float _966 = _918;
    if (_960)
    {
        _908 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _968 = _908;
    int _970 = as_type<int>(_968);
    if (_960)
    {
        out.m_47.x = 0.0;
    }
    if (_960)
    {
        float _972 = _968 * 5.0;
        _970 = as_type<int>(_972);
    }
    int _974 = _970;
    if (_960)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3262 = as_type<float>(_974);
        out.gl_Position.z = _3262;
    }
    if (_960)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _976 = in.m_67.x;
    float _978 = in.m_67.y;
    float _980 = in.m_67.z;
    float _982 = sqrt(_958);
    float _984 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _988 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _990 = _858 * _982;
    float _992 = _990 * _984;
    float _994 = _990 * _986;
    float _996 = _990 * _988;
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _978);
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _976);
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _980);
    float _1004 = _998 * _992;
    float _1006 = _1000 * _994;
    float _1008 = _1002 * _996;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1012 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1014 = _1004 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1016 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1010);
    float _1018 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1012);
    float _1020 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1014);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1016);
    float _1024 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1018);
    float _1026 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1020);
    float _1028 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1030 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1032 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1034 = _644 + _1028;
    float _1036 = _622 + _1030;
    float _1038 = _756 + _1032;
    float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1042 = _1034 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1036 + _1044;
    float _1048 = _1042 * _1042;
    float _1050 = _1046 * _1046;
    float _1052 = _1048 + _1050;
    float _1054 = sqrt(_1052);
    bool _1056 = _1054 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1058 = _1032;
    float _1060 = _1048;
    float _1062 = _1026;
    float _1064 = _1008;
    float _1066 = _1050;
    if (!_1056)
    {
        _1058 = _1048;
    }
    float _1068 = _1058;
    float _1070 = _1068;
    if (!_1056)
    {
        _1060 = _1034;
    }
    float _1072 = _1060;
    float _1074 = _1072;
    if (!_1056)
    {
        _1062 = _1036;
    }
    float _1076 = _1062;
    float _1078 = _1076;
    if (!_1056)
    {
        _1064 = _1038;
    }
    float _1080 = _1064;
    bool _1082 = !_1056;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1054 + _1088;
        float _1092 = rsqrt(_1052);
        float _1094 = _1090 * _1086;
        float _1096 = _1038 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = _1094 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1092 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = fma(_1042, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1116 = fma(_1046, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1122 = _1114 + _1120;
        float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1126 = _1116 + _1124;
        float _1128 = fma(_1038, _1106, _1118);
        float _1130 = _1122 * _1122;
        float _1132 = _1126 * _1126;
        _1084 = _1128;
        _1070 = _1130;
        _1066 = _1132;
        _1074 = _1114;
        _1078 = _1116;
    }
    float _1134 = _1084;
    float _1136 = _1070;
    float _1138 = _1066;
    float _1140 = _1074;
    float _1142 = _1078;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1146 = _1134 + _1144;
    float _1148 = fma(_1146, _1146, _1136);
    float _1150 = _1148 + _1138;
    float _1152 = sqrt(_1150);
    bool _1154 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1156 = isnan(_1152);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1162 = _1158 || _1160;
    float _1164 = _1148;
    if (!_1162)
    {
        _1164 = 1.0;
    }
    float _1166 = _1164;
    bool _1168 = !_1162;
    float _1170 = _1166;
    if (!_1168)
    {
        bool _1172 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1174 = isnan(_1152);
        bool _1176 = _1172 || _1174;
        bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1180 = _1176 || _1178;
        if (!_1180)
        {
            float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1184 = _1152 + _1182;
            float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1186;
            float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1194 = 1.0 / _1188;
            float _1196 = _1184 * _1194;
            float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1170 = _1198;
            _1200 = true;
        }
        else
        {
            bool _1202 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1204 = isnan(_1152);
            bool _1206 = _1202 || _1204;
            bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1210 = _1206 || _1208;
            if (!_1210)
            {
                float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1214 = _1152 + _1212;
                float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1218 = _1216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1222 = _1220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1224 = 1.0 / _1218;
                float _1226 = _1214 * _1224;
                float _1228 = fma(_1226, _1222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1170 = _1228;
                _1200 = true;
            }
            else
            {
                _1170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1200 = false;
    float _1230 = _1170;
    float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1234 = _1140 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1238 = _1134 + _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1242 = _1142 + _1240;
    bool _1244 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(0.5);
    bool _1252 = _1248 || _1250;
    float _1254 = fma(_1234, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1256 = fma(_1238, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1258 = fma(_1242, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1260 = -_906;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1254);
    float _1264 = -_904;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1268 = -_914;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    float _1272 = _1266;
    float _1274 = _1262;
    float _1276 = _1270;
    if (!_1252)
    {
        float _1278 = _926 * _926;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1282 = -_622;
        float _1284 = _1282 + _1258;
        float _1286 = -_644;
        float _1288 = _1286 + _1254;
        float _1290 = fma(_934, _934, _1278);
        float _1292 = -_756;
        float _1294 = _1292 + _1256;
        float _1296 = fma(_944, _944, _1290);
        float _1298 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1300 = sqrt(_1296);
        float _1302 = 1.0 / _990;
        float _1304 = precise::min(_1300, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1306 = _1304 * _1280;
        float _1308 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1310 = _1306 * _1302;
        float _1312 = _1308 * _1310;
        float _1314 = _1284 * _1310;
        float _1316 = fma(_1288, _1312, _918);
        float _1318 = fma(_1294, _1312, _912);
        float _1320 = fma(_1308, _1314, _930);
        _1272 = _1318;
        _1274 = _1316;
        _1276 = _1320;
    }
    float _1322 = _1272;
    float _1324 = _1274;
    float _1326 = _1276;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1330 = _1322 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1334 = _1324 + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1338 = _1326 + _1336;
    float _1340 = _1330 * _1330;
    float _1342 = fma(_1334, _1334, _1340);
    float _1344 = fma(_1338, _1338, _1342);
    float _1346 = rsqrt(_1344);
    float _1348 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1350 = _1334 * _1348;
    float _1352 = _1338 * _1348;
    float _1354 = _1350 * _1350;
    float _1356 = _1352 * _1352;
    float _1358 = _1354 + _1356;
    float _1360 = sqrt(_1358);
    bool _1362 = _1360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1366 = _1360 + _1364;
    float _1368 = _1338;
    float _1370 = _1358;
    float _1372 = _1366;
    float _1374 = _1350;
    if (_1362)
    {
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1368 = _1376;
    }
    float _1378 = _1368;
    if (_1362)
    {
        float _1380 = rsqrt(_1358);
        _1370 = _1380;
    }
    float _1382 = _1370;
    if (_1362)
    {
        float _1384 = _1366 * _1378;
        _1372 = _1384;
    }
    float _1386 = _1372;
    if (_1362)
    {
        float _1388 = _1386 * 0.15915493667125701904296875;
        _962 = _1388;
    }
    float _1390 = _962;
    float _1392 = _1340;
    if (_1362)
    {
        float _1394 = _1390 * 6.283185482025146484375;
        float _1396 = sin(_1394);
        _1392 = _1396;
    }
    float _1398 = _1392;
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1402 = precise::max(0.0, _1400);
    float _1404 = _1346;
    float _1406 = _1402;
    float _1408 = _1400;
    if (_1362)
    {
        float _1410 = _1390 * 6.283185482025146484375;
        float _1412 = cos(_1410);
        _1404 = _1412;
    }
    float _1414 = _1404;
    float _1416 = -_1348;
    float _1418 = -_1402;
    float _1420 = fma(_1330, _1416, _1418);
    float _1422 = _1420;
    if (!_1362)
    {
        _1406 = _1352;
    }
    float _1424 = _1406;
    float _1426 = _1424;
    if (_1362)
    {
        float _1428 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1428;
    }
    float _1430 = _1408;
    float _1432 = sqrt(_1344);
    float _1434 = _1398;
    float _1436 = _1430;
    if (_1362)
    {
        float _1438 = fma(_1398, _1430, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1434 = _1438;
    }
    float _1440 = _1434;
    float _1442 = _1440;
    if (_1362)
    {
        float _1444 = _1414 + (-1.0);
        _1436 = _1444;
    }
    float _1446 = _1436;
    float _1448 = _1446;
    if (_1362)
    {
        float _1450 = _1382 * _1440;
        _964 = _1450;
    }
    float _1452 = _964;
    if (!_1362)
    {
        _1442 = _1354;
    }
    float _1454 = _1442;
    float _1456 = _1454;
    if (_1362)
    {
        float _1458 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _966 = _1458;
    }
    float _1460 = _966;
    if (_1362)
    {
        float _1462 = _1350 * _1452;
        _1374 = _1462;
    }
    float _1464 = _1374;
    if (_1362)
    {
        float _1466 = _1352 * _1452;
        _1426 = _1466;
    }
    float _1468 = _1426;
    if (!_1362)
    {
        _1448 = _1356;
    }
    float _1470 = _1448;
    float _1472 = _1470;
    if (_1362)
    {
        float _1474 = fma(_1420, _1414, _1460);
        _1422 = _1474;
    }
    float _1476 = _1422;
    if (_1362)
    {
        float _1478 = _1464 * _1464;
        _1456 = _1478;
    }
    float _1480 = _1456;
    if (_1362)
    {
        float _1482 = _1468 * _1468;
        _1472 = _1482;
    }
    float _1484 = _1472;
    float _1486 = fma(_1476, _1476, _1480);
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1490 = fma(_1432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1488);
    float _1492 = precise::clamp(_1490, 0.0, 1.0);
    float _1494 = _1486 + _1484;
    float _1496 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1500 = -_1492;
    float _1502 = _1500 + 1.0;
    float _1504 = rsqrt(_1494);
    float _1506 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    float _1508 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1510 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1498);
    float _1512 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1514 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1516 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1508);
    float _1518 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1510);
    float _1520 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1512);
    float _1522 = abs(_1502);
    float _1524 = log2(_1522);
    float _1526 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1516);
    float _1528 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1530 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1520);
    float _1532 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1538 = _1504 * _1464;
    float _1540 = _1504 * _1476;
    float _1542 = _1504 * _1468;
    float _1544 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1536);
    float _1546 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1550 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1552 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1554 = -_1546;
    float _1556 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1544);
    float _1560 = -_1550;
    float _1562 = fma(_1560, _1548, 1.0);
    float _1564 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1566 = -_1542;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1570 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1558);
    float _1572 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1574 = exp2(_1564);
    float _1576 = fma(_1568, -0.5, 0.5);
    float _1578 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1580 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1572);
    float _1582 = fma(_1568, 0.5, 0.5);
    float _1584 = _1540 + 1.0;
    float _1586 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1578);
    float _1588 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1580);
    float _1590 = log2(_1562);
    float _1592 = fma(_1582, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1594 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1586);
    float _1596 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1588);
    float _1598 = fma(_1582, _1592, -0.212114393711090087890625);
    float _1600 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1594);
    float _1602 = 1.0 / _1570;
    float _1604 = -_1540;
    float _1606 = fma(_1574, _1584, _1604);
    float _1608 = fma(_1582, _1598, 1.570728778839111328125);
    float _1610 = fma(_1606, 0.5, 0.5);
    float _1612 = sqrt(_1576);
    float _1614 = _1590 * 0.693147182464599609375;
    float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1618 = _1596 * _1602;
    float _1620 = _1600 * _1602;
    float _1622 = fma(_1618, 0.5, 0.5);
    float _1624 = fma(_1620, -0.5, 0.5);
    float _1626 = _1612 * 0.636619746685028076171875;
    float3 _4341 = float3(_1622, _1624, _1616);
    float _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4341, float3(0.0), isnan(_4341)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4341, float3(0.0), isnan(_4341)), level(0.0)).x;
    float3 _4352 = float3(_1622, _1624, _1616);
    float4 _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4352, float3(0.0), isnan(_4352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4352, float3(0.0), isnan(_4352)), level(0.0)).xyzw;
    float _1633 = _1631.x;
    float _1635 = _1631.y;
    float _1637 = _1631.z;
    float _1639 = _1631.w;
    float _1641 = -_1608;
    float _1643 = fma(_1626, _1641, 1.0);
    float2 _4374 = float2(_1643, _1610);
    float3 _1647 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4374, float2(0.0), isnan(_4374)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4374, float2(0.0), isnan(_4374)), level(0.0)).xyz;
    float _1649 = _1647.x;
    float _1651 = _1647.y;
    float _1653 = _1647.z;
    float _1655 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1659 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1657);
    float _1661 = exp2(_1655);
    float _1663 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1659);
    float _1665 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1663);
    float _1667 = _1665 + _1570;
    out.gl_Position.x = _1596;
    out.gl_Position.y = _1600;
    out.gl_Position.z = _1665;
    out.gl_Position.w = _1570;
    float _1669 = _1667 * 0.5;
    float _1671 = -_1661;
    float _1673 = _1671 + 1.0;
    float _1675 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1677 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1669;
    out.m_69.w = _1570;
    out.m_47.x = _1675;
    float _1679 = _1677 * _1628;
    float _1681 = -_1677;
    float _1683 = _1681 + 1.0;
    float _1685 = _1639 * _1679;
    float _1687 = _1639 * _1683;
    float _1689 = _1653 * _1679;
    float _1691 = fma(_1649, _1685, _1633);
    float _1693 = fma(_1651, _1685, _1635);
    float _1695 = fma(_1639, _1689, _1637);
    out.m_71.x = _1691;
    out.m_71.y = _1693;
    out.m_71.z = _1695;
    out.m_71.w = _1687;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

