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
    float4 m_53 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1002 = false;
    bool _608 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2284 = as_type<float>(_104);
        out.gl_Position.z = _2284;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2354 = as_type<float>(_142);
        out.gl_Position.z = _2354;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _148 * _146;
    float _168 = 0.0;
    if (!_160)
    {
        float _170 = _150 * _150;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _178 = _174;
    if (!_160)
    {
        float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = in.m_47.x;
    float _186 = in.m_47.y;
    float _188 = in.m_47.z;
    float _190 = _176 * 6.283185482025146484375;
    float _192 = floor(_176);
    float _194 = _190 * 0.15915493667125701904296875;
    float _196 = _194 * 6.283185482025146484375;
    float _198 = cos(_196);
    float _200 = -_192;
    float _202 = _176 + _200;
    float _204 = _192;
    float _206 = _182;
    if (!_160)
    {
        _204 = _150;
    }
    float _208 = _204;
    bool _210 = !_160;
    float _212 = _208;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _150 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _150);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _242;
    }
    float _244 = _206;
    bool _246 = !_160;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _150 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _212 = _266;
    }
    float _268 = _212;
    float _270 = in.m_51.w;
    float _272 = in.m_42.x;
    float _274 = in.m_42.y;
    float _276 = in.m_42.z;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = fma(_198, 0.5, 0.5);
    bool _288 = _202 < 0.5;
    float _290 = float(_288);
    float _292 = -_202;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _296 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _298 = !_280;
    int _300 = _298 ? 0 : 1;
    float _302 = -_290;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = -_286;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _310 = abs(_300);
    float _312 = fma(_268, _184, _296);
    bool _314 = !_164;
    int _316 = _314 ? 0 : 1;
    float _318 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_284;
    int _322 = _320 ? 0 : 1;
    float _324 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _328 = fma(_268, _186, _318);
    int _330 = abs(_316);
    float _332 = fma(_268, _188, _324);
    int _334 = abs(_322);
    float _336 = float(_310);
    float _338 = float(_330);
    float _340 = fma(_312, _270, _272);
    float _342 = abs(_294);
    float _344 = _336 * _342;
    float _346 = fma(_328, _270, _274);
    float _348 = fma(_332, _270, _276);
    float _350 = float(_334);
    float _352 = fma(_338, _308, _344);
    float _354 = abs(_304);
    float _356 = fma(_350, _354, _352);
    bool _358 = !_326;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_88);
        float _380 = 1.0 / _378;
        float _382 = _122 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _384 + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = _384 + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _408 = _384 + _406;
    float _410 = 1.0 / _396;
    bool _412 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _414 = isnan(_384);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _426 = 1.0 / _400;
    float _428 = 1.0 / _404;
    float _430 = _392 * _410;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _436;
    float _440 = _388 * _426;
    bool _442 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _444 = isnan(_384);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _454;
    float _458 = fma(_434, _430, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _464 = -_452;
    float _466 = _464 + 1.0;
    float _468 = fma(_456, _430, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _470 = _408 * _428;
    bool _472 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _474 = isnan(_384);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = fma(_438, _430, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _486 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_384);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = _422 * _466;
    float _500 = -_422;
    float _502 = _500 + 1.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _512 = -_482;
    float _514 = _512 + 1.0;
    float _516 = _482 * _502;
    float _518 = fma(_506, _440, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _520 = fma(_462, _440, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _522 = fma(_510, _440, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = _496 * _514;
    float _526 = in.m_51.x;
    float _528 = in.m_51.y;
    float _530 = in.m_51.z;
    float _532 = -_496;
    float _534 = _532 + 1.0;
    float _536 = _458 * _524;
    float _538 = _484 * _524;
    float _540 = _468 * _524;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _542;
    float _546 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _536);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _538);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _554;
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _540);
    float _560 = fma(_544, _470, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _562 = fma(_552, _470, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _564 = fma(_556, _470, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _566 = fma(_518, _516, _546);
    float _568 = fma(_520, _516, _548);
    float _570 = fma(_522, _516, _558);
    float _572 = fma(_560, _498, _566);
    float _574 = fma(_562, _498, _568);
    float _576 = fma(_564, _498, _570);
    float _578 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].x, _572);
    float _580 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].y, _574);
    float _582 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].z, _576);
    float _584 = _578 * _526;
    float _586 = _580 * _528;
    float _588 = _582 * _530;
    bool _590 = !_424;
    float _606;
    if (!_590)
    {
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _594 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        float _610 = float(_88);
        float _612 = 1.0 / _610;
        float _614 = _122 * _612;
        _606 = _614;
    }
    _608 = false;
    float _616 = _606;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _620 = _616 + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _638 = 1.0 / _624;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _648 = 1.0 / _632;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _652 = _616 + _650;
    bool _654 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _656 = isnan(_616);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    bool _666 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _668 = isnan(_616);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _642;
    float _680 = _652 * _638;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _684 = _616 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _688 = _616 + _686;
    float _690 = 1.0 / _628;
    float _692 = _684 * _648;
    bool _694 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _696 = isnan(_616);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _708 = _616 + _706;
    bool _710 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _712 = 1.0 / _646;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _716 = _616 + _714;
    float _718 = _620 * _678;
    bool _720 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _722 = isnan(_616);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = 1.0 / _636;
    float _734 = _716 * _690;
    float _736 = -_704;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _740;
    float _744 = -_730;
    float _746 = _744 + 1.0;
    float _748 = _730 * _738;
    float _750 = fma(_742, _680, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _752 = _688 * _712;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _766 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _768 = isnan(_616);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = fma(_756, _680, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _780 = _664 * _746;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _786 = _708 * _732;
    float _788 = fma(_760, _680, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _790 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _792 = isnan(_616);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = -_664;
    float _804 = _802 + 1.0;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _810;
    float _814 = _800 * _804;
    float _816 = -_800;
    float _818 = _816 + 1.0;
    float _820 = fma(_764, _734, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _822 = fma(_784, _734, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _824 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _826 = isnan(_616);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = _676 * _818;
    float _838 = -_676;
    float _840 = _838 + 1.0;
    float _842 = fma(_808, _734, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _844;
    float _848 = -_834;
    float _850 = _848 + 1.0;
    float _852 = _834 * _840;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _854;
    float _858 = fma(_846, _718, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _860 = _776 * _850;
    float _862 = -_776;
    float _864 = _862 + 1.0;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _870 = fma(_856, _718, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _872 = _778 * _860;
    float _874 = _788 * _860;
    float _876 = _750 * _860;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[107].x, _872);
    float _888 = fma(_812, _718, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _890 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[107].y, _874);
    float _892 = fma(_880, _752, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _894 = fma(_884, _752, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _896 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[107].z, _876);
    float _898 = fma(_868, _752, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _900 = fma(_820, _852, _886);
    float _902 = fma(_842, _852, _890);
    float _904 = fma(_822, _852, _896);
    float _906 = fma(_870, _836, _900);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _912;
    float _916 = fma(_858, _836, _902);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _918;
    float _922 = fma(_888, _836, _904);
    float _924 = fma(_892, _814, _906);
    float _926 = fma(_910, _692, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _928 = fma(_914, _692, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _930 = fma(_894, _814, _916);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _940 = fma(_920, _692, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _946 = fma(_898, _814, _922);
    float _948 = fma(_934, _786, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _950 = fma(_938, _786, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _952 = fma(_944, _786, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _954 = fma(_926, _780, _924);
    float _956 = fma(_928, _780, _930);
    float _958 = fma(_940, _780, _946);
    float _960 = fma(_948, _748, _954);
    float _962 = fma(_950, _748, _956);
    float _964 = fma(_952, _748, _958);
    float _966 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[113].x, _960);
    float _968 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[113].y, _962);
    float _970 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[113].z, _964);
    float _972 = _966 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _974 = _968 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _976 = _970 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _978 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _978;
    out.m_53.y = _980;
    out.m_53.z = _982;
    bool _984 = !_710;
    float _1000;
    if (!_984)
    {
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _988 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _992 = _990 * _986;
        float _994 = floor(_992);
        float _996 = -_994;
        float _998 = _992 + _996;
        _1000 = _998;
        _1002 = true;
    }
    else
    {
        float _1004 = float(_88);
        float _1006 = 1.0 / _1004;
        float _1008 = _122 * _1006;
        _1000 = _1008;
    }
    _1002 = false;
    float _1010 = _1000;
    float _1012 = in.m_49.y;
    float _1014 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1016 = log2(_1014);
    float _1018 = _346 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _346 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1022 = in.m_49.z;
    float _1024 = _346 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1026 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1028 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1030 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1024);
    float _1032 = _144 * 2.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1034;
    float _1038 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1026);
    float _1040 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1028);
    float _1042 = floor(_1032);
    float _1044 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1030);
    float _1046 = _1016 * _122;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1058 = _1056 != 0;
    float _1060 = _1040 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1062 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1064 = 1.0 / _1036;
    bool _1066 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1068 = isnan(_1010);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _1012 * 2.0;
    float _1080 = _144 + _1012;
    float _1082 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1084 = _1022 * 2.0;
    float _1086 = _1012 + _1022;
    float _1088 = floor(_1078);
    float _1090 = _1080 + (-1.0);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1094 = _1010 + _1092;
    float _1096 = _1086 + (-1.0);
    bool _1098 = _1042 >= 0.0;
    bool _1100 = isnan(_1042);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1110 = _1042 > 0.0;
    float _1112 = exp2(_1046);
    float _1114 = _1094 * _1064;
    int _1116 = _1106 ? 0 : 1;
    int _1118 = ~_1116;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = floor(_1084);
    bool _1126 = _1088 >= 0.0;
    bool _1128 = isnan(_1088);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.0);
    bool _1134 = _1130 || _1132;
    bool _1136 = _1088 > 0.0;
    int _1138 = _1134 ? 0 : 1;
    bool _1140 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1148 = _1144 || _1146;
    float _1150 = -_1112;
    float _1152 = _1150 + 1.0;
    float _1154 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1156 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1158 = isnan(_1010);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = _1148 ? _1152 : 0.0;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1172 = 1.0 + _1170;
    bool _1174 = _1124 >= 0.0;
    bool _1176 = isnan(_1124);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan(0.0);
    bool _1182 = _1178 || _1180;
    float _1184 = -_1166;
    float _1186 = _1184 + 1.0;
    bool _1188 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1190 = isnan(1.0);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1196 = _1192 || _1194;
    float _1198 = 1.0 / _1172;
    int _1200 = _1182 ? 0 : 1;
    bool _1202 = _1124 > 0.0;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1208;
    int _1212 = _1122;
    int _1214 = as_type<int>(_1012);
    if (!_1110)
    {
        int _1216 = ~_1116;
        int _1218 = _1216 + 1;
        _1212 = _1218;
    }
    int _1220 = _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1222;
    float _1226 = _1076 * _1186;
    float _1228 = -_1076;
    float _1230 = _1228 + 1.0;
    float _1232 = fma(_1210, _1114, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1234 = fma(_1224, _1114, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    if (_1196)
    {
        float _1236 = _1168 * _1198;
        _124 = _1236;
    }
    float _1238 = _124;
    bool _1240 = !_1054;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = fma(_1206, _1114, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1246 = _1234 * _1226;
    int _1248 = ~_1138;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1062 + _1254;
    int _1258 = abs(_1242);
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1262 = _1060 + _1260;
    float _1264 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1246);
    bool _1266 = !_1050;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = _1232 * _1226;
    int _1272 = _1252;
    if (!_1136)
    {
        int _1274 = ~_1138;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    float _1280 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1282 = _1244 * _1226;
    int _1284 = abs(_1268);
    float _1286 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1270);
    float _1288 = float(_1258);
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1292 = _1082 + _1290;
    float _1294 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1280);
    int _1296 = ~_1200;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    float _1302 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1282);
    int _1304 = _1300;
    if (!_1202)
    {
        int _1306 = ~_1200;
        int _1308 = _1306 + 1;
        _1304 = _1308;
    }
    int _1310 = _1304;
    float _1312 = in.m_55.x;
    float _1314 = in.m_55.y;
    float _1316 = in.m_55.z;
    float _1318 = float(_1220);
    float _1320 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1294);
    float _1322 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1286);
    float _1324 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1264);
    float _1326 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1302);
    float _1328 = _1262 * _1262;
    float _1330 = _1288 * _1318;
    bool _1332 = _1320 >= 0.0;
    float _1334 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1336 = float(_1284);
    float _1338 = fma(_1256, _1256, _1328);
    float _1340 = float(_1310);
    float _1342 = _1330 * (-2.0);
    float _1344 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1346 = _1326 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _1336 * _1340;
    float _1352 = fma(_1292, _1292, _1338);
    float _1354 = fma(_1154, _1342, _1154);
    float _1356 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = as_type<float>(_1310);
    if (_1332)
    {
        _1358 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1360 = _1358;
    float _1362 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = rsqrt(_1352);
    float _1366 = fma(_1342, _1314, _1314);
    float _1368 = _1012 + (-0.5);
    bool _1370 = !_1058;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = _1316;
    float _1376 = _1366;
    if (_1332)
    {
        float _1378 = _1360 * 5.0;
        _1214 = as_type<int>(_1378);
    }
    int _1380 = _1214;
    float _1382 = _1350 * (-2.0);
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1366);
    int _1386 = abs(_1372);
    out.m_57.x = _1356;
    out.m_57.y = _1348;
    out.m_57.z = _1362;
    float _1388 = fma(_1108, _1382, _1108);
    float _1390 = fma(_1354, _1238, _1384);
    float _1392 = fma(_1382, _1312, _1312);
    if (_1332)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4342 = as_type<float>(_1380);
        out.gl_Position.z = _4342;
    }
    if (_1332)
    {
        out.m_45.x = 0.0;
    }
    float _1394 = _1262 * _1364;
    float _1396 = _1256 * _1364;
    if (_1332)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1398 = -_1394;
    float _1400 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1060);
    float _1402 = -_1396;
    float _1404 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1062);
    float _1406 = float(_1386);
    float _1408 = _144 + (-0.5);
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1400 + _1410;
    float _1414 = _1292 * _1364;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1418 = _1404 + _1416;
    float _1420 = float(_1278);
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1424 = -_1414;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1428 = _144 + _1022;
    float _1430 = -_1394;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1422);
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1438 = _1426 + _1436;
    float _1440 = _1406 * _1420;
    float _1442 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1392);
    float _1444 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1434);
    float _1446 = _1428 + (-1.0);
    float _1448 = _1440 * (-2.0);
    float _1450 = -_1396;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1454 = _1432 * _1432;
    bool _1456 = _1444 >= 0.0;
    float _1458 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1460 = fma(_1448, _1316, _1316);
    float _1462 = _1022 + (-0.5);
    float _1464 = fma(_1388, _1238, _1442);
    float _1466 = fma(_1452, _1452, _1454);
    float _1468 = -_1414;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1292);
    float _1472 = fma(_1458, _1448, _1458);
    float _1474 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1460);
    float _1476 = _1390 * 0.15915493667125701904296875;
    float _1478 = _1464 * 0.15915493667125701904296875;
    float _1480 = fma(_1470, _1470, _1466);
    float _1482 = fma(_1472, _1238, _1474);
    if (_1456)
    {
        _1374 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1484 = _1374;
    float _1486 = _1476 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    int _1490 = as_type<int>(_1484);
    if (_1456)
    {
        out.m_45.x = 0.0;
    }
    if (_1456)
    {
        float _1492 = _1484 * 5.0;
        _1490 = as_type<int>(_1492);
    }
    int _1494 = _1490;
    float _1496 = _1476 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    if (_1456)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4536 = as_type<float>(_1494);
        out.gl_Position.z = _4536;
    }
    float _1500 = _1478 * 6.283185482025146484375;
    float _1502 = sin(_1500);
    float _1504 = _1478 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = sqrt(_1480);
    if (_1456)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1510 = in.m_59.x;
    float _1512 = in.m_59.y;
    float _1514 = in.m_59.z;
    float _1516 = _1482 * 0.15915493667125701904296875;
    float _1518 = _356 * _586;
    float _1520 = _356 * _588;
    float _1522 = _356 * _584;
    float _1524 = _1516 * 6.283185482025146484375;
    float _1526 = cos(_1524);
    float _1528 = _1364 * _1508;
    float _1530 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1534 = _1522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1536 = _1502 * _1498;
    float _1538 = _1528 * _1530;
    float _1540 = _1528 * _1532;
    float _1542 = _1516 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = _1528 * _1534;
    float _1548 = _1502 * _1488;
    float _1550 = _1506 * _1498;
    float _1552 = _1506 * _1488;
    float _1554 = _1502 * _1526;
    float _1556 = _1506 * _1526;
    float _1558 = _1498 * _1526;
    float _1560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1512);
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1510);
    float _1564 = _1488 * _1526;
    float _1566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1514);
    float _1568 = _1538 * _1560;
    float _1570 = _1546 * _1562;
    float _1572 = fma(_1544, _1550, _1548);
    float _1574 = _1540 * _1566;
    float _1576 = _1556 * _1568;
    float _1578 = -_1536;
    float _1580 = fma(_1544, _1552, _1578);
    float _1582 = -_1568;
    float _1584 = _1544 * _1582;
    float _1586 = -_1552;
    float _1588 = fma(_1544, _1536, _1586);
    float _1590 = fma(_1572, _1570, _1576);
    float _1592 = _1554 * _1568;
    float _1594 = fma(_1558, _1570, _1584);
    float _1596 = fma(_1544, _1548, _1550);
    float _1598 = fma(_1580, _1574, _1590);
    float _1600 = fma(_1588, _1570, _1592);
    float _1602 = fma(_1564, _1574, _1594);
    float _1604 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = fma(_1596, _1574, _1600);
    float _1608 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1610 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1612 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1608);
    float _1614 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1610);
    float _1616 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1612);
    float _1618 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1620 = _1616 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1622 = _1082 + _1618;
    float _1624 = _1062 + _1620;
    float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1628 = _1622 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1632 = _1624 + _1630;
    float _1634 = _1628 * _1628;
    float _1636 = fma(_1632, _1632, _1634);
    float _1638 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1640 = sqrt(_1636);
    float _1642 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1638);
    float _1644 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1642);
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1648 = _1060 + _1646;
    bool _1650 = _1640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1598;
    float _1654 = _1646;
    float _1656 = _1624;
    float _1658 = _1550;
    float _1660 = _1648;
    if (!_1650)
    {
        _1652 = _1622;
    }
    float _1662 = _1652;
    float _1664 = _1662;
    if (!_1650)
    {
        _1654 = _1648;
    }
    float _1666 = _1654;
    bool _1668 = !_1650;
    float _1670 = _1666;
    if (!_1668)
    {
        float _1672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1676 = _1640 + _1674;
        float _1678 = rsqrt(_1636);
        float _1680 = _1676 * _1672;
        float _1682 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1684 = _1680 * 0.15915493667125701904296875;
        float _1686 = _1684 * 6.283185482025146484375;
        float _1688 = cos(_1686);
        float _1690 = _1684 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = _1688 + (-1.0);
        float _1696 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = fma(_1692, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1700 = fma(_1648, _1688, _1696);
        float _1702 = _1678 * _1698;
        float _1704 = fma(_1632, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1706 = fma(_1628, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1670 = _1700;
        _1656 = _1704;
        _1664 = _1706;
        _1658 = _1684;
    }
    float _1708 = _1670;
    float _1710 = _1656;
    float _1712 = _1664;
    float _1714 = _1658;
    float _1716 = -_1394;
    float _1718 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1708);
    float _1720 = -_1396;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1710);
    float _1724 = -_1414;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1712);
    float _1728 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1730 = _1718 + _1728;
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1734 = _1722 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1738 = _1726 + _1736;
    float _1740 = _1730 * _1730;
    float _1742 = fma(_1734, _1734, _1740);
    float _1744 = fma(_1738, _1738, _1742);
    float _1746 = rsqrt(_1744);
    float _1748 = sqrt(_1744);
    float _1750 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1752 = _1734 * _1750;
    float _1754 = _1738 * _1750;
    float _1756 = _1752 * _1752;
    float _1758 = _1754 * _1754;
    float _1760 = _1756 + _1758;
    float _1762 = sqrt(_1760);
    bool _1764 = _1762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1768 = _1762 + _1766;
    float _1770 = _1738;
    float _1772 = _1714;
    float _1774 = _1768;
    float _1776 = _1730;
    if (_1764)
    {
        float _1778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _1778;
    }
    float _1780 = _1770;
    if (_1764)
    {
        float _1782 = rsqrt(_1760);
        _1772 = _1782;
    }
    float _1784 = _1772;
    float _1786 = _1784;
    if (_1764)
    {
        float _1788 = _1768 * _1780;
        _1774 = _1788;
    }
    float _1790 = _1774;
    if (_1764)
    {
        float _1792 = _1790 * 0.15915493667125701904296875;
        _1660 = _1792;
    }
    float _1794 = _1660;
    float _1796 = _1746;
    if (_1764)
    {
        float _1798 = _1794 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        _1796 = _1800;
    }
    float _1802 = _1796;
    float _1804 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1806 = precise::max(0.0, _1804);
    float _1808 = _1740;
    float _1810 = _1806;
    float _1812 = _1804;
    if (_1764)
    {
        float _1814 = _1794 * 6.283185482025146484375;
        float _1816 = cos(_1814);
        _1808 = _1816;
    }
    float _1818 = _1808;
    float _1820 = -_1750;
    float _1822 = -_1806;
    float _1824 = fma(_1730, _1820, _1822);
    if (!_1764)
    {
        _1776 = _1754;
    }
    float _1826 = _1776;
    float _1828 = _1826;
    if (_1764)
    {
        float _1830 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1810 = _1830;
    }
    float _1832 = _1810;
    float _1834 = _1832;
    float _1836 = _1802;
    if (_1764)
    {
        float _1838 = fma(_1802, _1832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1834 = _1838;
    }
    float _1840 = _1834;
    float _1842 = _1840;
    if (!_1764)
    {
        _1836 = _1752;
    }
    float _1844 = _1836;
    float _1846 = _1844;
    float _1848 = _1818;
    if (_1764)
    {
        float _1850 = _1818 + (-1.0);
        _1812 = _1850;
    }
    float _1852 = _1812;
    float _1854 = _1852;
    if (_1764)
    {
        float _1856 = _1784 * _1840;
        _1376 = _1856;
    }
    float _1858 = _1376;
    if (!_1764)
    {
        _1842 = _1824;
    }
    float _1860 = _1842;
    float _1862 = _1860;
    if (_1764)
    {
        float _1864 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1786 = _1864;
    }
    float _1866 = _1786;
    if (_1764)
    {
        float _1868 = _1752 * _1858;
        _1846 = _1868;
    }
    float _1870 = _1846;
    if (!_1764)
    {
        _1854 = _1756;
    }
    float _1872 = _1854;
    float _1874 = _1872;
    if (_1764)
    {
        float _1876 = _1754 * _1858;
        _1828 = _1876;
    }
    float _1878 = _1828;
    if (_1764)
    {
        float _1880 = fma(_1824, _1818, _1866);
        _1862 = _1880;
    }
    float _1882 = _1862;
    if (_1764)
    {
        float _1884 = _1870 * _1870;
        _1874 = _1884;
    }
    float _1886 = _1874;
    if (!_1764)
    {
        _1848 = _1758;
    }
    float _1888 = _1848;
    float _1890 = _1888;
    if (_1764)
    {
        float _1892 = _1878 * _1878;
        _1890 = _1892;
    }
    float _1894 = _1890;
    float _1896 = fma(_1882, _1882, _1886);
    float _1898 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1900 = _1896 + _1894;
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1904 = fma(_1748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1902);
    float _1906 = precise::clamp(_1904, 0.0, 1.0);
    float _1908 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1898);
    float _1910 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1912 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1914 = -_1906;
    float _1916 = _1914 + 1.0;
    float _1918 = rsqrt(_1900);
    float _1920 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1922 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1908);
    float _1924 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1910);
    float _1926 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1928 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1920);
    float _1930 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1912);
    float _1932 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1924);
    float _1934 = abs(_1916);
    float _1936 = log2(_1934);
    float _1938 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1928);
    float _1940 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1930);
    float _1942 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1944 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1948 = _1940 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1952 = _1918 * _1870;
    float _1954 = _1918 * _1882;
    float _1956 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1958 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1950);
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1962 = _1918 * _1878;
    float _1964 = -_1956;
    float _1966 = fma(_1964, _1926, 1.0);
    float _1968 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1958);
    float _1970 = -_1960;
    float _1972 = fma(_1954, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1970);
    float _1974 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1976 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1978 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1968);
    float _1980 = -_1962;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1972);
    float _1984 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1986 = log2(_1966);
    float _1988 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1976);
    float _1990 = fma(_1982, -0.5, 0.5);
    float _1992 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1984);
    float _1994 = fma(_1982, 0.5, 0.5);
    float _1996 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1988);
    float _1998 = _1954 + 1.0;
    float _2000 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1992);
    float _2002 = exp2(_1974);
    float _2004 = fma(_1994, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2006 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2000);
    float _2008 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1996);
    float _2010 = fma(_1994, _2004, -0.212114393711090087890625);
    float _2012 = 1.0 / _1978;
    float _2014 = _1986 * 0.693147182464599609375;
    float _2016 = fma(_1994, _2010, 1.570728778839111328125);
    float _2018 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2020 = sqrt(_1990);
    float _2022 = -_1954;
    float _2024 = fma(_2002, _1998, _2022);
    float _2026 = fma(_2024, 0.5, 0.5);
    float _2028 = _2006 * _2012;
    float _2030 = _2008 * _2012;
    float _2032 = fma(_2028, 0.5, 0.5);
    float _2034 = fma(_2030, -0.5, 0.5);
    float _2036 = _2020 * 0.636619746685028076171875;
    float3 _5418 = float3(_2032, _2034, _2018);
    float _2038 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5418, float3(0.0), isnan(_5418)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5418, float3(0.0), isnan(_5418)), level(0.0)).x;
    float3 _5429 = float3(_2032, _2034, _2018);
    float4 _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5429, float3(0.0), isnan(_5429)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5429, float3(0.0), isnan(_5429)), level(0.0)).xyzw;
    float _2043 = _2041.x;
    float _2045 = _2041.y;
    float _2047 = _2041.z;
    float _2049 = _2041.w;
    float _2051 = -_2016;
    float _2053 = fma(_2036, _2051, 1.0);
    float2 _5451 = float2(_2053, _2026);
    float3 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5451, float2(0.0), isnan(_5451)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5451, float2(0.0), isnan(_5451)), level(0.0)).xyz;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = in.m_61.x;
    float _2067 = in.m_61.y;
    float _2069 = in.m_61.z;
    bool _2071 = _1512 != 0.0;
    bool _2073 = isnan(_1512);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(0.0);
    bool _2079 = _2075 || _2077;
    float _2081 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2083 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2085 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2087 = _1510 == 0.0;
    bool _2089 = !_2079;
    bool _2091 = _2087 && _2089;
    float _2093 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2095 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2097 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2099 = _1514 == 0.0;
    bool _2101 = _2099 && _2091;
    float _2103 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2105 = -_1544;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2095);
    float _2109 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2083);
    float _2111 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2113 = -_1544;
    float _2115 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2093);
    float _2117 = -_1544;
    float _2119 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2081);
    float _2121 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2097);
    float _2123 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2103);
    float _2125 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2127 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2111);
    float _2129 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2131 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2121);
    float _2133 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2123);
    float _2135 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2125);
    float _2137 = _2067;
    float _2139 = _2065;
    float _2141 = _2069;
    if (!_2101)
    {
        float _2143 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2067);
        _2137 = _2143;
    }
    float _2145 = _2137;
    float _2147 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2109);
    if (!_2101)
    {
        float _2149 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2065);
        _2139 = _2149;
    }
    float _2151 = _2139;
    float _2153 = exp2(_2085);
    if (!_2101)
    {
        float _2155 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2069);
        _2141 = _2155;
    }
    float _2157 = _2141;
    float _2159 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2115);
    float _2161 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2119);
    float _2163 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2107);
    float _2165 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2167 = _2159 * _2145;
    float _2169 = _2161 * _2145;
    float _2171 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2127);
    float _2173 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2129);
    float _2175 = _2163 * _2145;
    float _2177 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2135);
    float _2179 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2165);
    float _2181 = fma(_2131, _2151, _2167);
    float _2183 = fma(_2133, _2151, _2169);
    float _2185 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2173);
    float _2187 = -_2153;
    float _2189 = _2187 + 1.0;
    float _2191 = fma(_2171, _2151, _2175);
    float _2193 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2179);
    float _2195 = fma(_2147, _2157, _2181);
    float _2197 = fma(_2177, _2157, _2183);
    float _2199 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2201 = fma(_2185, _2157, _2191);
    float _2203 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2193);
    out.m_45.x = 1.0;
    float _2205 = _2203 + _1978;
    out.m_63.x = _2195;
    out.m_63.y = _2197;
    out.m_63.z = _2201;
    float _2207 = _2205 * 0.5;
    out.gl_Position.x = _2006;
    out.gl_Position.y = _2008;
    out.gl_Position.z = _2203;
    out.gl_Position.w = _1978;
    out.m_65.z = _2207;
    out.m_65.w = _1978;
    float _2209 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2211 = -_2199;
    float _2213 = _2211 + 1.0;
    out.m_67.w = _2209;
    float _2215 = _2199 * _2038;
    float _2217 = _2049 * _2213;
    float _2219 = _2049 * _2215;
    float _2221 = _2063 * _2215;
    float _2223 = fma(_2059, _2219, _2043);
    float _2225 = fma(_2061, _2219, _2045);
    float _2227 = fma(_2049, _2221, _2047);
    out.m_69.x = _2223;
    out.m_69.y = _2225;
    out.m_69.z = _2227;
    out.m_69.w = _2217;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1002 = false;
    bool _608 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2284 = as_type<float>(_104);
        out.gl_Position.z = _2284;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2354 = as_type<float>(_142);
        out.gl_Position.z = _2354;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _148 * _146;
    float _168 = 0.0;
    if (!_160)
    {
        float _170 = _150 * _150;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _178 = _174;
    if (!_160)
    {
        float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = in.m_47.x;
    float _186 = in.m_47.y;
    float _188 = in.m_47.z;
    float _190 = _176 * 6.283185482025146484375;
    float _192 = floor(_176);
    float _194 = _190 * 0.15915493667125701904296875;
    float _196 = _194 * 6.283185482025146484375;
    float _198 = cos(_196);
    float _200 = -_192;
    float _202 = _176 + _200;
    float _204 = _192;
    float _206 = _182;
    if (!_160)
    {
        _204 = _150;
    }
    float _208 = _204;
    bool _210 = !_160;
    float _212 = _208;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _150 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _150);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _242;
    }
    float _244 = _206;
    bool _246 = !_160;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _150 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _212 = _266;
    }
    float _268 = _212;
    float _270 = in.m_51.w;
    float _272 = in.m_42.x;
    float _274 = in.m_42.y;
    float _276 = in.m_42.z;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = fma(_198, 0.5, 0.5);
    bool _288 = _202 < 0.5;
    float _290 = float(_288);
    float _292 = -_202;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _296 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _298 = !_280;
    int _300 = _298 ? 0 : 1;
    float _302 = -_290;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = -_286;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _310 = abs(_300);
    float _312 = fma(_268, _184, _296);
    bool _314 = !_164;
    int _316 = _314 ? 0 : 1;
    float _318 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_284;
    int _322 = _320 ? 0 : 1;
    float _324 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _328 = fma(_268, _186, _318);
    int _330 = abs(_316);
    float _332 = fma(_268, _188, _324);
    int _334 = abs(_322);
    float _336 = float(_310);
    float _338 = float(_330);
    float _340 = fma(_312, _270, _272);
    float _342 = abs(_294);
    float _344 = _336 * _342;
    float _346 = fma(_328, _270, _274);
    float _348 = fma(_332, _270, _276);
    float _350 = float(_334);
    float _352 = fma(_338, _308, _344);
    float _354 = abs(_304);
    float _356 = fma(_350, _354, _352);
    bool _358 = !_326;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_88);
        float _380 = 1.0 / _378;
        float _382 = _122 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _384 + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = _384 + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _408 = _384 + _406;
    float _410 = 1.0 / _396;
    bool _412 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _414 = isnan(_384);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _426 = 1.0 / _400;
    float _428 = 1.0 / _404;
    float _430 = _392 * _410;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _436;
    float _440 = _388 * _426;
    bool _442 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _444 = isnan(_384);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _454;
    float _458 = fma(_434, _430, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _464 = -_452;
    float _466 = _464 + 1.0;
    float _468 = fma(_456, _430, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _470 = _408 * _428;
    bool _472 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _474 = isnan(_384);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = fma(_438, _430, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _486 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_384);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = _422 * _466;
    float _500 = -_422;
    float _502 = _500 + 1.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _512 = -_482;
    float _514 = _512 + 1.0;
    float _516 = _482 * _502;
    float _518 = fma(_506, _440, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _520 = fma(_462, _440, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _522 = fma(_510, _440, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = _496 * _514;
    float _526 = in.m_51.x;
    float _528 = in.m_51.y;
    float _530 = in.m_51.z;
    float _532 = -_496;
    float _534 = _532 + 1.0;
    float _536 = _458 * _524;
    float _538 = _484 * _524;
    float _540 = _468 * _524;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _542;
    float _546 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _536);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _538);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _554;
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _540);
    float _560 = fma(_544, _470, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _562 = fma(_552, _470, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _564 = fma(_556, _470, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _566 = fma(_518, _516, _546);
    float _568 = fma(_520, _516, _548);
    float _570 = fma(_522, _516, _558);
    float _572 = fma(_560, _498, _566);
    float _574 = fma(_562, _498, _568);
    float _576 = fma(_564, _498, _570);
    float _578 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].x, _572);
    float _580 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].y, _574);
    float _582 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].z, _576);
    float _584 = _578 * _526;
    float _586 = _580 * _528;
    float _588 = _582 * _530;
    bool _590 = !_424;
    float _606;
    if (!_590)
    {
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _594 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        float _610 = float(_88);
        float _612 = 1.0 / _610;
        float _614 = _122 * _612;
        _606 = _614;
    }
    _608 = false;
    float _616 = _606;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _620 = _616 + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _638 = 1.0 / _624;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _648 = 1.0 / _632;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _652 = _616 + _650;
    bool _654 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _656 = isnan(_616);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    bool _666 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _668 = isnan(_616);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _642;
    float _680 = _652 * _638;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _684 = _616 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _688 = _616 + _686;
    float _690 = 1.0 / _628;
    float _692 = _684 * _648;
    bool _694 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _696 = isnan(_616);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _708 = _616 + _706;
    bool _710 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _712 = 1.0 / _646;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _716 = _616 + _714;
    float _718 = _620 * _678;
    bool _720 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _722 = isnan(_616);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = 1.0 / _636;
    float _734 = _716 * _690;
    float _736 = -_704;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _740;
    float _744 = -_730;
    float _746 = _744 + 1.0;
    float _748 = _730 * _738;
    float _750 = fma(_742, _680, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _752 = _688 * _712;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _766 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _768 = isnan(_616);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = fma(_756, _680, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _780 = _664 * _746;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _786 = _708 * _732;
    float _788 = fma(_760, _680, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _790 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _792 = isnan(_616);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = -_664;
    float _804 = _802 + 1.0;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _810;
    float _814 = _800 * _804;
    float _816 = -_800;
    float _818 = _816 + 1.0;
    float _820 = fma(_764, _734, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _822 = fma(_784, _734, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _824 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _826 = isnan(_616);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = _676 * _818;
    float _838 = -_676;
    float _840 = _838 + 1.0;
    float _842 = fma(_808, _734, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _844;
    float _848 = -_834;
    float _850 = _848 + 1.0;
    float _852 = _834 * _840;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _854;
    float _858 = fma(_846, _718, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _860 = _776 * _850;
    float _862 = -_776;
    float _864 = _862 + 1.0;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _870 = fma(_856, _718, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _872 = _778 * _860;
    float _874 = _788 * _860;
    float _876 = _750 * _860;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[107].x, _872);
    float _888 = fma(_812, _718, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _890 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[107].y, _874);
    float _892 = fma(_880, _752, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _894 = fma(_884, _752, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _896 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[107].z, _876);
    float _898 = fma(_868, _752, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _900 = fma(_820, _852, _886);
    float _902 = fma(_842, _852, _890);
    float _904 = fma(_822, _852, _896);
    float _906 = fma(_870, _836, _900);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _912;
    float _916 = fma(_858, _836, _902);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _918;
    float _922 = fma(_888, _836, _904);
    float _924 = fma(_892, _814, _906);
    float _926 = fma(_910, _692, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _928 = fma(_914, _692, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _930 = fma(_894, _814, _916);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _940 = fma(_920, _692, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _946 = fma(_898, _814, _922);
    float _948 = fma(_934, _786, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _950 = fma(_938, _786, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _952 = fma(_944, _786, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _954 = fma(_926, _780, _924);
    float _956 = fma(_928, _780, _930);
    float _958 = fma(_940, _780, _946);
    float _960 = fma(_948, _748, _954);
    float _962 = fma(_950, _748, _956);
    float _964 = fma(_952, _748, _958);
    float _966 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[113].x, _960);
    float _968 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[113].y, _962);
    float _970 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[113].z, _964);
    float _972 = _966 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _974 = _968 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _976 = _970 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _978 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _978;
    out.m_53.y = _980;
    out.m_53.z = _982;
    bool _984 = !_710;
    float _1000;
    if (!_984)
    {
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _988 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _992 = _990 * _986;
        float _994 = floor(_992);
        float _996 = -_994;
        float _998 = _992 + _996;
        _1000 = _998;
        _1002 = true;
    }
    else
    {
        float _1004 = float(_88);
        float _1006 = 1.0 / _1004;
        float _1008 = _122 * _1006;
        _1000 = _1008;
    }
    _1002 = false;
    float _1010 = _1000;
    float _1012 = in.m_49.y;
    float _1014 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1016 = log2(_1014);
    float _1018 = _346 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _346 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1022 = in.m_49.z;
    float _1024 = _346 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1026 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1028 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1030 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1024);
    float _1032 = _144 * 2.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1034;
    float _1038 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1026);
    float _1040 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1028);
    float _1042 = floor(_1032);
    float _1044 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1030);
    float _1046 = _1016 * _122;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1058 = _1056 != 0;
    float _1060 = _1040 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1062 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1064 = 1.0 / _1036;
    bool _1066 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1068 = isnan(_1010);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _1012 * 2.0;
    float _1080 = _144 + _1012;
    float _1082 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1084 = _1022 * 2.0;
    float _1086 = _1012 + _1022;
    float _1088 = floor(_1078);
    float _1090 = _1080 + (-1.0);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1094 = _1010 + _1092;
    float _1096 = _1086 + (-1.0);
    bool _1098 = _1042 >= 0.0;
    bool _1100 = isnan(_1042);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1110 = _1042 > 0.0;
    float _1112 = exp2(_1046);
    float _1114 = _1094 * _1064;
    int _1116 = _1106 ? 0 : 1;
    int _1118 = ~_1116;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = floor(_1084);
    bool _1126 = _1088 >= 0.0;
    bool _1128 = isnan(_1088);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.0);
    bool _1134 = _1130 || _1132;
    bool _1136 = _1088 > 0.0;
    int _1138 = _1134 ? 0 : 1;
    bool _1140 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1148 = _1144 || _1146;
    float _1150 = -_1112;
    float _1152 = _1150 + 1.0;
    float _1154 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1156 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1158 = isnan(_1010);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = _1148 ? _1152 : 0.0;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1172 = 1.0 + _1170;
    bool _1174 = _1124 >= 0.0;
    bool _1176 = isnan(_1124);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan(0.0);
    bool _1182 = _1178 || _1180;
    float _1184 = -_1166;
    float _1186 = _1184 + 1.0;
    bool _1188 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1190 = isnan(1.0);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1196 = _1192 || _1194;
    float _1198 = 1.0 / _1172;
    int _1200 = _1182 ? 0 : 1;
    bool _1202 = _1124 > 0.0;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1208;
    int _1212 = _1122;
    int _1214 = as_type<int>(_1012);
    if (!_1110)
    {
        int _1216 = ~_1116;
        int _1218 = _1216 + 1;
        _1212 = _1218;
    }
    int _1220 = _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1222;
    float _1226 = _1076 * _1186;
    float _1228 = -_1076;
    float _1230 = _1228 + 1.0;
    float _1232 = fma(_1210, _1114, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1234 = fma(_1224, _1114, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    if (_1196)
    {
        float _1236 = _1168 * _1198;
        _124 = _1236;
    }
    float _1238 = _124;
    bool _1240 = !_1054;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = fma(_1206, _1114, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1246 = _1234 * _1226;
    int _1248 = ~_1138;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1062 + _1254;
    int _1258 = abs(_1242);
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1262 = _1060 + _1260;
    float _1264 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1246);
    bool _1266 = !_1050;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = _1232 * _1226;
    int _1272 = _1252;
    if (!_1136)
    {
        int _1274 = ~_1138;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    float _1280 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1282 = _1244 * _1226;
    int _1284 = abs(_1268);
    float _1286 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1270);
    float _1288 = float(_1258);
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1292 = _1082 + _1290;
    float _1294 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1280);
    int _1296 = ~_1200;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    float _1302 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1282);
    int _1304 = _1300;
    if (!_1202)
    {
        int _1306 = ~_1200;
        int _1308 = _1306 + 1;
        _1304 = _1308;
    }
    int _1310 = _1304;
    float _1312 = in.m_55.x;
    float _1314 = in.m_55.y;
    float _1316 = in.m_55.z;
    float _1318 = float(_1220);
    float _1320 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1294);
    float _1322 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1286);
    float _1324 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1264);
    float _1326 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1302);
    float _1328 = _1262 * _1262;
    float _1330 = _1288 * _1318;
    bool _1332 = _1320 >= 0.0;
    float _1334 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1336 = float(_1284);
    float _1338 = fma(_1256, _1256, _1328);
    float _1340 = float(_1310);
    float _1342 = _1330 * (-2.0);
    float _1344 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1346 = _1326 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _1336 * _1340;
    float _1352 = fma(_1292, _1292, _1338);
    float _1354 = fma(_1154, _1342, _1154);
    float _1356 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = as_type<float>(_1310);
    if (_1332)
    {
        _1358 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1360 = _1358;
    float _1362 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = rsqrt(_1352);
    float _1366 = fma(_1342, _1314, _1314);
    float _1368 = _1012 + (-0.5);
    bool _1370 = !_1058;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = _1316;
    float _1376 = _1366;
    if (_1332)
    {
        float _1378 = _1360 * 5.0;
        _1214 = as_type<int>(_1378);
    }
    int _1380 = _1214;
    float _1382 = _1350 * (-2.0);
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1366);
    int _1386 = abs(_1372);
    out.m_57.x = _1356;
    out.m_57.y = _1348;
    out.m_57.z = _1362;
    float _1388 = fma(_1108, _1382, _1108);
    float _1390 = fma(_1354, _1238, _1384);
    float _1392 = fma(_1382, _1312, _1312);
    if (_1332)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4342 = as_type<float>(_1380);
        out.gl_Position.z = _4342;
    }
    if (_1332)
    {
        out.m_45.x = 0.0;
    }
    float _1394 = _1262 * _1364;
    float _1396 = _1256 * _1364;
    if (_1332)
    {
        return out;
    }
    float _1398 = -_1394;
    float _1400 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1060);
    float _1402 = -_1396;
    float _1404 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1062);
    float _1406 = float(_1386);
    float _1408 = _144 + (-0.5);
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1400 + _1410;
    float _1414 = _1292 * _1364;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1418 = _1404 + _1416;
    float _1420 = float(_1278);
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1424 = -_1414;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1428 = _144 + _1022;
    float _1430 = -_1394;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1422);
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1438 = _1426 + _1436;
    float _1440 = _1406 * _1420;
    float _1442 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1392);
    float _1444 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1434);
    float _1446 = _1428 + (-1.0);
    float _1448 = _1440 * (-2.0);
    float _1450 = -_1396;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1454 = _1432 * _1432;
    bool _1456 = _1444 >= 0.0;
    float _1458 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1460 = fma(_1448, _1316, _1316);
    float _1462 = _1022 + (-0.5);
    float _1464 = fma(_1388, _1238, _1442);
    float _1466 = fma(_1452, _1452, _1454);
    float _1468 = -_1414;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1292);
    float _1472 = fma(_1458, _1448, _1458);
    float _1474 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1460);
    float _1476 = _1390 * 0.15915493667125701904296875;
    float _1478 = _1464 * 0.15915493667125701904296875;
    float _1480 = fma(_1470, _1470, _1466);
    float _1482 = fma(_1472, _1238, _1474);
    if (_1456)
    {
        _1374 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1484 = _1374;
    float _1486 = _1476 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    int _1490 = as_type<int>(_1484);
    if (_1456)
    {
        out.m_45.x = 0.0;
    }
    if (_1456)
    {
        float _1492 = _1484 * 5.0;
        _1490 = as_type<int>(_1492);
    }
    int _1494 = _1490;
    float _1496 = _1476 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    if (_1456)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4536 = as_type<float>(_1494);
        out.gl_Position.z = _4536;
    }
    float _1500 = _1478 * 6.283185482025146484375;
    float _1502 = sin(_1500);
    float _1504 = _1478 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = sqrt(_1480);
    if (_1456)
    {
        return out;
    }
    float _1510 = in.m_59.x;
    float _1512 = in.m_59.y;
    float _1514 = in.m_59.z;
    float _1516 = _1482 * 0.15915493667125701904296875;
    float _1518 = _356 * _586;
    float _1520 = _356 * _588;
    float _1522 = _356 * _584;
    float _1524 = _1516 * 6.283185482025146484375;
    float _1526 = cos(_1524);
    float _1528 = _1364 * _1508;
    float _1530 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1534 = _1522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1536 = _1502 * _1498;
    float _1538 = _1528 * _1530;
    float _1540 = _1528 * _1532;
    float _1542 = _1516 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = _1528 * _1534;
    float _1548 = _1502 * _1488;
    float _1550 = _1506 * _1498;
    float _1552 = _1506 * _1488;
    float _1554 = _1502 * _1526;
    float _1556 = _1506 * _1526;
    float _1558 = _1498 * _1526;
    float _1560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1512);
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1510);
    float _1564 = _1488 * _1526;
    float _1566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1514);
    float _1568 = _1538 * _1560;
    float _1570 = _1546 * _1562;
    float _1572 = fma(_1544, _1550, _1548);
    float _1574 = _1540 * _1566;
    float _1576 = _1556 * _1568;
    float _1578 = -_1536;
    float _1580 = fma(_1544, _1552, _1578);
    float _1582 = -_1568;
    float _1584 = _1544 * _1582;
    float _1586 = -_1552;
    float _1588 = fma(_1544, _1536, _1586);
    float _1590 = fma(_1572, _1570, _1576);
    float _1592 = _1554 * _1568;
    float _1594 = fma(_1558, _1570, _1584);
    float _1596 = fma(_1544, _1548, _1550);
    float _1598 = fma(_1580, _1574, _1590);
    float _1600 = fma(_1588, _1570, _1592);
    float _1602 = fma(_1564, _1574, _1594);
    float _1604 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = fma(_1596, _1574, _1600);
    float _1608 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1610 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1612 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1608);
    float _1614 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1610);
    float _1616 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1612);
    float _1618 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1620 = _1616 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1622 = _1082 + _1618;
    float _1624 = _1062 + _1620;
    float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1628 = _1622 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1632 = _1624 + _1630;
    float _1634 = _1628 * _1628;
    float _1636 = fma(_1632, _1632, _1634);
    float _1638 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1640 = sqrt(_1636);
    float _1642 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1638);
    float _1644 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1642);
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1648 = _1060 + _1646;
    bool _1650 = _1640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1598;
    float _1654 = _1646;
    float _1656 = _1624;
    float _1658 = _1550;
    float _1660 = _1648;
    if (!_1650)
    {
        _1652 = _1622;
    }
    float _1662 = _1652;
    float _1664 = _1662;
    if (!_1650)
    {
        _1654 = _1648;
    }
    float _1666 = _1654;
    bool _1668 = !_1650;
    float _1670 = _1666;
    if (!_1668)
    {
        float _1672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1676 = _1640 + _1674;
        float _1678 = rsqrt(_1636);
        float _1680 = _1676 * _1672;
        float _1682 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1684 = _1680 * 0.15915493667125701904296875;
        float _1686 = _1684 * 6.283185482025146484375;
        float _1688 = cos(_1686);
        float _1690 = _1684 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = _1688 + (-1.0);
        float _1696 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = fma(_1692, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1700 = fma(_1648, _1688, _1696);
        float _1702 = _1678 * _1698;
        float _1704 = fma(_1632, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1706 = fma(_1628, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1670 = _1700;
        _1656 = _1704;
        _1664 = _1706;
        _1658 = _1684;
    }
    float _1708 = _1670;
    float _1710 = _1656;
    float _1712 = _1664;
    float _1714 = _1658;
    float _1716 = -_1394;
    float _1718 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1708);
    float _1720 = -_1396;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1710);
    float _1724 = -_1414;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1712);
    float _1728 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1730 = _1718 + _1728;
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1734 = _1722 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1738 = _1726 + _1736;
    float _1740 = _1730 * _1730;
    float _1742 = fma(_1734, _1734, _1740);
    float _1744 = fma(_1738, _1738, _1742);
    float _1746 = rsqrt(_1744);
    float _1748 = sqrt(_1744);
    float _1750 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1752 = _1734 * _1750;
    float _1754 = _1738 * _1750;
    float _1756 = _1752 * _1752;
    float _1758 = _1754 * _1754;
    float _1760 = _1756 + _1758;
    float _1762 = sqrt(_1760);
    bool _1764 = _1762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1768 = _1762 + _1766;
    float _1770 = _1738;
    float _1772 = _1714;
    float _1774 = _1768;
    float _1776 = _1730;
    if (_1764)
    {
        float _1778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _1778;
    }
    float _1780 = _1770;
    if (_1764)
    {
        float _1782 = rsqrt(_1760);
        _1772 = _1782;
    }
    float _1784 = _1772;
    float _1786 = _1784;
    if (_1764)
    {
        float _1788 = _1768 * _1780;
        _1774 = _1788;
    }
    float _1790 = _1774;
    if (_1764)
    {
        float _1792 = _1790 * 0.15915493667125701904296875;
        _1660 = _1792;
    }
    float _1794 = _1660;
    float _1796 = _1746;
    if (_1764)
    {
        float _1798 = _1794 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        _1796 = _1800;
    }
    float _1802 = _1796;
    float _1804 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1806 = precise::max(0.0, _1804);
    float _1808 = _1740;
    float _1810 = _1806;
    float _1812 = _1804;
    if (_1764)
    {
        float _1814 = _1794 * 6.283185482025146484375;
        float _1816 = cos(_1814);
        _1808 = _1816;
    }
    float _1818 = _1808;
    float _1820 = -_1750;
    float _1822 = -_1806;
    float _1824 = fma(_1730, _1820, _1822);
    if (!_1764)
    {
        _1776 = _1754;
    }
    float _1826 = _1776;
    float _1828 = _1826;
    if (_1764)
    {
        float _1830 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1810 = _1830;
    }
    float _1832 = _1810;
    float _1834 = _1832;
    float _1836 = _1802;
    if (_1764)
    {
        float _1838 = fma(_1802, _1832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1834 = _1838;
    }
    float _1840 = _1834;
    float _1842 = _1840;
    if (!_1764)
    {
        _1836 = _1752;
    }
    float _1844 = _1836;
    float _1846 = _1844;
    float _1848 = _1818;
    if (_1764)
    {
        float _1850 = _1818 + (-1.0);
        _1812 = _1850;
    }
    float _1852 = _1812;
    float _1854 = _1852;
    if (_1764)
    {
        float _1856 = _1784 * _1840;
        _1376 = _1856;
    }
    float _1858 = _1376;
    if (!_1764)
    {
        _1842 = _1824;
    }
    float _1860 = _1842;
    float _1862 = _1860;
    if (_1764)
    {
        float _1864 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1786 = _1864;
    }
    float _1866 = _1786;
    if (_1764)
    {
        float _1868 = _1752 * _1858;
        _1846 = _1868;
    }
    float _1870 = _1846;
    if (!_1764)
    {
        _1854 = _1756;
    }
    float _1872 = _1854;
    float _1874 = _1872;
    if (_1764)
    {
        float _1876 = _1754 * _1858;
        _1828 = _1876;
    }
    float _1878 = _1828;
    if (_1764)
    {
        float _1880 = fma(_1824, _1818, _1866);
        _1862 = _1880;
    }
    float _1882 = _1862;
    if (_1764)
    {
        float _1884 = _1870 * _1870;
        _1874 = _1884;
    }
    float _1886 = _1874;
    if (!_1764)
    {
        _1848 = _1758;
    }
    float _1888 = _1848;
    float _1890 = _1888;
    if (_1764)
    {
        float _1892 = _1878 * _1878;
        _1890 = _1892;
    }
    float _1894 = _1890;
    float _1896 = fma(_1882, _1882, _1886);
    float _1898 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1900 = _1896 + _1894;
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1904 = fma(_1748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1902);
    float _1906 = precise::clamp(_1904, 0.0, 1.0);
    float _1908 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1898);
    float _1910 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1912 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1914 = -_1906;
    float _1916 = _1914 + 1.0;
    float _1918 = rsqrt(_1900);
    float _1920 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1922 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1908);
    float _1924 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1910);
    float _1926 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1928 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1920);
    float _1930 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1912);
    float _1932 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1924);
    float _1934 = abs(_1916);
    float _1936 = log2(_1934);
    float _1938 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1928);
    float _1940 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1930);
    float _1942 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1944 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1948 = _1940 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1952 = _1918 * _1870;
    float _1954 = _1918 * _1882;
    float _1956 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1958 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1950);
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1962 = _1918 * _1878;
    float _1964 = -_1956;
    float _1966 = fma(_1964, _1926, 1.0);
    float _1968 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1958);
    float _1970 = -_1960;
    float _1972 = fma(_1954, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1970);
    float _1974 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1976 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1978 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1968);
    float _1980 = -_1962;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1972);
    float _1984 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1986 = log2(_1966);
    float _1988 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1976);
    float _1990 = fma(_1982, -0.5, 0.5);
    float _1992 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1984);
    float _1994 = fma(_1982, 0.5, 0.5);
    float _1996 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1988);
    float _1998 = _1954 + 1.0;
    float _2000 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1992);
    float _2002 = exp2(_1974);
    float _2004 = fma(_1994, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2006 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2000);
    float _2008 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1996);
    float _2010 = fma(_1994, _2004, -0.212114393711090087890625);
    float _2012 = 1.0 / _1978;
    float _2014 = _1986 * 0.693147182464599609375;
    float _2016 = fma(_1994, _2010, 1.570728778839111328125);
    float _2018 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2020 = sqrt(_1990);
    float _2022 = -_1954;
    float _2024 = fma(_2002, _1998, _2022);
    float _2026 = fma(_2024, 0.5, 0.5);
    float _2028 = _2006 * _2012;
    float _2030 = _2008 * _2012;
    float _2032 = fma(_2028, 0.5, 0.5);
    float _2034 = fma(_2030, -0.5, 0.5);
    float _2036 = _2020 * 0.636619746685028076171875;
    float3 _5418 = float3(_2032, _2034, _2018);
    float _2038 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5418, float3(0.0), isnan(_5418)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5418, float3(0.0), isnan(_5418)), level(0.0)).x;
    float3 _5429 = float3(_2032, _2034, _2018);
    float4 _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5429, float3(0.0), isnan(_5429)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5429, float3(0.0), isnan(_5429)), level(0.0)).xyzw;
    float _2043 = _2041.x;
    float _2045 = _2041.y;
    float _2047 = _2041.z;
    float _2049 = _2041.w;
    float _2051 = -_2016;
    float _2053 = fma(_2036, _2051, 1.0);
    float2 _5451 = float2(_2053, _2026);
    float3 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5451, float2(0.0), isnan(_5451)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5451, float2(0.0), isnan(_5451)), level(0.0)).xyz;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = in.m_61.x;
    float _2067 = in.m_61.y;
    float _2069 = in.m_61.z;
    bool _2071 = _1512 != 0.0;
    bool _2073 = isnan(_1512);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(0.0);
    bool _2079 = _2075 || _2077;
    float _2081 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2083 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2085 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2087 = _1510 == 0.0;
    bool _2089 = !_2079;
    bool _2091 = _2087 && _2089;
    float _2093 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2095 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2097 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2099 = _1514 == 0.0;
    bool _2101 = _2099 && _2091;
    float _2103 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2105 = -_1544;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2095);
    float _2109 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2083);
    float _2111 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2113 = -_1544;
    float _2115 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2093);
    float _2117 = -_1544;
    float _2119 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2081);
    float _2121 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2097);
    float _2123 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2103);
    float _2125 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2127 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2111);
    float _2129 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2131 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2121);
    float _2133 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2123);
    float _2135 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2125);
    float _2137 = _2067;
    float _2139 = _2065;
    float _2141 = _2069;
    if (!_2101)
    {
        float _2143 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2067);
        _2137 = _2143;
    }
    float _2145 = _2137;
    float _2147 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2109);
    if (!_2101)
    {
        float _2149 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2065);
        _2139 = _2149;
    }
    float _2151 = _2139;
    float _2153 = exp2(_2085);
    if (!_2101)
    {
        float _2155 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2069);
        _2141 = _2155;
    }
    float _2157 = _2141;
    float _2159 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2115);
    float _2161 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2119);
    float _2163 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2107);
    float _2165 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2167 = _2159 * _2145;
    float _2169 = _2161 * _2145;
    float _2171 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2127);
    float _2173 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2129);
    float _2175 = _2163 * _2145;
    float _2177 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2135);
    float _2179 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2165);
    float _2181 = fma(_2131, _2151, _2167);
    float _2183 = fma(_2133, _2151, _2169);
    float _2185 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2173);
    float _2187 = -_2153;
    float _2189 = _2187 + 1.0;
    float _2191 = fma(_2171, _2151, _2175);
    float _2193 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2179);
    float _2195 = fma(_2147, _2157, _2181);
    float _2197 = fma(_2177, _2157, _2183);
    float _2199 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2201 = fma(_2185, _2157, _2191);
    float _2203 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2193);
    out.m_45.x = 1.0;
    float _2205 = _2203 + _1978;
    out.m_63.x = _2195;
    out.m_63.y = _2197;
    out.m_63.z = _2201;
    float _2207 = _2205 * 0.5;
    out.gl_Position.x = _2006;
    out.gl_Position.y = _2008;
    out.gl_Position.z = _2203;
    out.gl_Position.w = _1978;
    out.m_65.z = _2207;
    out.m_65.w = _1978;
    float _2209 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2211 = -_2199;
    float _2213 = _2211 + 1.0;
    out.m_67.w = _2209;
    float _2215 = _2199 * _2038;
    float _2217 = _2049 * _2213;
    float _2219 = _2049 * _2215;
    float _2221 = _2063 * _2215;
    float _2223 = fma(_2059, _2219, _2043);
    float _2225 = fma(_2061, _2219, _2045);
    float _2227 = fma(_2049, _2221, _2047);
    out.m_69.x = _2223;
    out.m_69.y = _2225;
    out.m_69.z = _2227;
    out.m_69.w = _2217;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1002 = false;
    bool _608 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2284 = as_type<float>(_104);
        out.gl_Position.z = _2284;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2354 = as_type<float>(_142);
        out.gl_Position.z = _2354;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _148 * _146;
    float _168 = 0.0;
    if (!_160)
    {
        float _170 = _150 * _150;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _178 = _174;
    if (!_160)
    {
        float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = in.m_47.x;
    float _186 = in.m_47.y;
    float _188 = in.m_47.z;
    float _190 = _176 * 6.283185482025146484375;
    float _192 = floor(_176);
    float _194 = _190 * 0.15915493667125701904296875;
    float _196 = _194 * 6.283185482025146484375;
    float _198 = cos(_196);
    float _200 = -_192;
    float _202 = _176 + _200;
    float _204 = _192;
    float _206 = _182;
    if (!_160)
    {
        _204 = _150;
    }
    float _208 = _204;
    bool _210 = !_160;
    float _212 = _208;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _150 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _150);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _242;
    }
    float _244 = _206;
    bool _246 = !_160;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _150 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _212 = _266;
    }
    float _268 = _212;
    float _270 = in.m_51.w;
    float _272 = in.m_42.x;
    float _274 = in.m_42.y;
    float _276 = in.m_42.z;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = fma(_198, 0.5, 0.5);
    bool _288 = _202 < 0.5;
    float _290 = float(_288);
    float _292 = -_202;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _296 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _298 = !_280;
    int _300 = _298 ? 0 : 1;
    float _302 = -_290;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = -_286;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _310 = abs(_300);
    float _312 = fma(_268, _184, _296);
    bool _314 = !_164;
    int _316 = _314 ? 0 : 1;
    float _318 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_284;
    int _322 = _320 ? 0 : 1;
    float _324 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _328 = fma(_268, _186, _318);
    int _330 = abs(_316);
    float _332 = fma(_268, _188, _324);
    int _334 = abs(_322);
    float _336 = float(_310);
    float _338 = float(_330);
    float _340 = fma(_312, _270, _272);
    float _342 = abs(_294);
    float _344 = _336 * _342;
    float _346 = fma(_328, _270, _274);
    float _348 = fma(_332, _270, _276);
    float _350 = float(_334);
    float _352 = fma(_338, _308, _344);
    float _354 = abs(_304);
    float _356 = fma(_350, _354, _352);
    bool _358 = !_326;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_88);
        float _380 = 1.0 / _378;
        float _382 = _122 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _384 + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = _384 + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _408 = _384 + _406;
    float _410 = 1.0 / _396;
    bool _412 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _414 = isnan(_384);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _426 = 1.0 / _400;
    float _428 = 1.0 / _404;
    float _430 = _392 * _410;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _436;
    float _440 = _388 * _426;
    bool _442 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _444 = isnan(_384);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _454;
    float _458 = fma(_434, _430, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _464 = -_452;
    float _466 = _464 + 1.0;
    float _468 = fma(_456, _430, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _470 = _408 * _428;
    bool _472 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _474 = isnan(_384);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = fma(_438, _430, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _486 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_384);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = _422 * _466;
    float _500 = -_422;
    float _502 = _500 + 1.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _512 = -_482;
    float _514 = _512 + 1.0;
    float _516 = _482 * _502;
    float _518 = fma(_506, _440, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _520 = fma(_462, _440, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _522 = fma(_510, _440, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = _496 * _514;
    float _526 = in.m_51.x;
    float _528 = in.m_51.y;
    float _530 = in.m_51.z;
    float _532 = -_496;
    float _534 = _532 + 1.0;
    float _536 = _458 * _524;
    float _538 = _484 * _524;
    float _540 = _468 * _524;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _542;
    float _546 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _536);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _538);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _554;
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _540);
    float _560 = fma(_544, _470, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _562 = fma(_552, _470, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _564 = fma(_556, _470, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _566 = fma(_518, _516, _546);
    float _568 = fma(_520, _516, _548);
    float _570 = fma(_522, _516, _558);
    float _572 = fma(_560, _498, _566);
    float _574 = fma(_562, _498, _568);
    float _576 = fma(_564, _498, _570);
    float _578 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].x, _572);
    float _580 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].y, _574);
    float _582 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].z, _576);
    float _584 = _578 * _526;
    float _586 = _580 * _528;
    float _588 = _582 * _530;
    bool _590 = !_424;
    float _606;
    if (!_590)
    {
        float _592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _594 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _598 = _596 * _592;
        float _600 = floor(_598);
        float _602 = -_600;
        float _604 = _598 + _602;
        _606 = _604;
        _608 = true;
    }
    else
    {
        float _610 = float(_88);
        float _612 = 1.0 / _610;
        float _614 = _122 * _612;
        _606 = _614;
    }
    _608 = false;
    float _616 = _606;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _620 = _616 + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _638 = 1.0 / _624;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _648 = 1.0 / _632;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _652 = _616 + _650;
    bool _654 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _656 = isnan(_616);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    bool _666 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _668 = isnan(_616);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _642;
    float _680 = _652 * _638;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _684 = _616 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _688 = _616 + _686;
    float _690 = 1.0 / _628;
    float _692 = _684 * _648;
    bool _694 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _696 = isnan(_616);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _708 = _616 + _706;
    bool _710 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _712 = 1.0 / _646;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _716 = _616 + _714;
    float _718 = _620 * _678;
    bool _720 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _722 = isnan(_616);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = 1.0 / _636;
    float _734 = _716 * _690;
    float _736 = -_704;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _740;
    float _744 = -_730;
    float _746 = _744 + 1.0;
    float _748 = _730 * _738;
    float _750 = fma(_742, _680, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _752 = _688 * _712;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _766 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _768 = isnan(_616);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = fma(_756, _680, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _780 = _664 * _746;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _786 = _708 * _732;
    float _788 = fma(_760, _680, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _790 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _792 = isnan(_616);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = -_664;
    float _804 = _802 + 1.0;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _810;
    float _814 = _800 * _804;
    float _816 = -_800;
    float _818 = _816 + 1.0;
    float _820 = fma(_764, _734, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _822 = fma(_784, _734, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _824 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _826 = isnan(_616);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = _676 * _818;
    float _838 = -_676;
    float _840 = _838 + 1.0;
    float _842 = fma(_808, _734, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _844;
    float _848 = -_834;
    float _850 = _848 + 1.0;
    float _852 = _834 * _840;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _854;
    float _858 = fma(_846, _718, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _860 = _776 * _850;
    float _862 = -_776;
    float _864 = _862 + 1.0;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _870 = fma(_856, _718, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _872 = _778 * _860;
    float _874 = _788 * _860;
    float _876 = _750 * _860;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[107].x, _872);
    float _888 = fma(_812, _718, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _890 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[107].y, _874);
    float _892 = fma(_880, _752, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _894 = fma(_884, _752, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _896 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[107].z, _876);
    float _898 = fma(_868, _752, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _900 = fma(_820, _852, _886);
    float _902 = fma(_842, _852, _890);
    float _904 = fma(_822, _852, _896);
    float _906 = fma(_870, _836, _900);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _912;
    float _916 = fma(_858, _836, _902);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _918;
    float _922 = fma(_888, _836, _904);
    float _924 = fma(_892, _814, _906);
    float _926 = fma(_910, _692, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _928 = fma(_914, _692, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _930 = fma(_894, _814, _916);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _940 = fma(_920, _692, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _946 = fma(_898, _814, _922);
    float _948 = fma(_934, _786, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _950 = fma(_938, _786, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _952 = fma(_944, _786, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _954 = fma(_926, _780, _924);
    float _956 = fma(_928, _780, _930);
    float _958 = fma(_940, _780, _946);
    float _960 = fma(_948, _748, _954);
    float _962 = fma(_950, _748, _956);
    float _964 = fma(_952, _748, _958);
    float _966 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[113].x, _960);
    float _968 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[113].y, _962);
    float _970 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[113].z, _964);
    float _972 = _966 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _974 = _968 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _976 = _970 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _978 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _978;
    out.m_53.y = _980;
    out.m_53.z = _982;
    bool _984 = !_710;
    float _1000;
    if (!_984)
    {
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _988 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _992 = _990 * _986;
        float _994 = floor(_992);
        float _996 = -_994;
        float _998 = _992 + _996;
        _1000 = _998;
        _1002 = true;
    }
    else
    {
        float _1004 = float(_88);
        float _1006 = 1.0 / _1004;
        float _1008 = _122 * _1006;
        _1000 = _1008;
    }
    _1002 = false;
    float _1010 = _1000;
    float _1012 = in.m_49.y;
    float _1014 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1016 = log2(_1014);
    float _1018 = _346 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _346 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1022 = in.m_49.z;
    float _1024 = _346 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1026 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1028 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1030 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1024);
    float _1032 = _144 * 2.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1034;
    float _1038 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1026);
    float _1040 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1028);
    float _1042 = floor(_1032);
    float _1044 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1030);
    float _1046 = _1016 * _122;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1058 = _1056 != 0;
    float _1060 = _1040 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1062 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1064 = 1.0 / _1036;
    bool _1066 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1068 = isnan(_1010);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _1012 * 2.0;
    float _1080 = _144 + _1012;
    float _1082 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1084 = _1022 * 2.0;
    float _1086 = _1012 + _1022;
    float _1088 = floor(_1078);
    float _1090 = _1080 + (-1.0);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1094 = _1010 + _1092;
    float _1096 = _1086 + (-1.0);
    bool _1098 = _1042 >= 0.0;
    bool _1100 = isnan(_1042);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1110 = _1042 > 0.0;
    float _1112 = exp2(_1046);
    float _1114 = _1094 * _1064;
    int _1116 = _1106 ? 0 : 1;
    int _1118 = ~_1116;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = floor(_1084);
    bool _1126 = _1088 >= 0.0;
    bool _1128 = isnan(_1088);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.0);
    bool _1134 = _1130 || _1132;
    bool _1136 = _1088 > 0.0;
    int _1138 = _1134 ? 0 : 1;
    bool _1140 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1148 = _1144 || _1146;
    float _1150 = -_1112;
    float _1152 = _1150 + 1.0;
    float _1154 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1156 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1158 = isnan(_1010);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = _1148 ? _1152 : 0.0;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1172 = 1.0 + _1170;
    bool _1174 = _1124 >= 0.0;
    bool _1176 = isnan(_1124);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan(0.0);
    bool _1182 = _1178 || _1180;
    float _1184 = -_1166;
    float _1186 = _1184 + 1.0;
    bool _1188 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1190 = isnan(1.0);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1196 = _1192 || _1194;
    float _1198 = 1.0 / _1172;
    int _1200 = _1182 ? 0 : 1;
    bool _1202 = _1124 > 0.0;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1208;
    int _1212 = _1122;
    int _1214 = as_type<int>(_1012);
    if (!_1110)
    {
        int _1216 = ~_1116;
        int _1218 = _1216 + 1;
        _1212 = _1218;
    }
    int _1220 = _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1222;
    float _1226 = _1076 * _1186;
    float _1228 = -_1076;
    float _1230 = _1228 + 1.0;
    float _1232 = fma(_1210, _1114, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1234 = fma(_1224, _1114, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    if (_1196)
    {
        float _1236 = _1168 * _1198;
        _124 = _1236;
    }
    float _1238 = _124;
    bool _1240 = !_1054;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = fma(_1206, _1114, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1246 = _1234 * _1226;
    int _1248 = ~_1138;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1062 + _1254;
    int _1258 = abs(_1242);
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1262 = _1060 + _1260;
    float _1264 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1246);
    bool _1266 = !_1050;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = _1232 * _1226;
    int _1272 = _1252;
    if (!_1136)
    {
        int _1274 = ~_1138;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    float _1280 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1282 = _1244 * _1226;
    int _1284 = abs(_1268);
    float _1286 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1270);
    float _1288 = float(_1258);
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1292 = _1082 + _1290;
    float _1294 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1280);
    int _1296 = ~_1200;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    float _1302 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1282);
    int _1304 = _1300;
    if (!_1202)
    {
        int _1306 = ~_1200;
        int _1308 = _1306 + 1;
        _1304 = _1308;
    }
    int _1310 = _1304;
    float _1312 = in.m_55.x;
    float _1314 = in.m_55.y;
    float _1316 = in.m_55.z;
    float _1318 = float(_1220);
    float _1320 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1294);
    float _1322 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1286);
    float _1324 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1264);
    float _1326 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1302);
    float _1328 = _1262 * _1262;
    float _1330 = _1288 * _1318;
    bool _1332 = _1320 >= 0.0;
    float _1334 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1336 = float(_1284);
    float _1338 = fma(_1256, _1256, _1328);
    float _1340 = float(_1310);
    float _1342 = _1330 * (-2.0);
    float _1344 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1346 = _1326 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _1336 * _1340;
    float _1352 = fma(_1292, _1292, _1338);
    float _1354 = fma(_1154, _1342, _1154);
    float _1356 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = as_type<float>(_1310);
    if (_1332)
    {
        _1358 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1360 = _1358;
    float _1362 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = rsqrt(_1352);
    float _1366 = fma(_1342, _1314, _1314);
    float _1368 = _1012 + (-0.5);
    bool _1370 = !_1058;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = _1316;
    float _1376 = _1366;
    if (_1332)
    {
        float _1378 = _1360 * 5.0;
        _1214 = as_type<int>(_1378);
    }
    int _1380 = _1214;
    float _1382 = _1350 * (-2.0);
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1366);
    int _1386 = abs(_1372);
    out.m_57.x = _1356;
    out.m_57.y = _1348;
    out.m_57.z = _1362;
    float _1388 = fma(_1108, _1382, _1108);
    float _1390 = fma(_1354, _1238, _1384);
    float _1392 = fma(_1382, _1312, _1312);
    if (_1332)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4342 = as_type<float>(_1380);
        out.gl_Position.z = _4342;
    }
    if (_1332)
    {
        out.m_45.x = 0.0;
    }
    float _1394 = _1262 * _1364;
    float _1396 = _1256 * _1364;
    if (_1332)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1398 = -_1394;
    float _1400 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1060);
    float _1402 = -_1396;
    float _1404 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1062);
    float _1406 = float(_1386);
    float _1408 = _144 + (-0.5);
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1400 + _1410;
    float _1414 = _1292 * _1364;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1418 = _1404 + _1416;
    float _1420 = float(_1278);
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1424 = -_1414;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1428 = _144 + _1022;
    float _1430 = -_1394;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1422);
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1438 = _1426 + _1436;
    float _1440 = _1406 * _1420;
    float _1442 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1392);
    float _1444 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1434);
    float _1446 = _1428 + (-1.0);
    float _1448 = _1440 * (-2.0);
    float _1450 = -_1396;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1454 = _1432 * _1432;
    bool _1456 = _1444 >= 0.0;
    float _1458 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1460 = fma(_1448, _1316, _1316);
    float _1462 = _1022 + (-0.5);
    float _1464 = fma(_1388, _1238, _1442);
    float _1466 = fma(_1452, _1452, _1454);
    float _1468 = -_1414;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1292);
    float _1472 = fma(_1458, _1448, _1458);
    float _1474 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1460);
    float _1476 = _1390 * 0.15915493667125701904296875;
    float _1478 = _1464 * 0.15915493667125701904296875;
    float _1480 = fma(_1470, _1470, _1466);
    float _1482 = fma(_1472, _1238, _1474);
    if (_1456)
    {
        _1374 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1484 = _1374;
    float _1486 = _1476 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    int _1490 = as_type<int>(_1484);
    if (_1456)
    {
        out.m_45.x = 0.0;
    }
    if (_1456)
    {
        float _1492 = _1484 * 5.0;
        _1490 = as_type<int>(_1492);
    }
    int _1494 = _1490;
    float _1496 = _1476 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    if (_1456)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4536 = as_type<float>(_1494);
        out.gl_Position.z = _4536;
    }
    float _1500 = _1478 * 6.283185482025146484375;
    float _1502 = sin(_1500);
    float _1504 = _1478 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = sqrt(_1480);
    if (_1456)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1510 = in.m_59.x;
    float _1512 = in.m_59.y;
    float _1514 = in.m_59.z;
    float _1516 = _1482 * 0.15915493667125701904296875;
    float _1518 = _356 * _586;
    float _1520 = _356 * _588;
    float _1522 = _356 * _584;
    float _1524 = _1516 * 6.283185482025146484375;
    float _1526 = cos(_1524);
    float _1528 = _1364 * _1508;
    float _1530 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1534 = _1522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1536 = _1502 * _1498;
    float _1538 = _1528 * _1530;
    float _1540 = _1528 * _1532;
    float _1542 = _1516 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = _1528 * _1534;
    float _1548 = _1502 * _1488;
    float _1550 = _1506 * _1498;
    float _1552 = _1506 * _1488;
    float _1554 = _1502 * _1526;
    float _1556 = _1506 * _1526;
    float _1558 = _1498 * _1526;
    float _1560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1512);
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1510);
    float _1564 = _1488 * _1526;
    float _1566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1514);
    float _1568 = _1538 * _1560;
    float _1570 = _1546 * _1562;
    float _1572 = fma(_1544, _1550, _1548);
    float _1574 = _1540 * _1566;
    float _1576 = _1556 * _1568;
    float _1578 = -_1536;
    float _1580 = fma(_1544, _1552, _1578);
    float _1582 = -_1568;
    float _1584 = _1544 * _1582;
    float _1586 = -_1552;
    float _1588 = fma(_1544, _1536, _1586);
    float _1590 = fma(_1572, _1570, _1576);
    float _1592 = _1554 * _1568;
    float _1594 = fma(_1558, _1570, _1584);
    float _1596 = fma(_1544, _1548, _1550);
    float _1598 = fma(_1580, _1574, _1590);
    float _1600 = fma(_1588, _1570, _1592);
    float _1602 = fma(_1564, _1574, _1594);
    float _1604 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = fma(_1596, _1574, _1600);
    float _1608 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1610 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1612 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1608);
    float _1614 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1610);
    float _1616 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1612);
    float _1618 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1620 = _1616 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1622 = _1082 + _1618;
    float _1624 = _1062 + _1620;
    float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1628 = _1622 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1632 = _1624 + _1630;
    float _1634 = _1628 * _1628;
    float _1636 = fma(_1632, _1632, _1634);
    float _1638 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1640 = sqrt(_1636);
    float _1642 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1638);
    float _1644 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1642);
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1648 = _1060 + _1646;
    bool _1650 = _1640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1598;
    float _1654 = _1646;
    float _1656 = _1624;
    float _1658 = _1550;
    float _1660 = _1648;
    if (!_1650)
    {
        _1652 = _1622;
    }
    float _1662 = _1652;
    float _1664 = _1662;
    if (!_1650)
    {
        _1654 = _1648;
    }
    float _1666 = _1654;
    bool _1668 = !_1650;
    float _1670 = _1666;
    if (!_1668)
    {
        float _1672 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1676 = _1640 + _1674;
        float _1678 = rsqrt(_1636);
        float _1680 = _1676 * _1672;
        float _1682 = _1648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1684 = _1680 * 0.15915493667125701904296875;
        float _1686 = _1684 * 6.283185482025146484375;
        float _1688 = cos(_1686);
        float _1690 = _1684 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = _1688 + (-1.0);
        float _1696 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = fma(_1692, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1700 = fma(_1648, _1688, _1696);
        float _1702 = _1678 * _1698;
        float _1704 = fma(_1632, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1706 = fma(_1628, _1702, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1670 = _1700;
        _1656 = _1704;
        _1664 = _1706;
        _1658 = _1684;
    }
    float _1708 = _1670;
    float _1710 = _1656;
    float _1712 = _1664;
    float _1714 = _1658;
    float _1716 = -_1394;
    float _1718 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1708);
    float _1720 = -_1396;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1710);
    float _1724 = -_1414;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1712);
    float _1728 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1730 = _1718 + _1728;
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1734 = _1722 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1738 = _1726 + _1736;
    float _1740 = _1730 * _1730;
    float _1742 = fma(_1734, _1734, _1740);
    float _1744 = fma(_1738, _1738, _1742);
    float _1746 = rsqrt(_1744);
    float _1748 = sqrt(_1744);
    float _1750 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1752 = _1734 * _1750;
    float _1754 = _1738 * _1750;
    float _1756 = _1752 * _1752;
    float _1758 = _1754 * _1754;
    float _1760 = _1756 + _1758;
    float _1762 = sqrt(_1760);
    bool _1764 = _1762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1768 = _1762 + _1766;
    float _1770 = _1738;
    float _1772 = _1714;
    float _1774 = _1768;
    float _1776 = _1730;
    if (_1764)
    {
        float _1778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _1778;
    }
    float _1780 = _1770;
    if (_1764)
    {
        float _1782 = rsqrt(_1760);
        _1772 = _1782;
    }
    float _1784 = _1772;
    float _1786 = _1784;
    if (_1764)
    {
        float _1788 = _1768 * _1780;
        _1774 = _1788;
    }
    float _1790 = _1774;
    if (_1764)
    {
        float _1792 = _1790 * 0.15915493667125701904296875;
        _1660 = _1792;
    }
    float _1794 = _1660;
    float _1796 = _1746;
    if (_1764)
    {
        float _1798 = _1794 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        _1796 = _1800;
    }
    float _1802 = _1796;
    float _1804 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1806 = precise::max(0.0, _1804);
    float _1808 = _1740;
    float _1810 = _1806;
    float _1812 = _1804;
    if (_1764)
    {
        float _1814 = _1794 * 6.283185482025146484375;
        float _1816 = cos(_1814);
        _1808 = _1816;
    }
    float _1818 = _1808;
    float _1820 = -_1750;
    float _1822 = -_1806;
    float _1824 = fma(_1730, _1820, _1822);
    if (!_1764)
    {
        _1776 = _1754;
    }
    float _1826 = _1776;
    float _1828 = _1826;
    if (_1764)
    {
        float _1830 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1810 = _1830;
    }
    float _1832 = _1810;
    float _1834 = _1832;
    float _1836 = _1802;
    if (_1764)
    {
        float _1838 = fma(_1802, _1832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1834 = _1838;
    }
    float _1840 = _1834;
    float _1842 = _1840;
    if (!_1764)
    {
        _1836 = _1752;
    }
    float _1844 = _1836;
    float _1846 = _1844;
    float _1848 = _1818;
    if (_1764)
    {
        float _1850 = _1818 + (-1.0);
        _1812 = _1850;
    }
    float _1852 = _1812;
    float _1854 = _1852;
    if (_1764)
    {
        float _1856 = _1784 * _1840;
        _1376 = _1856;
    }
    float _1858 = _1376;
    if (!_1764)
    {
        _1842 = _1824;
    }
    float _1860 = _1842;
    float _1862 = _1860;
    if (_1764)
    {
        float _1864 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1786 = _1864;
    }
    float _1866 = _1786;
    if (_1764)
    {
        float _1868 = _1752 * _1858;
        _1846 = _1868;
    }
    float _1870 = _1846;
    if (!_1764)
    {
        _1854 = _1756;
    }
    float _1872 = _1854;
    float _1874 = _1872;
    if (_1764)
    {
        float _1876 = _1754 * _1858;
        _1828 = _1876;
    }
    float _1878 = _1828;
    if (_1764)
    {
        float _1880 = fma(_1824, _1818, _1866);
        _1862 = _1880;
    }
    float _1882 = _1862;
    if (_1764)
    {
        float _1884 = _1870 * _1870;
        _1874 = _1884;
    }
    float _1886 = _1874;
    if (!_1764)
    {
        _1848 = _1758;
    }
    float _1888 = _1848;
    float _1890 = _1888;
    if (_1764)
    {
        float _1892 = _1878 * _1878;
        _1890 = _1892;
    }
    float _1894 = _1890;
    float _1896 = fma(_1882, _1882, _1886);
    float _1898 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1900 = _1896 + _1894;
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1904 = fma(_1748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1902);
    float _1906 = precise::clamp(_1904, 0.0, 1.0);
    float _1908 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1898);
    float _1910 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1912 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1914 = -_1906;
    float _1916 = _1914 + 1.0;
    float _1918 = rsqrt(_1900);
    float _1920 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1922 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1908);
    float _1924 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1910);
    float _1926 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1928 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1920);
    float _1930 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1912);
    float _1932 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1924);
    float _1934 = abs(_1916);
    float _1936 = log2(_1934);
    float _1938 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1928);
    float _1940 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1930);
    float _1942 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1944 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1948 = _1940 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1952 = _1918 * _1870;
    float _1954 = _1918 * _1882;
    float _1956 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1958 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1950);
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1962 = _1918 * _1878;
    float _1964 = -_1956;
    float _1966 = fma(_1964, _1926, 1.0);
    float _1968 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1958);
    float _1970 = -_1960;
    float _1972 = fma(_1954, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1970);
    float _1974 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1976 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1978 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1968);
    float _1980 = -_1962;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1972);
    float _1984 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1986 = log2(_1966);
    float _1988 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1976);
    float _1990 = fma(_1982, -0.5, 0.5);
    float _1992 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1984);
    float _1994 = fma(_1982, 0.5, 0.5);
    float _1996 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1988);
    float _1998 = _1954 + 1.0;
    float _2000 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1992);
    float _2002 = exp2(_1974);
    float _2004 = fma(_1994, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2006 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2000);
    float _2008 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1996);
    float _2010 = fma(_1994, _2004, -0.212114393711090087890625);
    float _2012 = 1.0 / _1978;
    float _2014 = _1986 * 0.693147182464599609375;
    float _2016 = fma(_1994, _2010, 1.570728778839111328125);
    float _2018 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2020 = sqrt(_1990);
    float _2022 = -_1954;
    float _2024 = fma(_2002, _1998, _2022);
    float _2026 = fma(_2024, 0.5, 0.5);
    float _2028 = _2006 * _2012;
    float _2030 = _2008 * _2012;
    float _2032 = fma(_2028, 0.5, 0.5);
    float _2034 = fma(_2030, -0.5, 0.5);
    float _2036 = _2020 * 0.636619746685028076171875;
    float3 _5418 = float3(_2032, _2034, _2018);
    float _2038 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5418, float3(0.0), isnan(_5418)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5418, float3(0.0), isnan(_5418)), level(0.0)).x;
    float3 _5429 = float3(_2032, _2034, _2018);
    float4 _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5429, float3(0.0), isnan(_5429)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5429, float3(0.0), isnan(_5429)), level(0.0)).xyzw;
    float _2043 = _2041.x;
    float _2045 = _2041.y;
    float _2047 = _2041.z;
    float _2049 = _2041.w;
    float _2051 = -_2016;
    float _2053 = fma(_2036, _2051, 1.0);
    float2 _5451 = float2(_2053, _2026);
    float3 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5451, float2(0.0), isnan(_5451)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5451, float2(0.0), isnan(_5451)), level(0.0)).xyz;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = in.m_61.x;
    float _2067 = in.m_61.y;
    float _2069 = in.m_61.z;
    bool _2071 = _1512 != 0.0;
    bool _2073 = isnan(_1512);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(0.0);
    bool _2079 = _2075 || _2077;
    float _2081 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2083 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2085 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2087 = _1510 == 0.0;
    bool _2089 = !_2079;
    bool _2091 = _2087 && _2089;
    float _2093 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2095 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2097 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2099 = _1514 == 0.0;
    bool _2101 = _2099 && _2091;
    float _2103 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2105 = -_1544;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2095);
    float _2109 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2083);
    float _2111 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2113 = -_1544;
    float _2115 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2093);
    float _2117 = -_1544;
    float _2119 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2081);
    float _2121 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2097);
    float _2123 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2103);
    float _2125 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2127 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2111);
    float _2129 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2131 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2121);
    float _2133 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2123);
    float _2135 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2125);
    float _2137 = _2067;
    float _2139 = _2065;
    float _2141 = _2069;
    if (!_2101)
    {
        float _2143 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2067);
        _2137 = _2143;
    }
    float _2145 = _2137;
    float _2147 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2109);
    if (!_2101)
    {
        float _2149 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2065);
        _2139 = _2149;
    }
    float _2151 = _2139;
    float _2153 = exp2(_2085);
    if (!_2101)
    {
        float _2155 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2069);
        _2141 = _2155;
    }
    float _2157 = _2141;
    float _2159 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2115);
    float _2161 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2119);
    float _2163 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2107);
    float _2165 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2167 = _2159 * _2145;
    float _2169 = _2161 * _2145;
    float _2171 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2127);
    float _2173 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2129);
    float _2175 = _2163 * _2145;
    float _2177 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2135);
    float _2179 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2165);
    float _2181 = fma(_2131, _2151, _2167);
    float _2183 = fma(_2133, _2151, _2169);
    float _2185 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2173);
    float _2187 = -_2153;
    float _2189 = _2187 + 1.0;
    float _2191 = fma(_2171, _2151, _2175);
    float _2193 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2179);
    float _2195 = fma(_2147, _2157, _2181);
    float _2197 = fma(_2177, _2157, _2183);
    float _2199 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2201 = fma(_2185, _2157, _2191);
    float _2203 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2193);
    out.m_45.x = 1.0;
    float _2205 = _2203 + _1978;
    out.m_63.x = _2195;
    out.m_63.y = _2197;
    out.m_63.z = _2201;
    float _2207 = _2205 * 0.5;
    out.gl_Position.x = _2006;
    out.gl_Position.y = _2008;
    out.gl_Position.z = _2203;
    out.gl_Position.w = _1978;
    out.m_65.z = _2207;
    out.m_65.w = _1978;
    float _2209 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2211 = -_2199;
    float _2213 = _2211 + 1.0;
    out.m_67.w = _2209;
    float _2215 = _2199 * _2038;
    float _2217 = _2049 * _2213;
    float _2219 = _2049 * _2215;
    float _2221 = _2063 * _2215;
    float _2223 = fma(_2059, _2219, _2043);
    float _2225 = fma(_2061, _2219, _2045);
    float _2227 = fma(_2049, _2221, _2047);
    out.m_69.x = _2223;
    out.m_69.y = _2225;
    out.m_69.z = _2227;
    out.m_69.w = _2217;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

