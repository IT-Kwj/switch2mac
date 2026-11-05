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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_75 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_57 [[attribute(8)]];
    float4 m_49 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _834 = false;
    bool _668 = false;
    bool _382 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2747 = as_type<float>(_110);
        out.gl_Position.z = _2747;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2816 = as_type<float>(_148);
        out.gl_Position.z = _2816;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = _154 * _152;
    float _176 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _178 = _176 * 6.283185482025146484375;
    float _180 = floor(_176);
    float _182 = _178 * 0.15915493667125701904296875;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = _182 * 6.283185482025146484375;
    float _190 = cos(_188);
    float _192 = 1.4012984643248170709237295832899e-45;
    if (!_172)
    {
        float _194 = _162 * _162;
        float _196 = _194 * 0.5;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = _198;
    if (!_172)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    float _206 = -_180;
    float _208 = _176 + _206;
    float _210 = _180;
    float _212 = _204;
    if (!_172)
    {
        _210 = _162;
    }
    float _214 = _210;
    bool _216 = !_172;
    float _218 = _214;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _162 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _162);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _248;
    }
    float _250 = _212;
    bool _252 = !_172;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _162 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _218 = _272;
    }
    float _274 = _218;
    float _276 = in.m_51.w;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = in.m_42.x;
    float _288 = in.m_42.y;
    float _290 = in.m_42.z;
    float _292 = fma(_190, 0.5, 0.5);
    bool _294 = _208 < 0.5;
    float _296 = float(_294);
    bool _298 = !_186;
    int _300 = _298 ? 0 : 1;
    float _302 = -_208;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_280;
    int _308 = _306 ? 0 : 1;
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _314 = -_292;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _318 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _320 = abs(_300);
    int _322 = abs(_308);
    float _324 = fma(_274, _156, _318);
    bool _326 = !_284;
    int _328 = _326 ? 0 : 1;
    float _330 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _334 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _336 = abs(_328);
    float _338 = fma(_274, _158, _330);
    float _340 = float(_322);
    float _342 = fma(_274, _160, _334);
    float _344 = float(_320);
    float _346 = fma(_324, _276, _286);
    float _348 = abs(_304);
    float _350 = _340 * _348;
    float _352 = fma(_338, _276, _288);
    float _354 = fma(_342, _276, _290);
    float _356 = float(_336);
    float _358 = fma(_344, _316, _350);
    float _360 = abs(_312);
    float _362 = fma(_356, _360, _358);
    bool _364 = !_332;
    float _380;
    if (!_364)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _368 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _372 = _370 * _366;
        float _374 = floor(_372);
        float _376 = -_374;
        float _378 = _372 + _376;
        _380 = _378;
        _382 = true;
    }
    else
    {
        float _384 = float(_94);
        float _386 = 1.0 / _384;
        float _388 = _128 * _386;
        _380 = _388;
    }
    _382 = false;
    float _390 = _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _394 = _390 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _390 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = _390 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _420 = 1.0 / _410;
    bool _422 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _424 = isnan(_390);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    bool _434 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _436 = isnan(_390);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = 1.0 / _406;
    bool _448 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _450 = 1.0 / _414;
    float _452 = _398 * _420;
    bool _454 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _456 = isnan(_390);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    bool _466 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _468 = isnan(_390);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _418;
    float _480 = _394 * _446;
    bool _482 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _484 = isnan(_390);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _496 = _390 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _502 = _402 * _450;
    float _504 = -_492;
    float _506 = _504 + 1.0;
    float _508 = -_464;
    float _510 = _508 + 1.0;
    float _512 = _476 * _510;
    float _514 = -_476;
    float _516 = _514 + 1.0;
    float _518 = _496 * _478;
    float _520 = _464 * _506;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _530;
    float _534 = _432 * _516;
    float _536 = fma(_524, _480, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _538 = fma(_528, _480, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _540 = fma(_532, _480, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _542 = -_432;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = fma(_500, _452, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = _444 * _544;
    float _558 = fma(_548, _452, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_552, _452, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = _536 * _556;
    float _564 = _538 * _556;
    float _566 = _540 * _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _568;
    float _572 = -_444;
    float _574 = _572 + 1.0;
    float _576 = in.m_51.x;
    float _578 = in.m_51.y;
    float _580 = in.m_51.z;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _582;
    float _586 = fma(_570, _502, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _588 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].x, _562);
    float _590 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].y, _564);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _592;
    float _596 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].z, _566);
    float _598 = fma(_554, _534, _588);
    float _600 = fma(_558, _534, _590);
    float _602 = fma(_584, _502, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _604 = fma(_594, _502, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _618 = fma(_560, _534, _596);
    float _620 = fma(_608, _518, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _622 = fma(_612, _518, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _624 = fma(_616, _518, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _626 = fma(_602, _512, _598);
    float _628 = fma(_586, _512, _600);
    float _630 = fma(_604, _512, _618);
    float _632 = fma(_620, _520, _626);
    float _634 = fma(_622, _520, _628);
    float _636 = fma(_624, _520, _630);
    float _638 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].x, _632);
    float _640 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].y, _634);
    float _642 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].z, _636);
    float _644 = _638 * _576;
    float _646 = _640 * _578;
    float _648 = _642 * _580;
    bool _650 = !_448;
    float _666;
    if (!_650)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _654 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_94);
        float _672 = 1.0 / _670;
        float _674 = _128 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _676 + _678;
    bool _682 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _684 = isnan(_676);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _696 = _676 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _706 = 1.0 / _700;
    bool _708 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _710 = 1.0 / _704;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _712;
    float _716 = _680 * _706;
    bool _718 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _720 = isnan(_676);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -_692;
    float _732 = _730 + 1.0;
    bool _734 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _736 = isnan(_676);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = fma(_714, _716, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _748 = _744 * _732;
    float _750 = -_744;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _758;
    float _762 = _696 * _710;
    float _764 = _728 * _752;
    float _766 = fma(_756, _716, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _768 = fma(_760, _716, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _770 = -_728;
    float _772 = _770 + 1.0;
    float _774 = _746 * _764;
    float _776 = _766 * _764;
    float _778 = _768 * _764;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _792 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].x, _776);
    float _794 = fma(_782, _762, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _796 = fma(_786, _762, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _798 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].y, _774);
    float _800 = fma(_790, _762, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _802 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].z, _778);
    float _804 = fma(_794, _748, _792);
    float _806 = fma(_796, _748, _798);
    float _808 = fma(_800, _748, _802);
    float _810 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].x, _804);
    float _812 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].y, _806);
    float _814 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].z, _808);
    bool _816 = !_708;
    float _832;
    if (!_816)
    {
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _820 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _824 = _822 * _818;
        float _826 = floor(_824);
        float _828 = -_826;
        float _830 = _824 + _828;
        _832 = _830;
        _834 = true;
    }
    else
    {
        float _836 = float(_94);
        float _838 = 1.0 / _836;
        float _840 = _128 * _838;
        _832 = _840;
    }
    _834 = false;
    float _842 = _832;
    float _844 = in.m_49.z;
    float _846 = _150 * 2.0;
    float _848 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _850 = in.m_49.y;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _862 = _860 != 0;
    float _864 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _866 = int(_864);
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _870 = _362 * _646;
    float _872 = -_868;
    float _874 = fma(_848, 2.0, _872);
    bool _876 = !_858;
    int _878 = _876 ? 0 : 1;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _882 = floor(_846);
    bool _884 = !_854;
    int _886 = _884 ? 0 : 1;
    float _888 = -_128;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[76].x, _874);
    bool _892 = !_862;
    int _894 = _892 ? 0 : 1;
    float _896 = _362 * _644;
    float _898 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _900 = _362 * _648;
    float _902 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _904 = log2(_902);
    float _906 = float(_866);
    float _908 = _844 * 2.0;
    float _910 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _912 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _850 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _916 = _850 * 2.0;
    float _918 = floor(_908);
    bool _920 = _882 > 0.0;
    float _922 = fma(_914, -2.0, _880);
    bool _924 = _882 >= 0.0;
    bool _926 = isnan(_882);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    float _934 = _850 + _844;
    float _936 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _922);
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _944 = _942 != 0;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _948 = _946 != 0;
    float _950 = _934 + (-1.0);
    float _952 = floor(_916);
    float _954 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _956 = _932 ? 0 : 1;
    bool _958 = !_944;
    int _960 = _958 ? 0 : 1;
    bool _962 = _918 > 0.0;
    float _964 = 1.0 / _906;
    bool _966 = _918 >= 0.0;
    bool _968 = isnan(_918);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    int _976 = abs(_960);
    int _978 = _974 ? 0 : 1;
    int _980 = ~_956;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    float _986 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _988 = int(_986);
    int _990 = _984;
    if (!_920)
    {
        int _992 = ~_956;
        int _994 = _992 + 1;
        _990 = _994;
    }
    int _996 = _990;
    int _998 = ~_978;
    int _1000 = _998 + 1;
    int _1002 = _1000 + 1;
    int _1004 = _1002;
    if (!_962)
    {
        int _1006 = ~_978;
        int _1008 = _1006 + 1;
        _1004 = _1008;
    }
    int _1010 = _1004;
    float _1012 = _904 * _128;
    float _1014 = float(_996);
    float _1016 = _964 * _128;
    float _1018 = float(_976);
    float _1020 = exp2(_1012);
    float _1022 = _1018 * _1014;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1026 = 1.0 + _1024;
    bool _1028 = _952 > 0.0;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1032 = _952 >= 0.0;
    bool _1034 = isnan(_952);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1044 = in.m_53.x;
    float _1046 = in.m_53.y;
    float _1048 = in.m_53.z;
    float _1050 = 1.0 / _1026;
    bool _1052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1054 = isnan(1.0);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1060 = _1056 || _1058;
    float _1062 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1042);
    bool _1064 = !_940;
    int _1066 = _1064 ? 0 : 1;
    float _1068 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1030);
    bool _1070 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1072 = isnan(0.0);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1078 = _1074 || _1076;
    float _1080 = -_1020;
    float _1082 = _1080 + 1.0;
    int _1084 = abs(_1066);
    float _1086 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1068);
    float _1088 = float(_988);
    float _1090 = _1022 * (-2.0);
    float _1092 = _1078 ? _1082 : 0.0;
    float _1094 = _1088 * _128;
    float _1096 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1062);
    float _1098 = float(_1084);
    if (_1060)
    {
        float _1100 = _1092 * _1050;
        _132 = _1100;
    }
    float _1102 = _132;
    bool _1104 = !_948;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = float(_1010);
    float _1110 = _850 + (-0.5);
    int _1112 = _1040 ? 0 : 1;
    int _1114 = abs(_1106);
    float _1116 = fma(_1090, _1046, _1046);
    float _1118 = fma(_954, _1090, _954);
    int _1120 = ~_1112;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    float _1126 = _1098 * _1108;
    float _1128 = _150 + _850;
    int _1130 = _1124;
    if (!_1028)
    {
        int _1132 = ~_1112;
        int _1134 = _1132 + 1;
        _1130 = _1134;
    }
    int _1136 = _1130;
    float _1138 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1116);
    float _1140 = _1128 + (-1.0);
    float _1142 = _1126 * (-2.0);
    float _1144 = float(_1114);
    float _1146 = fma(_1118, _1102, _1138);
    float _1148 = float(_1136);
    float _1150 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1152 = fma(_1142, _1044, _1044);
    float _1154 = _150 + (-0.5);
    float _1156 = _150 + _844;
    float _1158 = _1144 * _1148;
    float _1160 = _1146 * 0.15915493667125701904296875;
    float _1162 = fma(_1150, _1142, _1150);
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1152);
    float _1166 = _1156 + (-1.0);
    float _1168 = _1158 * (-2.0);
    float _1170 = in.m_55.x;
    float _1172 = in.m_55.y;
    float _1174 = in.m_55.z;
    float _1176 = in.m_55.w;
    float _1178 = fma(_1162, _1102, _1164);
    float _1180 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1182 = fma(_1168, _1048, _1048);
    float _1184 = _844 + (-0.5);
    float _1186 = in.m_57.x;
    float _1188 = in.m_57.y;
    float _1190 = in.m_57.z;
    float _1192 = fma(_1180, _1168, _1180);
    float _1194 = _1178 * 0.15915493667125701904296875;
    float _1196 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1182);
    float _1198 = _1160 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = fma(_1192, _1102, _1196);
    float _1204 = _1202 * 0.15915493667125701904296875;
    float _1206 = _1160 * 6.283185482025146484375;
    float _1208 = cos(_1206);
    float _1210 = _352 * _1172;
    float _1212 = _1194 * 6.283185482025146484375;
    float _1214 = sin(_1212);
    float _1216 = fma(_346, _1170, _1210);
    float _1218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1188);
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1186);
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1190);
    float _1224 = fma(_354, _1174, _1216);
    float _1226 = _1194 * 6.283185482025146484375;
    float _1228 = cos(_1226);
    float _1230 = _898 * _1218;
    float _1232 = _912 * _1222;
    float _1234 = in.m_59.x;
    float _1236 = in.m_59.y;
    float _1238 = in.m_59.z;
    float _1240 = in.m_59.w;
    float _1242 = _1204 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = _910 * _1220;
    float _1248 = _1214 * _1200;
    float _1250 = _1214 * _1208;
    float _1252 = _1204 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1228 * _1208;
    float _1258 = _1228 * _1200;
    float _1260 = _1200 * _1244;
    float _1262 = _1244 * _1230;
    float _1264 = _1208 * _1244;
    float _1266 = _1228 * _1262;
    float _1268 = _1214 * _1262;
    float _1270 = fma(_1254, _1256, _1248);
    float _1272 = -_1230;
    float _1274 = _1254 * _1272;
    float _1276 = fma(_1270, _1246, _1266);
    float _1278 = -_1250;
    float _1280 = fma(_1254, _1258, _1278);
    float _1282 = -_1258;
    float _1284 = fma(_1254, _1250, _1282);
    float _1286 = fma(_1264, _1246, _1274);
    float _1288 = fma(_1254, _1248, _1256);
    float _1290 = fma(_1280, _1232, _1276);
    float _1292 = fma(_1284, _1246, _1268);
    float _1294 = fma(_1260, _1232, _1286);
    float _1296 = _352 * _1236;
    float _1298 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1300 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1302 = fma(_1288, _1232, _1292);
    float _1304 = fma(_346, _1234, _1296);
    float _1306 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1298);
    float _1308 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1300);
    float _1310 = _1224 + _1176;
    float _1312 = fma(_354, _1238, _1304);
    float _1314 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1306);
    float _1316 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1308);
    float _1318 = _1312 + _1240;
    float _1320 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1322 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1324 = in.m_61.x;
    float _1326 = in.m_61.y;
    float _1328 = in.m_61.z;
    float _1330 = in.m_61.w;
    float _1332 = _1310 + _1320;
    float _1334 = _1318 + _1322;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1338 = _1332 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1342 = _1334 + _1340;
    float _1344 = _1338 * _1338;
    float _1346 = fma(_1342, _1342, _1344);
    float _1348 = sqrt(_1346);
    float _1350 = _352 * _1326;
    float _1352 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1354 = fma(_346, _1324, _1350);
    float _1356 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1352);
    float _1358 = fma(_354, _1328, _1354);
    bool _1360 = _1348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1356);
    float _1364 = _1358 + _1330;
    float _1366 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1368 = _1364 + _1366;
    float _1370 = _1328;
    float _1372 = _1358;
    float _1374 = _1302;
    float _1376 = _1290;
    if (!_1360)
    {
        _1370 = _1334;
    }
    float _1378 = _1370;
    float _1380 = _1378;
    if (!_1360)
    {
        _1372 = _1332;
    }
    float _1382 = _1372;
    float _1384 = _1382;
    if (!_1360)
    {
        _1374 = _1368;
    }
    float _1386 = _1374;
    bool _1388 = !_1360;
    float _1390 = _1386;
    if (!_1388)
    {
        float _1392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1396 = _1348 + _1394;
        float _1398 = _1368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1400 = rsqrt(_1346);
        float _1402 = _1396 * _1392;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = _1404 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = _1404 * 6.283185482025146484375;
        float _1412 = sin(_1410);
        float _1414 = _1408 + (-1.0);
        float _1416 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = fma(_1412, _1398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1420 = fma(_1368, _1408, _1416);
        float _1422 = _1400 * _1418;
        float _1424 = fma(_1342, _1422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1426 = fma(_1338, _1422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1390 = _1420;
        _1380 = _1424;
        _1384 = _1426;
    }
    float _1428 = _1390;
    float _1430 = _1380;
    float _1432 = _1384;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1436 = _1428 + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1440 = _1430 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1444 = _1432 + _1442;
    float _1446 = _1436 * _1436;
    float _1448 = fma(_1440, _1440, _1446);
    float _1450 = fma(_1444, _1444, _1448);
    float _1452 = rsqrt(_1450);
    float _1454 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1456 = _1440 * _1454;
    float _1458 = _1444 * _1454;
    float _1460 = _1456 * _1456;
    float _1462 = _1458 * _1458;
    float _1464 = _1460 + _1462;
    float _1466 = sqrt(_1464);
    bool _1468 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1466 + _1470;
    float _1474 = _1444;
    float _1476 = _1464;
    float _1478 = _1472;
    float _1480 = _1436;
    float _1482 = _1454;
    if (_1468)
    {
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1484;
    }
    float _1486 = _1474;
    if (_1468)
    {
        float _1488 = rsqrt(_1464);
        _1476 = _1488;
    }
    float _1490 = _1476;
    if (_1468)
    {
        float _1492 = _1472 * _1486;
        _1478 = _1492;
    }
    float _1494 = _1478;
    if (_1468)
    {
        float _1496 = _1494 * 0.15915493667125701904296875;
        _1376 = _1496;
    }
    float _1498 = _1376;
    float _1500 = _1448;
    float _1502 = _1498;
    if (_1468)
    {
        float _1504 = _1498 * 6.283185482025146484375;
        float _1506 = sin(_1504);
        _1500 = _1506;
    }
    float _1508 = _1500;
    float _1510 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1512 = precise::max(0.0, _1510);
    float _1514 = _1452;
    float _1516 = _1512;
    if (_1468)
    {
        float _1518 = _1498 * 6.283185482025146484375;
        float _1520 = cos(_1518);
        _1514 = _1520;
    }
    float _1522 = _1514;
    float _1524 = -_1454;
    float _1526 = -_1512;
    float _1528 = fma(_1436, _1524, _1526);
    float _1530 = _1528;
    if (!_1468)
    {
        _1480 = _1456;
    }
    float _1532 = _1480;
    float _1534 = _1532;
    if (_1468)
    {
        float _1536 = _1528 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1536;
    }
    float _1538 = _1516;
    float _1540 = _1538;
    float _1542 = _1508;
    if (_1468)
    {
        float _1544 = fma(_1508, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1540 = _1544;
    }
    float _1546 = _1540;
    float _1548 = _1546;
    float _1550 = _1522;
    if (_1468)
    {
        float _1552 = _1522 + (-1.0);
        _1482 = _1552;
    }
    float _1554 = _1482;
    if (_1468)
    {
        float _1556 = _1490 * _1546;
        _1502 = _1556;
    }
    float _1558 = _1502;
    if (!_1468)
    {
        _1548 = _1458;
    }
    float _1560 = _1548;
    float _1562 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = _1560;
    if (_1468)
    {
        float _1566 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1542 = _1566;
    }
    float _1568 = _1542;
    float _1570 = _1568;
    if (_1468)
    {
        float _1572 = _1456 * _1558;
        _1534 = _1572;
    }
    float _1574 = _1534;
    float _1576 = sqrt(_1450);
    if (_1468)
    {
        float _1578 = _1458 * _1558;
        _1564 = _1578;
    }
    float _1580 = _1564;
    if (_1468)
    {
        float _1582 = fma(_1528, _1522, _1568);
        _1530 = _1582;
    }
    float _1584 = _1530;
    if (!_1468)
    {
        _1550 = _1460;
    }
    float _1586 = _1550;
    float _1588 = _1586;
    if (_1468)
    {
        float _1590 = _1574 * _1574;
        _1588 = _1590;
    }
    float _1592 = _1588;
    if (!_1468)
    {
        _1570 = _1462;
    }
    float _1594 = _1570;
    float _1596 = _1594;
    if (_1468)
    {
        float _1598 = _1580 * _1580;
        _1596 = _1598;
    }
    float _1600 = _1596;
    float _1602 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1604 = fma(_1584, _1584, _1592);
    float _1606 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1608 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1610 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1612 = _1604 + _1600;
    float _1614 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1602);
    float _1616 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1606);
    float _1618 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1608);
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1622 = fma(_1576, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1620);
    float _1624 = precise::clamp(_1622, 0.0, 1.0);
    float _1626 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1614);
    float _1628 = rsqrt(_1612);
    float _1630 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1610);
    float _1632 = -_1624;
    float _1634 = _1632 + 1.0;
    float _1636 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1638 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1616);
    float _1640 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1642 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1618);
    float _1644 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1646 = abs(_1634);
    float _1648 = log2(_1646);
    float _1650 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1652 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1654 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1644);
    float _1656 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1658 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1660 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1654);
    float _1662 = _1628 * _1574;
    float _1664 = _1628 * _1584;
    float _1666 = _1628 * _1580;
    float _1668 = -_1658;
    float _1670 = fma(_1668, _1652, 1.0);
    float _1672 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1674 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1660);
    float _1676 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1678 = -_1672;
    float _1680 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1678);
    float _1682 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1684 = log2(_1670);
    float _1686 = -_1666;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1680);
    float _1690 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1692 = fma(_1688, -0.5, 0.5);
    float _1694 = fma(_1688, 0.5, 0.5);
    float _1696 = exp2(_1682);
    float _1698 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1676);
    float _1700 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1690);
    float _1702 = _1664 + 1.0;
    float _1704 = fma(_1694, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1706 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1698);
    float _1708 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1700);
    float _1710 = 1.0 / _1674;
    float _1712 = fma(_1694, _1704, -0.212114393711090087890625);
    float _1714 = _1684 * 0.693147182464599609375;
    float _1716 = fma(_1694, _1712, 1.570728778839111328125);
    float _1718 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1720 = sqrt(_1692);
    float _1722 = -_1664;
    float _1724 = fma(_1696, _1702, _1722);
    float _1726 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1706);
    float _1728 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1708);
    float _1730 = fma(_1724, 0.5, 0.5);
    float _1732 = _1726 * _1710;
    float _1734 = _1728 * _1710;
    float _1736 = fma(_1732, 0.5, 0.5);
    float _1738 = fma(_1734, -0.5, 0.5);
    float _1740 = _1720 * 0.636619746685028076171875;
    float _1742 = -_1716;
    float _1744 = fma(_1740, _1742, 1.0);
    float3 _5299 = float3(_1736, _1738, _1718);
    float _1746 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5299, float3(0.0), isnan(_5299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5299, float3(0.0), isnan(_5299)), level(0.0)).x;
    float3 _5310 = float3(_1736, _1738, _1718);
    float4 _1749 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5310, float3(0.0), isnan(_5310)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5310, float3(0.0), isnan(_5310)), level(0.0)).xyzw;
    float _1751 = _1749.x;
    float _1753 = _1749.y;
    float _1755 = _1749.z;
    float _1757 = _1749.w;
    float2 _5327 = float2(_1744, _1730);
    float3 _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5327, float2(0.0), isnan(_5327)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5327, float2(0.0), isnan(_5327)), level(0.0)).xyz;
    float _1763 = _1761.x;
    float _1765 = _1761.y;
    float _1767 = _1761.z;
    float _1769 = float(uint(_988));
    float _1771 = trunc(_1016);
    int _1773 = int(_1771);
    int _1775 = ~_988;
    int _1777 = _1775 + 1;
    float _1779 = _812 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1781 = ~_988;
    int _1783 = _1781 + 1;
    float _1785 = _810 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1787 = float(_94);
    float _1789 = _814 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1791 = abs(_878);
    float _1793 = 1.0 / _1769;
    float _1795 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1797 = float(uint(_1773));
    float _1799 = 1.0 / _1787;
    int _1801 = as_type<int>(_1793) + (-2);
    float _1803 = exp2(_1795);
    float _1805 = as_type<float>(_1801) * _1797;
    float _1807 = _1094 * _1799;
    float _1809 = trunc(_1805);
    float _1811 = precise::max(_1809, 0.0);
    uint _1814 = uint(_1811);
    float _1816 = -_1803;
    float _1818 = _1816 + 1.0;
    float _1820 = trunc(_1807);
    int _1822 = int(_1820);
    int _1824 = _1777 * int(_1814);
    int _1826 = _1824 + _1773;
    float _1828 = float(uint(_1826));
    float _1830 = as_type<float>(_1801) * _1828;
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1834 = _1832 != 0;
    float _1836 = trunc(_1830);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    bool _1842 = !_1834;
    float _1844 = _1842 ? 7.345489978790283203125 : 1.0;
    float _1846 = _1844 * _150;
    float _1848 = floor(_1846);
    int _1850 = int(_1814) + int(_1840);
    float _1852 = float(_1773);
    int _1854 = _1783 * _1850;
    int _1856 = _1854 + _1773;
    bool _1858 = _1852 >= _1088;
    bool _1860 = isnan(_1852);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan(_1088);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    bool _1870 = uint(_1856) >= uint(_988);
    float _1872 = -_1848;
    float _1874 = _1846 + _1872;
    float _1876 = trunc(_1868);
    int _1878 = int(_1876);
    bool _1880 = !_1870;
    int _1882 = _1880 ? 0 : (-1);
    float _1884 = _1874 * _1088;
    bool _1886 = _988 == 0;
    int _1888 = ~_1850;
    int _1890 = _1888 + _1882;
    int _1892 = _1890 + 1;
    int _1894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1896 = _1894 != 0;
    float _1898 = trunc(_1884);
    int _1900 = int(_1898);
    int _1902 = _988 + (-1);
    int _1904 = _988 * _1892;
    int _1906 = _1904 + _1773;
    bool _1908 = !_1896;
    int _1910 = _1908 ? 0 : 1;
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1914 = _1912 != 0;
    int _1916 = ~_1878;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    bool _1922 = !_1886;
    int _1924 = _1922 ? _1906 : (-1);
    int _1926 = abs(_1910);
    int _1928 = abs(_894);
    int _1930 = _1924 * _1920;
    int _1932 = abs(_886);
    int _1934 = _1878 * _1902;
    int _1936 = _1934 + _1930;
    bool _1938 = !_1914;
    int _1940 = _1938 ? 0 : 1;
    int _1942 = _1936 * _1791;
    int _1944 = _1900 * _1926;
    int _1946 = _1944 + _1773;
    int _1948 = abs(_1940);
    int _1950 = _1822 * _1932;
    int _1952 = _1950 + _1942;
    int _1954 = ~_988;
    int _1956 = _1954 + 1;
    int _1958 = _1946 * _1928;
    int _1960 = _1958 + _1952;
    int _1962 = _1900 * _1948;
    int _1964 = _1962 + _1960;
    int _1966 = ~_988;
    int _1968 = _1966 + 1;
    float _1970 = float(uint(_1964));
    float _1972 = as_type<float>(_1801) * _1970;
    float _1974 = trunc(_1972);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = _1968 * int(_1978);
    int _1982 = _1980 + _1964;
    float _1984 = float(uint(_1982));
    float _1986 = as_type<float>(_1801) * _1984;
    float _1988 = trunc(_1986);
    float _1990 = precise::max(_1988, 0.0);
    uint _1992 = uint(_1990);
    int _1994 = int(_1978) + int(_1992);
    float _1996 = float(uint(_1946));
    int _1998 = _1956 * _1994;
    int _2000 = _1998 + _1964;
    float _2002 = as_type<float>(_1801) * _1996;
    bool _2004 = uint(_2000) >= uint(_988);
    float _2006 = trunc(_2002);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    bool _2012 = !_2004;
    int _2014 = _2012 ? 0 : (-1);
    int _2016 = ~_1994;
    int _2018 = _2016 + _2014;
    int _2020 = _2018 + 1;
    int _2022 = _988 * _2020;
    int _2024 = _2022 + _1964;
    bool _2026 = !_1886;
    int _2028 = _2026 ? _2024 : (-1);
    int _2030 = ~_988;
    int _2032 = _2030 + 1;
    int _2034 = _2028 >> 31;
    int _2036 = _2028 & 3;
    bool _2038 = _2036 != 0;
    int _2040 = _2032 * int(_2010);
    int _2042 = _2040 + _1946;
    int _2044 = _2034 & 3;
    bool _2046 = uint(_2036) > 1u;
    int _2048 = _2028 + _2044;
    float _2050 = float(uint(_2042));
    int _2052 = _2048 >> 2;
    int _2054 = _2028 & 3;
    bool _2056 = _2054 != 0;
    float _2058 = as_type<float>(_1801) * _2050;
    int _2060 = _2052 << 4;
    int _2062 = _2060 + 368;
    int _2064 = _2056 ? 0 : 1;
    float _2066 = trunc(_2058);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    uint _2072 = uint(int(uint(_2062) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    int _2088 = ~_988;
    int _2090 = _2088 + 1;
    bool _2092 = _2036 != 3;
    bool _2094 = uint(_2036) >= 2u;
    int _2096 = _2062 + 8;
    uint _2098 = uint(int(uint(_2096) >> uint(2)));
    uint _2100 = uint(int(uint(int(_2098)) >> uint(2)));
    int _2102 = int(_2098) & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    int _2106 = int(_2098) + 1;
    uint _2108 = uint(int(uint(_2106) >> uint(2)));
    int _2110 = _2106 & 3;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[int(_2108)][_2110];
    int _2114 = int(_2010) + int(_2070);
    int _2116 = ~_2064;
    int _2118 = _2116 + 1;
    int _2120 = _2118 + 1;
    int _2122 = _2120;
    if (!_2046)
    {
        int _2124 = ~_2064;
        int _2126 = _2124 + 1;
        _2122 = _2126;
    }
    int _2128 = _2122;
    int _2130 = _2090 * _2114;
    int _2132 = _2130 + _1946;
    bool _2134 = !_2038;
    int _2136 = _2134 ? 0 : 1;
    int _2138 = abs(_2128);
    bool _2140 = uint(_2132) >= uint(_988);
    int _2142 = _2094 ? 0 : 1;
    int _2144 = ~_2138;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    int _2150 = abs(_2136);
    int _2152 = ~_2142;
    int _2154 = _2152 + 1;
    int _2156 = _2154 + 1;
    int _2158 = _2156;
    if (_2092)
    {
        int _2160 = ~_2142;
        int _2162 = _2160 + 1;
        _2158 = _2162;
    }
    int _2164 = _2158;
    bool _2166 = !_2140;
    int _2168 = _2166 ? 0 : (-1);
    int _2170 = ~_2150;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    bool _2176 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2178 = isnan(0.5);
    bool _2180 = _2176 || _2178;
    bool _2182 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2184 = _2180 || _2182;
    int _2186 = abs(_2164);
    int _2188 = ~_2114;
    int _2190 = _2188 + _2168;
    int _2192 = _2190 + 1;
    int _2194 = _2148 * as_type<int>(_2086);
    bool _2196 = _2036 != 3;
    float _2198 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2200 = int(_2198);
    int _2202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2204 = _2202 != 0;
    int _2206 = _2174 * as_type<int>(_2078);
    int _2208 = _2206 + _2194;
    int _2210 = ~_2186;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = _988 * _2192;
    int _2218 = _2216 + _1946;
    bool _2220 = !_2196;
    int _2222 = _2220 ? 0 : (-1);
    int _2224 = _2214 * as_type<int>(_2104);
    int _2226 = _2224 + _2208;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2230 = _2228 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2232 = !_2204;
    int _2234 = _2232 ? 0 : 1;
    int _2236 = abs(_2222);
    float _2238 = 1.0 / _2230;
    int _2240 = abs(_2234);
    float _2242 = float(uint(_2200));
    int _2244 = ~_2236;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = abs(_2200);
    float _2252 = 1.0 / _2242;
    int _2254 = ~_2240;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2248 * as_type<int>(_2112);
    int _2262 = _2260 + _2226;
    float _2264 = float(uint(_2250));
    bool _2266 = !_1886;
    int _2268 = _2266 ? _2218 : (-1);
    int _2270 = _2262 * _2258;
    float _2272 = 1.0 / _2264;
    float _2274 = in.m_63.y;
    int _2276 = _2268 * _2240;
    int _2278 = _2276 + _2270;
    bool _2280 = _850 > 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    int _2282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2284 = _2282 != 0;
    float _2286 = float(uint(_2278));
    int _2288 = abs(_2278);
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2292 = _2290 != 0;
    float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2296 = _842 + _2294;
    bool _2298 = _150 > 0.5;
    bool _2300 = _2298 && _2284;
    bool _2302 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2304 = isnan(_842);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2310 = _2306 || _2308;
    float _2312 = float(_2310);
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2314;
    int _2318 = as_type<int>(_2252) + (-2);
    float _2320 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2322 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2324 = isnan(_842);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2330 = _2326 || _2328;
    float _2332 = float(_2330);
    float _2334 = _2316 * _2238;
    int _2336 = as_type<int>(_2272) + (-2);
    float _2338 = as_type<float>(_2318) * _2286;
    float _2340 = float(uint(_2288));
    float _2342 = fma(_2334, _2296, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2344 = -_2312;
    float _2346 = _2344 + 1.0;
    int _2348 = ~_2200;
    int _2350 = _2348 + 1;
    float _2352 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2320);
    float _2354 = trunc(_2338);
    float _2356 = precise::max(_2354, 0.0);
    uint _2358 = uint(_2356);
    float _2360 = as_type<float>(_2336) * _2340;
    float _2362 = -_2274;
    float _2364 = _2362 + 1.0;
    float _2366 = _2332 * _2346;
    float _2368 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2370 = ~_2250;
    int _2372 = _2370 + 1;
    float _2374 = trunc(_2360);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    float _2380 = _2274;
    float _2382 = as_type<float>(_2288);
    if (_2292)
    {
        float _2384 = _2280 ? _2364 : _2274;
        _2380 = _2384;
    }
    float _2386 = _2380;
    float _2388 = _2342 * _2366;
    float _2390 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2352);
    float _2392 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2368);
    float _2394 = in.m_63.x;
    float _2396 = _2390 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2398 = _2350 * int(_2358);
    int _2400 = _2398 + _2278;
    float _2402 = -_2332;
    float _2404 = _2402 + 1.0;
    float _2406 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2392);
    float _2408 = 1.0 / _2396;
    float _2410 = float(uint(_2400));
    float _2412 = fma(_2404, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2388);
    int _2414 = _2372 * int(_2378);
    int _2416 = _2414 + _2288;
    float _2418 = _2406 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2420 = as_type<float>(_2318) * _2410;
    float _2422 = fma(_2312, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2412);
    float _2424 = float(uint(_2416));
    float _2426 = _2418 + _2396;
    float _2428 = trunc(_2420);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    float _2434 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2436 = as_type<float>(_2336) * _2424;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2442 = _2426 * _2408;
    float _2444 = _2442 * 0.5;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2448 = trunc(_2436);
    float _2450 = precise::max(_2448, 0.0);
    uint _2452 = uint(_2450);
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2456 = _2440;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_2184)
    {
        _2456 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2460 = _2456;
    float _2462 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2464 = _2446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2466 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2468 = _2460;
    float _2470 = _2394;
    if (_2284)
    {
        _2458 = _2394;
    }
    float _2472 = _2458;
    float _2474 = _2472;
    if (!_2184)
    {
        float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2478 = fma(_2444, _2460, _2476);
        _2468 = _2478;
    }
    float _2480 = _2468;
    int _2482 = int(_2358) + int(_2432);
    out.m_67.x = _2462;
    out.m_67.y = _2464;
    out.m_67.z = _2454;
    int _2484 = ~_2200;
    int _2486 = _2484 + 1;
    if (_2300)
    {
        float _2488 = -_2472;
        float _2490 = _2488 + 1.0;
        _2474 = _2490;
    }
    float _2492 = _2474;
    float _2494 = _1789;
    if (!_2184)
    {
        float _2496 = 1.0 / _2480;
        _2494 = _2496;
    }
    float _2498 = _2494;
    int _2500 = int(_2378) + int(_2452);
    float _2502 = _2422 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_2284)
    {
        _2470 = _2492;
    }
    float _2504 = _2470;
    bool _2506 = _2200 == 0;
    int _2508 = _2486 * _2482;
    int _2510 = _2508 + _2278;
    int _2512 = ~_2250;
    int _2514 = _2512 + 1;
    float _2516 = _1779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2520 = uint(_2510) >= uint(_2200);
    int _2522 = _2514 * _2500;
    int _2524 = _2522 + _2288;
    float _2526 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2528 = _2516;
    if (!_2184)
    {
        _2382 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2530 = _2382;
    out.m_69.x = _2466;
    out.m_69.y = _2516;
    out.m_69.z = _2434;
    out.m_69.w = _2502;
    bool _2532 = !_2520;
    int _2534 = _2532 ? 0 : (-1);
    float _2536 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2526);
    bool _2538 = uint(_2524) >= uint(_2250);
    float _2540 = _2498;
    if (!_2184)
    {
        float _2542 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2544 = -_2530;
        float _2546 = fma(_2498, _2542, _2544);
        _2540 = _2546;
    }
    float _2548 = _2540;
    int _2550 = _2278 ^ _2200;
    float _2552 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2536);
    bool _2554 = !_2538;
    int _2556 = _2554 ? 0 : (-1);
    uint _2558 = uint(int(uint(_2550) >> uint(31)));
    float _2560 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2552);
    int _2562 = ~_2482;
    int _2564 = _2562 + _2534;
    int _2566 = _2564 + 1;
    float _2568 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2570 = ~_2556;
    int _2572 = _2500 + _2570;
    int _2574 = _2572 + 1;
    float _2576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2578 = ~int(_2558);
    int _2580 = _2578 + 1;
    if (!_2184)
    {
        float _2582 = -_2530;
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2528 = _2584;
    }
    float _2586 = _2528;
    int _2588 = _2200 * _2566;
    int _2590 = _2588 + _2278;
    bool _2592 = _2200 == 0;
    float _2594 = fma(_2568, _2504, -0.5);
    int _2596 = _2574 ^ _2580;
    out.gl_Position.x = _1726;
    out.gl_Position.y = _1728;
    out.gl_Position.z = _2560;
    out.gl_Position.w = _1674;
    float _2598 = _2434;
    if (!_2184)
    {
        float _2600 = 1.0 / _2586;
        _2598 = _2600;
    }
    float _2602 = _2598;
    bool _2604 = !_2592;
    float _2606 = _2604 ? as_type<float>(_2590) : as_type<float>(0xffffffffu /* nan */);
    int _2608 = ~_2580;
    int _2610 = _2608 + _2596;
    int _2612 = _2610 + 1;
    float _2614 = float(as_type<int>(_2606));
    bool _2616 = !_2506;
    int _2618 = _2616 ? _2612 : (-1);
    float _2620 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2622 = _2606;
    if (_2184)
    {
        _2622 = 1.0;
    }
    float _2624 = _2622;
    float _2626 = fma(_2568, _2614, _890);
    float _2628 = float(_2618);
    float _2630 = _2560 + _1674;
    float _2632 = fma(_2620, _2386, -0.5);
    float _2634 = fma(_1086, _2594, _2626);
    float _2636 = -_936;
    float _2638 = fma(_2620, _2628, _2636);
    float _2640 = _2624;
    if (!_2184)
    {
        float _2642 = _2548 * _2602;
        float _2644 = precise::clamp(_2642, 0.0, 1.0);
        _2640 = _2644;
    }
    float _2646 = _2640;
    float _2648 = _2630 * 0.5;
    float _2650 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2652 = fma(_1096, _2632, _2638);
    float _2654 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2656 = _2646 > 0.0;
    bool _2658 = isnan(_2646);
    bool _2660 = _2656 || _2658;
    bool _2662 = isnan(0.0);
    bool _2664 = _2660 || _2662;
    float _2666 = _2650 * _1746;
    float _2668 = _2652 + 0.5;
    float _2670 = _2654 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2672 = -_2650;
    float _2674 = _2672 + 1.0;
    float _2676 = _1757 * _2666;
    float _2678 = _1767 * _2666;
    float _2680 = _2634 + 0.5;
    float _2682 = fma(_1763, _2676, _1751);
    float _2684 = fma(_1765, _2676, _1753);
    float _2686 = _1757 * _2674;
    float _2688 = fma(_1757, _2678, _1755);
    out.m_71.z = _2648;
    out.m_71.w = _1674;
    out.m_73.x = _2680;
    out.m_73.y = _2668;
    out.m_45.x = _2670;
    out.m_75.x = _2682;
    out.m_75.y = _2684;
    out.m_75.z = _2688;
    out.m_75.w = _2686;
    if (_2664)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2690 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2690;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _834 = false;
    bool _668 = false;
    bool _382 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2747 = as_type<float>(_110);
        out.gl_Position.z = _2747;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2816 = as_type<float>(_148);
        out.gl_Position.z = _2816;
    }
    if (_142)
    {
        return out;
    }
    float _150 = in.m_49.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = _154 * _152;
    float _176 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _178 = _176 * 6.283185482025146484375;
    float _180 = floor(_176);
    float _182 = _178 * 0.15915493667125701904296875;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = _182 * 6.283185482025146484375;
    float _190 = cos(_188);
    float _192 = 1.4012984643248170709237295832899e-45;
    if (!_172)
    {
        float _194 = _162 * _162;
        float _196 = _194 * 0.5;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = _198;
    if (!_172)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    float _206 = -_180;
    float _208 = _176 + _206;
    float _210 = _180;
    float _212 = _204;
    if (!_172)
    {
        _210 = _162;
    }
    float _214 = _210;
    bool _216 = !_172;
    float _218 = _214;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _162 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _162);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _248;
    }
    float _250 = _212;
    bool _252 = !_172;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _162 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _218 = _272;
    }
    float _274 = _218;
    float _276 = in.m_51.w;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = in.m_42.x;
    float _288 = in.m_42.y;
    float _290 = in.m_42.z;
    float _292 = fma(_190, 0.5, 0.5);
    bool _294 = _208 < 0.5;
    float _296 = float(_294);
    bool _298 = !_186;
    int _300 = _298 ? 0 : 1;
    float _302 = -_208;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_280;
    int _308 = _306 ? 0 : 1;
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _314 = -_292;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _318 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _320 = abs(_300);
    int _322 = abs(_308);
    float _324 = fma(_274, _156, _318);
    bool _326 = !_284;
    int _328 = _326 ? 0 : 1;
    float _330 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _334 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _336 = abs(_328);
    float _338 = fma(_274, _158, _330);
    float _340 = float(_322);
    float _342 = fma(_274, _160, _334);
    float _344 = float(_320);
    float _346 = fma(_324, _276, _286);
    float _348 = abs(_304);
    float _350 = _340 * _348;
    float _352 = fma(_338, _276, _288);
    float _354 = fma(_342, _276, _290);
    float _356 = float(_336);
    float _358 = fma(_344, _316, _350);
    float _360 = abs(_312);
    float _362 = fma(_356, _360, _358);
    bool _364 = !_332;
    float _380;
    if (!_364)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _368 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _372 = _370 * _366;
        float _374 = floor(_372);
        float _376 = -_374;
        float _378 = _372 + _376;
        _380 = _378;
        _382 = true;
    }
    else
    {
        float _384 = float(_94);
        float _386 = 1.0 / _384;
        float _388 = _128 * _386;
        _380 = _388;
    }
    _382 = false;
    float _390 = _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _394 = _390 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _390 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = _390 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _420 = 1.0 / _410;
    bool _422 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _424 = isnan(_390);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    bool _434 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _436 = isnan(_390);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = 1.0 / _406;
    bool _448 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _450 = 1.0 / _414;
    float _452 = _398 * _420;
    bool _454 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _456 = isnan(_390);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    bool _466 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _468 = isnan(_390);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _418;
    float _480 = _394 * _446;
    bool _482 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _484 = isnan(_390);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _496 = _390 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _502 = _402 * _450;
    float _504 = -_492;
    float _506 = _504 + 1.0;
    float _508 = -_464;
    float _510 = _508 + 1.0;
    float _512 = _476 * _510;
    float _514 = -_476;
    float _516 = _514 + 1.0;
    float _518 = _496 * _478;
    float _520 = _464 * _506;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _530;
    float _534 = _432 * _516;
    float _536 = fma(_524, _480, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _538 = fma(_528, _480, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _540 = fma(_532, _480, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _542 = -_432;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = fma(_500, _452, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = _444 * _544;
    float _558 = fma(_548, _452, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_552, _452, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = _536 * _556;
    float _564 = _538 * _556;
    float _566 = _540 * _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _568;
    float _572 = -_444;
    float _574 = _572 + 1.0;
    float _576 = in.m_51.x;
    float _578 = in.m_51.y;
    float _580 = in.m_51.z;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _582;
    float _586 = fma(_570, _502, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _588 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].x, _562);
    float _590 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].y, _564);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _592;
    float _596 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].z, _566);
    float _598 = fma(_554, _534, _588);
    float _600 = fma(_558, _534, _590);
    float _602 = fma(_584, _502, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _604 = fma(_594, _502, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _618 = fma(_560, _534, _596);
    float _620 = fma(_608, _518, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _622 = fma(_612, _518, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _624 = fma(_616, _518, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _626 = fma(_602, _512, _598);
    float _628 = fma(_586, _512, _600);
    float _630 = fma(_604, _512, _618);
    float _632 = fma(_620, _520, _626);
    float _634 = fma(_622, _520, _628);
    float _636 = fma(_624, _520, _630);
    float _638 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].x, _632);
    float _640 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].y, _634);
    float _642 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].z, _636);
    float _644 = _638 * _576;
    float _646 = _640 * _578;
    float _648 = _642 * _580;
    bool _650 = !_448;
    float _666;
    if (!_650)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _654 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_94);
        float _672 = 1.0 / _670;
        float _674 = _128 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _676 + _678;
    bool _682 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _684 = isnan(_676);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _696 = _676 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _706 = 1.0 / _700;
    bool _708 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _710 = 1.0 / _704;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _712;
    float _716 = _680 * _706;
    bool _718 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _720 = isnan(_676);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -_692;
    float _732 = _730 + 1.0;
    bool _734 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _736 = isnan(_676);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = fma(_714, _716, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _748 = _744 * _732;
    float _750 = -_744;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _758;
    float _762 = _696 * _710;
    float _764 = _728 * _752;
    float _766 = fma(_756, _716, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _768 = fma(_760, _716, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _770 = -_728;
    float _772 = _770 + 1.0;
    float _774 = _746 * _764;
    float _776 = _766 * _764;
    float _778 = _768 * _764;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _792 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].x, _776);
    float _794 = fma(_782, _762, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _796 = fma(_786, _762, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _798 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].y, _774);
    float _800 = fma(_790, _762, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _802 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].z, _778);
    float _804 = fma(_794, _748, _792);
    float _806 = fma(_796, _748, _798);
    float _808 = fma(_800, _748, _802);
    float _810 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].x, _804);
    float _812 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].y, _806);
    float _814 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].z, _808);
    bool _816 = !_708;
    float _832;
    if (!_816)
    {
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _820 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _824 = _822 * _818;
        float _826 = floor(_824);
        float _828 = -_826;
        float _830 = _824 + _828;
        _832 = _830;
        _834 = true;
    }
    else
    {
        float _836 = float(_94);
        float _838 = 1.0 / _836;
        float _840 = _128 * _838;
        _832 = _840;
    }
    _834 = false;
    float _842 = _832;
    float _844 = in.m_49.z;
    float _846 = _150 * 2.0;
    float _848 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _850 = in.m_49.y;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _862 = _860 != 0;
    float _864 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _866 = int(_864);
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _870 = _362 * _646;
    float _872 = -_868;
    float _874 = fma(_848, 2.0, _872);
    bool _876 = !_858;
    int _878 = _876 ? 0 : 1;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _882 = floor(_846);
    bool _884 = !_854;
    int _886 = _884 ? 0 : 1;
    float _888 = -_128;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[76].x, _874);
    bool _892 = !_862;
    int _894 = _892 ? 0 : 1;
    float _896 = _362 * _644;
    float _898 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _900 = _362 * _648;
    float _902 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _904 = log2(_902);
    float _906 = float(_866);
    float _908 = _844 * 2.0;
    float _910 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _912 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _850 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _916 = _850 * 2.0;
    float _918 = floor(_908);
    bool _920 = _882 > 0.0;
    float _922 = fma(_914, -2.0, _880);
    bool _924 = _882 >= 0.0;
    bool _926 = isnan(_882);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    float _934 = _850 + _844;
    float _936 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _922);
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _944 = _942 != 0;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _948 = _946 != 0;
    float _950 = _934 + (-1.0);
    float _952 = floor(_916);
    float _954 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _956 = _932 ? 0 : 1;
    bool _958 = !_944;
    int _960 = _958 ? 0 : 1;
    bool _962 = _918 > 0.0;
    float _964 = 1.0 / _906;
    bool _966 = _918 >= 0.0;
    bool _968 = isnan(_918);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    int _976 = abs(_960);
    int _978 = _974 ? 0 : 1;
    int _980 = ~_956;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    float _986 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _988 = int(_986);
    int _990 = _984;
    if (!_920)
    {
        int _992 = ~_956;
        int _994 = _992 + 1;
        _990 = _994;
    }
    int _996 = _990;
    int _998 = ~_978;
    int _1000 = _998 + 1;
    int _1002 = _1000 + 1;
    int _1004 = _1002;
    if (!_962)
    {
        int _1006 = ~_978;
        int _1008 = _1006 + 1;
        _1004 = _1008;
    }
    int _1010 = _1004;
    float _1012 = _904 * _128;
    float _1014 = float(_996);
    float _1016 = _964 * _128;
    float _1018 = float(_976);
    float _1020 = exp2(_1012);
    float _1022 = _1018 * _1014;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1026 = 1.0 + _1024;
    bool _1028 = _952 > 0.0;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1032 = _952 >= 0.0;
    bool _1034 = isnan(_952);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1044 = in.m_53.x;
    float _1046 = in.m_53.y;
    float _1048 = in.m_53.z;
    float _1050 = 1.0 / _1026;
    bool _1052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1054 = isnan(1.0);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1060 = _1056 || _1058;
    float _1062 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1042);
    bool _1064 = !_940;
    int _1066 = _1064 ? 0 : 1;
    float _1068 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1030);
    bool _1070 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1072 = isnan(0.0);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1078 = _1074 || _1076;
    float _1080 = -_1020;
    float _1082 = _1080 + 1.0;
    int _1084 = abs(_1066);
    float _1086 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1068);
    float _1088 = float(_988);
    float _1090 = _1022 * (-2.0);
    float _1092 = _1078 ? _1082 : 0.0;
    float _1094 = _1088 * _128;
    float _1096 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1062);
    float _1098 = float(_1084);
    if (_1060)
    {
        float _1100 = _1092 * _1050;
        _132 = _1100;
    }
    float _1102 = _132;
    bool _1104 = !_948;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = float(_1010);
    float _1110 = _850 + (-0.5);
    int _1112 = _1040 ? 0 : 1;
    int _1114 = abs(_1106);
    float _1116 = fma(_1090, _1046, _1046);
    float _1118 = fma(_954, _1090, _954);
    int _1120 = ~_1112;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    float _1126 = _1098 * _1108;
    float _1128 = _150 + _850;
    int _1130 = _1124;
    if (!_1028)
    {
        int _1132 = ~_1112;
        int _1134 = _1132 + 1;
        _1130 = _1134;
    }
    int _1136 = _1130;
    float _1138 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1116);
    float _1140 = _1128 + (-1.0);
    float _1142 = _1126 * (-2.0);
    float _1144 = float(_1114);
    float _1146 = fma(_1118, _1102, _1138);
    float _1148 = float(_1136);
    float _1150 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1152 = fma(_1142, _1044, _1044);
    float _1154 = _150 + (-0.5);
    float _1156 = _150 + _844;
    float _1158 = _1144 * _1148;
    float _1160 = _1146 * 0.15915493667125701904296875;
    float _1162 = fma(_1150, _1142, _1150);
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1152);
    float _1166 = _1156 + (-1.0);
    float _1168 = _1158 * (-2.0);
    float _1170 = in.m_55.x;
    float _1172 = in.m_55.y;
    float _1174 = in.m_55.z;
    float _1176 = in.m_55.w;
    float _1178 = fma(_1162, _1102, _1164);
    float _1180 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1182 = fma(_1168, _1048, _1048);
    float _1184 = _844 + (-0.5);
    float _1186 = in.m_57.x;
    float _1188 = in.m_57.y;
    float _1190 = in.m_57.z;
    float _1192 = fma(_1180, _1168, _1180);
    float _1194 = _1178 * 0.15915493667125701904296875;
    float _1196 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1182);
    float _1198 = _1160 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = fma(_1192, _1102, _1196);
    float _1204 = _1202 * 0.15915493667125701904296875;
    float _1206 = _1160 * 6.283185482025146484375;
    float _1208 = cos(_1206);
    float _1210 = _352 * _1172;
    float _1212 = _1194 * 6.283185482025146484375;
    float _1214 = sin(_1212);
    float _1216 = fma(_346, _1170, _1210);
    float _1218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1188);
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1186);
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1190);
    float _1224 = fma(_354, _1174, _1216);
    float _1226 = _1194 * 6.283185482025146484375;
    float _1228 = cos(_1226);
    float _1230 = _898 * _1218;
    float _1232 = _912 * _1222;
    float _1234 = in.m_59.x;
    float _1236 = in.m_59.y;
    float _1238 = in.m_59.z;
    float _1240 = in.m_59.w;
    float _1242 = _1204 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = _910 * _1220;
    float _1248 = _1214 * _1200;
    float _1250 = _1214 * _1208;
    float _1252 = _1204 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1228 * _1208;
    float _1258 = _1228 * _1200;
    float _1260 = _1200 * _1244;
    float _1262 = _1244 * _1230;
    float _1264 = _1208 * _1244;
    float _1266 = _1228 * _1262;
    float _1268 = _1214 * _1262;
    float _1270 = fma(_1254, _1256, _1248);
    float _1272 = -_1230;
    float _1274 = _1254 * _1272;
    float _1276 = fma(_1270, _1246, _1266);
    float _1278 = -_1250;
    float _1280 = fma(_1254, _1258, _1278);
    float _1282 = -_1258;
    float _1284 = fma(_1254, _1250, _1282);
    float _1286 = fma(_1264, _1246, _1274);
    float _1288 = fma(_1254, _1248, _1256);
    float _1290 = fma(_1280, _1232, _1276);
    float _1292 = fma(_1284, _1246, _1268);
    float _1294 = fma(_1260, _1232, _1286);
    float _1296 = _352 * _1236;
    float _1298 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1300 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1302 = fma(_1288, _1232, _1292);
    float _1304 = fma(_346, _1234, _1296);
    float _1306 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1298);
    float _1308 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1300);
    float _1310 = _1224 + _1176;
    float _1312 = fma(_354, _1238, _1304);
    float _1314 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1306);
    float _1316 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1308);
    float _1318 = _1312 + _1240;
    float _1320 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1322 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1324 = in.m_61.x;
    float _1326 = in.m_61.y;
    float _1328 = in.m_61.z;
    float _1330 = in.m_61.w;
    float _1332 = _1310 + _1320;
    float _1334 = _1318 + _1322;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1338 = _1332 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1342 = _1334 + _1340;
    float _1344 = _1338 * _1338;
    float _1346 = fma(_1342, _1342, _1344);
    float _1348 = sqrt(_1346);
    float _1350 = _352 * _1326;
    float _1352 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1354 = fma(_346, _1324, _1350);
    float _1356 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1352);
    float _1358 = fma(_354, _1328, _1354);
    bool _1360 = _1348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1356);
    float _1364 = _1358 + _1330;
    float _1366 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1368 = _1364 + _1366;
    float _1370 = _1328;
    float _1372 = _1358;
    float _1374 = _1302;
    float _1376 = _1290;
    if (!_1360)
    {
        _1370 = _1334;
    }
    float _1378 = _1370;
    float _1380 = _1378;
    if (!_1360)
    {
        _1372 = _1332;
    }
    float _1382 = _1372;
    float _1384 = _1382;
    if (!_1360)
    {
        _1374 = _1368;
    }
    float _1386 = _1374;
    bool _1388 = !_1360;
    float _1390 = _1386;
    if (!_1388)
    {
        float _1392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1396 = _1348 + _1394;
        float _1398 = _1368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1400 = rsqrt(_1346);
        float _1402 = _1396 * _1392;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = _1404 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = _1404 * 6.283185482025146484375;
        float _1412 = sin(_1410);
        float _1414 = _1408 + (-1.0);
        float _1416 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = fma(_1412, _1398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1420 = fma(_1368, _1408, _1416);
        float _1422 = _1400 * _1418;
        float _1424 = fma(_1342, _1422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1426 = fma(_1338, _1422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1390 = _1420;
        _1380 = _1424;
        _1384 = _1426;
    }
    float _1428 = _1390;
    float _1430 = _1380;
    float _1432 = _1384;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1436 = _1428 + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1440 = _1430 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1444 = _1432 + _1442;
    float _1446 = _1436 * _1436;
    float _1448 = fma(_1440, _1440, _1446);
    float _1450 = fma(_1444, _1444, _1448);
    float _1452 = rsqrt(_1450);
    float _1454 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1456 = _1440 * _1454;
    float _1458 = _1444 * _1454;
    float _1460 = _1456 * _1456;
    float _1462 = _1458 * _1458;
    float _1464 = _1460 + _1462;
    float _1466 = sqrt(_1464);
    bool _1468 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1466 + _1470;
    float _1474 = _1444;
    float _1476 = _1464;
    float _1478 = _1472;
    float _1480 = _1436;
    float _1482 = _1454;
    if (_1468)
    {
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1484;
    }
    float _1486 = _1474;
    if (_1468)
    {
        float _1488 = rsqrt(_1464);
        _1476 = _1488;
    }
    float _1490 = _1476;
    if (_1468)
    {
        float _1492 = _1472 * _1486;
        _1478 = _1492;
    }
    float _1494 = _1478;
    if (_1468)
    {
        float _1496 = _1494 * 0.15915493667125701904296875;
        _1376 = _1496;
    }
    float _1498 = _1376;
    float _1500 = _1448;
    float _1502 = _1498;
    if (_1468)
    {
        float _1504 = _1498 * 6.283185482025146484375;
        float _1506 = sin(_1504);
        _1500 = _1506;
    }
    float _1508 = _1500;
    float _1510 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1512 = precise::max(0.0, _1510);
    float _1514 = _1452;
    float _1516 = _1512;
    if (_1468)
    {
        float _1518 = _1498 * 6.283185482025146484375;
        float _1520 = cos(_1518);
        _1514 = _1520;
    }
    float _1522 = _1514;
    float _1524 = -_1454;
    float _1526 = -_1512;
    float _1528 = fma(_1436, _1524, _1526);
    float _1530 = _1528;
    if (!_1468)
    {
        _1480 = _1456;
    }
    float _1532 = _1480;
    float _1534 = _1532;
    if (_1468)
    {
        float _1536 = _1528 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1536;
    }
    float _1538 = _1516;
    float _1540 = _1538;
    float _1542 = _1508;
    if (_1468)
    {
        float _1544 = fma(_1508, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1540 = _1544;
    }
    float _1546 = _1540;
    float _1548 = _1546;
    float _1550 = _1522;
    if (_1468)
    {
        float _1552 = _1522 + (-1.0);
        _1482 = _1552;
    }
    float _1554 = _1482;
    if (_1468)
    {
        float _1556 = _1490 * _1546;
        _1502 = _1556;
    }
    float _1558 = _1502;
    if (!_1468)
    {
        _1548 = _1458;
    }
    float _1560 = _1548;
    float _1562 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = _1560;
    if (_1468)
    {
        float _1566 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1542 = _1566;
    }
    float _1568 = _1542;
    float _1570 = _1568;
    if (_1468)
    {
        float _1572 = _1456 * _1558;
        _1534 = _1572;
    }
    float _1574 = _1534;
    float _1576 = sqrt(_1450);
    if (_1468)
    {
        float _1578 = _1458 * _1558;
        _1564 = _1578;
    }
    float _1580 = _1564;
    if (_1468)
    {
        float _1582 = fma(_1528, _1522, _1568);
        _1530 = _1582;
    }
    float _1584 = _1530;
    if (!_1468)
    {
        _1550 = _1460;
    }
    float _1586 = _1550;
    float _1588 = _1586;
    if (_1468)
    {
        float _1590 = _1574 * _1574;
        _1588 = _1590;
    }
    float _1592 = _1588;
    if (!_1468)
    {
        _1570 = _1462;
    }
    float _1594 = _1570;
    float _1596 = _1594;
    if (_1468)
    {
        float _1598 = _1580 * _1580;
        _1596 = _1598;
    }
    float _1600 = _1596;
    float _1602 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1604 = fma(_1584, _1584, _1592);
    float _1606 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1608 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1610 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1612 = _1604 + _1600;
    float _1614 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1602);
    float _1616 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1606);
    float _1618 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1608);
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1622 = fma(_1576, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1620);
    float _1624 = precise::clamp(_1622, 0.0, 1.0);
    float _1626 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1614);
    float _1628 = rsqrt(_1612);
    float _1630 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1610);
    float _1632 = -_1624;
    float _1634 = _1632 + 1.0;
    float _1636 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1638 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1616);
    float _1640 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1642 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1618);
    float _1644 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1646 = abs(_1634);
    float _1648 = log2(_1646);
    float _1650 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1652 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1654 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1644);
    float _1656 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1658 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1660 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1654);
    float _1662 = _1628 * _1574;
    float _1664 = _1628 * _1584;
    float _1666 = _1628 * _1580;
    float _1668 = -_1658;
    float _1670 = fma(_1668, _1652, 1.0);
    float _1672 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1674 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1660);
    float _1676 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1678 = -_1672;
    float _1680 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1678);
    float _1682 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1684 = log2(_1670);
    float _1686 = -_1666;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1680);
    float _1690 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1692 = fma(_1688, -0.5, 0.5);
    float _1694 = fma(_1688, 0.5, 0.5);
    float _1696 = exp2(_1682);
    float _1698 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1676);
    float _1700 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1690);
    float _1702 = _1664 + 1.0;
    float _1704 = fma(_1694, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1706 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1698);
    float _1708 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1700);
    float _1710 = 1.0 / _1674;
    float _1712 = fma(_1694, _1704, -0.212114393711090087890625);
    float _1714 = _1684 * 0.693147182464599609375;
    float _1716 = fma(_1694, _1712, 1.570728778839111328125);
    float _1718 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1720 = sqrt(_1692);
    float _1722 = -_1664;
    float _1724 = fma(_1696, _1702, _1722);
    float _1726 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1706);
    float _1728 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1708);
    float _1730 = fma(_1724, 0.5, 0.5);
    float _1732 = _1726 * _1710;
    float _1734 = _1728 * _1710;
    float _1736 = fma(_1732, 0.5, 0.5);
    float _1738 = fma(_1734, -0.5, 0.5);
    float _1740 = _1720 * 0.636619746685028076171875;
    float _1742 = -_1716;
    float _1744 = fma(_1740, _1742, 1.0);
    float3 _5299 = float3(_1736, _1738, _1718);
    float _1746 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5299, float3(0.0), isnan(_5299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5299, float3(0.0), isnan(_5299)), level(0.0)).x;
    float3 _5310 = float3(_1736, _1738, _1718);
    float4 _1749 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5310, float3(0.0), isnan(_5310)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5310, float3(0.0), isnan(_5310)), level(0.0)).xyzw;
    float _1751 = _1749.x;
    float _1753 = _1749.y;
    float _1755 = _1749.z;
    float _1757 = _1749.w;
    float2 _5327 = float2(_1744, _1730);
    float3 _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5327, float2(0.0), isnan(_5327)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5327, float2(0.0), isnan(_5327)), level(0.0)).xyz;
    float _1763 = _1761.x;
    float _1765 = _1761.y;
    float _1767 = _1761.z;
    float _1769 = float(uint(_988));
    float _1771 = trunc(_1016);
    int _1773 = int(_1771);
    int _1775 = ~_988;
    int _1777 = _1775 + 1;
    float _1779 = _812 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1781 = ~_988;
    int _1783 = _1781 + 1;
    float _1785 = _810 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1787 = float(_94);
    float _1789 = _814 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1791 = abs(_878);
    float _1793 = 1.0 / _1769;
    float _1795 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1797 = float(uint(_1773));
    float _1799 = 1.0 / _1787;
    int _1801 = as_type<int>(_1793) + (-2);
    float _1803 = exp2(_1795);
    float _1805 = as_type<float>(_1801) * _1797;
    float _1807 = _1094 * _1799;
    float _1809 = trunc(_1805);
    float _1811 = precise::max(_1809, 0.0);
    uint _1814 = uint(_1811);
    float _1816 = -_1803;
    float _1818 = _1816 + 1.0;
    float _1820 = trunc(_1807);
    int _1822 = int(_1820);
    int _1824 = _1777 * int(_1814);
    int _1826 = _1824 + _1773;
    float _1828 = float(uint(_1826));
    float _1830 = as_type<float>(_1801) * _1828;
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1834 = _1832 != 0;
    float _1836 = trunc(_1830);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    bool _1842 = !_1834;
    float _1844 = _1842 ? 7.345489978790283203125 : 1.0;
    float _1846 = _1844 * _150;
    float _1848 = floor(_1846);
    int _1850 = int(_1814) + int(_1840);
    float _1852 = float(_1773);
    int _1854 = _1783 * _1850;
    int _1856 = _1854 + _1773;
    bool _1858 = _1852 >= _1088;
    bool _1860 = isnan(_1852);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan(_1088);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    bool _1870 = uint(_1856) >= uint(_988);
    float _1872 = -_1848;
    float _1874 = _1846 + _1872;
    float _1876 = trunc(_1868);
    int _1878 = int(_1876);
    bool _1880 = !_1870;
    int _1882 = _1880 ? 0 : (-1);
    float _1884 = _1874 * _1088;
    bool _1886 = _988 == 0;
    int _1888 = ~_1850;
    int _1890 = _1888 + _1882;
    int _1892 = _1890 + 1;
    int _1894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1896 = _1894 != 0;
    float _1898 = trunc(_1884);
    int _1900 = int(_1898);
    int _1902 = _988 + (-1);
    int _1904 = _988 * _1892;
    int _1906 = _1904 + _1773;
    bool _1908 = !_1896;
    int _1910 = _1908 ? 0 : 1;
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1914 = _1912 != 0;
    int _1916 = ~_1878;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    bool _1922 = !_1886;
    int _1924 = _1922 ? _1906 : (-1);
    int _1926 = abs(_1910);
    int _1928 = abs(_894);
    int _1930 = _1924 * _1920;
    int _1932 = abs(_886);
    int _1934 = _1878 * _1902;
    int _1936 = _1934 + _1930;
    bool _1938 = !_1914;
    int _1940 = _1938 ? 0 : 1;
    int _1942 = _1936 * _1791;
    int _1944 = _1900 * _1926;
    int _1946 = _1944 + _1773;
    int _1948 = abs(_1940);
    int _1950 = _1822 * _1932;
    int _1952 = _1950 + _1942;
    int _1954 = ~_988;
    int _1956 = _1954 + 1;
    int _1958 = _1946 * _1928;
    int _1960 = _1958 + _1952;
    int _1962 = _1900 * _1948;
    int _1964 = _1962 + _1960;
    int _1966 = ~_988;
    int _1968 = _1966 + 1;
    float _1970 = float(uint(_1964));
    float _1972 = as_type<float>(_1801) * _1970;
    float _1974 = trunc(_1972);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = _1968 * int(_1978);
    int _1982 = _1980 + _1964;
    float _1984 = float(uint(_1982));
    float _1986 = as_type<float>(_1801) * _1984;
    float _1988 = trunc(_1986);
    float _1990 = precise::max(_1988, 0.0);
    uint _1992 = uint(_1990);
    int _1994 = int(_1978) + int(_1992);
    float _1996 = float(uint(_1946));
    int _1998 = _1956 * _1994;
    int _2000 = _1998 + _1964;
    float _2002 = as_type<float>(_1801) * _1996;
    bool _2004 = uint(_2000) >= uint(_988);
    float _2006 = trunc(_2002);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    bool _2012 = !_2004;
    int _2014 = _2012 ? 0 : (-1);
    int _2016 = ~_1994;
    int _2018 = _2016 + _2014;
    int _2020 = _2018 + 1;
    int _2022 = _988 * _2020;
    int _2024 = _2022 + _1964;
    bool _2026 = !_1886;
    int _2028 = _2026 ? _2024 : (-1);
    int _2030 = ~_988;
    int _2032 = _2030 + 1;
    int _2034 = _2028 >> 31;
    int _2036 = _2028 & 3;
    bool _2038 = _2036 != 0;
    int _2040 = _2032 * int(_2010);
    int _2042 = _2040 + _1946;
    int _2044 = _2034 & 3;
    bool _2046 = uint(_2036) > 1u;
    int _2048 = _2028 + _2044;
    float _2050 = float(uint(_2042));
    int _2052 = _2048 >> 2;
    int _2054 = _2028 & 3;
    bool _2056 = _2054 != 0;
    float _2058 = as_type<float>(_1801) * _2050;
    int _2060 = _2052 << 4;
    int _2062 = _2060 + 368;
    int _2064 = _2056 ? 0 : 1;
    float _2066 = trunc(_2058);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    uint _2072 = uint(int(uint(_2062) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    int _2088 = ~_988;
    int _2090 = _2088 + 1;
    bool _2092 = _2036 != 3;
    bool _2094 = uint(_2036) >= 2u;
    int _2096 = _2062 + 8;
    uint _2098 = uint(int(uint(_2096) >> uint(2)));
    uint _2100 = uint(int(uint(int(_2098)) >> uint(2)));
    int _2102 = int(_2098) & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    int _2106 = int(_2098) + 1;
    uint _2108 = uint(int(uint(_2106) >> uint(2)));
    int _2110 = _2106 & 3;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[int(_2108)][_2110];
    int _2114 = int(_2010) + int(_2070);
    int _2116 = ~_2064;
    int _2118 = _2116 + 1;
    int _2120 = _2118 + 1;
    int _2122 = _2120;
    if (!_2046)
    {
        int _2124 = ~_2064;
        int _2126 = _2124 + 1;
        _2122 = _2126;
    }
    int _2128 = _2122;
    int _2130 = _2090 * _2114;
    int _2132 = _2130 + _1946;
    bool _2134 = !_2038;
    int _2136 = _2134 ? 0 : 1;
    int _2138 = abs(_2128);
    bool _2140 = uint(_2132) >= uint(_988);
    int _2142 = _2094 ? 0 : 1;
    int _2144 = ~_2138;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    int _2150 = abs(_2136);
    int _2152 = ~_2142;
    int _2154 = _2152 + 1;
    int _2156 = _2154 + 1;
    int _2158 = _2156;
    if (_2092)
    {
        int _2160 = ~_2142;
        int _2162 = _2160 + 1;
        _2158 = _2162;
    }
    int _2164 = _2158;
    bool _2166 = !_2140;
    int _2168 = _2166 ? 0 : (-1);
    int _2170 = ~_2150;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    bool _2176 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2178 = isnan(0.5);
    bool _2180 = _2176 || _2178;
    bool _2182 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2184 = _2180 || _2182;
    int _2186 = abs(_2164);
    int _2188 = ~_2114;
    int _2190 = _2188 + _2168;
    int _2192 = _2190 + 1;
    int _2194 = _2148 * as_type<int>(_2086);
    bool _2196 = _2036 != 3;
    float _2198 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2200 = int(_2198);
    int _2202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2204 = _2202 != 0;
    int _2206 = _2174 * as_type<int>(_2078);
    int _2208 = _2206 + _2194;
    int _2210 = ~_2186;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = _988 * _2192;
    int _2218 = _2216 + _1946;
    bool _2220 = !_2196;
    int _2222 = _2220 ? 0 : (-1);
    int _2224 = _2214 * as_type<int>(_2104);
    int _2226 = _2224 + _2208;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2230 = _2228 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2232 = !_2204;
    int _2234 = _2232 ? 0 : 1;
    int _2236 = abs(_2222);
    float _2238 = 1.0 / _2230;
    int _2240 = abs(_2234);
    float _2242 = float(uint(_2200));
    int _2244 = ~_2236;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = abs(_2200);
    float _2252 = 1.0 / _2242;
    int _2254 = ~_2240;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2248 * as_type<int>(_2112);
    int _2262 = _2260 + _2226;
    float _2264 = float(uint(_2250));
    bool _2266 = !_1886;
    int _2268 = _2266 ? _2218 : (-1);
    int _2270 = _2262 * _2258;
    float _2272 = 1.0 / _2264;
    float _2274 = in.m_63.y;
    int _2276 = _2268 * _2240;
    int _2278 = _2276 + _2270;
    bool _2280 = _850 > 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    int _2282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2284 = _2282 != 0;
    float _2286 = float(uint(_2278));
    int _2288 = abs(_2278);
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2292 = _2290 != 0;
    float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2296 = _842 + _2294;
    bool _2298 = _150 > 0.5;
    bool _2300 = _2298 && _2284;
    bool _2302 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2304 = isnan(_842);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2310 = _2306 || _2308;
    float _2312 = float(_2310);
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2314;
    int _2318 = as_type<int>(_2252) + (-2);
    float _2320 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2322 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2324 = isnan(_842);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2330 = _2326 || _2328;
    float _2332 = float(_2330);
    float _2334 = _2316 * _2238;
    int _2336 = as_type<int>(_2272) + (-2);
    float _2338 = as_type<float>(_2318) * _2286;
    float _2340 = float(uint(_2288));
    float _2342 = fma(_2334, _2296, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2344 = -_2312;
    float _2346 = _2344 + 1.0;
    int _2348 = ~_2200;
    int _2350 = _2348 + 1;
    float _2352 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2320);
    float _2354 = trunc(_2338);
    float _2356 = precise::max(_2354, 0.0);
    uint _2358 = uint(_2356);
    float _2360 = as_type<float>(_2336) * _2340;
    float _2362 = -_2274;
    float _2364 = _2362 + 1.0;
    float _2366 = _2332 * _2346;
    float _2368 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2370 = ~_2250;
    int _2372 = _2370 + 1;
    float _2374 = trunc(_2360);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    float _2380 = _2274;
    float _2382 = as_type<float>(_2288);
    if (_2292)
    {
        float _2384 = _2280 ? _2364 : _2274;
        _2380 = _2384;
    }
    float _2386 = _2380;
    float _2388 = _2342 * _2366;
    float _2390 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2352);
    float _2392 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2368);
    float _2394 = in.m_63.x;
    float _2396 = _2390 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2398 = _2350 * int(_2358);
    int _2400 = _2398 + _2278;
    float _2402 = -_2332;
    float _2404 = _2402 + 1.0;
    float _2406 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2392);
    float _2408 = 1.0 / _2396;
    float _2410 = float(uint(_2400));
    float _2412 = fma(_2404, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2388);
    int _2414 = _2372 * int(_2378);
    int _2416 = _2414 + _2288;
    float _2418 = _2406 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2420 = as_type<float>(_2318) * _2410;
    float _2422 = fma(_2312, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2412);
    float _2424 = float(uint(_2416));
    float _2426 = _2418 + _2396;
    float _2428 = trunc(_2420);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    float _2434 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2436 = as_type<float>(_2336) * _2424;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2442 = _2426 * _2408;
    float _2444 = _2442 * 0.5;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2448 = trunc(_2436);
    float _2450 = precise::max(_2448, 0.0);
    uint _2452 = uint(_2450);
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2456 = _2440;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_2184)
    {
        _2456 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2460 = _2456;
    float _2462 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2464 = _2446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2466 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2468 = _2460;
    float _2470 = _2394;
    if (_2284)
    {
        _2458 = _2394;
    }
    float _2472 = _2458;
    float _2474 = _2472;
    if (!_2184)
    {
        float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2478 = fma(_2444, _2460, _2476);
        _2468 = _2478;
    }
    float _2480 = _2468;
    int _2482 = int(_2358) + int(_2432);
    out.m_67.x = _2462;
    out.m_67.y = _2464;
    out.m_67.z = _2454;
    int _2484 = ~_2200;
    int _2486 = _2484 + 1;
    if (_2300)
    {
        float _2488 = -_2472;
        float _2490 = _2488 + 1.0;
        _2474 = _2490;
    }
    float _2492 = _2474;
    float _2494 = _1789;
    if (!_2184)
    {
        float _2496 = 1.0 / _2480;
        _2494 = _2496;
    }
    float _2498 = _2494;
    int _2500 = int(_2378) + int(_2452);
    float _2502 = _2422 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_2284)
    {
        _2470 = _2492;
    }
    float _2504 = _2470;
    bool _2506 = _2200 == 0;
    int _2508 = _2486 * _2482;
    int _2510 = _2508 + _2278;
    int _2512 = ~_2250;
    int _2514 = _2512 + 1;
    float _2516 = _1779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2520 = uint(_2510) >= uint(_2200);
    int _2522 = _2514 * _2500;
    int _2524 = _2522 + _2288;
    float _2526 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2528 = _2516;
    if (!_2184)
    {
        _2382 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2530 = _2382;
    out.m_69.x = _2466;
    out.m_69.y = _2516;
    out.m_69.z = _2434;
    out.m_69.w = _2502;
    bool _2532 = !_2520;
    int _2534 = _2532 ? 0 : (-1);
    float _2536 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2526);
    bool _2538 = uint(_2524) >= uint(_2250);
    float _2540 = _2498;
    if (!_2184)
    {
        float _2542 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2544 = -_2530;
        float _2546 = fma(_2498, _2542, _2544);
        _2540 = _2546;
    }
    float _2548 = _2540;
    int _2550 = _2278 ^ _2200;
    float _2552 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2536);
    bool _2554 = !_2538;
    int _2556 = _2554 ? 0 : (-1);
    uint _2558 = uint(int(uint(_2550) >> uint(31)));
    float _2560 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2552);
    int _2562 = ~_2482;
    int _2564 = _2562 + _2534;
    int _2566 = _2564 + 1;
    float _2568 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2570 = ~_2556;
    int _2572 = _2500 + _2570;
    int _2574 = _2572 + 1;
    float _2576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2578 = ~int(_2558);
    int _2580 = _2578 + 1;
    if (!_2184)
    {
        float _2582 = -_2530;
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2528 = _2584;
    }
    float _2586 = _2528;
    int _2588 = _2200 * _2566;
    int _2590 = _2588 + _2278;
    bool _2592 = _2200 == 0;
    float _2594 = fma(_2568, _2504, -0.5);
    int _2596 = _2574 ^ _2580;
    out.gl_Position.x = _1726;
    out.gl_Position.y = _1728;
    out.gl_Position.z = _2560;
    out.gl_Position.w = _1674;
    float _2598 = _2434;
    if (!_2184)
    {
        float _2600 = 1.0 / _2586;
        _2598 = _2600;
    }
    float _2602 = _2598;
    bool _2604 = !_2592;
    float _2606 = _2604 ? as_type<float>(_2590) : as_type<float>(0xffffffffu /* nan */);
    int _2608 = ~_2580;
    int _2610 = _2608 + _2596;
    int _2612 = _2610 + 1;
    float _2614 = float(as_type<int>(_2606));
    bool _2616 = !_2506;
    int _2618 = _2616 ? _2612 : (-1);
    float _2620 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2622 = _2606;
    if (_2184)
    {
        _2622 = 1.0;
    }
    float _2624 = _2622;
    float _2626 = fma(_2568, _2614, _890);
    float _2628 = float(_2618);
    float _2630 = _2560 + _1674;
    float _2632 = fma(_2620, _2386, -0.5);
    float _2634 = fma(_1086, _2594, _2626);
    float _2636 = -_936;
    float _2638 = fma(_2620, _2628, _2636);
    float _2640 = _2624;
    if (!_2184)
    {
        float _2642 = _2548 * _2602;
        float _2644 = precise::clamp(_2642, 0.0, 1.0);
        _2640 = _2644;
    }
    float _2646 = _2640;
    float _2648 = _2630 * 0.5;
    float _2650 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2652 = fma(_1096, _2632, _2638);
    float _2654 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2656 = _2646 > 0.0;
    bool _2658 = isnan(_2646);
    bool _2660 = _2656 || _2658;
    bool _2662 = isnan(0.0);
    bool _2664 = _2660 || _2662;
    float _2666 = _2650 * _1746;
    float _2668 = _2652 + 0.5;
    float _2670 = _2654 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2672 = -_2650;
    float _2674 = _2672 + 1.0;
    float _2676 = _1757 * _2666;
    float _2678 = _1767 * _2666;
    float _2680 = _2634 + 0.5;
    float _2682 = fma(_1763, _2676, _1751);
    float _2684 = fma(_1765, _2676, _1753);
    float _2686 = _1757 * _2674;
    float _2688 = fma(_1757, _2678, _1755);
    out.m_71.z = _2648;
    out.m_71.w = _1674;
    out.m_73.x = _2680;
    out.m_73.y = _2668;
    out.m_45.x = _2670;
    out.m_75.x = _2682;
    out.m_75.y = _2684;
    out.m_75.z = _2688;
    out.m_75.w = _2686;
    if (_2664)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2690 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2690;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _834 = false;
    bool _668 = false;
    bool _382 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2747 = as_type<float>(_110);
        out.gl_Position.z = _2747;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2816 = as_type<float>(_148);
        out.gl_Position.z = _2816;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = _154 * _152;
    float _176 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _178 = _176 * 6.283185482025146484375;
    float _180 = floor(_176);
    float _182 = _178 * 0.15915493667125701904296875;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = _182 * 6.283185482025146484375;
    float _190 = cos(_188);
    float _192 = 1.4012984643248170709237295832899e-45;
    if (!_172)
    {
        float _194 = _162 * _162;
        float _196 = _194 * 0.5;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = _198;
    if (!_172)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    float _206 = -_180;
    float _208 = _176 + _206;
    float _210 = _180;
    float _212 = _204;
    if (!_172)
    {
        _210 = _162;
    }
    float _214 = _210;
    bool _216 = !_172;
    float _218 = _214;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _162 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _162);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _248;
    }
    float _250 = _212;
    bool _252 = !_172;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _162 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _218 = _272;
    }
    float _274 = _218;
    float _276 = in.m_51.w;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = in.m_42.x;
    float _288 = in.m_42.y;
    float _290 = in.m_42.z;
    float _292 = fma(_190, 0.5, 0.5);
    bool _294 = _208 < 0.5;
    float _296 = float(_294);
    bool _298 = !_186;
    int _300 = _298 ? 0 : 1;
    float _302 = -_208;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_280;
    int _308 = _306 ? 0 : 1;
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _314 = -_292;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _318 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _320 = abs(_300);
    int _322 = abs(_308);
    float _324 = fma(_274, _156, _318);
    bool _326 = !_284;
    int _328 = _326 ? 0 : 1;
    float _330 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _334 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _336 = abs(_328);
    float _338 = fma(_274, _158, _330);
    float _340 = float(_322);
    float _342 = fma(_274, _160, _334);
    float _344 = float(_320);
    float _346 = fma(_324, _276, _286);
    float _348 = abs(_304);
    float _350 = _340 * _348;
    float _352 = fma(_338, _276, _288);
    float _354 = fma(_342, _276, _290);
    float _356 = float(_336);
    float _358 = fma(_344, _316, _350);
    float _360 = abs(_312);
    float _362 = fma(_356, _360, _358);
    bool _364 = !_332;
    float _380;
    if (!_364)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _368 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _372 = _370 * _366;
        float _374 = floor(_372);
        float _376 = -_374;
        float _378 = _372 + _376;
        _380 = _378;
        _382 = true;
    }
    else
    {
        float _384 = float(_94);
        float _386 = 1.0 / _384;
        float _388 = _128 * _386;
        _380 = _388;
    }
    _382 = false;
    float _390 = _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _394 = _390 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _390 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = _390 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _420 = 1.0 / _410;
    bool _422 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _424 = isnan(_390);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    bool _434 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _436 = isnan(_390);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = 1.0 / _406;
    bool _448 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _450 = 1.0 / _414;
    float _452 = _398 * _420;
    bool _454 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _456 = isnan(_390);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    bool _466 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _468 = isnan(_390);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _418;
    float _480 = _394 * _446;
    bool _482 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _484 = isnan(_390);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _496 = _390 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _502 = _402 * _450;
    float _504 = -_492;
    float _506 = _504 + 1.0;
    float _508 = -_464;
    float _510 = _508 + 1.0;
    float _512 = _476 * _510;
    float _514 = -_476;
    float _516 = _514 + 1.0;
    float _518 = _496 * _478;
    float _520 = _464 * _506;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _530;
    float _534 = _432 * _516;
    float _536 = fma(_524, _480, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _538 = fma(_528, _480, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _540 = fma(_532, _480, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _542 = -_432;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = fma(_500, _452, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = _444 * _544;
    float _558 = fma(_548, _452, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_552, _452, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = _536 * _556;
    float _564 = _538 * _556;
    float _566 = _540 * _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _568;
    float _572 = -_444;
    float _574 = _572 + 1.0;
    float _576 = in.m_51.x;
    float _578 = in.m_51.y;
    float _580 = in.m_51.z;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _582;
    float _586 = fma(_570, _502, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _588 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].x, _562);
    float _590 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].y, _564);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _592;
    float _596 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].z, _566);
    float _598 = fma(_554, _534, _588);
    float _600 = fma(_558, _534, _590);
    float _602 = fma(_584, _502, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _604 = fma(_594, _502, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _618 = fma(_560, _534, _596);
    float _620 = fma(_608, _518, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _622 = fma(_612, _518, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _624 = fma(_616, _518, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _626 = fma(_602, _512, _598);
    float _628 = fma(_586, _512, _600);
    float _630 = fma(_604, _512, _618);
    float _632 = fma(_620, _520, _626);
    float _634 = fma(_622, _520, _628);
    float _636 = fma(_624, _520, _630);
    float _638 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].x, _632);
    float _640 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].y, _634);
    float _642 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[147].z, _636);
    float _644 = _638 * _576;
    float _646 = _640 * _578;
    float _648 = _642 * _580;
    bool _650 = !_448;
    float _666;
    if (!_650)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _654 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_94);
        float _672 = 1.0 / _670;
        float _674 = _128 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _676 + _678;
    bool _682 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _684 = isnan(_676);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _696 = _676 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _706 = 1.0 / _700;
    bool _708 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _710 = 1.0 / _704;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _712;
    float _716 = _680 * _706;
    bool _718 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _720 = isnan(_676);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -_692;
    float _732 = _730 + 1.0;
    bool _734 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _736 = isnan(_676);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = fma(_714, _716, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _748 = _744 * _732;
    float _750 = -_744;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _758;
    float _762 = _696 * _710;
    float _764 = _728 * _752;
    float _766 = fma(_756, _716, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _768 = fma(_760, _716, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _770 = -_728;
    float _772 = _770 + 1.0;
    float _774 = _746 * _764;
    float _776 = _766 * _764;
    float _778 = _768 * _764;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _792 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].x, _776);
    float _794 = fma(_782, _762, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _796 = fma(_786, _762, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _798 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].y, _774);
    float _800 = fma(_790, _762, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _802 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].z, _778);
    float _804 = fma(_794, _748, _792);
    float _806 = fma(_796, _748, _798);
    float _808 = fma(_800, _748, _802);
    float _810 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].x, _804);
    float _812 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].y, _806);
    float _814 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].z, _808);
    bool _816 = !_708;
    float _832;
    if (!_816)
    {
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _820 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _824 = _822 * _818;
        float _826 = floor(_824);
        float _828 = -_826;
        float _830 = _824 + _828;
        _832 = _830;
        _834 = true;
    }
    else
    {
        float _836 = float(_94);
        float _838 = 1.0 / _836;
        float _840 = _128 * _838;
        _832 = _840;
    }
    _834 = false;
    float _842 = _832;
    float _844 = in.m_49.z;
    float _846 = _150 * 2.0;
    float _848 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _850 = in.m_49.y;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _862 = _860 != 0;
    float _864 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _866 = int(_864);
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _870 = _362 * _646;
    float _872 = -_868;
    float _874 = fma(_848, 2.0, _872);
    bool _876 = !_858;
    int _878 = _876 ? 0 : 1;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _882 = floor(_846);
    bool _884 = !_854;
    int _886 = _884 ? 0 : 1;
    float _888 = -_128;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[76].x, _874);
    bool _892 = !_862;
    int _894 = _892 ? 0 : 1;
    float _896 = _362 * _644;
    float _898 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _900 = _362 * _648;
    float _902 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _904 = log2(_902);
    float _906 = float(_866);
    float _908 = _844 * 2.0;
    float _910 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _912 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _850 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _916 = _850 * 2.0;
    float _918 = floor(_908);
    bool _920 = _882 > 0.0;
    float _922 = fma(_914, -2.0, _880);
    bool _924 = _882 >= 0.0;
    bool _926 = isnan(_882);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    float _934 = _850 + _844;
    float _936 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _922);
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _944 = _942 != 0;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _948 = _946 != 0;
    float _950 = _934 + (-1.0);
    float _952 = floor(_916);
    float _954 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _956 = _932 ? 0 : 1;
    bool _958 = !_944;
    int _960 = _958 ? 0 : 1;
    bool _962 = _918 > 0.0;
    float _964 = 1.0 / _906;
    bool _966 = _918 >= 0.0;
    bool _968 = isnan(_918);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    int _976 = abs(_960);
    int _978 = _974 ? 0 : 1;
    int _980 = ~_956;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    float _986 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _988 = int(_986);
    int _990 = _984;
    if (!_920)
    {
        int _992 = ~_956;
        int _994 = _992 + 1;
        _990 = _994;
    }
    int _996 = _990;
    int _998 = ~_978;
    int _1000 = _998 + 1;
    int _1002 = _1000 + 1;
    int _1004 = _1002;
    if (!_962)
    {
        int _1006 = ~_978;
        int _1008 = _1006 + 1;
        _1004 = _1008;
    }
    int _1010 = _1004;
    float _1012 = _904 * _128;
    float _1014 = float(_996);
    float _1016 = _964 * _128;
    float _1018 = float(_976);
    float _1020 = exp2(_1012);
    float _1022 = _1018 * _1014;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1026 = 1.0 + _1024;
    bool _1028 = _952 > 0.0;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1032 = _952 >= 0.0;
    bool _1034 = isnan(_952);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1044 = in.m_53.x;
    float _1046 = in.m_53.y;
    float _1048 = in.m_53.z;
    float _1050 = 1.0 / _1026;
    bool _1052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1054 = isnan(1.0);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1060 = _1056 || _1058;
    float _1062 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1042);
    bool _1064 = !_940;
    int _1066 = _1064 ? 0 : 1;
    float _1068 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1030);
    bool _1070 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1072 = isnan(0.0);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1078 = _1074 || _1076;
    float _1080 = -_1020;
    float _1082 = _1080 + 1.0;
    int _1084 = abs(_1066);
    float _1086 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1068);
    float _1088 = float(_988);
    float _1090 = _1022 * (-2.0);
    float _1092 = _1078 ? _1082 : 0.0;
    float _1094 = _1088 * _128;
    float _1096 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1062);
    float _1098 = float(_1084);
    if (_1060)
    {
        float _1100 = _1092 * _1050;
        _132 = _1100;
    }
    float _1102 = _132;
    bool _1104 = !_948;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = float(_1010);
    float _1110 = _850 + (-0.5);
    int _1112 = _1040 ? 0 : 1;
    int _1114 = abs(_1106);
    float _1116 = fma(_1090, _1046, _1046);
    float _1118 = fma(_954, _1090, _954);
    int _1120 = ~_1112;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    float _1126 = _1098 * _1108;
    float _1128 = _150 + _850;
    int _1130 = _1124;
    if (!_1028)
    {
        int _1132 = ~_1112;
        int _1134 = _1132 + 1;
        _1130 = _1134;
    }
    int _1136 = _1130;
    float _1138 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1116);
    float _1140 = _1128 + (-1.0);
    float _1142 = _1126 * (-2.0);
    float _1144 = float(_1114);
    float _1146 = fma(_1118, _1102, _1138);
    float _1148 = float(_1136);
    float _1150 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1152 = fma(_1142, _1044, _1044);
    float _1154 = _150 + (-0.5);
    float _1156 = _150 + _844;
    float _1158 = _1144 * _1148;
    float _1160 = _1146 * 0.15915493667125701904296875;
    float _1162 = fma(_1150, _1142, _1150);
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1152);
    float _1166 = _1156 + (-1.0);
    float _1168 = _1158 * (-2.0);
    float _1170 = in.m_55.x;
    float _1172 = in.m_55.y;
    float _1174 = in.m_55.z;
    float _1176 = in.m_55.w;
    float _1178 = fma(_1162, _1102, _1164);
    float _1180 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1182 = fma(_1168, _1048, _1048);
    float _1184 = _844 + (-0.5);
    float _1186 = in.m_57.x;
    float _1188 = in.m_57.y;
    float _1190 = in.m_57.z;
    float _1192 = fma(_1180, _1168, _1180);
    float _1194 = _1178 * 0.15915493667125701904296875;
    float _1196 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1182);
    float _1198 = _1160 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = fma(_1192, _1102, _1196);
    float _1204 = _1202 * 0.15915493667125701904296875;
    float _1206 = _1160 * 6.283185482025146484375;
    float _1208 = cos(_1206);
    float _1210 = _352 * _1172;
    float _1212 = _1194 * 6.283185482025146484375;
    float _1214 = sin(_1212);
    float _1216 = fma(_346, _1170, _1210);
    float _1218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1188);
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1186);
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1190);
    float _1224 = fma(_354, _1174, _1216);
    float _1226 = _1194 * 6.283185482025146484375;
    float _1228 = cos(_1226);
    float _1230 = _898 * _1218;
    float _1232 = _912 * _1222;
    float _1234 = in.m_59.x;
    float _1236 = in.m_59.y;
    float _1238 = in.m_59.z;
    float _1240 = in.m_59.w;
    float _1242 = _1204 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = _910 * _1220;
    float _1248 = _1214 * _1200;
    float _1250 = _1214 * _1208;
    float _1252 = _1204 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1228 * _1208;
    float _1258 = _1228 * _1200;
    float _1260 = _1200 * _1244;
    float _1262 = _1244 * _1230;
    float _1264 = _1208 * _1244;
    float _1266 = _1228 * _1262;
    float _1268 = _1214 * _1262;
    float _1270 = fma(_1254, _1256, _1248);
    float _1272 = -_1230;
    float _1274 = _1254 * _1272;
    float _1276 = fma(_1270, _1246, _1266);
    float _1278 = -_1250;
    float _1280 = fma(_1254, _1258, _1278);
    float _1282 = -_1258;
    float _1284 = fma(_1254, _1250, _1282);
    float _1286 = fma(_1264, _1246, _1274);
    float _1288 = fma(_1254, _1248, _1256);
    float _1290 = fma(_1280, _1232, _1276);
    float _1292 = fma(_1284, _1246, _1268);
    float _1294 = fma(_1260, _1232, _1286);
    float _1296 = _352 * _1236;
    float _1298 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1300 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1302 = fma(_1288, _1232, _1292);
    float _1304 = fma(_346, _1234, _1296);
    float _1306 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1298);
    float _1308 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1300);
    float _1310 = _1224 + _1176;
    float _1312 = fma(_354, _1238, _1304);
    float _1314 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1306);
    float _1316 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1308);
    float _1318 = _1312 + _1240;
    float _1320 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1322 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1324 = in.m_61.x;
    float _1326 = in.m_61.y;
    float _1328 = in.m_61.z;
    float _1330 = in.m_61.w;
    float _1332 = _1310 + _1320;
    float _1334 = _1318 + _1322;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1338 = _1332 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1342 = _1334 + _1340;
    float _1344 = _1338 * _1338;
    float _1346 = fma(_1342, _1342, _1344);
    float _1348 = sqrt(_1346);
    float _1350 = _352 * _1326;
    float _1352 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1354 = fma(_346, _1324, _1350);
    float _1356 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1352);
    float _1358 = fma(_354, _1328, _1354);
    bool _1360 = _1348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1356);
    float _1364 = _1358 + _1330;
    float _1366 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1368 = _1364 + _1366;
    float _1370 = _1328;
    float _1372 = _1358;
    float _1374 = _1302;
    float _1376 = _1290;
    if (!_1360)
    {
        _1370 = _1334;
    }
    float _1378 = _1370;
    float _1380 = _1378;
    if (!_1360)
    {
        _1372 = _1332;
    }
    float _1382 = _1372;
    float _1384 = _1382;
    if (!_1360)
    {
        _1374 = _1368;
    }
    float _1386 = _1374;
    bool _1388 = !_1360;
    float _1390 = _1386;
    if (!_1388)
    {
        float _1392 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1396 = _1348 + _1394;
        float _1398 = _1368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1400 = rsqrt(_1346);
        float _1402 = _1396 * _1392;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = _1404 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = _1404 * 6.283185482025146484375;
        float _1412 = sin(_1410);
        float _1414 = _1408 + (-1.0);
        float _1416 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1418 = fma(_1412, _1398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1420 = fma(_1368, _1408, _1416);
        float _1422 = _1400 * _1418;
        float _1424 = fma(_1342, _1422, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1426 = fma(_1338, _1422, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1390 = _1420;
        _1380 = _1424;
        _1384 = _1426;
    }
    float _1428 = _1390;
    float _1430 = _1380;
    float _1432 = _1384;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1436 = _1428 + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1440 = _1430 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1444 = _1432 + _1442;
    float _1446 = _1436 * _1436;
    float _1448 = fma(_1440, _1440, _1446);
    float _1450 = fma(_1444, _1444, _1448);
    float _1452 = rsqrt(_1450);
    float _1454 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1456 = _1440 * _1454;
    float _1458 = _1444 * _1454;
    float _1460 = _1456 * _1456;
    float _1462 = _1458 * _1458;
    float _1464 = _1460 + _1462;
    float _1466 = sqrt(_1464);
    bool _1468 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1466 + _1470;
    float _1474 = _1444;
    float _1476 = _1464;
    float _1478 = _1472;
    float _1480 = _1436;
    float _1482 = _1454;
    if (_1468)
    {
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1484;
    }
    float _1486 = _1474;
    if (_1468)
    {
        float _1488 = rsqrt(_1464);
        _1476 = _1488;
    }
    float _1490 = _1476;
    if (_1468)
    {
        float _1492 = _1472 * _1486;
        _1478 = _1492;
    }
    float _1494 = _1478;
    if (_1468)
    {
        float _1496 = _1494 * 0.15915493667125701904296875;
        _1376 = _1496;
    }
    float _1498 = _1376;
    float _1500 = _1448;
    float _1502 = _1498;
    if (_1468)
    {
        float _1504 = _1498 * 6.283185482025146484375;
        float _1506 = sin(_1504);
        _1500 = _1506;
    }
    float _1508 = _1500;
    float _1510 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1512 = precise::max(0.0, _1510);
    float _1514 = _1452;
    float _1516 = _1512;
    if (_1468)
    {
        float _1518 = _1498 * 6.283185482025146484375;
        float _1520 = cos(_1518);
        _1514 = _1520;
    }
    float _1522 = _1514;
    float _1524 = -_1454;
    float _1526 = -_1512;
    float _1528 = fma(_1436, _1524, _1526);
    float _1530 = _1528;
    if (!_1468)
    {
        _1480 = _1456;
    }
    float _1532 = _1480;
    float _1534 = _1532;
    if (_1468)
    {
        float _1536 = _1528 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1536;
    }
    float _1538 = _1516;
    float _1540 = _1538;
    float _1542 = _1508;
    if (_1468)
    {
        float _1544 = fma(_1508, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1540 = _1544;
    }
    float _1546 = _1540;
    float _1548 = _1546;
    float _1550 = _1522;
    if (_1468)
    {
        float _1552 = _1522 + (-1.0);
        _1482 = _1552;
    }
    float _1554 = _1482;
    if (_1468)
    {
        float _1556 = _1490 * _1546;
        _1502 = _1556;
    }
    float _1558 = _1502;
    if (!_1468)
    {
        _1548 = _1458;
    }
    float _1560 = _1548;
    float _1562 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = _1560;
    if (_1468)
    {
        float _1566 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1542 = _1566;
    }
    float _1568 = _1542;
    float _1570 = _1568;
    if (_1468)
    {
        float _1572 = _1456 * _1558;
        _1534 = _1572;
    }
    float _1574 = _1534;
    float _1576 = sqrt(_1450);
    if (_1468)
    {
        float _1578 = _1458 * _1558;
        _1564 = _1578;
    }
    float _1580 = _1564;
    if (_1468)
    {
        float _1582 = fma(_1528, _1522, _1568);
        _1530 = _1582;
    }
    float _1584 = _1530;
    if (!_1468)
    {
        _1550 = _1460;
    }
    float _1586 = _1550;
    float _1588 = _1586;
    if (_1468)
    {
        float _1590 = _1574 * _1574;
        _1588 = _1590;
    }
    float _1592 = _1588;
    if (!_1468)
    {
        _1570 = _1462;
    }
    float _1594 = _1570;
    float _1596 = _1594;
    if (_1468)
    {
        float _1598 = _1580 * _1580;
        _1596 = _1598;
    }
    float _1600 = _1596;
    float _1602 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1604 = fma(_1584, _1584, _1592);
    float _1606 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1608 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1610 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1612 = _1604 + _1600;
    float _1614 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1602);
    float _1616 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1606);
    float _1618 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1608);
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1622 = fma(_1576, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1620);
    float _1624 = precise::clamp(_1622, 0.0, 1.0);
    float _1626 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1614);
    float _1628 = rsqrt(_1612);
    float _1630 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1610);
    float _1632 = -_1624;
    float _1634 = _1632 + 1.0;
    float _1636 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1638 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1616);
    float _1640 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1642 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1618);
    float _1644 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1646 = abs(_1634);
    float _1648 = log2(_1646);
    float _1650 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1652 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1654 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1644);
    float _1656 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1658 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1660 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1654);
    float _1662 = _1628 * _1574;
    float _1664 = _1628 * _1584;
    float _1666 = _1628 * _1580;
    float _1668 = -_1658;
    float _1670 = fma(_1668, _1652, 1.0);
    float _1672 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1674 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1660);
    float _1676 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1678 = -_1672;
    float _1680 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1678);
    float _1682 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1684 = log2(_1670);
    float _1686 = -_1666;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1680);
    float _1690 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1692 = fma(_1688, -0.5, 0.5);
    float _1694 = fma(_1688, 0.5, 0.5);
    float _1696 = exp2(_1682);
    float _1698 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1676);
    float _1700 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1690);
    float _1702 = _1664 + 1.0;
    float _1704 = fma(_1694, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1706 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1698);
    float _1708 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1700);
    float _1710 = 1.0 / _1674;
    float _1712 = fma(_1694, _1704, -0.212114393711090087890625);
    float _1714 = _1684 * 0.693147182464599609375;
    float _1716 = fma(_1694, _1712, 1.570728778839111328125);
    float _1718 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1720 = sqrt(_1692);
    float _1722 = -_1664;
    float _1724 = fma(_1696, _1702, _1722);
    float _1726 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1706);
    float _1728 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1708);
    float _1730 = fma(_1724, 0.5, 0.5);
    float _1732 = _1726 * _1710;
    float _1734 = _1728 * _1710;
    float _1736 = fma(_1732, 0.5, 0.5);
    float _1738 = fma(_1734, -0.5, 0.5);
    float _1740 = _1720 * 0.636619746685028076171875;
    float _1742 = -_1716;
    float _1744 = fma(_1740, _1742, 1.0);
    float3 _5299 = float3(_1736, _1738, _1718);
    float _1746 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5299, float3(0.0), isnan(_5299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5299, float3(0.0), isnan(_5299)), level(0.0)).x;
    float3 _5310 = float3(_1736, _1738, _1718);
    float4 _1749 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5310, float3(0.0), isnan(_5310)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5310, float3(0.0), isnan(_5310)), level(0.0)).xyzw;
    float _1751 = _1749.x;
    float _1753 = _1749.y;
    float _1755 = _1749.z;
    float _1757 = _1749.w;
    float2 _5327 = float2(_1744, _1730);
    float3 _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5327, float2(0.0), isnan(_5327)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5327, float2(0.0), isnan(_5327)), level(0.0)).xyz;
    float _1763 = _1761.x;
    float _1765 = _1761.y;
    float _1767 = _1761.z;
    float _1769 = float(uint(_988));
    float _1771 = trunc(_1016);
    int _1773 = int(_1771);
    int _1775 = ~_988;
    int _1777 = _1775 + 1;
    float _1779 = _812 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1781 = ~_988;
    int _1783 = _1781 + 1;
    float _1785 = _810 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1787 = float(_94);
    float _1789 = _814 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1791 = abs(_878);
    float _1793 = 1.0 / _1769;
    float _1795 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1797 = float(uint(_1773));
    float _1799 = 1.0 / _1787;
    int _1801 = as_type<int>(_1793) + (-2);
    float _1803 = exp2(_1795);
    float _1805 = as_type<float>(_1801) * _1797;
    float _1807 = _1094 * _1799;
    float _1809 = trunc(_1805);
    float _1811 = precise::max(_1809, 0.0);
    uint _1814 = uint(_1811);
    float _1816 = -_1803;
    float _1818 = _1816 + 1.0;
    float _1820 = trunc(_1807);
    int _1822 = int(_1820);
    int _1824 = _1777 * int(_1814);
    int _1826 = _1824 + _1773;
    float _1828 = float(uint(_1826));
    float _1830 = as_type<float>(_1801) * _1828;
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1834 = _1832 != 0;
    float _1836 = trunc(_1830);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    bool _1842 = !_1834;
    float _1844 = _1842 ? 7.345489978790283203125 : 1.0;
    float _1846 = _1844 * _150;
    float _1848 = floor(_1846);
    int _1850 = int(_1814) + int(_1840);
    float _1852 = float(_1773);
    int _1854 = _1783 * _1850;
    int _1856 = _1854 + _1773;
    bool _1858 = _1852 >= _1088;
    bool _1860 = isnan(_1852);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan(_1088);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    bool _1870 = uint(_1856) >= uint(_988);
    float _1872 = -_1848;
    float _1874 = _1846 + _1872;
    float _1876 = trunc(_1868);
    int _1878 = int(_1876);
    bool _1880 = !_1870;
    int _1882 = _1880 ? 0 : (-1);
    float _1884 = _1874 * _1088;
    bool _1886 = _988 == 0;
    int _1888 = ~_1850;
    int _1890 = _1888 + _1882;
    int _1892 = _1890 + 1;
    int _1894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1896 = _1894 != 0;
    float _1898 = trunc(_1884);
    int _1900 = int(_1898);
    int _1902 = _988 + (-1);
    int _1904 = _988 * _1892;
    int _1906 = _1904 + _1773;
    bool _1908 = !_1896;
    int _1910 = _1908 ? 0 : 1;
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1914 = _1912 != 0;
    int _1916 = ~_1878;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    bool _1922 = !_1886;
    int _1924 = _1922 ? _1906 : (-1);
    int _1926 = abs(_1910);
    int _1928 = abs(_894);
    int _1930 = _1924 * _1920;
    int _1932 = abs(_886);
    int _1934 = _1878 * _1902;
    int _1936 = _1934 + _1930;
    bool _1938 = !_1914;
    int _1940 = _1938 ? 0 : 1;
    int _1942 = _1936 * _1791;
    int _1944 = _1900 * _1926;
    int _1946 = _1944 + _1773;
    int _1948 = abs(_1940);
    int _1950 = _1822 * _1932;
    int _1952 = _1950 + _1942;
    int _1954 = ~_988;
    int _1956 = _1954 + 1;
    int _1958 = _1946 * _1928;
    int _1960 = _1958 + _1952;
    int _1962 = _1900 * _1948;
    int _1964 = _1962 + _1960;
    int _1966 = ~_988;
    int _1968 = _1966 + 1;
    float _1970 = float(uint(_1964));
    float _1972 = as_type<float>(_1801) * _1970;
    float _1974 = trunc(_1972);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = _1968 * int(_1978);
    int _1982 = _1980 + _1964;
    float _1984 = float(uint(_1982));
    float _1986 = as_type<float>(_1801) * _1984;
    float _1988 = trunc(_1986);
    float _1990 = precise::max(_1988, 0.0);
    uint _1992 = uint(_1990);
    int _1994 = int(_1978) + int(_1992);
    float _1996 = float(uint(_1946));
    int _1998 = _1956 * _1994;
    int _2000 = _1998 + _1964;
    float _2002 = as_type<float>(_1801) * _1996;
    bool _2004 = uint(_2000) >= uint(_988);
    float _2006 = trunc(_2002);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    bool _2012 = !_2004;
    int _2014 = _2012 ? 0 : (-1);
    int _2016 = ~_1994;
    int _2018 = _2016 + _2014;
    int _2020 = _2018 + 1;
    int _2022 = _988 * _2020;
    int _2024 = _2022 + _1964;
    bool _2026 = !_1886;
    int _2028 = _2026 ? _2024 : (-1);
    int _2030 = ~_988;
    int _2032 = _2030 + 1;
    int _2034 = _2028 >> 31;
    int _2036 = _2028 & 3;
    bool _2038 = _2036 != 0;
    int _2040 = _2032 * int(_2010);
    int _2042 = _2040 + _1946;
    int _2044 = _2034 & 3;
    bool _2046 = uint(_2036) > 1u;
    int _2048 = _2028 + _2044;
    float _2050 = float(uint(_2042));
    int _2052 = _2048 >> 2;
    int _2054 = _2028 & 3;
    bool _2056 = _2054 != 0;
    float _2058 = as_type<float>(_1801) * _2050;
    int _2060 = _2052 << 4;
    int _2062 = _2060 + 368;
    int _2064 = _2056 ? 0 : 1;
    float _2066 = trunc(_2058);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    uint _2072 = uint(int(uint(_2062) >> uint(2)));
    uint _2074 = uint(int(uint(int(_2072)) >> uint(2)));
    int _2076 = int(_2072) & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    int _2080 = int(_2072) + 1;
    uint _2082 = uint(int(uint(_2080) >> uint(2)));
    int _2084 = _2080 & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    int _2088 = ~_988;
    int _2090 = _2088 + 1;
    bool _2092 = _2036 != 3;
    bool _2094 = uint(_2036) >= 2u;
    int _2096 = _2062 + 8;
    uint _2098 = uint(int(uint(_2096) >> uint(2)));
    uint _2100 = uint(int(uint(int(_2098)) >> uint(2)));
    int _2102 = int(_2098) & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    int _2106 = int(_2098) + 1;
    uint _2108 = uint(int(uint(_2106) >> uint(2)));
    int _2110 = _2106 & 3;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[int(_2108)][_2110];
    int _2114 = int(_2010) + int(_2070);
    int _2116 = ~_2064;
    int _2118 = _2116 + 1;
    int _2120 = _2118 + 1;
    int _2122 = _2120;
    if (!_2046)
    {
        int _2124 = ~_2064;
        int _2126 = _2124 + 1;
        _2122 = _2126;
    }
    int _2128 = _2122;
    int _2130 = _2090 * _2114;
    int _2132 = _2130 + _1946;
    bool _2134 = !_2038;
    int _2136 = _2134 ? 0 : 1;
    int _2138 = abs(_2128);
    bool _2140 = uint(_2132) >= uint(_988);
    int _2142 = _2094 ? 0 : 1;
    int _2144 = ~_2138;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    int _2150 = abs(_2136);
    int _2152 = ~_2142;
    int _2154 = _2152 + 1;
    int _2156 = _2154 + 1;
    int _2158 = _2156;
    if (_2092)
    {
        int _2160 = ~_2142;
        int _2162 = _2160 + 1;
        _2158 = _2162;
    }
    int _2164 = _2158;
    bool _2166 = !_2140;
    int _2168 = _2166 ? 0 : (-1);
    int _2170 = ~_2150;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    bool _2176 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2178 = isnan(0.5);
    bool _2180 = _2176 || _2178;
    bool _2182 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2184 = _2180 || _2182;
    int _2186 = abs(_2164);
    int _2188 = ~_2114;
    int _2190 = _2188 + _2168;
    int _2192 = _2190 + 1;
    int _2194 = _2148 * as_type<int>(_2086);
    bool _2196 = _2036 != 3;
    float _2198 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2200 = int(_2198);
    int _2202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2204 = _2202 != 0;
    int _2206 = _2174 * as_type<int>(_2078);
    int _2208 = _2206 + _2194;
    int _2210 = ~_2186;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = _988 * _2192;
    int _2218 = _2216 + _1946;
    bool _2220 = !_2196;
    int _2222 = _2220 ? 0 : (-1);
    int _2224 = _2214 * as_type<int>(_2104);
    int _2226 = _2224 + _2208;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2230 = _2228 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2232 = !_2204;
    int _2234 = _2232 ? 0 : 1;
    int _2236 = abs(_2222);
    float _2238 = 1.0 / _2230;
    int _2240 = abs(_2234);
    float _2242 = float(uint(_2200));
    int _2244 = ~_2236;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = abs(_2200);
    float _2252 = 1.0 / _2242;
    int _2254 = ~_2240;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    int _2260 = _2248 * as_type<int>(_2112);
    int _2262 = _2260 + _2226;
    float _2264 = float(uint(_2250));
    bool _2266 = !_1886;
    int _2268 = _2266 ? _2218 : (-1);
    int _2270 = _2262 * _2258;
    float _2272 = 1.0 / _2264;
    float _2274 = in.m_63.y;
    int _2276 = _2268 * _2240;
    int _2278 = _2276 + _2270;
    bool _2280 = _850 > 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    int _2282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2284 = _2282 != 0;
    float _2286 = float(uint(_2278));
    int _2288 = abs(_2278);
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2292 = _2290 != 0;
    float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2296 = _842 + _2294;
    bool _2298 = _150 > 0.5;
    bool _2300 = _2298 && _2284;
    bool _2302 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2304 = isnan(_842);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2310 = _2306 || _2308;
    float _2312 = float(_2310);
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2314;
    int _2318 = as_type<int>(_2252) + (-2);
    float _2320 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2322 = _842 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2324 = isnan(_842);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2330 = _2326 || _2328;
    float _2332 = float(_2330);
    float _2334 = _2316 * _2238;
    int _2336 = as_type<int>(_2272) + (-2);
    float _2338 = as_type<float>(_2318) * _2286;
    float _2340 = float(uint(_2288));
    float _2342 = fma(_2334, _2296, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2344 = -_2312;
    float _2346 = _2344 + 1.0;
    int _2348 = ~_2200;
    int _2350 = _2348 + 1;
    float _2352 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2320);
    float _2354 = trunc(_2338);
    float _2356 = precise::max(_2354, 0.0);
    uint _2358 = uint(_2356);
    float _2360 = as_type<float>(_2336) * _2340;
    float _2362 = -_2274;
    float _2364 = _2362 + 1.0;
    float _2366 = _2332 * _2346;
    float _2368 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2370 = ~_2250;
    int _2372 = _2370 + 1;
    float _2374 = trunc(_2360);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    float _2380 = _2274;
    float _2382 = as_type<float>(_2288);
    if (_2292)
    {
        float _2384 = _2280 ? _2364 : _2274;
        _2380 = _2384;
    }
    float _2386 = _2380;
    float _2388 = _2342 * _2366;
    float _2390 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2352);
    float _2392 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2368);
    float _2394 = in.m_63.x;
    float _2396 = _2390 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2398 = _2350 * int(_2358);
    int _2400 = _2398 + _2278;
    float _2402 = -_2332;
    float _2404 = _2402 + 1.0;
    float _2406 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2392);
    float _2408 = 1.0 / _2396;
    float _2410 = float(uint(_2400));
    float _2412 = fma(_2404, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2388);
    int _2414 = _2372 * int(_2378);
    int _2416 = _2414 + _2288;
    float _2418 = _2406 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2420 = as_type<float>(_2318) * _2410;
    float _2422 = fma(_2312, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2412);
    float _2424 = float(uint(_2416));
    float _2426 = _2418 + _2396;
    float _2428 = trunc(_2420);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    float _2434 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2436 = as_type<float>(_2336) * _2424;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2440 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2442 = _2426 * _2408;
    float _2444 = _2442 * 0.5;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2448 = trunc(_2436);
    float _2450 = precise::max(_2448, 0.0);
    uint _2452 = uint(_2450);
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2456 = _2440;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (!_2184)
    {
        _2456 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2460 = _2456;
    float _2462 = _2438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2464 = _2446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2466 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2468 = _2460;
    float _2470 = _2394;
    if (_2284)
    {
        _2458 = _2394;
    }
    float _2472 = _2458;
    float _2474 = _2472;
    if (!_2184)
    {
        float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2478 = fma(_2444, _2460, _2476);
        _2468 = _2478;
    }
    float _2480 = _2468;
    int _2482 = int(_2358) + int(_2432);
    out.m_67.x = _2462;
    out.m_67.y = _2464;
    out.m_67.z = _2454;
    int _2484 = ~_2200;
    int _2486 = _2484 + 1;
    if (_2300)
    {
        float _2488 = -_2472;
        float _2490 = _2488 + 1.0;
        _2474 = _2490;
    }
    float _2492 = _2474;
    float _2494 = _1789;
    if (!_2184)
    {
        float _2496 = 1.0 / _2480;
        _2494 = _2496;
    }
    float _2498 = _2494;
    int _2500 = int(_2378) + int(_2452);
    float _2502 = _2422 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_2284)
    {
        _2470 = _2492;
    }
    float _2504 = _2470;
    bool _2506 = _2200 == 0;
    int _2508 = _2486 * _2482;
    int _2510 = _2508 + _2278;
    int _2512 = ~_2250;
    int _2514 = _2512 + 1;
    float _2516 = _1779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2520 = uint(_2510) >= uint(_2200);
    int _2522 = _2514 * _2500;
    int _2524 = _2522 + _2288;
    float _2526 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2528 = _2516;
    if (!_2184)
    {
        _2382 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2530 = _2382;
    out.m_69.x = _2466;
    out.m_69.y = _2516;
    out.m_69.z = _2434;
    out.m_69.w = _2502;
    bool _2532 = !_2520;
    int _2534 = _2532 ? 0 : (-1);
    float _2536 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2526);
    bool _2538 = uint(_2524) >= uint(_2250);
    float _2540 = _2498;
    if (!_2184)
    {
        float _2542 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2544 = -_2530;
        float _2546 = fma(_2498, _2542, _2544);
        _2540 = _2546;
    }
    float _2548 = _2540;
    int _2550 = _2278 ^ _2200;
    float _2552 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2536);
    bool _2554 = !_2538;
    int _2556 = _2554 ? 0 : (-1);
    uint _2558 = uint(int(uint(_2550) >> uint(31)));
    float _2560 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2552);
    int _2562 = ~_2482;
    int _2564 = _2562 + _2534;
    int _2566 = _2564 + 1;
    float _2568 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2570 = ~_2556;
    int _2572 = _2500 + _2570;
    int _2574 = _2572 + 1;
    float _2576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2578 = ~int(_2558);
    int _2580 = _2578 + 1;
    if (!_2184)
    {
        float _2582 = -_2530;
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2528 = _2584;
    }
    float _2586 = _2528;
    int _2588 = _2200 * _2566;
    int _2590 = _2588 + _2278;
    bool _2592 = _2200 == 0;
    float _2594 = fma(_2568, _2504, -0.5);
    int _2596 = _2574 ^ _2580;
    out.gl_Position.x = _1726;
    out.gl_Position.y = _1728;
    out.gl_Position.z = _2560;
    out.gl_Position.w = _1674;
    float _2598 = _2434;
    if (!_2184)
    {
        float _2600 = 1.0 / _2586;
        _2598 = _2600;
    }
    float _2602 = _2598;
    bool _2604 = !_2592;
    float _2606 = _2604 ? as_type<float>(_2590) : as_type<float>(0xffffffffu /* nan */);
    int _2608 = ~_2580;
    int _2610 = _2608 + _2596;
    int _2612 = _2610 + 1;
    float _2614 = float(as_type<int>(_2606));
    bool _2616 = !_2506;
    int _2618 = _2616 ? _2612 : (-1);
    float _2620 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2622 = _2606;
    if (_2184)
    {
        _2622 = 1.0;
    }
    float _2624 = _2622;
    float _2626 = fma(_2568, _2614, _890);
    float _2628 = float(_2618);
    float _2630 = _2560 + _1674;
    float _2632 = fma(_2620, _2386, -0.5);
    float _2634 = fma(_1086, _2594, _2626);
    float _2636 = -_936;
    float _2638 = fma(_2620, _2628, _2636);
    float _2640 = _2624;
    if (!_2184)
    {
        float _2642 = _2548 * _2602;
        float _2644 = precise::clamp(_2642, 0.0, 1.0);
        _2640 = _2644;
    }
    float _2646 = _2640;
    float _2648 = _2630 * 0.5;
    float _2650 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2652 = fma(_1096, _2632, _2638);
    float _2654 = _2646 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2656 = _2646 > 0.0;
    bool _2658 = isnan(_2646);
    bool _2660 = _2656 || _2658;
    bool _2662 = isnan(0.0);
    bool _2664 = _2660 || _2662;
    float _2666 = _2650 * _1746;
    float _2668 = _2652 + 0.5;
    float _2670 = _2654 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2672 = -_2650;
    float _2674 = _2672 + 1.0;
    float _2676 = _1757 * _2666;
    float _2678 = _1767 * _2666;
    float _2680 = _2634 + 0.5;
    float _2682 = fma(_1763, _2676, _1751);
    float _2684 = fma(_1765, _2676, _1753);
    float _2686 = _1757 * _2674;
    float _2688 = fma(_1757, _2678, _1755);
    out.m_71.z = _2648;
    out.m_71.w = _1674;
    out.m_73.x = _2680;
    out.m_73.y = _2668;
    out.m_45.x = _2670;
    out.m_75.x = _2682;
    out.m_75.y = _2684;
    out.m_75.z = _2688;
    out.m_75.w = _2686;
    if (_2664)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2690 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2690;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

