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
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_91 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2291 = false;
    bool _414 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2590 = as_type<float>(_130);
        out.gl_Position.z = _2590;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2659 = as_type<float>(_168);
        out.gl_Position.z = _2659;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_53.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _200 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _200 + _206;
    bool _210 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _212 = isnan(_200);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _200 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _224;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = 1.0 / _232;
    float _244 = 1.0 / _236;
    float _246 = _204 * _238;
    bool _248 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_200);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_220;
    float _262 = _260 + 1.0;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    float _268 = _258 * _262;
    float _270 = _208 * _242;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    bool _276 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _278 = isnan(_200);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_258;
    float _290 = _288 + 1.0;
    float _292 = fma(_266, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = _228 * _244;
    bool _298 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_200);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = fma(_312, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = -_308;
    float _322 = _320 + 1.0;
    float _324 = _308 * _290;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = _286 * _322;
    float _336 = -_286;
    float _338 = _336 + 1.0;
    float _340 = fma(_316, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _342 = fma(_328, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _344 = _292 * _334;
    float _346 = _294 * _334;
    float _348 = _318 * _334;
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _354 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _348);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = fma(_332, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_340, _324, _350);
    float _372 = fma(_358, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_362, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _376 = fma(_342, _324, _352);
    float _378 = fma(_368, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_364, _324, _354);
    float _382 = fma(_372, _268, _370);
    float _384 = fma(_374, _268, _376);
    float _386 = fma(_378, _268, _380);
    float _388 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].x, _382);
    float _390 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].z, _386);
    bool _394 = !_240;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_114);
        float _418 = 1.0 / _416;
        float _420 = _148 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_53.z;
    float _426 = in.m_53.w;
    float _428 = in.m_53.y;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _432 = _430 != 0;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_432)
    {
        float _438 = in.m_53.x;
        _436 = _438;
    }
    float _440 = _436;
    float _442 = _424 * 2.0;
    float _444 = _428 * 2.0;
    float _446 = _428 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _448 = floor(_442);
    float _450 = fma(_446, -2.0, _434);
    int _452 = as_type<int>(_446);
    if (_432)
    {
        _452 = 0;
    }
    int _454 = _452;
    float _456 = floor(_444);
    bool _458 = _448 >= 0.0;
    bool _460 = isnan(_448);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    bool _468 = _448 > 0.0;
    float _470 = _448;
    int _472 = _454;
    if (_432)
    {
        _470 = _428;
    }
    float _474 = _470;
    int _476 = _466 ? 0 : 1;
    bool _478 = _456 >= 0.0;
    bool _480 = isnan(_456);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    bool _488 = _456 > 0.0;
    int _490 = _486 ? 0 : 1;
    float _492 = _456;
    float _494 = _440;
    float _496 = _474;
    if (_432)
    {
        _492 = _440;
    }
    float _498 = _492;
    float _500 = _498;
    if (!_432)
    {
        float _502 = in.m_53.x;
        float _504 = _428 * 3.1415927410125732421875;
        float _506 = _504 * 0.15915493667125701904296875;
        float _508 = _506 * 6.283185482025146484375;
        float _510 = sin(_508);
        float _512 = _502 * 3.1415927410125732421875;
        float _514 = _512 * 0.15915493667125701904296875;
        float _516 = _514 * 6.283185482025146484375;
        float _518 = sin(_516);
        _472 = 1;
        _494 = _502;
        _496 = _510;
        _500 = _518;
    }
    int _520 = _472;
    float _522 = _494;
    float _524 = _496;
    float _526 = _500;
    bool _528 = _520 != 1;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _532 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _534 = ~_490;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _542 = log2(_540);
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _554 = _552 != 0;
    float _556 = -_530;
    float _558 = fma(_532, 2.0, _556);
    float _560 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _450);
    float _562 = -_148;
    float _564 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[76].x, _558);
    int _566 = _538;
    if (!_488)
    {
        int _568 = ~_490;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    float _574 = _522 * 2.0;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _580 = in.m_55.x;
    float _582 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[93].w, _576);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _586 = _524 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _588 = floor(_574);
    float _590 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[93].z, _578);
    float _592 = _526 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _594 = _428 + _522;
    float _596 = fma(_586, -2.0, _584);
    float _598 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].z, _590);
    float _600 = _594 + (-1.0);
    float _602 = _594;
    float _604 = _592;
    if (!_528)
    {
        _602 = _424;
    }
    float _606 = _602;
    float _608 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[91].y, _596);
    float _610 = _606;
    float _612 = _608;
    if (_528)
    {
        _610 = _428;
    }
    float _614 = _610;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _618 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _620 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[83].w, _616);
    int _622 = ~_476;
    int _624 = _622 + 1;
    int _626 = _624 + 1;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _630 = _626;
    float _632 = _614;
    if (!_468)
    {
        int _634 = ~_476;
        int _636 = _634 + 1;
        _630 = _636;
    }
    int _638 = _630;
    float _640 = _424 + _522;
    bool _642 = !_546;
    int _644 = _642 ? 0 : 1;
    float _646 = -_628;
    float _648 = fma(_592, 2.0, _646);
    bool _650 = _588 > 0.0;
    float _652 = _640 + (-1.0);
    bool _654 = _588 >= 0.0;
    bool _656 = isnan(_588);
    bool _658 = _654 || _656;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_528)
    {
        _632 = _424;
    }
    float _666 = _632;
    float _668 = _542 * _148;
    float _670 = _666;
    if (_528)
    {
        _670 = _428;
    }
    float _672 = _670;
    float _674 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _620);
    int _676 = abs(_644);
    float _678 = _672 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_528)
    {
        _604 = _428;
    }
    float _680 = _604;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _684 = _680;
    if (_528)
    {
        _684 = _522;
    }
    float _686 = _684;
    float _688 = fma(_678, -2.0, _664);
    float _690 = float(_638);
    float _692 = float(_676);
    float _694 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[83].z, _682);
    float _696 = in.m_57.x;
    float _698 = in.m_57.y;
    float _700 = in.m_57.z;
    int _702 = _662 ? 0 : 1;
    float _704 = _692 * _690;
    float _706 = _686;
    if (!_528)
    {
        _706 = _428;
    }
    float _708 = _706;
    float _710 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _712 = exp2(_668);
    float _714 = _704 * (-2.0);
    float _716 = _708;
    if (_528)
    {
        _716 = _522;
    }
    float _718 = _716;
    int _720 = ~_702;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _728 = _724;
    if (!_650)
    {
        int _730 = ~_702;
        int _732 = _730 + 1;
        _728 = _732;
    }
    int _734 = _728;
    float _736 = _718 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _738 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _740 = isnan(1.0);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _746 = _742 || _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _750 = 1.0 + _748;
    float _752 = -_726;
    float _754 = fma(_736, 2.0, _752);
    float _756 = in.m_59.x;
    float _758 = in.m_59.y;
    float _760 = in.m_59.z;
    bool _762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = 1.0 / _750;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _776 = -_712;
    float _778 = _776 + 1.0;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _782 = !_554;
    int _784 = _782 ? 0 : 1;
    float _786 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].w, _774);
    bool _788 = !_550;
    int _790 = _788 ? 0 : 1;
    float _792 = -_148;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[81].x, _754);
    float _796 = _770 ? _778 : 0.0;
    float _798 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _786);
    float _800 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].z, _780);
    float _802 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].w, _582);
    float _804 = -_148;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[91].x, _648);
    float _808 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _694);
    float _810 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[191].x, _522);
    float _812 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _800);
    float _814 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _688);
    float _816 = _794;
    if (_746)
    {
        float _818 = _796 * _772;
        _152 = _818;
    }
    float _820 = _152;
    int _822 = abs(_784);
    float _824 = fma(_714, _696, _696);
    int _826 = abs(_790);
    float _828 = _522 + (-0.5);
    float _830 = float(_572);
    float _832 = _810 + _760;
    float _834 = float(_822);
    float _836 = fma(_618, _714, _618);
    float _838 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[196].x, _824);
    float _840 = float(_734);
    float _842 = _834 * _830;
    float _844 = float(_826);
    float _846 = _832 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _848 = fma(_836, _820, _838);
    float _850 = _842 * (-2.0);
    float _852 = _428 + _424;
    float _854 = _844 * _840;
    float _856 = _846 * 0.15915493667125701904296875;
    float _858 = in.m_61.x;
    float _860 = in.m_61.y;
    float _862 = in.m_61.z;
    float _864 = _424 + (-0.5);
    float _866 = fma(_850, _700, _700);
    float _868 = _854 * (-2.0);
    float _870 = _852 + (-1.0);
    float _872 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[196].z, _866);
    float _874 = _856 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(_868, _698, _698);
    float _880 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _882 = _428 + (-0.5);
    float _884 = fma(_710, _850, _710);
    float _886 = _848 * 0.15915493667125701904296875;
    float _888 = fma(_880, _868, _880);
    float _890 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _892 = fma(_884, _820, _872);
    float _894 = _886 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _580 * _580;
    float _900 = fma(_888, _820, _890);
    float _902 = _892 * 0.15915493667125701904296875;
    float _904 = _900 * 0.15915493667125701904296875;
    float _906 = _876 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _908 = _886 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = _392 * _862;
    float _914 = _390 * _860;
    float _916 = _388 * _858;
    float _918 = fma(_906, _898, _758);
    float _920 = in.m_46.x;
    float _922 = in.m_46.y;
    float _924 = in.m_46.z;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _760);
    float _928 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _930 = _902 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _918);
    float _938 = fma(_906, 0.300000011920928955078125, _756);
    float _940 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _938);
    float _944 = _904 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = _942 * _940;
    float _950 = _904 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = _910 * _932;
    float _956 = _896 * _932;
    float _958 = _902 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = _926 * _928;
    float _964 = _936 * _934;
    float _966 = _896 * _946;
    float _968 = _910 * _946;
    float _970 = _964 * _954;
    float _972 = _910 * _952;
    float _974 = _896 * _952;
    float _976 = _952 * _932;
    float _978 = _946 * _932;
    float _980 = fma(_960, _972, _966);
    float _982 = -_968;
    float _984 = fma(_960, _974, _982);
    float _986 = -_974;
    float _988 = fma(_960, _968, _986);
    float _990 = -_964;
    float _992 = _960 * _990;
    float _994 = fma(_980, _948, _970);
    float _996 = _964 * _956;
    float _998 = _922 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1000 = fma(_948, _976, _992);
    float _1002 = fma(_962, _988, _994);
    float _1004 = fma(_960, _966, _972);
    float _1006 = fma(_948, _984, _996);
    float _1008 = _922 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1010 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[6].x, _998);
    float _1012 = fma(_962, _978, _1000);
    float _1014 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1016 = fma(_1004, _962, _1006);
    float _1018 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1020 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1010);
    float _1022 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1014);
    float _1026 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1028 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1030 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1022);
    float _1032 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1024);
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = _922 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1038 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1030);
    float _1040 = _1028 + _1032;
    float _1042 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1036);
    float _1044 = _1034 + _1038;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1048 = _1040 + _1046;
    float _1050 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1042);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1054 = _1044 + _1052;
    float _1056 = _1048 * _1048;
    float _1058 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1060 = fma(_1054, _1054, _1056);
    float _1062 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1064 = sqrt(_1060);
    float _1066 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1062);
    float _1068 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1066);
    float _1070 = _1058 + _1068;
    bool _1072 = _1064 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1074 = _920;
    float _1076 = _924;
    float _1078 = _1050;
    float _1080 = _1044;
    float _1082 = _1040;
    float _1084 = _850;
    float _1086 = _1028;
    float _1088 = _760;
    if (!_1072)
    {
        _1074 = _1044;
    }
    float _1090 = _1074;
    float _1092 = _1090;
    if (!_1072)
    {
        _1076 = _1040;
    }
    float _1094 = _1076;
    float _1096 = _1094;
    if (!_1072)
    {
        _1078 = _1070;
    }
    float _1098 = _1078;
    bool _1100 = !_1072;
    float _1102 = _1098;
    if (!_1100)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1108 = _1064 + _1106;
        float _1110 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = rsqrt(_1060);
        float _1114 = _1108 * _1104;
        float _1116 = _1114 * 0.15915493667125701904296875;
        float _1118 = _1116 * 6.283185482025146484375;
        float _1120 = cos(_1118);
        float _1122 = _1116 * 6.283185482025146484375;
        float _1124 = sin(_1122);
        float _1126 = _1120 + (-1.0);
        float _1128 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1130 = fma(_1124, _1110, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1132 = fma(_1070, _1120, _1128);
        float _1134 = _1112 * _1130;
        float _1136 = fma(_1054, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1138 = fma(_1048, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1102 = _1132;
        _1092 = _1136;
        _1096 = _1138;
    }
    float _1140 = _1102;
    float _1142 = _1092;
    float _1144 = _1096;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1148 = _1140 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1152 = _1142 + _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1156 = _1144 + _1154;
    float _1158 = _1148 * _1148;
    float _1160 = fma(_1152, _1152, _1158);
    float _1162 = fma(_1156, _1156, _1160);
    float _1164 = rsqrt(_1162);
    float _1166 = sqrt(_1162);
    float _1168 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1170 = _1152 * _1168;
    float _1172 = _1156 * _1168;
    float _1174 = _1170 * _1170;
    float _1176 = _1172 * _1172;
    float _1178 = _1174 + _1176;
    float _1180 = sqrt(_1178);
    bool _1182 = _1180 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = _1180 + _1184;
    float _1188 = _1156;
    float _1190 = _1178;
    float _1192 = _1186;
    float _1194 = _1148;
    if (_1182)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1188 = _1196;
    }
    float _1198 = _1188;
    if (_1182)
    {
        float _1200 = rsqrt(_1178);
        _1190 = _1200;
    }
    float _1202 = _1190;
    float _1204 = _1202;
    if (_1182)
    {
        float _1206 = _1186 * _1198;
        _1192 = _1206;
    }
    float _1208 = _1192;
    if (_1182)
    {
        float _1210 = _1208 * 0.15915493667125701904296875;
        _1080 = _1210;
    }
    float _1212 = _1080;
    float _1214 = _1198;
    float _1216 = _1212;
    if (_1182)
    {
        float _1218 = _1212 * 6.283185482025146484375;
        float _1220 = sin(_1218);
        _1214 = _1220;
    }
    float _1222 = _1214;
    float _1224 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1226 = precise::max(0.0, _1224);
    float _1228 = _1164;
    float _1230 = _1226;
    if (_1182)
    {
        float _1232 = _1212 * 6.283185482025146484375;
        float _1234 = cos(_1232);
        _1228 = _1234;
    }
    float _1236 = _1228;
    float _1238 = -_1168;
    float _1240 = -_1226;
    float _1242 = fma(_1148, _1238, _1240);
    if (_1182)
    {
        float _1244 = _1242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1230 = _1244;
    }
    float _1246 = _1230;
    float _1248 = _1246;
    if (!_1182)
    {
        _1216 = _1172;
    }
    float _1250 = _1216;
    float _1252 = _1222;
    float _1254 = _1250;
    if (_1182)
    {
        float _1256 = fma(_1222, _1246, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1082 = _1256;
    }
    float _1258 = _1082;
    float _1260 = _1258;
    if (!_1182)
    {
        _1252 = _1170;
    }
    float _1262 = _1252;
    float _1264 = _1262;
    if (!_1182)
    {
        _1248 = _1242;
    }
    float _1266 = _1248;
    float _1268 = _1266;
    if (_1182)
    {
        float _1270 = _1236 + (-1.0);
        _1194 = _1270;
    }
    float _1272 = _1194;
    float _1274 = _1272;
    if (_1182)
    {
        float _1276 = _1202 * _1258;
        _1084 = _1276;
    }
    float _1278 = _1084;
    if (!_1182)
    {
        _1204 = _1174;
    }
    float _1280 = _1204;
    float _1282 = _1280;
    if (_1182)
    {
        float _1284 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (_1182)
    {
        float _1288 = _1170 * _1278;
        _1264 = _1288;
    }
    float _1290 = _1264;
    if (_1182)
    {
        float _1292 = _1172 * _1278;
        _1254 = _1292;
    }
    float _1294 = _1254;
    if (!_1182)
    {
        _1260 = _1176;
    }
    float _1296 = _1260;
    float _1298 = _1296;
    if (_1182)
    {
        float _1300 = fma(_1242, _1236, _1286);
        _1268 = _1300;
    }
    float _1302 = _1268;
    if (_1182)
    {
        float _1304 = _1290 * _1290;
        _1282 = _1304;
    }
    float _1306 = _1282;
    if (_1182)
    {
        float _1308 = _1294 * _1294;
        _1298 = _1308;
    }
    float _1310 = _1298;
    float _1312 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1314 = fma(_1302, _1302, _1306);
    float _1316 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1318 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1312);
    float _1320 = _1314 + _1310;
    float _1322 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1316);
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1326 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1324);
    float _1328 = precise::clamp(_1326, 0.0, 1.0);
    float _1330 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1332 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1322);
    float _1334 = rsqrt(_1320);
    float _1336 = -_1328;
    float _1338 = _1336 + 1.0;
    float _1340 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1344 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1330);
    float _1346 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1348 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1350 = abs(_1338);
    float _1352 = log2(_1350);
    float _1354 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1344);
    float _1356 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1318);
    float _1358 = -_1348;
    float _1360 = fma(_1358, _1340, 1.0);
    float _1362 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1364 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1366 = fma(_1028, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1370 = _1334 * _1290;
    float _1372 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1362);
    float _1374 = _1334 * _1302;
    float _1376 = floor(_1346);
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1380 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1372);
    float _1382 = _1334 * _1294;
    float _1384 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = -_1378;
    float _1388 = fma(_1374, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1386);
    float _1390 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1392 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1394 = floor(_1366);
    float _1396 = -_1382;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1388);
    float _1400 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1402 = fma(_1398, -0.5, 0.5);
    float _1404 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1400);
    float _1406 = fma(_1398, 0.5, 0.5);
    float _1408 = exp2(_1392);
    float _1410 = -_1376;
    float _1412 = _1346 + _1410;
    float _1414 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1404);
    float _1416 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1418 = log2(_1360);
    float _1420 = fma(_1406, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1422 = -_1394;
    float _1424 = _1366 + _1422;
    float _1426 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1416);
    float _1428 = _1374 + 1.0;
    float _1430 = fma(_1406, _1420, -0.212114393711090087890625);
    float _1432 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1434 = 1.0 / _1414;
    float _1436 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1438 = sqrt(_1402);
    float _1440 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1436);
    float _1442 = -_1374;
    float _1444 = fma(_1408, _1428, _1442);
    float _1446 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1432);
    float _1448 = _1418 * 0.693147182464599609375;
    float _1450 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1440);
    float2 _4718 = float2(_1412, _1424);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4718, float2(0.0), isnan(_4718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4718, float2(0.0), isnan(_4718)), level(0.0)).x;
    float _1454 = fma(_1406, _1430, 1.570728778839111328125);
    float _1456 = _1446 * _1434;
    float _1458 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1450);
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1462 = fma(_1444, 0.5, 0.5);
    float _1464 = fma(_1456, 0.5, 0.5);
    float _1466 = _1458 * _1434;
    float _1468 = _1438 * 0.636619746685028076171875;
    float _1470 = fma(_1466, -0.5, 0.5);
    float _1472 = -_1454;
    float _1474 = fma(_1468, _1472, 1.0);
    float3 _4762 = float3(_1464, _1470, _1460);
    float _1476 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4762, float3(0.0), isnan(_4762)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4762, float3(0.0), isnan(_4762)), level(0.0)).x;
    float3 _4773 = float3(_1464, _1470, _1460);
    float4 _1479 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4773, float3(0.0), isnan(_4773)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4773, float3(0.0), isnan(_4773)), level(0.0)).xyzw;
    float _1481 = _1479.x;
    float _1483 = _1479.y;
    float _1485 = _1479.z;
    float _1487 = _1479.w;
    float2 _4789 = float2(_1474, _1462);
    float3 _1491 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4789, float2(0.0), isnan(_4789)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4789, float2(0.0), isnan(_4789)), level(0.0)).xyz;
    float _1493 = _1491.x;
    float _1495 = _1491.y;
    float _1497 = _1491.z;
    float _1499 = in.m_63.y;
    float _1501 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1503 = _426 > 0.5;
    out.m_65.x = _580;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1509 = _424 > 0.5;
    float _1511 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1501);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1517 = _1515 != 0;
    float _1519 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1511);
    int _1521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1523 = _1521 != 0;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1527 = _1525 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1531 = _1529 != 0;
    float _1533 = in.m_63.x;
    float _1535 = 1.0 / _1507;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1539 = _1537 != 0;
    float _1541 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1543 = _428 > 0.5;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1545;
    float _1549 = -_1499;
    float _1551 = _1549 + 1.0;
    float _1553 = 0.0;
    float _1555 = _1499;
    bool _1557 = _1503;
    bool _1559 = _1539;
    float _1561 = _1414;
    if (_1517)
    {
        float _1563 = in.m_53.z;
        _1553 = _1563;
    }
    float _1565 = _1553;
    float _1567 = 1.0 / _1527;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1575 = _1509 ? as_type<int>(_1551) : as_type<int>(_1499);
    float _1577 = 0.0;
    if (_1531)
    {
        float _1579 = in.m_53.x;
        _1577 = _1579;
    }
    float _1581 = _1577;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1585 = _1583 != 0;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1589 = _1523 ? as_type<float>(_1575) : _1499;
    float _1591 = _1547 * _1535;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1595 = _1593 != 0;
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1599 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.x = _1142;
    out.m_67.y = _1140;
    out.m_67.z = _1144;
    int _1601 = _1543 ? as_type<int>(_1551) : as_type<int>(_1499);
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1605 = _1571 * _1567;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1609 = _1539 ? as_type<float>(_1601) : _1499;
    float _1611 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1595)
    {
        float _1617 = _1503 ? _1551 : _1499;
        _1555 = _1617;
    }
    float _1619 = _1555;
    float _1621 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1623 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1625 = _1619;
    if (_1517)
    {
        bool _1627 = _1565 > 0.5;
        _1557 = _1627;
    }
    bool _1629 = _1557;
    out.m_69.x = _1611;
    out.m_69.y = _1615;
    out.m_69.z = _1587;
    float _1631 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1633 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1623);
    float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1531)
    {
        bool _1637 = _1581 > 0.5;
        _1559 = _1637;
    }
    bool _1639 = _1559;
    float _1641 = fma(_1609, _1631, -0.5);
    float _1643 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1633);
    bool _1645 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1647 = isnan(_422);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1659 = -_560;
    float _1661 = fma(_798, _1641, _1659);
    float _1663 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1665 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1667 = 1.0 / _1621;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1671 = _422 + _1669;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1675 = _422 + _1673;
    float _1677 = _1663 + _1621;
    int _1679 = as_type<int>(_1641);
    if (_1517)
    {
        float _1681 = -_1533;
        float _1683 = _1681 + 1.0;
        _1679 = as_type<int>(_1683);
    }
    int _1685 = _1679;
    float _1687 = fma(_1591, _1671, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1689 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1691 = isnan(_422);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = fma(_1605, _1675, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1705 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1707 = isnan(_422);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1713 = _1709 || _1711;
    float _1715 = float(_1713);
    float _1717 = -_1699;
    float _1719 = _1717 + 1.0;
    float _1721 = fma(_1589, _1665, -0.5);
    float _1723 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1725 = as_type<int>(_1635);
    int _1727 = as_type<int>(_1719);
    float _1729 = _1687;
    if (_1531)
    {
        float _1731 = -_1533;
        float _1733 = _1731 + 1.0;
        _1725 = as_type<int>(_1733);
    }
    int _1735 = _1725;
    float _1737 = _1715 * _1719;
    float _1739 = _1677 * _1667;
    float _1741 = _1739 * 0.5;
    float _1743 = -_1715;
    float _1745 = _1743 + 1.0;
    float _1747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1585)
    {
        float _1749 = -_1533;
        float _1751 = _1749 + 1.0;
        _1727 = as_type<int>(_1751);
    }
    int _1753 = _1727;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1757 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1755);
    float _1759 = _1655 * _1745;
    float _1761 = -_1655;
    float _1763 = _1761 + 1.0;
    if (!_1531)
    {
        _1086 = _1533;
    }
    float _1765 = _1086;
    float _1767 = -_608;
    float _1769 = fma(_802, _1721, _1767);
    float _1771 = _1687 * _1759;
    float _1773 = 1.0 / _1757;
    float _1775 = fma(_1723, _1619, -0.5);
    float _1777 = _1765;
    float _1779 = _1775;
    if (!_1517)
    {
        _1625 = _1533;
    }
    float _1781 = _1625;
    float _1783 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1771);
    float _1785 = _1781;
    if (_1531)
    {
        float _1787 = _1639 ? as_type<float>(_1735) : _1533;
        _1777 = _1787;
    }
    float _1789 = _1777;
    float _1791 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1517)
    {
        float _1793 = _1629 ? as_type<float>(_1685) : _1533;
        _1785 = _1793;
    }
    float _1795 = _1785;
    float _1797 = fma(_1701, _1737, _1783);
    if (!_1585)
    {
        _1729 = _1533;
    }
    float _1799 = _1729;
    float _1801 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1803 = _1799;
    if (_1585)
    {
        float _1805 = _1543 ? as_type<float>(_1753) : _1533;
        _1803 = _1805;
    }
    float _1807 = _1803;
    float _1809 = fma(_1657, _1789, -0.5);
    float _1811 = fma(_1791, _1795, -0.5);
    float _1813 = fma(_1699, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1797);
    bool _1815 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1817 = isnan(0.5);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1823 = _1819 || _1821;
    float _1825 = fma(_1801, _1807, -0.5);
    float _1827 = in.m_71.x;
    float _1829 = in.m_71.y;
    float _1831 = in.m_71.z;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = _1773 * _1833;
    bool _1837 = _918 != 0.0;
    bool _1839 = isnan(_918);
    bool _1841 = _1837 || _1839;
    bool _1843 = isnan(0.0);
    bool _1845 = _1841 || _1843;
    float _1847 = fma(_598, _1825, _806);
    float _1849 = abs(_1835);
    float _1851 = log2(_1849);
    bool _1853 = _938 == 0.0;
    bool _1855 = !_1845;
    bool _1857 = _1853 && _1855;
    float _1859 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1863 = _760 == 0.0;
    bool _1865 = _1863 && _1857;
    float _1867 = fma(_808, _1811, _794);
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1871 = _1811;
    if (!_1823)
    {
        _612 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1873 = _612;
    float _1875 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1877 = -_814;
    float _1879 = fma(_674, _1775, _1877);
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1883 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1885 = _1873;
    float _1887 = _1883;
    if (!_1823)
    {
        float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1891 = _1873 + _1889;
        _1885 = _1891;
    }
    float _1893 = _1885;
    float _1895 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1897 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1899 = _1897;
    if (!_1823)
    {
        float _1901 = 1.0 / _1893;
        _1871 = _1901;
    }
    float _1903 = _1871;
    float _1905 = _1827;
    float _1907 = _1829;
    if (_1865)
    {
        _816 = _1831;
    }
    float _1909 = _816;
    float _1911 = _1847 + 0.5;
    float _1913 = _1909;
    if (_1823)
    {
        _1779 = 1.0;
    }
    float _1915 = _1779;
    out.m_73.x = _1875;
    out.m_73.y = _1883;
    out.m_73.z = _1897;
    out.m_73.w = _1859;
    float _1917 = _1769 + 0.5;
    float _1919 = fma(_812, _1809, _564);
    float _1921 = _1661 + 0.5;
    float _1923 = exp2(_1895);
    float _1925 = _1867 + 0.5;
    float _1927 = _1919 + 0.5;
    float _1929 = _1879 + 0.5;
    out.m_75.x = _1911;
    out.m_75.y = _1917;
    float _1931 = _1915;
    if (!_1865)
    {
        float _1933 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1827);
        _1905 = _1933;
    }
    float _1935 = _1905;
    float _1937 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1599);
    out.m_77.x = _1927;
    out.m_77.y = _1921;
    out.m_77.z = _1925;
    out.m_77.w = _1929;
    float _1939 = exp2(_1541);
    if (_1865)
    {
        _1899 = _1909;
    }
    float _1941 = _1899;
    float _1943 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1937);
    float _1945 = _1941;
    if (_1865)
    {
        _1887 = _1829;
    }
    float _1947 = _1887;
    float _1949 = _1947;
    if (!_1865)
    {
        float _1951 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1829);
        _1949 = _1951;
    }
    float _1953 = _1949;
    if (!_1865)
    {
        _1913 = _1831;
    }
    float _1955 = _1913;
    float _1957 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1959 = precise::clamp(_1957, 0.0, 1.0);
    float _1961 = _1955;
    if (!_1865)
    {
        _1907 = _1953;
    }
    float _1963 = _1907;
    if (!_1865)
    {
        float _1965 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1955);
        _1945 = _1965;
    }
    float _1967 = _1945;
    if (!_1823)
    {
        float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1971 = _1835 + _1969;
        _1088 = _1971;
    }
    float _1973 = _1088;
    float _1975 = fma(_1959, -2.0, 3.0);
    float _1977 = _1959 * _1959;
    float _1979 = _954 * _1953;
    if (!_1823)
    {
        float _1981 = _1973 * _1903;
        float _1983 = precise::clamp(_1981, 0.0, 1.0);
        _1931 = _1983;
    }
    float _1985 = _1931;
    if (!_1865)
    {
        _1961 = _1967;
    }
    float _1987 = _1961;
    float _1989 = _1963 * _1963;
    float _1991 = _1977 * _1975;
    float _1993 = -_1953;
    float _1995 = _960 * _1993;
    float _1997 = _956 * _1953;
    float _1999 = fma(_1987, _1987, _1989);
    float _2001 = -_1991;
    float _2003 = _2001 + 1.0;
    float _2005 = fma(_976, _1935, _1995);
    float _2007 = fma(_984, _1935, _1997);
    float _2009 = _980 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2011 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1991);
    float _2013 = rsqrt(_1999);
    float _2015 = fma(_980, _1935, _1979);
    float _2017 = fma(_978, _1967, _2005);
    float _2019 = _980 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2021 = _980 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2023 = fma(_988, _1967, _2015);
    float _2025 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2009);
    float _2027 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2019);
    float _2029 = fma(_1004, _1967, _2007);
    float _2031 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2021);
    float _2033 = in.m_79.x;
    bool _2035 = _1835 <= 8000.0;
    bool _2037 = isnan(_1835);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(8000.0);
    bool _2043 = _2039 || _2041;
    float _2045 = float(_2043);
    float _2047 = -_1939;
    float _2049 = _2047 + 1.0;
    float _2051 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2031);
    float _2053 = _2013 * _1963;
    float _2055 = _2013 * _1987;
    float _2057 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2027);
    float _2059 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2025);
    float _2061 = -_2053;
    float _2063 = _988 * _2061;
    float _2065 = -_2053;
    float _2067 = _978 * _2065;
    float _2069 = -_2053;
    float _2071 = _1004 * _2069;
    float _2073 = _2045 * _2011;
    float _2075 = fma(_954, _2055, _2063);
    float _2077 = -_960;
    float _2079 = fma(_2077, _2055, _2067);
    float _2081 = fma(_956, _2055, _2071);
    out.m_81.x = _2051;
    out.m_81.y = _2057;
    out.m_81.z = _2059;
    float _2083 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2085 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2087 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2089 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2091 = fma(_2079, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2083);
    float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2085);
    float _2095 = fma(_2079, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2087);
    float _2097 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2099 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _2101 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2103 = isnan(_1166);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2109 = _2105 || _2107;
    float _2111 = fma(_2081, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2091);
    float _2113 = _1414 * 0.5;
    float _2115 = fma(_2081, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2095);
    float _2117 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1943);
    float _2119 = fma(_2081, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2093);
    float _2121 = fma(_1458, -0.5, _2113);
    float _2123 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2125 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2127 = _1446 + _1414;
    out.gl_Position.x = _1446;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _2117;
    out.gl_Position.w = _1414;
    float _2129 = fma(_2017, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2097);
    float _2131 = fma(_2017, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2125);
    float _2133 = _2117 + _1414;
    float _2135 = fma(_2017, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2099);
    float _2137 = fma(_2029, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2129);
    float _2139 = fma(_2029, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2131);
    float _2141 = _2133 * 0.5;
    float _2143 = _2127 * 0.5;
    float _2145 = fma(_2029, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2135);
    out.m_83.x = _2111;
    out.m_83.y = _2119;
    out.m_83.z = _2115;
    out.m_85.x = _2143;
    out.m_85.y = _2121;
    out.m_85.z = _2141;
    out.m_85.w = _1414;
    float _2147 = _2117;
    float _2149 = _2119;
    float _2151 = _2111;
    if (!_2109)
    {
        _1561 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2153 = _1561;
    float _2155 = _2153;
    float _2157 = _2153;
    if (!_2109)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2159 = _2147;
    out.m_87.x = _2139;
    out.m_87.y = _2137;
    out.m_87.z = _2145;
    float _2161 = _2159;
    float _2163 = _2159;
    if (!_2109)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2165 = _2149;
    float _2167 = _2165;
    float _2169 = _2165;
    if (!_2109)
    {
        _2151 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2171 = _2151;
    float _2173 = -_1452;
    float _2175 = _2173 + 1.0;
    float _2177 = _2175 * _2089;
    float _2179 = precise::clamp(_2177, 0.0, 1.0);
    float _2181 = -_2179;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2185 = _2183 * _2033;
    float _2187 = _2123 * _1476;
    float _2189 = -_2123;
    float _2191 = _2189 + 1.0;
    float _2193 = _2185 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2195 = _1487 * _2187;
    float _2197 = _1497 * _2187;
    float _2199 = _1487 * _2191;
    out.m_89.x = _2193;
    float _2201 = fma(_1493, _2195, _1481);
    float _2203 = fma(_1495, _2195, _1483);
    float _2205 = fma(_1487, _2197, _1485);
    float _2207 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2209 = _2195;
    float _2211 = _2187;
    float _2213 = _2171;
    float _2215 = _2171;
    if (!_2109)
    {
        _2209 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2217 = _2209;
    float _2219 = _2217;
    float _2221 = _2217;
    if (!_2109)
    {
        _2211 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2223 = _2211;
    out.m_91.x = _2201;
    out.m_91.y = _2203;
    out.m_91.z = _2205;
    out.m_91.w = _2199;
    bool _2225 = !_2109;
    float _2227 = _2223;
    float _2229 = _2223;
    if (!_2225)
    {
        bool _2231 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2233 = isnan(_1166);
        bool _2235 = _2231 || _2233;
        bool _2237 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2239 = _2235 || _2237;
        if (!_2239)
        {
            float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2243 = _1166 + _2241;
            float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2247 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2245;
            float _2249 = 1.0 / _2247;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2271 = _2243 * _2249;
            float _2273 = precise::clamp(_2271, 0.0, 1.0);
            float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2279 = fma(_2273, _2253, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2281 = fma(_2273, _2277, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2283 = fma(_2273, _2257, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2285 = fma(_2273, _2261, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2287 = fma(_2273, _2265, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2289 = fma(_2273, _2269, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2215 = _2281;
            _2221 = _2287;
            _2169 = _2279;
            _2163 = _2285;
            _2157 = _2283;
            _2229 = _2289;
            _2291 = true;
        }
        else
        {
            bool _2293 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2295 = isnan(_1166);
            bool _2297 = _2293 || _2295;
            bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2301 = _2297 || _2299;
            if (!_2301)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2303 = _2167;
            _2169 = _2303;
            if (!_2301)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2305 = _2213;
            _2215 = _2305;
            if (!_2301)
            {
                _2155 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2307 = _2155;
            _2157 = _2307;
            if (!_2301)
            {
                _2161 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2309 = _2161;
            _2163 = _2309;
            if (!_2301)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2311 = _2219;
            _2221 = _2311;
            if (!_2301)
            {
                _2227 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2313 = _2227;
            bool _2315 = !_2301;
            _2229 = _2313;
            if (!_2315)
            {
                bool _2317 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2319 = isnan(_1166);
                bool _2321 = _2317 || _2319;
                bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2325 = _2321 || _2323;
                if (!_2325)
                {
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2329 = _1166 + _2327;
                    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2331;
                    float _2335 = 1.0 / _2333;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2357 = _2329 * _2335;
                    float _2359 = precise::clamp(_2357, 0.0, 1.0);
                    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2365 = fma(_2359, _2339, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2367 = fma(_2359, _2363, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2369 = fma(_2359, _2343, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2371 = fma(_2359, _2347, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2373 = fma(_2359, _2351, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2375 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2215 = _2367;
                    _2221 = _2373;
                    _2169 = _2365;
                    _2163 = _2371;
                    _2157 = _2369;
                    _2229 = _2375;
                    _2291 = true;
                }
                else
                {
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2163 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2157 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2229 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2291 = false;
    float _2377 = _2215;
    float _2379 = _2221;
    float _2381 = _2169;
    float _2383 = _2163;
    float _2385 = _2157;
    float _2387 = _2229;
    float _2389 = _2207 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2391 = fma(_2137, -0.5, 0.5);
    float _2393 = precise::clamp(_2391, 0.0, 1.0);
    float _2395 = -_2377;
    float _2397 = _2395 + _2379;
    float _2399 = -_2381;
    float _2401 = _2399 + _2383;
    out.m_49.x = _2389;
    float _2403 = fma(_2393, _2397, _2377);
    float _2405 = -_2385;
    float _2407 = _2405 + _2387;
    float _2409 = fma(_2393, _2401, _2381);
    float _2411 = _2403 * 0.586610972881317138671875;
    bool _2413 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2415 = fma(_2393, _2407, _2385);
    out.m_93.x = 0.0;
    float _2417 = fma(_2409, 0.298911988735198974609375, _2411);
    bool _2419 = _1985 > 0.0;
    bool _2421 = isnan(_1985);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan(0.0);
    bool _2427 = _2423 || _2425;
    float _2429 = fma(_2415, 0.114477999508380889892578125, _2417);
    float _2431 = -_2429;
    float _2433 = _2409 + _2431;
    float _2435 = -_2429;
    float _2437 = _2403 + _2435;
    float _2439 = -_2429;
    float _2441 = _2415 + _2439;
    float _2443 = fma(_2433, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2429);
    float _2445 = fma(_2437, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2429);
    float _2447 = fma(_2441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2429);
    bool _2449 = !_2413;
    if (!_2449)
    {
        float _2451 = -_1140;
        float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2455 = -_1142;
        float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2459 = -_1144;
        float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2463 = _2453 * _2453;
        float _2465 = fma(_2457, _2457, _2463);
        float _2467 = fma(_2461, _2461, _2465);
        float _2469 = sqrt(_2467);
        float _2471 = rsqrt(_2467);
        float _2473 = -_2469;
        float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2477 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2479 = precise::clamp(_2477, 0.0, 1.0);
        float _2481 = _2457 * _2471;
        float _2483 = _2453 * _2471;
        float _2485 = abs(_2479);
        float _2487 = log2(_2485);
        float _2489 = _2461 * _2471;
        float _2491 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2493 = _2137 * _2483;
        float _2495 = -_2483;
        float _2497 = -_2491;
        float _2499 = fma(_2495, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2497);
        float _2501 = fma(_2139, _2481, _2493);
        float _2503 = -_2489;
        float _2505 = fma(_2503, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2499);
        float _2507 = fma(_2145, _2489, _2501);
        float _2509 = precise::clamp(_2507, 0.0, 1.0);
        float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2513 = _2505 + _2511;
        float _2515 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2517 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2519 = precise::clamp(_2517, 0.0, 1.0);
        float _2521 = exp2(_2515);
        float _2523 = _2521 * _2519;
        float _2525 = _2509 * _2523;
        float _2527 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2529 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2531 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2527;
        out.m_93.y = _2529;
        out.m_93.z = _2531;
    }
    out.m_95.x = _2443;
    out.m_95.y = _2445;
    out.m_95.z = _2447;
    if (_2427)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2533 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2533;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2291 = false;
    bool _414 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2590 = as_type<float>(_130);
        out.gl_Position.z = _2590;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2659 = as_type<float>(_168);
        out.gl_Position.z = _2659;
    }
    if (_162)
    {
        return out;
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_53.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _200 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _200 + _206;
    bool _210 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _212 = isnan(_200);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _200 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _224;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = 1.0 / _232;
    float _244 = 1.0 / _236;
    float _246 = _204 * _238;
    bool _248 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_200);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_220;
    float _262 = _260 + 1.0;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    float _268 = _258 * _262;
    float _270 = _208 * _242;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    bool _276 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _278 = isnan(_200);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_258;
    float _290 = _288 + 1.0;
    float _292 = fma(_266, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = _228 * _244;
    bool _298 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_200);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = fma(_312, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = -_308;
    float _322 = _320 + 1.0;
    float _324 = _308 * _290;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = _286 * _322;
    float _336 = -_286;
    float _338 = _336 + 1.0;
    float _340 = fma(_316, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _342 = fma(_328, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _344 = _292 * _334;
    float _346 = _294 * _334;
    float _348 = _318 * _334;
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _354 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _348);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = fma(_332, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_340, _324, _350);
    float _372 = fma(_358, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_362, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _376 = fma(_342, _324, _352);
    float _378 = fma(_368, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_364, _324, _354);
    float _382 = fma(_372, _268, _370);
    float _384 = fma(_374, _268, _376);
    float _386 = fma(_378, _268, _380);
    float _388 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].x, _382);
    float _390 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].z, _386);
    bool _394 = !_240;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_114);
        float _418 = 1.0 / _416;
        float _420 = _148 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_53.z;
    float _426 = in.m_53.w;
    float _428 = in.m_53.y;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _432 = _430 != 0;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_432)
    {
        float _438 = in.m_53.x;
        _436 = _438;
    }
    float _440 = _436;
    float _442 = _424 * 2.0;
    float _444 = _428 * 2.0;
    float _446 = _428 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _448 = floor(_442);
    float _450 = fma(_446, -2.0, _434);
    int _452 = as_type<int>(_446);
    if (_432)
    {
        _452 = 0;
    }
    int _454 = _452;
    float _456 = floor(_444);
    bool _458 = _448 >= 0.0;
    bool _460 = isnan(_448);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    bool _468 = _448 > 0.0;
    float _470 = _448;
    int _472 = _454;
    if (_432)
    {
        _470 = _428;
    }
    float _474 = _470;
    int _476 = _466 ? 0 : 1;
    bool _478 = _456 >= 0.0;
    bool _480 = isnan(_456);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    bool _488 = _456 > 0.0;
    int _490 = _486 ? 0 : 1;
    float _492 = _456;
    float _494 = _440;
    float _496 = _474;
    if (_432)
    {
        _492 = _440;
    }
    float _498 = _492;
    float _500 = _498;
    if (!_432)
    {
        float _502 = in.m_53.x;
        float _504 = _428 * 3.1415927410125732421875;
        float _506 = _504 * 0.15915493667125701904296875;
        float _508 = _506 * 6.283185482025146484375;
        float _510 = sin(_508);
        float _512 = _502 * 3.1415927410125732421875;
        float _514 = _512 * 0.15915493667125701904296875;
        float _516 = _514 * 6.283185482025146484375;
        float _518 = sin(_516);
        _472 = 1;
        _494 = _502;
        _496 = _510;
        _500 = _518;
    }
    int _520 = _472;
    float _522 = _494;
    float _524 = _496;
    float _526 = _500;
    bool _528 = _520 != 1;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _532 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _534 = ~_490;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _542 = log2(_540);
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _554 = _552 != 0;
    float _556 = -_530;
    float _558 = fma(_532, 2.0, _556);
    float _560 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _450);
    float _562 = -_148;
    float _564 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[76].x, _558);
    int _566 = _538;
    if (!_488)
    {
        int _568 = ~_490;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    float _574 = _522 * 2.0;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _580 = in.m_55.x;
    float _582 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[93].w, _576);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _586 = _524 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _588 = floor(_574);
    float _590 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[93].z, _578);
    float _592 = _526 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _594 = _428 + _522;
    float _596 = fma(_586, -2.0, _584);
    float _598 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].z, _590);
    float _600 = _594 + (-1.0);
    float _602 = _594;
    float _604 = _592;
    if (!_528)
    {
        _602 = _424;
    }
    float _606 = _602;
    float _608 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[91].y, _596);
    float _610 = _606;
    float _612 = _608;
    if (_528)
    {
        _610 = _428;
    }
    float _614 = _610;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _618 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _620 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[83].w, _616);
    int _622 = ~_476;
    int _624 = _622 + 1;
    int _626 = _624 + 1;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _630 = _626;
    float _632 = _614;
    if (!_468)
    {
        int _634 = ~_476;
        int _636 = _634 + 1;
        _630 = _636;
    }
    int _638 = _630;
    float _640 = _424 + _522;
    bool _642 = !_546;
    int _644 = _642 ? 0 : 1;
    float _646 = -_628;
    float _648 = fma(_592, 2.0, _646);
    bool _650 = _588 > 0.0;
    float _652 = _640 + (-1.0);
    bool _654 = _588 >= 0.0;
    bool _656 = isnan(_588);
    bool _658 = _654 || _656;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_528)
    {
        _632 = _424;
    }
    float _666 = _632;
    float _668 = _542 * _148;
    float _670 = _666;
    if (_528)
    {
        _670 = _428;
    }
    float _672 = _670;
    float _674 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _620);
    int _676 = abs(_644);
    float _678 = _672 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_528)
    {
        _604 = _428;
    }
    float _680 = _604;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _684 = _680;
    if (_528)
    {
        _684 = _522;
    }
    float _686 = _684;
    float _688 = fma(_678, -2.0, _664);
    float _690 = float(_638);
    float _692 = float(_676);
    float _694 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[83].z, _682);
    float _696 = in.m_57.x;
    float _698 = in.m_57.y;
    float _700 = in.m_57.z;
    int _702 = _662 ? 0 : 1;
    float _704 = _692 * _690;
    float _706 = _686;
    if (!_528)
    {
        _706 = _428;
    }
    float _708 = _706;
    float _710 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _712 = exp2(_668);
    float _714 = _704 * (-2.0);
    float _716 = _708;
    if (_528)
    {
        _716 = _522;
    }
    float _718 = _716;
    int _720 = ~_702;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _728 = _724;
    if (!_650)
    {
        int _730 = ~_702;
        int _732 = _730 + 1;
        _728 = _732;
    }
    int _734 = _728;
    float _736 = _718 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _738 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _740 = isnan(1.0);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _746 = _742 || _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _750 = 1.0 + _748;
    float _752 = -_726;
    float _754 = fma(_736, 2.0, _752);
    float _756 = in.m_59.x;
    float _758 = in.m_59.y;
    float _760 = in.m_59.z;
    bool _762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = 1.0 / _750;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _776 = -_712;
    float _778 = _776 + 1.0;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _782 = !_554;
    int _784 = _782 ? 0 : 1;
    float _786 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].w, _774);
    bool _788 = !_550;
    int _790 = _788 ? 0 : 1;
    float _792 = -_148;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[81].x, _754);
    float _796 = _770 ? _778 : 0.0;
    float _798 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _786);
    float _800 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].z, _780);
    float _802 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].w, _582);
    float _804 = -_148;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[91].x, _648);
    float _808 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _694);
    float _810 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[191].x, _522);
    float _812 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _800);
    float _814 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _688);
    float _816 = _794;
    if (_746)
    {
        float _818 = _796 * _772;
        _152 = _818;
    }
    float _820 = _152;
    int _822 = abs(_784);
    float _824 = fma(_714, _696, _696);
    int _826 = abs(_790);
    float _828 = _522 + (-0.5);
    float _830 = float(_572);
    float _832 = _810 + _760;
    float _834 = float(_822);
    float _836 = fma(_618, _714, _618);
    float _838 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[196].x, _824);
    float _840 = float(_734);
    float _842 = _834 * _830;
    float _844 = float(_826);
    float _846 = _832 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _848 = fma(_836, _820, _838);
    float _850 = _842 * (-2.0);
    float _852 = _428 + _424;
    float _854 = _844 * _840;
    float _856 = _846 * 0.15915493667125701904296875;
    float _858 = in.m_61.x;
    float _860 = in.m_61.y;
    float _862 = in.m_61.z;
    float _864 = _424 + (-0.5);
    float _866 = fma(_850, _700, _700);
    float _868 = _854 * (-2.0);
    float _870 = _852 + (-1.0);
    float _872 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[196].z, _866);
    float _874 = _856 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(_868, _698, _698);
    float _880 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _882 = _428 + (-0.5);
    float _884 = fma(_710, _850, _710);
    float _886 = _848 * 0.15915493667125701904296875;
    float _888 = fma(_880, _868, _880);
    float _890 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _892 = fma(_884, _820, _872);
    float _894 = _886 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _580 * _580;
    float _900 = fma(_888, _820, _890);
    float _902 = _892 * 0.15915493667125701904296875;
    float _904 = _900 * 0.15915493667125701904296875;
    float _906 = _876 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _908 = _886 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = _392 * _862;
    float _914 = _390 * _860;
    float _916 = _388 * _858;
    float _918 = fma(_906, _898, _758);
    float _920 = in.m_46.x;
    float _922 = in.m_46.y;
    float _924 = in.m_46.z;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _760);
    float _928 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _930 = _902 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _918);
    float _938 = fma(_906, 0.300000011920928955078125, _756);
    float _940 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _938);
    float _944 = _904 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = _942 * _940;
    float _950 = _904 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = _910 * _932;
    float _956 = _896 * _932;
    float _958 = _902 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = _926 * _928;
    float _964 = _936 * _934;
    float _966 = _896 * _946;
    float _968 = _910 * _946;
    float _970 = _964 * _954;
    float _972 = _910 * _952;
    float _974 = _896 * _952;
    float _976 = _952 * _932;
    float _978 = _946 * _932;
    float _980 = fma(_960, _972, _966);
    float _982 = -_968;
    float _984 = fma(_960, _974, _982);
    float _986 = -_974;
    float _988 = fma(_960, _968, _986);
    float _990 = -_964;
    float _992 = _960 * _990;
    float _994 = fma(_980, _948, _970);
    float _996 = _964 * _956;
    float _998 = _922 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1000 = fma(_948, _976, _992);
    float _1002 = fma(_962, _988, _994);
    float _1004 = fma(_960, _966, _972);
    float _1006 = fma(_948, _984, _996);
    float _1008 = _922 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1010 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[6].x, _998);
    float _1012 = fma(_962, _978, _1000);
    float _1014 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1016 = fma(_1004, _962, _1006);
    float _1018 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1020 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1010);
    float _1022 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1014);
    float _1026 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1028 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1030 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1022);
    float _1032 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1024);
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = _922 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1038 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1030);
    float _1040 = _1028 + _1032;
    float _1042 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1036);
    float _1044 = _1034 + _1038;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1048 = _1040 + _1046;
    float _1050 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1042);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1054 = _1044 + _1052;
    float _1056 = _1048 * _1048;
    float _1058 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1060 = fma(_1054, _1054, _1056);
    float _1062 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1064 = sqrt(_1060);
    float _1066 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1062);
    float _1068 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1066);
    float _1070 = _1058 + _1068;
    bool _1072 = _1064 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1074 = _920;
    float _1076 = _924;
    float _1078 = _1050;
    float _1080 = _1044;
    float _1082 = _1040;
    float _1084 = _850;
    float _1086 = _1028;
    float _1088 = _760;
    if (!_1072)
    {
        _1074 = _1044;
    }
    float _1090 = _1074;
    float _1092 = _1090;
    if (!_1072)
    {
        _1076 = _1040;
    }
    float _1094 = _1076;
    float _1096 = _1094;
    if (!_1072)
    {
        _1078 = _1070;
    }
    float _1098 = _1078;
    bool _1100 = !_1072;
    float _1102 = _1098;
    if (!_1100)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1108 = _1064 + _1106;
        float _1110 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = rsqrt(_1060);
        float _1114 = _1108 * _1104;
        float _1116 = _1114 * 0.15915493667125701904296875;
        float _1118 = _1116 * 6.283185482025146484375;
        float _1120 = cos(_1118);
        float _1122 = _1116 * 6.283185482025146484375;
        float _1124 = sin(_1122);
        float _1126 = _1120 + (-1.0);
        float _1128 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1130 = fma(_1124, _1110, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1132 = fma(_1070, _1120, _1128);
        float _1134 = _1112 * _1130;
        float _1136 = fma(_1054, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1138 = fma(_1048, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1102 = _1132;
        _1092 = _1136;
        _1096 = _1138;
    }
    float _1140 = _1102;
    float _1142 = _1092;
    float _1144 = _1096;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1148 = _1140 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1152 = _1142 + _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1156 = _1144 + _1154;
    float _1158 = _1148 * _1148;
    float _1160 = fma(_1152, _1152, _1158);
    float _1162 = fma(_1156, _1156, _1160);
    float _1164 = rsqrt(_1162);
    float _1166 = sqrt(_1162);
    float _1168 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1170 = _1152 * _1168;
    float _1172 = _1156 * _1168;
    float _1174 = _1170 * _1170;
    float _1176 = _1172 * _1172;
    float _1178 = _1174 + _1176;
    float _1180 = sqrt(_1178);
    bool _1182 = _1180 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = _1180 + _1184;
    float _1188 = _1156;
    float _1190 = _1178;
    float _1192 = _1186;
    float _1194 = _1148;
    if (_1182)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1188 = _1196;
    }
    float _1198 = _1188;
    if (_1182)
    {
        float _1200 = rsqrt(_1178);
        _1190 = _1200;
    }
    float _1202 = _1190;
    float _1204 = _1202;
    if (_1182)
    {
        float _1206 = _1186 * _1198;
        _1192 = _1206;
    }
    float _1208 = _1192;
    if (_1182)
    {
        float _1210 = _1208 * 0.15915493667125701904296875;
        _1080 = _1210;
    }
    float _1212 = _1080;
    float _1214 = _1198;
    float _1216 = _1212;
    if (_1182)
    {
        float _1218 = _1212 * 6.283185482025146484375;
        float _1220 = sin(_1218);
        _1214 = _1220;
    }
    float _1222 = _1214;
    float _1224 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1226 = precise::max(0.0, _1224);
    float _1228 = _1164;
    float _1230 = _1226;
    if (_1182)
    {
        float _1232 = _1212 * 6.283185482025146484375;
        float _1234 = cos(_1232);
        _1228 = _1234;
    }
    float _1236 = _1228;
    float _1238 = -_1168;
    float _1240 = -_1226;
    float _1242 = fma(_1148, _1238, _1240);
    if (_1182)
    {
        float _1244 = _1242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1230 = _1244;
    }
    float _1246 = _1230;
    float _1248 = _1246;
    if (!_1182)
    {
        _1216 = _1172;
    }
    float _1250 = _1216;
    float _1252 = _1222;
    float _1254 = _1250;
    if (_1182)
    {
        float _1256 = fma(_1222, _1246, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1082 = _1256;
    }
    float _1258 = _1082;
    float _1260 = _1258;
    if (!_1182)
    {
        _1252 = _1170;
    }
    float _1262 = _1252;
    float _1264 = _1262;
    if (!_1182)
    {
        _1248 = _1242;
    }
    float _1266 = _1248;
    float _1268 = _1266;
    if (_1182)
    {
        float _1270 = _1236 + (-1.0);
        _1194 = _1270;
    }
    float _1272 = _1194;
    float _1274 = _1272;
    if (_1182)
    {
        float _1276 = _1202 * _1258;
        _1084 = _1276;
    }
    float _1278 = _1084;
    if (!_1182)
    {
        _1204 = _1174;
    }
    float _1280 = _1204;
    float _1282 = _1280;
    if (_1182)
    {
        float _1284 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (_1182)
    {
        float _1288 = _1170 * _1278;
        _1264 = _1288;
    }
    float _1290 = _1264;
    if (_1182)
    {
        float _1292 = _1172 * _1278;
        _1254 = _1292;
    }
    float _1294 = _1254;
    if (!_1182)
    {
        _1260 = _1176;
    }
    float _1296 = _1260;
    float _1298 = _1296;
    if (_1182)
    {
        float _1300 = fma(_1242, _1236, _1286);
        _1268 = _1300;
    }
    float _1302 = _1268;
    if (_1182)
    {
        float _1304 = _1290 * _1290;
        _1282 = _1304;
    }
    float _1306 = _1282;
    if (_1182)
    {
        float _1308 = _1294 * _1294;
        _1298 = _1308;
    }
    float _1310 = _1298;
    float _1312 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1314 = fma(_1302, _1302, _1306);
    float _1316 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1318 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1312);
    float _1320 = _1314 + _1310;
    float _1322 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1316);
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1326 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1324);
    float _1328 = precise::clamp(_1326, 0.0, 1.0);
    float _1330 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1332 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1322);
    float _1334 = rsqrt(_1320);
    float _1336 = -_1328;
    float _1338 = _1336 + 1.0;
    float _1340 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1344 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1330);
    float _1346 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1348 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1350 = abs(_1338);
    float _1352 = log2(_1350);
    float _1354 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1344);
    float _1356 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1318);
    float _1358 = -_1348;
    float _1360 = fma(_1358, _1340, 1.0);
    float _1362 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1364 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1366 = fma(_1028, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1370 = _1334 * _1290;
    float _1372 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1362);
    float _1374 = _1334 * _1302;
    float _1376 = floor(_1346);
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1380 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1372);
    float _1382 = _1334 * _1294;
    float _1384 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = -_1378;
    float _1388 = fma(_1374, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1386);
    float _1390 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1392 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1394 = floor(_1366);
    float _1396 = -_1382;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1388);
    float _1400 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1402 = fma(_1398, -0.5, 0.5);
    float _1404 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1400);
    float _1406 = fma(_1398, 0.5, 0.5);
    float _1408 = exp2(_1392);
    float _1410 = -_1376;
    float _1412 = _1346 + _1410;
    float _1414 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1404);
    float _1416 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1418 = log2(_1360);
    float _1420 = fma(_1406, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1422 = -_1394;
    float _1424 = _1366 + _1422;
    float _1426 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1416);
    float _1428 = _1374 + 1.0;
    float _1430 = fma(_1406, _1420, -0.212114393711090087890625);
    float _1432 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1434 = 1.0 / _1414;
    float _1436 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1438 = sqrt(_1402);
    float _1440 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1436);
    float _1442 = -_1374;
    float _1444 = fma(_1408, _1428, _1442);
    float _1446 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1432);
    float _1448 = _1418 * 0.693147182464599609375;
    float _1450 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1440);
    float2 _4718 = float2(_1412, _1424);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4718, float2(0.0), isnan(_4718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4718, float2(0.0), isnan(_4718)), level(0.0)).x;
    float _1454 = fma(_1406, _1430, 1.570728778839111328125);
    float _1456 = _1446 * _1434;
    float _1458 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1450);
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1462 = fma(_1444, 0.5, 0.5);
    float _1464 = fma(_1456, 0.5, 0.5);
    float _1466 = _1458 * _1434;
    float _1468 = _1438 * 0.636619746685028076171875;
    float _1470 = fma(_1466, -0.5, 0.5);
    float _1472 = -_1454;
    float _1474 = fma(_1468, _1472, 1.0);
    float3 _4762 = float3(_1464, _1470, _1460);
    float _1476 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4762, float3(0.0), isnan(_4762)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4762, float3(0.0), isnan(_4762)), level(0.0)).x;
    float3 _4773 = float3(_1464, _1470, _1460);
    float4 _1479 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4773, float3(0.0), isnan(_4773)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4773, float3(0.0), isnan(_4773)), level(0.0)).xyzw;
    float _1481 = _1479.x;
    float _1483 = _1479.y;
    float _1485 = _1479.z;
    float _1487 = _1479.w;
    float2 _4789 = float2(_1474, _1462);
    float3 _1491 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4789, float2(0.0), isnan(_4789)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4789, float2(0.0), isnan(_4789)), level(0.0)).xyz;
    float _1493 = _1491.x;
    float _1495 = _1491.y;
    float _1497 = _1491.z;
    float _1499 = in.m_63.y;
    float _1501 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1503 = _426 > 0.5;
    out.m_65.x = _580;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1509 = _424 > 0.5;
    float _1511 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1501);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1517 = _1515 != 0;
    float _1519 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1511);
    int _1521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1523 = _1521 != 0;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1527 = _1525 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1531 = _1529 != 0;
    float _1533 = in.m_63.x;
    float _1535 = 1.0 / _1507;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1539 = _1537 != 0;
    float _1541 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1543 = _428 > 0.5;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1545;
    float _1549 = -_1499;
    float _1551 = _1549 + 1.0;
    float _1553 = 0.0;
    float _1555 = _1499;
    bool _1557 = _1503;
    bool _1559 = _1539;
    float _1561 = _1414;
    if (_1517)
    {
        float _1563 = in.m_53.z;
        _1553 = _1563;
    }
    float _1565 = _1553;
    float _1567 = 1.0 / _1527;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1575 = _1509 ? as_type<int>(_1551) : as_type<int>(_1499);
    float _1577 = 0.0;
    if (_1531)
    {
        float _1579 = in.m_53.x;
        _1577 = _1579;
    }
    float _1581 = _1577;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1585 = _1583 != 0;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1589 = _1523 ? as_type<float>(_1575) : _1499;
    float _1591 = _1547 * _1535;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1595 = _1593 != 0;
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1599 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.x = _1142;
    out.m_67.y = _1140;
    out.m_67.z = _1144;
    int _1601 = _1543 ? as_type<int>(_1551) : as_type<int>(_1499);
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1605 = _1571 * _1567;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1609 = _1539 ? as_type<float>(_1601) : _1499;
    float _1611 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1595)
    {
        float _1617 = _1503 ? _1551 : _1499;
        _1555 = _1617;
    }
    float _1619 = _1555;
    float _1621 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1623 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1625 = _1619;
    if (_1517)
    {
        bool _1627 = _1565 > 0.5;
        _1557 = _1627;
    }
    bool _1629 = _1557;
    out.m_69.x = _1611;
    out.m_69.y = _1615;
    out.m_69.z = _1587;
    float _1631 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1633 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1623);
    float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1531)
    {
        bool _1637 = _1581 > 0.5;
        _1559 = _1637;
    }
    bool _1639 = _1559;
    float _1641 = fma(_1609, _1631, -0.5);
    float _1643 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1633);
    bool _1645 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1647 = isnan(_422);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1659 = -_560;
    float _1661 = fma(_798, _1641, _1659);
    float _1663 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1665 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1667 = 1.0 / _1621;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1671 = _422 + _1669;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1675 = _422 + _1673;
    float _1677 = _1663 + _1621;
    int _1679 = as_type<int>(_1641);
    if (_1517)
    {
        float _1681 = -_1533;
        float _1683 = _1681 + 1.0;
        _1679 = as_type<int>(_1683);
    }
    int _1685 = _1679;
    float _1687 = fma(_1591, _1671, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1689 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1691 = isnan(_422);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = fma(_1605, _1675, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1705 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1707 = isnan(_422);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1713 = _1709 || _1711;
    float _1715 = float(_1713);
    float _1717 = -_1699;
    float _1719 = _1717 + 1.0;
    float _1721 = fma(_1589, _1665, -0.5);
    float _1723 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1725 = as_type<int>(_1635);
    int _1727 = as_type<int>(_1719);
    float _1729 = _1687;
    if (_1531)
    {
        float _1731 = -_1533;
        float _1733 = _1731 + 1.0;
        _1725 = as_type<int>(_1733);
    }
    int _1735 = _1725;
    float _1737 = _1715 * _1719;
    float _1739 = _1677 * _1667;
    float _1741 = _1739 * 0.5;
    float _1743 = -_1715;
    float _1745 = _1743 + 1.0;
    float _1747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1585)
    {
        float _1749 = -_1533;
        float _1751 = _1749 + 1.0;
        _1727 = as_type<int>(_1751);
    }
    int _1753 = _1727;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1757 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1755);
    float _1759 = _1655 * _1745;
    float _1761 = -_1655;
    float _1763 = _1761 + 1.0;
    if (!_1531)
    {
        _1086 = _1533;
    }
    float _1765 = _1086;
    float _1767 = -_608;
    float _1769 = fma(_802, _1721, _1767);
    float _1771 = _1687 * _1759;
    float _1773 = 1.0 / _1757;
    float _1775 = fma(_1723, _1619, -0.5);
    float _1777 = _1765;
    float _1779 = _1775;
    if (!_1517)
    {
        _1625 = _1533;
    }
    float _1781 = _1625;
    float _1783 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1771);
    float _1785 = _1781;
    if (_1531)
    {
        float _1787 = _1639 ? as_type<float>(_1735) : _1533;
        _1777 = _1787;
    }
    float _1789 = _1777;
    float _1791 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1517)
    {
        float _1793 = _1629 ? as_type<float>(_1685) : _1533;
        _1785 = _1793;
    }
    float _1795 = _1785;
    float _1797 = fma(_1701, _1737, _1783);
    if (!_1585)
    {
        _1729 = _1533;
    }
    float _1799 = _1729;
    float _1801 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1803 = _1799;
    if (_1585)
    {
        float _1805 = _1543 ? as_type<float>(_1753) : _1533;
        _1803 = _1805;
    }
    float _1807 = _1803;
    float _1809 = fma(_1657, _1789, -0.5);
    float _1811 = fma(_1791, _1795, -0.5);
    float _1813 = fma(_1699, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1797);
    bool _1815 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1817 = isnan(0.5);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1823 = _1819 || _1821;
    float _1825 = fma(_1801, _1807, -0.5);
    float _1827 = in.m_71.x;
    float _1829 = in.m_71.y;
    float _1831 = in.m_71.z;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = _1773 * _1833;
    bool _1837 = _918 != 0.0;
    bool _1839 = isnan(_918);
    bool _1841 = _1837 || _1839;
    bool _1843 = isnan(0.0);
    bool _1845 = _1841 || _1843;
    float _1847 = fma(_598, _1825, _806);
    float _1849 = abs(_1835);
    float _1851 = log2(_1849);
    bool _1853 = _938 == 0.0;
    bool _1855 = !_1845;
    bool _1857 = _1853 && _1855;
    float _1859 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1863 = _760 == 0.0;
    bool _1865 = _1863 && _1857;
    float _1867 = fma(_808, _1811, _794);
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1871 = _1811;
    if (!_1823)
    {
        _612 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1873 = _612;
    float _1875 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1877 = -_814;
    float _1879 = fma(_674, _1775, _1877);
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1883 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1885 = _1873;
    float _1887 = _1883;
    if (!_1823)
    {
        float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1891 = _1873 + _1889;
        _1885 = _1891;
    }
    float _1893 = _1885;
    float _1895 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1897 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1899 = _1897;
    if (!_1823)
    {
        float _1901 = 1.0 / _1893;
        _1871 = _1901;
    }
    float _1903 = _1871;
    float _1905 = _1827;
    float _1907 = _1829;
    if (_1865)
    {
        _816 = _1831;
    }
    float _1909 = _816;
    float _1911 = _1847 + 0.5;
    float _1913 = _1909;
    if (_1823)
    {
        _1779 = 1.0;
    }
    float _1915 = _1779;
    out.m_73.x = _1875;
    out.m_73.y = _1883;
    out.m_73.z = _1897;
    out.m_73.w = _1859;
    float _1917 = _1769 + 0.5;
    float _1919 = fma(_812, _1809, _564);
    float _1921 = _1661 + 0.5;
    float _1923 = exp2(_1895);
    float _1925 = _1867 + 0.5;
    float _1927 = _1919 + 0.5;
    float _1929 = _1879 + 0.5;
    out.m_75.x = _1911;
    out.m_75.y = _1917;
    float _1931 = _1915;
    if (!_1865)
    {
        float _1933 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1827);
        _1905 = _1933;
    }
    float _1935 = _1905;
    float _1937 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1599);
    out.m_77.x = _1927;
    out.m_77.y = _1921;
    out.m_77.z = _1925;
    out.m_77.w = _1929;
    float _1939 = exp2(_1541);
    if (_1865)
    {
        _1899 = _1909;
    }
    float _1941 = _1899;
    float _1943 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1937);
    float _1945 = _1941;
    if (_1865)
    {
        _1887 = _1829;
    }
    float _1947 = _1887;
    float _1949 = _1947;
    if (!_1865)
    {
        float _1951 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1829);
        _1949 = _1951;
    }
    float _1953 = _1949;
    if (!_1865)
    {
        _1913 = _1831;
    }
    float _1955 = _1913;
    float _1957 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1959 = precise::clamp(_1957, 0.0, 1.0);
    float _1961 = _1955;
    if (!_1865)
    {
        _1907 = _1953;
    }
    float _1963 = _1907;
    if (!_1865)
    {
        float _1965 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1955);
        _1945 = _1965;
    }
    float _1967 = _1945;
    if (!_1823)
    {
        float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1971 = _1835 + _1969;
        _1088 = _1971;
    }
    float _1973 = _1088;
    float _1975 = fma(_1959, -2.0, 3.0);
    float _1977 = _1959 * _1959;
    float _1979 = _954 * _1953;
    if (!_1823)
    {
        float _1981 = _1973 * _1903;
        float _1983 = precise::clamp(_1981, 0.0, 1.0);
        _1931 = _1983;
    }
    float _1985 = _1931;
    if (!_1865)
    {
        _1961 = _1967;
    }
    float _1987 = _1961;
    float _1989 = _1963 * _1963;
    float _1991 = _1977 * _1975;
    float _1993 = -_1953;
    float _1995 = _960 * _1993;
    float _1997 = _956 * _1953;
    float _1999 = fma(_1987, _1987, _1989);
    float _2001 = -_1991;
    float _2003 = _2001 + 1.0;
    float _2005 = fma(_976, _1935, _1995);
    float _2007 = fma(_984, _1935, _1997);
    float _2009 = _980 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2011 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1991);
    float _2013 = rsqrt(_1999);
    float _2015 = fma(_980, _1935, _1979);
    float _2017 = fma(_978, _1967, _2005);
    float _2019 = _980 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2021 = _980 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2023 = fma(_988, _1967, _2015);
    float _2025 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2009);
    float _2027 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2019);
    float _2029 = fma(_1004, _1967, _2007);
    float _2031 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2021);
    float _2033 = in.m_79.x;
    bool _2035 = _1835 <= 8000.0;
    bool _2037 = isnan(_1835);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(8000.0);
    bool _2043 = _2039 || _2041;
    float _2045 = float(_2043);
    float _2047 = -_1939;
    float _2049 = _2047 + 1.0;
    float _2051 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2031);
    float _2053 = _2013 * _1963;
    float _2055 = _2013 * _1987;
    float _2057 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2027);
    float _2059 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2025);
    float _2061 = -_2053;
    float _2063 = _988 * _2061;
    float _2065 = -_2053;
    float _2067 = _978 * _2065;
    float _2069 = -_2053;
    float _2071 = _1004 * _2069;
    float _2073 = _2045 * _2011;
    float _2075 = fma(_954, _2055, _2063);
    float _2077 = -_960;
    float _2079 = fma(_2077, _2055, _2067);
    float _2081 = fma(_956, _2055, _2071);
    out.m_81.x = _2051;
    out.m_81.y = _2057;
    out.m_81.z = _2059;
    float _2083 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2085 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2087 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2089 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2091 = fma(_2079, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2083);
    float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2085);
    float _2095 = fma(_2079, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2087);
    float _2097 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2099 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _2101 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2103 = isnan(_1166);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2109 = _2105 || _2107;
    float _2111 = fma(_2081, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2091);
    float _2113 = _1414 * 0.5;
    float _2115 = fma(_2081, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2095);
    float _2117 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1943);
    float _2119 = fma(_2081, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2093);
    float _2121 = fma(_1458, -0.5, _2113);
    float _2123 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2125 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2127 = _1446 + _1414;
    out.gl_Position.x = _1446;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _2117;
    out.gl_Position.w = _1414;
    float _2129 = fma(_2017, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2097);
    float _2131 = fma(_2017, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2125);
    float _2133 = _2117 + _1414;
    float _2135 = fma(_2017, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2099);
    float _2137 = fma(_2029, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2129);
    float _2139 = fma(_2029, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2131);
    float _2141 = _2133 * 0.5;
    float _2143 = _2127 * 0.5;
    float _2145 = fma(_2029, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2135);
    out.m_83.x = _2111;
    out.m_83.y = _2119;
    out.m_83.z = _2115;
    out.m_85.x = _2143;
    out.m_85.y = _2121;
    out.m_85.z = _2141;
    out.m_85.w = _1414;
    float _2147 = _2117;
    float _2149 = _2119;
    float _2151 = _2111;
    if (!_2109)
    {
        _1561 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2153 = _1561;
    float _2155 = _2153;
    float _2157 = _2153;
    if (!_2109)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2159 = _2147;
    out.m_87.x = _2139;
    out.m_87.y = _2137;
    out.m_87.z = _2145;
    float _2161 = _2159;
    float _2163 = _2159;
    if (!_2109)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2165 = _2149;
    float _2167 = _2165;
    float _2169 = _2165;
    if (!_2109)
    {
        _2151 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2171 = _2151;
    float _2173 = -_1452;
    float _2175 = _2173 + 1.0;
    float _2177 = _2175 * _2089;
    float _2179 = precise::clamp(_2177, 0.0, 1.0);
    float _2181 = -_2179;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2185 = _2183 * _2033;
    float _2187 = _2123 * _1476;
    float _2189 = -_2123;
    float _2191 = _2189 + 1.0;
    float _2193 = _2185 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2195 = _1487 * _2187;
    float _2197 = _1497 * _2187;
    float _2199 = _1487 * _2191;
    out.m_89.x = _2193;
    float _2201 = fma(_1493, _2195, _1481);
    float _2203 = fma(_1495, _2195, _1483);
    float _2205 = fma(_1487, _2197, _1485);
    float _2207 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2209 = _2195;
    float _2211 = _2187;
    float _2213 = _2171;
    float _2215 = _2171;
    if (!_2109)
    {
        _2209 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2217 = _2209;
    float _2219 = _2217;
    float _2221 = _2217;
    if (!_2109)
    {
        _2211 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2223 = _2211;
    out.m_91.x = _2201;
    out.m_91.y = _2203;
    out.m_91.z = _2205;
    out.m_91.w = _2199;
    bool _2225 = !_2109;
    float _2227 = _2223;
    float _2229 = _2223;
    if (!_2225)
    {
        bool _2231 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2233 = isnan(_1166);
        bool _2235 = _2231 || _2233;
        bool _2237 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2239 = _2235 || _2237;
        if (!_2239)
        {
            float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2243 = _1166 + _2241;
            float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2247 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2245;
            float _2249 = 1.0 / _2247;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2271 = _2243 * _2249;
            float _2273 = precise::clamp(_2271, 0.0, 1.0);
            float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2279 = fma(_2273, _2253, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2281 = fma(_2273, _2277, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2283 = fma(_2273, _2257, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2285 = fma(_2273, _2261, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2287 = fma(_2273, _2265, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2289 = fma(_2273, _2269, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2215 = _2281;
            _2221 = _2287;
            _2169 = _2279;
            _2163 = _2285;
            _2157 = _2283;
            _2229 = _2289;
            _2291 = true;
        }
        else
        {
            bool _2293 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2295 = isnan(_1166);
            bool _2297 = _2293 || _2295;
            bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2301 = _2297 || _2299;
            if (!_2301)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2303 = _2167;
            _2169 = _2303;
            if (!_2301)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2305 = _2213;
            _2215 = _2305;
            if (!_2301)
            {
                _2155 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2307 = _2155;
            _2157 = _2307;
            if (!_2301)
            {
                _2161 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2309 = _2161;
            _2163 = _2309;
            if (!_2301)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2311 = _2219;
            _2221 = _2311;
            if (!_2301)
            {
                _2227 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2313 = _2227;
            bool _2315 = !_2301;
            _2229 = _2313;
            if (!_2315)
            {
                bool _2317 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2319 = isnan(_1166);
                bool _2321 = _2317 || _2319;
                bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2325 = _2321 || _2323;
                if (!_2325)
                {
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2329 = _1166 + _2327;
                    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2331;
                    float _2335 = 1.0 / _2333;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2357 = _2329 * _2335;
                    float _2359 = precise::clamp(_2357, 0.0, 1.0);
                    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2365 = fma(_2359, _2339, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2367 = fma(_2359, _2363, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2369 = fma(_2359, _2343, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2371 = fma(_2359, _2347, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2373 = fma(_2359, _2351, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2375 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2215 = _2367;
                    _2221 = _2373;
                    _2169 = _2365;
                    _2163 = _2371;
                    _2157 = _2369;
                    _2229 = _2375;
                    _2291 = true;
                }
                else
                {
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2163 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2157 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2229 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2291 = false;
    float _2377 = _2215;
    float _2379 = _2221;
    float _2381 = _2169;
    float _2383 = _2163;
    float _2385 = _2157;
    float _2387 = _2229;
    float _2389 = _2207 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2391 = fma(_2137, -0.5, 0.5);
    float _2393 = precise::clamp(_2391, 0.0, 1.0);
    float _2395 = -_2377;
    float _2397 = _2395 + _2379;
    float _2399 = -_2381;
    float _2401 = _2399 + _2383;
    out.m_49.x = _2389;
    float _2403 = fma(_2393, _2397, _2377);
    float _2405 = -_2385;
    float _2407 = _2405 + _2387;
    float _2409 = fma(_2393, _2401, _2381);
    float _2411 = _2403 * 0.586610972881317138671875;
    bool _2413 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2415 = fma(_2393, _2407, _2385);
    out.m_93.x = 0.0;
    float _2417 = fma(_2409, 0.298911988735198974609375, _2411);
    bool _2419 = _1985 > 0.0;
    bool _2421 = isnan(_1985);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan(0.0);
    bool _2427 = _2423 || _2425;
    float _2429 = fma(_2415, 0.114477999508380889892578125, _2417);
    float _2431 = -_2429;
    float _2433 = _2409 + _2431;
    float _2435 = -_2429;
    float _2437 = _2403 + _2435;
    float _2439 = -_2429;
    float _2441 = _2415 + _2439;
    float _2443 = fma(_2433, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2429);
    float _2445 = fma(_2437, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2429);
    float _2447 = fma(_2441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2429);
    bool _2449 = !_2413;
    if (!_2449)
    {
        float _2451 = -_1140;
        float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2455 = -_1142;
        float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2459 = -_1144;
        float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2463 = _2453 * _2453;
        float _2465 = fma(_2457, _2457, _2463);
        float _2467 = fma(_2461, _2461, _2465);
        float _2469 = sqrt(_2467);
        float _2471 = rsqrt(_2467);
        float _2473 = -_2469;
        float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2477 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2479 = precise::clamp(_2477, 0.0, 1.0);
        float _2481 = _2457 * _2471;
        float _2483 = _2453 * _2471;
        float _2485 = abs(_2479);
        float _2487 = log2(_2485);
        float _2489 = _2461 * _2471;
        float _2491 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2493 = _2137 * _2483;
        float _2495 = -_2483;
        float _2497 = -_2491;
        float _2499 = fma(_2495, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2497);
        float _2501 = fma(_2139, _2481, _2493);
        float _2503 = -_2489;
        float _2505 = fma(_2503, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2499);
        float _2507 = fma(_2145, _2489, _2501);
        float _2509 = precise::clamp(_2507, 0.0, 1.0);
        float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2513 = _2505 + _2511;
        float _2515 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2517 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2519 = precise::clamp(_2517, 0.0, 1.0);
        float _2521 = exp2(_2515);
        float _2523 = _2521 * _2519;
        float _2525 = _2509 * _2523;
        float _2527 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2529 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2531 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2527;
        out.m_93.y = _2529;
        out.m_93.z = _2531;
    }
    out.m_95.x = _2443;
    out.m_95.y = _2445;
    out.m_95.z = _2447;
    if (_2427)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2533 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2533;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2291 = false;
    bool _414 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2590 = as_type<float>(_130);
        out.gl_Position.z = _2590;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_51.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_49.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2659 = as_type<float>(_168);
        out.gl_Position.z = _2659;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_53.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _200 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _200 + _206;
    bool _210 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _212 = isnan(_200);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _200 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _224;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _242 = 1.0 / _232;
    float _244 = 1.0 / _236;
    float _246 = _204 * _238;
    bool _248 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_200);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_220;
    float _262 = _260 + 1.0;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    float _268 = _258 * _262;
    float _270 = _208 * _242;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    bool _276 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _278 = isnan(_200);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_258;
    float _290 = _288 + 1.0;
    float _292 = fma(_266, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = _228 * _244;
    bool _298 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_200);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = fma(_312, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = -_308;
    float _322 = _320 + 1.0;
    float _324 = _308 * _290;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = _286 * _322;
    float _336 = -_286;
    float _338 = _336 + 1.0;
    float _340 = fma(_316, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _342 = fma(_328, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _344 = _292 * _334;
    float _346 = _294 * _334;
    float _348 = _318 * _334;
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _354 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _348);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = fma(_332, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_340, _324, _350);
    float _372 = fma(_358, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_362, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _376 = fma(_342, _324, _352);
    float _378 = fma(_368, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_364, _324, _354);
    float _382 = fma(_372, _268, _370);
    float _384 = fma(_374, _268, _376);
    float _386 = fma(_378, _268, _380);
    float _388 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].x, _382);
    float _390 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].z, _386);
    bool _394 = !_240;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_114);
        float _418 = 1.0 / _416;
        float _420 = _148 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_53.z;
    float _426 = in.m_53.w;
    float _428 = in.m_53.y;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _432 = _430 != 0;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_432)
    {
        float _438 = in.m_53.x;
        _436 = _438;
    }
    float _440 = _436;
    float _442 = _424 * 2.0;
    float _444 = _428 * 2.0;
    float _446 = _428 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _448 = floor(_442);
    float _450 = fma(_446, -2.0, _434);
    int _452 = as_type<int>(_446);
    if (_432)
    {
        _452 = 0;
    }
    int _454 = _452;
    float _456 = floor(_444);
    bool _458 = _448 >= 0.0;
    bool _460 = isnan(_448);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    bool _468 = _448 > 0.0;
    float _470 = _448;
    int _472 = _454;
    if (_432)
    {
        _470 = _428;
    }
    float _474 = _470;
    int _476 = _466 ? 0 : 1;
    bool _478 = _456 >= 0.0;
    bool _480 = isnan(_456);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    bool _488 = _456 > 0.0;
    int _490 = _486 ? 0 : 1;
    float _492 = _456;
    float _494 = _440;
    float _496 = _474;
    if (_432)
    {
        _492 = _440;
    }
    float _498 = _492;
    float _500 = _498;
    if (!_432)
    {
        float _502 = in.m_53.x;
        float _504 = _428 * 3.1415927410125732421875;
        float _506 = _504 * 0.15915493667125701904296875;
        float _508 = _506 * 6.283185482025146484375;
        float _510 = sin(_508);
        float _512 = _502 * 3.1415927410125732421875;
        float _514 = _512 * 0.15915493667125701904296875;
        float _516 = _514 * 6.283185482025146484375;
        float _518 = sin(_516);
        _472 = 1;
        _494 = _502;
        _496 = _510;
        _500 = _518;
    }
    int _520 = _472;
    float _522 = _494;
    float _524 = _496;
    float _526 = _500;
    bool _528 = _520 != 1;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _532 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _534 = ~_490;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _542 = log2(_540);
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _554 = _552 != 0;
    float _556 = -_530;
    float _558 = fma(_532, 2.0, _556);
    float _560 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _450);
    float _562 = -_148;
    float _564 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[76].x, _558);
    int _566 = _538;
    if (!_488)
    {
        int _568 = ~_490;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    float _574 = _522 * 2.0;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _580 = in.m_55.x;
    float _582 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[93].w, _576);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _586 = _524 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _588 = floor(_574);
    float _590 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[93].z, _578);
    float _592 = _526 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _594 = _428 + _522;
    float _596 = fma(_586, -2.0, _584);
    float _598 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].z, _590);
    float _600 = _594 + (-1.0);
    float _602 = _594;
    float _604 = _592;
    if (!_528)
    {
        _602 = _424;
    }
    float _606 = _602;
    float _608 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[91].y, _596);
    float _610 = _606;
    float _612 = _608;
    if (_528)
    {
        _610 = _428;
    }
    float _614 = _610;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _618 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _620 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[83].w, _616);
    int _622 = ~_476;
    int _624 = _622 + 1;
    int _626 = _624 + 1;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _630 = _626;
    float _632 = _614;
    if (!_468)
    {
        int _634 = ~_476;
        int _636 = _634 + 1;
        _630 = _636;
    }
    int _638 = _630;
    float _640 = _424 + _522;
    bool _642 = !_546;
    int _644 = _642 ? 0 : 1;
    float _646 = -_628;
    float _648 = fma(_592, 2.0, _646);
    bool _650 = _588 > 0.0;
    float _652 = _640 + (-1.0);
    bool _654 = _588 >= 0.0;
    bool _656 = isnan(_588);
    bool _658 = _654 || _656;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_528)
    {
        _632 = _424;
    }
    float _666 = _632;
    float _668 = _542 * _148;
    float _670 = _666;
    if (_528)
    {
        _670 = _428;
    }
    float _672 = _670;
    float _674 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _620);
    int _676 = abs(_644);
    float _678 = _672 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_528)
    {
        _604 = _428;
    }
    float _680 = _604;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _684 = _680;
    if (_528)
    {
        _684 = _522;
    }
    float _686 = _684;
    float _688 = fma(_678, -2.0, _664);
    float _690 = float(_638);
    float _692 = float(_676);
    float _694 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[83].z, _682);
    float _696 = in.m_57.x;
    float _698 = in.m_57.y;
    float _700 = in.m_57.z;
    int _702 = _662 ? 0 : 1;
    float _704 = _692 * _690;
    float _706 = _686;
    if (!_528)
    {
        _706 = _428;
    }
    float _708 = _706;
    float _710 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _712 = exp2(_668);
    float _714 = _704 * (-2.0);
    float _716 = _708;
    if (_528)
    {
        _716 = _522;
    }
    float _718 = _716;
    int _720 = ~_702;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _728 = _724;
    if (!_650)
    {
        int _730 = ~_702;
        int _732 = _730 + 1;
        _728 = _732;
    }
    int _734 = _728;
    float _736 = _718 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _738 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _740 = isnan(1.0);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _746 = _742 || _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _750 = 1.0 + _748;
    float _752 = -_726;
    float _754 = fma(_736, 2.0, _752);
    float _756 = in.m_59.x;
    float _758 = in.m_59.y;
    float _760 = in.m_59.z;
    bool _762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = 1.0 / _750;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _776 = -_712;
    float _778 = _776 + 1.0;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _782 = !_554;
    int _784 = _782 ? 0 : 1;
    float _786 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].w, _774);
    bool _788 = !_550;
    int _790 = _788 ? 0 : 1;
    float _792 = -_148;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[81].x, _754);
    float _796 = _770 ? _778 : 0.0;
    float _798 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _786);
    float _800 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].z, _780);
    float _802 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[92].w, _582);
    float _804 = -_148;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[91].x, _648);
    float _808 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _694);
    float _810 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[191].x, _522);
    float _812 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _800);
    float _814 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _688);
    float _816 = _794;
    if (_746)
    {
        float _818 = _796 * _772;
        _152 = _818;
    }
    float _820 = _152;
    int _822 = abs(_784);
    float _824 = fma(_714, _696, _696);
    int _826 = abs(_790);
    float _828 = _522 + (-0.5);
    float _830 = float(_572);
    float _832 = _810 + _760;
    float _834 = float(_822);
    float _836 = fma(_618, _714, _618);
    float _838 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[196].x, _824);
    float _840 = float(_734);
    float _842 = _834 * _830;
    float _844 = float(_826);
    float _846 = _832 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _848 = fma(_836, _820, _838);
    float _850 = _842 * (-2.0);
    float _852 = _428 + _424;
    float _854 = _844 * _840;
    float _856 = _846 * 0.15915493667125701904296875;
    float _858 = in.m_61.x;
    float _860 = in.m_61.y;
    float _862 = in.m_61.z;
    float _864 = _424 + (-0.5);
    float _866 = fma(_850, _700, _700);
    float _868 = _854 * (-2.0);
    float _870 = _852 + (-1.0);
    float _872 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[196].z, _866);
    float _874 = _856 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(_868, _698, _698);
    float _880 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _882 = _428 + (-0.5);
    float _884 = fma(_710, _850, _710);
    float _886 = _848 * 0.15915493667125701904296875;
    float _888 = fma(_880, _868, _880);
    float _890 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _892 = fma(_884, _820, _872);
    float _894 = _886 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _580 * _580;
    float _900 = fma(_888, _820, _890);
    float _902 = _892 * 0.15915493667125701904296875;
    float _904 = _900 * 0.15915493667125701904296875;
    float _906 = _876 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _908 = _886 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = _392 * _862;
    float _914 = _390 * _860;
    float _916 = _388 * _858;
    float _918 = fma(_906, _898, _758);
    float _920 = in.m_46.x;
    float _922 = in.m_46.y;
    float _924 = in.m_46.z;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _760);
    float _928 = _912 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _930 = _902 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _918);
    float _938 = fma(_906, 0.300000011920928955078125, _756);
    float _940 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _938);
    float _944 = _904 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = _942 * _940;
    float _950 = _904 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = _910 * _932;
    float _956 = _896 * _932;
    float _958 = _902 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = _926 * _928;
    float _964 = _936 * _934;
    float _966 = _896 * _946;
    float _968 = _910 * _946;
    float _970 = _964 * _954;
    float _972 = _910 * _952;
    float _974 = _896 * _952;
    float _976 = _952 * _932;
    float _978 = _946 * _932;
    float _980 = fma(_960, _972, _966);
    float _982 = -_968;
    float _984 = fma(_960, _974, _982);
    float _986 = -_974;
    float _988 = fma(_960, _968, _986);
    float _990 = -_964;
    float _992 = _960 * _990;
    float _994 = fma(_980, _948, _970);
    float _996 = _964 * _956;
    float _998 = _922 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1000 = fma(_948, _976, _992);
    float _1002 = fma(_962, _988, _994);
    float _1004 = fma(_960, _966, _972);
    float _1006 = fma(_948, _984, _996);
    float _1008 = _922 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1010 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[6].x, _998);
    float _1012 = fma(_962, _978, _1000);
    float _1014 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1016 = fma(_1004, _962, _1006);
    float _1018 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1020 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1010);
    float _1022 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1014);
    float _1026 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1028 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1030 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1022);
    float _1032 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1024);
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = _922 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1038 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1030);
    float _1040 = _1028 + _1032;
    float _1042 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1036);
    float _1044 = _1034 + _1038;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1048 = _1040 + _1046;
    float _1050 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1042);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1054 = _1044 + _1052;
    float _1056 = _1048 * _1048;
    float _1058 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1060 = fma(_1054, _1054, _1056);
    float _1062 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1064 = sqrt(_1060);
    float _1066 = fma(_1012, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1062);
    float _1068 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1066);
    float _1070 = _1058 + _1068;
    bool _1072 = _1064 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1074 = _920;
    float _1076 = _924;
    float _1078 = _1050;
    float _1080 = _1044;
    float _1082 = _1040;
    float _1084 = _850;
    float _1086 = _1028;
    float _1088 = _760;
    if (!_1072)
    {
        _1074 = _1044;
    }
    float _1090 = _1074;
    float _1092 = _1090;
    if (!_1072)
    {
        _1076 = _1040;
    }
    float _1094 = _1076;
    float _1096 = _1094;
    if (!_1072)
    {
        _1078 = _1070;
    }
    float _1098 = _1078;
    bool _1100 = !_1072;
    float _1102 = _1098;
    if (!_1100)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1108 = _1064 + _1106;
        float _1110 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = rsqrt(_1060);
        float _1114 = _1108 * _1104;
        float _1116 = _1114 * 0.15915493667125701904296875;
        float _1118 = _1116 * 6.283185482025146484375;
        float _1120 = cos(_1118);
        float _1122 = _1116 * 6.283185482025146484375;
        float _1124 = sin(_1122);
        float _1126 = _1120 + (-1.0);
        float _1128 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1130 = fma(_1124, _1110, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1132 = fma(_1070, _1120, _1128);
        float _1134 = _1112 * _1130;
        float _1136 = fma(_1054, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1138 = fma(_1048, _1134, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1102 = _1132;
        _1092 = _1136;
        _1096 = _1138;
    }
    float _1140 = _1102;
    float _1142 = _1092;
    float _1144 = _1096;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1148 = _1140 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1152 = _1142 + _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1156 = _1144 + _1154;
    float _1158 = _1148 * _1148;
    float _1160 = fma(_1152, _1152, _1158);
    float _1162 = fma(_1156, _1156, _1160);
    float _1164 = rsqrt(_1162);
    float _1166 = sqrt(_1162);
    float _1168 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1170 = _1152 * _1168;
    float _1172 = _1156 * _1168;
    float _1174 = _1170 * _1170;
    float _1176 = _1172 * _1172;
    float _1178 = _1174 + _1176;
    float _1180 = sqrt(_1178);
    bool _1182 = _1180 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = _1180 + _1184;
    float _1188 = _1156;
    float _1190 = _1178;
    float _1192 = _1186;
    float _1194 = _1148;
    if (_1182)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1188 = _1196;
    }
    float _1198 = _1188;
    if (_1182)
    {
        float _1200 = rsqrt(_1178);
        _1190 = _1200;
    }
    float _1202 = _1190;
    float _1204 = _1202;
    if (_1182)
    {
        float _1206 = _1186 * _1198;
        _1192 = _1206;
    }
    float _1208 = _1192;
    if (_1182)
    {
        float _1210 = _1208 * 0.15915493667125701904296875;
        _1080 = _1210;
    }
    float _1212 = _1080;
    float _1214 = _1198;
    float _1216 = _1212;
    if (_1182)
    {
        float _1218 = _1212 * 6.283185482025146484375;
        float _1220 = sin(_1218);
        _1214 = _1220;
    }
    float _1222 = _1214;
    float _1224 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1226 = precise::max(0.0, _1224);
    float _1228 = _1164;
    float _1230 = _1226;
    if (_1182)
    {
        float _1232 = _1212 * 6.283185482025146484375;
        float _1234 = cos(_1232);
        _1228 = _1234;
    }
    float _1236 = _1228;
    float _1238 = -_1168;
    float _1240 = -_1226;
    float _1242 = fma(_1148, _1238, _1240);
    if (_1182)
    {
        float _1244 = _1242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1230 = _1244;
    }
    float _1246 = _1230;
    float _1248 = _1246;
    if (!_1182)
    {
        _1216 = _1172;
    }
    float _1250 = _1216;
    float _1252 = _1222;
    float _1254 = _1250;
    if (_1182)
    {
        float _1256 = fma(_1222, _1246, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1082 = _1256;
    }
    float _1258 = _1082;
    float _1260 = _1258;
    if (!_1182)
    {
        _1252 = _1170;
    }
    float _1262 = _1252;
    float _1264 = _1262;
    if (!_1182)
    {
        _1248 = _1242;
    }
    float _1266 = _1248;
    float _1268 = _1266;
    if (_1182)
    {
        float _1270 = _1236 + (-1.0);
        _1194 = _1270;
    }
    float _1272 = _1194;
    float _1274 = _1272;
    if (_1182)
    {
        float _1276 = _1202 * _1258;
        _1084 = _1276;
    }
    float _1278 = _1084;
    if (!_1182)
    {
        _1204 = _1174;
    }
    float _1280 = _1204;
    float _1282 = _1280;
    if (_1182)
    {
        float _1284 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (_1182)
    {
        float _1288 = _1170 * _1278;
        _1264 = _1288;
    }
    float _1290 = _1264;
    if (_1182)
    {
        float _1292 = _1172 * _1278;
        _1254 = _1292;
    }
    float _1294 = _1254;
    if (!_1182)
    {
        _1260 = _1176;
    }
    float _1296 = _1260;
    float _1298 = _1296;
    if (_1182)
    {
        float _1300 = fma(_1242, _1236, _1286);
        _1268 = _1300;
    }
    float _1302 = _1268;
    if (_1182)
    {
        float _1304 = _1290 * _1290;
        _1282 = _1304;
    }
    float _1306 = _1282;
    if (_1182)
    {
        float _1308 = _1294 * _1294;
        _1298 = _1308;
    }
    float _1310 = _1298;
    float _1312 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1314 = fma(_1302, _1302, _1306);
    float _1316 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1318 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1312);
    float _1320 = _1314 + _1310;
    float _1322 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1316);
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1326 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1324);
    float _1328 = precise::clamp(_1326, 0.0, 1.0);
    float _1330 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1332 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1322);
    float _1334 = rsqrt(_1320);
    float _1336 = -_1328;
    float _1338 = _1336 + 1.0;
    float _1340 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1342 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1344 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1330);
    float _1346 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1348 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1350 = abs(_1338);
    float _1352 = log2(_1350);
    float _1354 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1344);
    float _1356 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1318);
    float _1358 = -_1348;
    float _1360 = fma(_1358, _1340, 1.0);
    float _1362 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1364 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1366 = fma(_1028, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1370 = _1334 * _1290;
    float _1372 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1362);
    float _1374 = _1334 * _1302;
    float _1376 = floor(_1346);
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1380 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1372);
    float _1382 = _1334 * _1294;
    float _1384 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = -_1378;
    float _1388 = fma(_1374, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1386);
    float _1390 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1392 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1394 = floor(_1366);
    float _1396 = -_1382;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1388);
    float _1400 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1402 = fma(_1398, -0.5, 0.5);
    float _1404 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1400);
    float _1406 = fma(_1398, 0.5, 0.5);
    float _1408 = exp2(_1392);
    float _1410 = -_1376;
    float _1412 = _1346 + _1410;
    float _1414 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1404);
    float _1416 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1418 = log2(_1360);
    float _1420 = fma(_1406, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1422 = -_1394;
    float _1424 = _1366 + _1422;
    float _1426 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1416);
    float _1428 = _1374 + 1.0;
    float _1430 = fma(_1406, _1420, -0.212114393711090087890625);
    float _1432 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1434 = 1.0 / _1414;
    float _1436 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1438 = sqrt(_1402);
    float _1440 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1436);
    float _1442 = -_1374;
    float _1444 = fma(_1408, _1428, _1442);
    float _1446 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1432);
    float _1448 = _1418 * 0.693147182464599609375;
    float _1450 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1440);
    float2 _4718 = float2(_1412, _1424);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4718, float2(0.0), isnan(_4718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4718, float2(0.0), isnan(_4718)), level(0.0)).x;
    float _1454 = fma(_1406, _1430, 1.570728778839111328125);
    float _1456 = _1446 * _1434;
    float _1458 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1450);
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1462 = fma(_1444, 0.5, 0.5);
    float _1464 = fma(_1456, 0.5, 0.5);
    float _1466 = _1458 * _1434;
    float _1468 = _1438 * 0.636619746685028076171875;
    float _1470 = fma(_1466, -0.5, 0.5);
    float _1472 = -_1454;
    float _1474 = fma(_1468, _1472, 1.0);
    float3 _4762 = float3(_1464, _1470, _1460);
    float _1476 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4762, float3(0.0), isnan(_4762)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4762, float3(0.0), isnan(_4762)), level(0.0)).x;
    float3 _4773 = float3(_1464, _1470, _1460);
    float4 _1479 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4773, float3(0.0), isnan(_4773)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4773, float3(0.0), isnan(_4773)), level(0.0)).xyzw;
    float _1481 = _1479.x;
    float _1483 = _1479.y;
    float _1485 = _1479.z;
    float _1487 = _1479.w;
    float2 _4789 = float2(_1474, _1462);
    float3 _1491 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4789, float2(0.0), isnan(_4789)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4789, float2(0.0), isnan(_4789)), level(0.0)).xyz;
    float _1493 = _1491.x;
    float _1495 = _1491.y;
    float _1497 = _1491.z;
    float _1499 = in.m_63.y;
    float _1501 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1503 = _426 > 0.5;
    out.m_65.x = _580;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1509 = _424 > 0.5;
    float _1511 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1501);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1517 = _1515 != 0;
    float _1519 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1511);
    int _1521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1523 = _1521 != 0;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1527 = _1525 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1531 = _1529 != 0;
    float _1533 = in.m_63.x;
    float _1535 = 1.0 / _1507;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1539 = _1537 != 0;
    float _1541 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1543 = _428 > 0.5;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1545;
    float _1549 = -_1499;
    float _1551 = _1549 + 1.0;
    float _1553 = 0.0;
    float _1555 = _1499;
    bool _1557 = _1503;
    bool _1559 = _1539;
    float _1561 = _1414;
    if (_1517)
    {
        float _1563 = in.m_53.z;
        _1553 = _1563;
    }
    float _1565 = _1553;
    float _1567 = 1.0 / _1527;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1575 = _1509 ? as_type<int>(_1551) : as_type<int>(_1499);
    float _1577 = 0.0;
    if (_1531)
    {
        float _1579 = in.m_53.x;
        _1577 = _1579;
    }
    float _1581 = _1577;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1585 = _1583 != 0;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1589 = _1523 ? as_type<float>(_1575) : _1499;
    float _1591 = _1547 * _1535;
    int _1593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1595 = _1593 != 0;
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1599 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.x = _1142;
    out.m_67.y = _1140;
    out.m_67.z = _1144;
    int _1601 = _1543 ? as_type<int>(_1551) : as_type<int>(_1499);
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1605 = _1571 * _1567;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1609 = _1539 ? as_type<float>(_1601) : _1499;
    float _1611 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1595)
    {
        float _1617 = _1503 ? _1551 : _1499;
        _1555 = _1617;
    }
    float _1619 = _1555;
    float _1621 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1623 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1625 = _1619;
    if (_1517)
    {
        bool _1627 = _1565 > 0.5;
        _1557 = _1627;
    }
    bool _1629 = _1557;
    out.m_69.x = _1611;
    out.m_69.y = _1615;
    out.m_69.z = _1587;
    float _1631 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1633 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1623);
    float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1531)
    {
        bool _1637 = _1581 > 0.5;
        _1559 = _1637;
    }
    bool _1639 = _1559;
    float _1641 = fma(_1609, _1631, -0.5);
    float _1643 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1633);
    bool _1645 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1647 = isnan(_422);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1659 = -_560;
    float _1661 = fma(_798, _1641, _1659);
    float _1663 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1665 = _1613 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1667 = 1.0 / _1621;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1671 = _422 + _1669;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1675 = _422 + _1673;
    float _1677 = _1663 + _1621;
    int _1679 = as_type<int>(_1641);
    if (_1517)
    {
        float _1681 = -_1533;
        float _1683 = _1681 + 1.0;
        _1679 = as_type<int>(_1683);
    }
    int _1685 = _1679;
    float _1687 = fma(_1591, _1671, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1689 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1691 = isnan(_422);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = fma(_1605, _1675, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1705 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1707 = isnan(_422);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1713 = _1709 || _1711;
    float _1715 = float(_1713);
    float _1717 = -_1699;
    float _1719 = _1717 + 1.0;
    float _1721 = fma(_1589, _1665, -0.5);
    float _1723 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1725 = as_type<int>(_1635);
    int _1727 = as_type<int>(_1719);
    float _1729 = _1687;
    if (_1531)
    {
        float _1731 = -_1533;
        float _1733 = _1731 + 1.0;
        _1725 = as_type<int>(_1733);
    }
    int _1735 = _1725;
    float _1737 = _1715 * _1719;
    float _1739 = _1677 * _1667;
    float _1741 = _1739 * 0.5;
    float _1743 = -_1715;
    float _1745 = _1743 + 1.0;
    float _1747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1585)
    {
        float _1749 = -_1533;
        float _1751 = _1749 + 1.0;
        _1727 = as_type<int>(_1751);
    }
    int _1753 = _1727;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1757 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1755);
    float _1759 = _1655 * _1745;
    float _1761 = -_1655;
    float _1763 = _1761 + 1.0;
    if (!_1531)
    {
        _1086 = _1533;
    }
    float _1765 = _1086;
    float _1767 = -_608;
    float _1769 = fma(_802, _1721, _1767);
    float _1771 = _1687 * _1759;
    float _1773 = 1.0 / _1757;
    float _1775 = fma(_1723, _1619, -0.5);
    float _1777 = _1765;
    float _1779 = _1775;
    if (!_1517)
    {
        _1625 = _1533;
    }
    float _1781 = _1625;
    float _1783 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1771);
    float _1785 = _1781;
    if (_1531)
    {
        float _1787 = _1639 ? as_type<float>(_1735) : _1533;
        _1777 = _1787;
    }
    float _1789 = _1777;
    float _1791 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1517)
    {
        float _1793 = _1629 ? as_type<float>(_1685) : _1533;
        _1785 = _1793;
    }
    float _1795 = _1785;
    float _1797 = fma(_1701, _1737, _1783);
    if (!_1585)
    {
        _1729 = _1533;
    }
    float _1799 = _1729;
    float _1801 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1803 = _1799;
    if (_1585)
    {
        float _1805 = _1543 ? as_type<float>(_1753) : _1533;
        _1803 = _1805;
    }
    float _1807 = _1803;
    float _1809 = fma(_1657, _1789, -0.5);
    float _1811 = fma(_1791, _1795, -0.5);
    float _1813 = fma(_1699, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1797);
    bool _1815 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1817 = isnan(0.5);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1823 = _1819 || _1821;
    float _1825 = fma(_1801, _1807, -0.5);
    float _1827 = in.m_71.x;
    float _1829 = in.m_71.y;
    float _1831 = in.m_71.z;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = _1773 * _1833;
    bool _1837 = _918 != 0.0;
    bool _1839 = isnan(_918);
    bool _1841 = _1837 || _1839;
    bool _1843 = isnan(0.0);
    bool _1845 = _1841 || _1843;
    float _1847 = fma(_598, _1825, _806);
    float _1849 = abs(_1835);
    float _1851 = log2(_1849);
    bool _1853 = _938 == 0.0;
    bool _1855 = !_1845;
    bool _1857 = _1853 && _1855;
    float _1859 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1863 = _760 == 0.0;
    bool _1865 = _1863 && _1857;
    float _1867 = fma(_808, _1811, _794);
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1871 = _1811;
    if (!_1823)
    {
        _612 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1873 = _612;
    float _1875 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1877 = -_814;
    float _1879 = fma(_674, _1775, _1877);
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1883 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1885 = _1873;
    float _1887 = _1883;
    if (!_1823)
    {
        float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1891 = _1873 + _1889;
        _1885 = _1891;
    }
    float _1893 = _1885;
    float _1895 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1897 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1899 = _1897;
    if (!_1823)
    {
        float _1901 = 1.0 / _1893;
        _1871 = _1901;
    }
    float _1903 = _1871;
    float _1905 = _1827;
    float _1907 = _1829;
    if (_1865)
    {
        _816 = _1831;
    }
    float _1909 = _816;
    float _1911 = _1847 + 0.5;
    float _1913 = _1909;
    if (_1823)
    {
        _1779 = 1.0;
    }
    float _1915 = _1779;
    out.m_73.x = _1875;
    out.m_73.y = _1883;
    out.m_73.z = _1897;
    out.m_73.w = _1859;
    float _1917 = _1769 + 0.5;
    float _1919 = fma(_812, _1809, _564);
    float _1921 = _1661 + 0.5;
    float _1923 = exp2(_1895);
    float _1925 = _1867 + 0.5;
    float _1927 = _1919 + 0.5;
    float _1929 = _1879 + 0.5;
    out.m_75.x = _1911;
    out.m_75.y = _1917;
    float _1931 = _1915;
    if (!_1865)
    {
        float _1933 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1827);
        _1905 = _1933;
    }
    float _1935 = _1905;
    float _1937 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1599);
    out.m_77.x = _1927;
    out.m_77.y = _1921;
    out.m_77.z = _1925;
    out.m_77.w = _1929;
    float _1939 = exp2(_1541);
    if (_1865)
    {
        _1899 = _1909;
    }
    float _1941 = _1899;
    float _1943 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1937);
    float _1945 = _1941;
    if (_1865)
    {
        _1887 = _1829;
    }
    float _1947 = _1887;
    float _1949 = _1947;
    if (!_1865)
    {
        float _1951 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1829);
        _1949 = _1951;
    }
    float _1953 = _1949;
    if (!_1865)
    {
        _1913 = _1831;
    }
    float _1955 = _1913;
    float _1957 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1959 = precise::clamp(_1957, 0.0, 1.0);
    float _1961 = _1955;
    if (!_1865)
    {
        _1907 = _1953;
    }
    float _1963 = _1907;
    if (!_1865)
    {
        float _1965 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1955);
        _1945 = _1965;
    }
    float _1967 = _1945;
    if (!_1823)
    {
        float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1971 = _1835 + _1969;
        _1088 = _1971;
    }
    float _1973 = _1088;
    float _1975 = fma(_1959, -2.0, 3.0);
    float _1977 = _1959 * _1959;
    float _1979 = _954 * _1953;
    if (!_1823)
    {
        float _1981 = _1973 * _1903;
        float _1983 = precise::clamp(_1981, 0.0, 1.0);
        _1931 = _1983;
    }
    float _1985 = _1931;
    if (!_1865)
    {
        _1961 = _1967;
    }
    float _1987 = _1961;
    float _1989 = _1963 * _1963;
    float _1991 = _1977 * _1975;
    float _1993 = -_1953;
    float _1995 = _960 * _1993;
    float _1997 = _956 * _1953;
    float _1999 = fma(_1987, _1987, _1989);
    float _2001 = -_1991;
    float _2003 = _2001 + 1.0;
    float _2005 = fma(_976, _1935, _1995);
    float _2007 = fma(_984, _1935, _1997);
    float _2009 = _980 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2011 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1991);
    float _2013 = rsqrt(_1999);
    float _2015 = fma(_980, _1935, _1979);
    float _2017 = fma(_978, _1967, _2005);
    float _2019 = _980 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2021 = _980 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2023 = fma(_988, _1967, _2015);
    float _2025 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2009);
    float _2027 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2019);
    float _2029 = fma(_1004, _1967, _2007);
    float _2031 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2021);
    float _2033 = in.m_79.x;
    bool _2035 = _1835 <= 8000.0;
    bool _2037 = isnan(_1835);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(8000.0);
    bool _2043 = _2039 || _2041;
    float _2045 = float(_2043);
    float _2047 = -_1939;
    float _2049 = _2047 + 1.0;
    float _2051 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2031);
    float _2053 = _2013 * _1963;
    float _2055 = _2013 * _1987;
    float _2057 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2027);
    float _2059 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2025);
    float _2061 = -_2053;
    float _2063 = _988 * _2061;
    float _2065 = -_2053;
    float _2067 = _978 * _2065;
    float _2069 = -_2053;
    float _2071 = _1004 * _2069;
    float _2073 = _2045 * _2011;
    float _2075 = fma(_954, _2055, _2063);
    float _2077 = -_960;
    float _2079 = fma(_2077, _2055, _2067);
    float _2081 = fma(_956, _2055, _2071);
    out.m_81.x = _2051;
    out.m_81.y = _2057;
    out.m_81.z = _2059;
    float _2083 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2085 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2087 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2089 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2091 = fma(_2079, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2083);
    float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2085);
    float _2095 = fma(_2079, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2087);
    float _2097 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2099 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _2101 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2103 = isnan(_1166);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2109 = _2105 || _2107;
    float _2111 = fma(_2081, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2091);
    float _2113 = _1414 * 0.5;
    float _2115 = fma(_2081, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2095);
    float _2117 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1943);
    float _2119 = fma(_2081, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2093);
    float _2121 = fma(_1458, -0.5, _2113);
    float _2123 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2125 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2127 = _1446 + _1414;
    out.gl_Position.x = _1446;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _2117;
    out.gl_Position.w = _1414;
    float _2129 = fma(_2017, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2097);
    float _2131 = fma(_2017, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2125);
    float _2133 = _2117 + _1414;
    float _2135 = fma(_2017, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2099);
    float _2137 = fma(_2029, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2129);
    float _2139 = fma(_2029, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2131);
    float _2141 = _2133 * 0.5;
    float _2143 = _2127 * 0.5;
    float _2145 = fma(_2029, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2135);
    out.m_83.x = _2111;
    out.m_83.y = _2119;
    out.m_83.z = _2115;
    out.m_85.x = _2143;
    out.m_85.y = _2121;
    out.m_85.z = _2141;
    out.m_85.w = _1414;
    float _2147 = _2117;
    float _2149 = _2119;
    float _2151 = _2111;
    if (!_2109)
    {
        _1561 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2153 = _1561;
    float _2155 = _2153;
    float _2157 = _2153;
    if (!_2109)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2159 = _2147;
    out.m_87.x = _2139;
    out.m_87.y = _2137;
    out.m_87.z = _2145;
    float _2161 = _2159;
    float _2163 = _2159;
    if (!_2109)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2165 = _2149;
    float _2167 = _2165;
    float _2169 = _2165;
    if (!_2109)
    {
        _2151 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2171 = _2151;
    float _2173 = -_1452;
    float _2175 = _2173 + 1.0;
    float _2177 = _2175 * _2089;
    float _2179 = precise::clamp(_2177, 0.0, 1.0);
    float _2181 = -_2179;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2185 = _2183 * _2033;
    float _2187 = _2123 * _1476;
    float _2189 = -_2123;
    float _2191 = _2189 + 1.0;
    float _2193 = _2185 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2195 = _1487 * _2187;
    float _2197 = _1497 * _2187;
    float _2199 = _1487 * _2191;
    out.m_89.x = _2193;
    float _2201 = fma(_1493, _2195, _1481);
    float _2203 = fma(_1495, _2195, _1483);
    float _2205 = fma(_1487, _2197, _1485);
    float _2207 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2209 = _2195;
    float _2211 = _2187;
    float _2213 = _2171;
    float _2215 = _2171;
    if (!_2109)
    {
        _2209 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2217 = _2209;
    float _2219 = _2217;
    float _2221 = _2217;
    if (!_2109)
    {
        _2211 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2223 = _2211;
    out.m_91.x = _2201;
    out.m_91.y = _2203;
    out.m_91.z = _2205;
    out.m_91.w = _2199;
    bool _2225 = !_2109;
    float _2227 = _2223;
    float _2229 = _2223;
    if (!_2225)
    {
        bool _2231 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2233 = isnan(_1166);
        bool _2235 = _2231 || _2233;
        bool _2237 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2239 = _2235 || _2237;
        if (!_2239)
        {
            float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2243 = _1166 + _2241;
            float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2247 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2245;
            float _2249 = 1.0 / _2247;
            float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2271 = _2243 * _2249;
            float _2273 = precise::clamp(_2271, 0.0, 1.0);
            float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2279 = fma(_2273, _2253, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2281 = fma(_2273, _2277, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2283 = fma(_2273, _2257, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2285 = fma(_2273, _2261, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2287 = fma(_2273, _2265, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2289 = fma(_2273, _2269, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2215 = _2281;
            _2221 = _2287;
            _2169 = _2279;
            _2163 = _2285;
            _2157 = _2283;
            _2229 = _2289;
            _2291 = true;
        }
        else
        {
            bool _2293 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2295 = isnan(_1166);
            bool _2297 = _2293 || _2295;
            bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2301 = _2297 || _2299;
            if (!_2301)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2303 = _2167;
            _2169 = _2303;
            if (!_2301)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2305 = _2213;
            _2215 = _2305;
            if (!_2301)
            {
                _2155 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2307 = _2155;
            _2157 = _2307;
            if (!_2301)
            {
                _2161 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2309 = _2161;
            _2163 = _2309;
            if (!_2301)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2311 = _2219;
            _2221 = _2311;
            if (!_2301)
            {
                _2227 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2313 = _2227;
            bool _2315 = !_2301;
            _2229 = _2313;
            if (!_2315)
            {
                bool _2317 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2319 = isnan(_1166);
                bool _2321 = _2317 || _2319;
                bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2325 = _2321 || _2323;
                if (!_2325)
                {
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2329 = _1166 + _2327;
                    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2331;
                    float _2335 = 1.0 / _2333;
                    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2357 = _2329 * _2335;
                    float _2359 = precise::clamp(_2357, 0.0, 1.0);
                    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2365 = fma(_2359, _2339, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2367 = fma(_2359, _2363, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2369 = fma(_2359, _2343, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2371 = fma(_2359, _2347, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2373 = fma(_2359, _2351, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2375 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2215 = _2367;
                    _2221 = _2373;
                    _2169 = _2365;
                    _2163 = _2371;
                    _2157 = _2369;
                    _2229 = _2375;
                    _2291 = true;
                }
                else
                {
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2163 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2157 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2229 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2291 = false;
    float _2377 = _2215;
    float _2379 = _2221;
    float _2381 = _2169;
    float _2383 = _2163;
    float _2385 = _2157;
    float _2387 = _2229;
    float _2389 = _2207 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2391 = fma(_2137, -0.5, 0.5);
    float _2393 = precise::clamp(_2391, 0.0, 1.0);
    float _2395 = -_2377;
    float _2397 = _2395 + _2379;
    float _2399 = -_2381;
    float _2401 = _2399 + _2383;
    out.m_49.x = _2389;
    float _2403 = fma(_2393, _2397, _2377);
    float _2405 = -_2385;
    float _2407 = _2405 + _2387;
    float _2409 = fma(_2393, _2401, _2381);
    float _2411 = _2403 * 0.586610972881317138671875;
    bool _2413 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2415 = fma(_2393, _2407, _2385);
    out.m_93.x = 0.0;
    float _2417 = fma(_2409, 0.298911988735198974609375, _2411);
    bool _2419 = _1985 > 0.0;
    bool _2421 = isnan(_1985);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan(0.0);
    bool _2427 = _2423 || _2425;
    float _2429 = fma(_2415, 0.114477999508380889892578125, _2417);
    float _2431 = -_2429;
    float _2433 = _2409 + _2431;
    float _2435 = -_2429;
    float _2437 = _2403 + _2435;
    float _2439 = -_2429;
    float _2441 = _2415 + _2439;
    float _2443 = fma(_2433, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2429);
    float _2445 = fma(_2437, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2429);
    float _2447 = fma(_2441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2429);
    bool _2449 = !_2413;
    if (!_2449)
    {
        float _2451 = -_1140;
        float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2455 = -_1142;
        float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2459 = -_1144;
        float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2463 = _2453 * _2453;
        float _2465 = fma(_2457, _2457, _2463);
        float _2467 = fma(_2461, _2461, _2465);
        float _2469 = sqrt(_2467);
        float _2471 = rsqrt(_2467);
        float _2473 = -_2469;
        float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2477 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2479 = precise::clamp(_2477, 0.0, 1.0);
        float _2481 = _2457 * _2471;
        float _2483 = _2453 * _2471;
        float _2485 = abs(_2479);
        float _2487 = log2(_2485);
        float _2489 = _2461 * _2471;
        float _2491 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2493 = _2137 * _2483;
        float _2495 = -_2483;
        float _2497 = -_2491;
        float _2499 = fma(_2495, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2497);
        float _2501 = fma(_2139, _2481, _2493);
        float _2503 = -_2489;
        float _2505 = fma(_2503, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2499);
        float _2507 = fma(_2145, _2489, _2501);
        float _2509 = precise::clamp(_2507, 0.0, 1.0);
        float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2513 = _2505 + _2511;
        float _2515 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2517 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2519 = precise::clamp(_2517, 0.0, 1.0);
        float _2521 = exp2(_2515);
        float _2523 = _2521 * _2519;
        float _2525 = _2509 * _2523;
        float _2527 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2529 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2531 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2527;
        out.m_93.y = _2529;
        out.m_93.z = _2531;
    }
    out.m_95.x = _2443;
    out.m_95.y = _2445;
    out.m_95.z = _2447;
    if (_2427)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2533 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2533;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

