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
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _372 = false;
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
        float _1768 = as_type<float>(_104);
        out.gl_Position.z = _1768;
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
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1836 = as_type<float>(_140);
        out.gl_Position.z = _1836;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _146 * _144;
    float _166 = 0.0;
    float _168 = _148;
    if (!_158)
    {
        float _170 = _148 * _148;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _178 = _174;
    if (!_158)
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
    bool _204 = !_158;
    float _206 = _182;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _148 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _148);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_158;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _148 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _168 = _260;
    }
    float _262 = _168;
    float _264 = in.m_51.w;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _272 = _270 != 0;
    float _274 = in.m_42.x;
    float _276 = in.m_42.y;
    float _278 = in.m_42.z;
    bool _280 = _202 < 0.5;
    float _282 = float(_280);
    float _284 = fma(_198, 0.5, 0.5);
    bool _286 = !_268;
    int _288 = _286 ? 0 : 1;
    float _290 = -_202;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _294 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _296 = -_282;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _300 = abs(_288);
    float _302 = -_284;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = fma(_262, _184, _294);
    bool _308 = !_162;
    int _310 = _308 ? 0 : 1;
    float _312 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _314 = !_272;
    int _316 = _314 ? 0 : 1;
    float _318 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _322 = fma(_262, _186, _312);
    int _324 = abs(_310);
    float _326 = fma(_262, _188, _318);
    int _328 = abs(_316);
    float _330 = float(_300);
    float _332 = float(_324);
    float _334 = abs(_292);
    float _336 = _330 * _334;
    float _338 = fma(_326, _264, _278);
    float _340 = float(_328);
    float _342 = fma(_332, _304, _336);
    float _344 = fma(_306, _264, _274);
    float _346 = fma(_322, _264, _276);
    float _348 = abs(_298);
    float _350 = fma(_340, _348, _342);
    bool _352 = !_320;
    bool _354 = false;
    float _370;
    if (!_352)
    {
        float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _358 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _362 = _360 * _356;
        float _364 = floor(_362);
        float _366 = -_364;
        float _368 = _362 + _366;
        _370 = _368;
        _372 = true;
    }
    else
    {
        float _374 = float(_88);
        float _376 = 1.0 / _374;
        float _378 = _122 * _376;
        _370 = _378;
    }
    _372 = false;
    float _380 = _370;
    float _382 = in.m_49.w;
    float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _386 = in.m_53.w;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _390 = _388 != 0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _402 = _400 != 0;
    float _404 = in.m_49.y;
    float _406 = 1.0 / _394;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _410 = _408 != 0;
    float _412 = _346 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _416 = _414 != 0;
    float _418 = in.m_55.x;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _422 = _420 != 0;
    float _424 = _346 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _426 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _412);
    float _428 = _326;
    if (_390)
    {
        float _430 = in.m_49.z;
        _428 = _430;
    }
    float _432 = _428;
    float _434 = 1.0 / _398;
    float _436 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _424);
    bool _438 = _382 > 0.5;
    float _440 = _346 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _442 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _444;
    float _448 = in.m_55.y;
    float _450 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _454 = _380 + _452;
    float _456 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
    out.m_57.w = _386;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _458;
    float _462 = _454 * _406;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _466 = _380 + _464;
    float _468 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].z, _450);
    float _470 = _456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = _466 * _434;
    float _474 = fma(_446, _462, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].x;
    bool _486 = _438;
    int _488 = as_type<int>(_474);
    if (_390)
    {
        bool _490 = _432 > 0.5;
        _354 = _490;
    }
    bool _492 = _354;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _498 = fma(_478, _462, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _500 = fma(_460, _462, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _506 = fma(_482, _472, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _508 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _510 = isnan(_380);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _478;
    float _522 = _498;
    if (!_410)
    {
        float _524 = in.m_49.z;
        _520 = _524;
    }
    float _526 = _520;
    float _528 = fma(_504, _472, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _530 = -_448;
    float _532 = _530 + 1.0;
    float _534 = fma(_496, _472, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _536 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _538 = isnan(_380);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -_518;
    float _550 = _548 + 1.0;
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _554 = _550;
    float _556 = _448;
    if (!_410)
    {
        _484 = _404;
    }
    float _558 = _484;
    float _560 = _468 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _562 = _438 ? as_type<int>(_532) : as_type<int>(_448);
    float _564 = _546 * _550;
    float _566 = _558;
    if (_402)
    {
        bool _568 = _142 > 0.5;
        _486 = _568;
    }
    bool _570 = _486;
    float _572 = -_546;
    float _574 = _572 + 1.0;
    if (_410)
    {
        _566 = _142;
    }
    float _576 = _566;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _580 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _582 = isnan(_380);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _416 ? as_type<float>(_562) : _448;
    if (!_402)
    {
        _554 = _418;
    }
    float _594 = _554;
    float _596 = _590 * _574;
    float _598 = -_590;
    float _600 = _598 + 1.0;
    float _602 = _552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _604 = _474 * _596;
    int _606 = as_type<int>(_596);
    float _608 = _594;
    float _610 = _602;
    if (_402)
    {
        float _612 = -_418;
        float _614 = _612 + 1.0;
        _488 = as_type<int>(_614);
    }
    int _616 = _488;
    float _618 = _498 * _596;
    float _620 = _500 * _596;
    if (_390)
    {
        float _622 = -_418;
        float _624 = _622 + 1.0;
        _606 = as_type<int>(_624);
    }
    int _626 = _606;
    float _628 = fma(_602, _592, -0.5);
    if (_402)
    {
        float _630 = _570 ? as_type<float>(_616) : _418;
        _608 = _630;
    }
    float _632 = _608;
    float _634 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].x, _618);
    float _636 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].z, _620);
    float _638 = _526;
    if (!_410)
    {
        _610 = _526;
    }
    float _640 = _610;
    float _642 = _632 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _644 = _640;
    if (!_390)
    {
        _522 = _418;
    }
    float _646 = _522;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _650 = _646;
    if (_410)
    {
        _644 = _404;
    }
    float _652 = _644;
    float _654 = fma(_534, _564, _636);
    if (_410)
    {
        _638 = _404;
    }
    float _656 = _638;
    float _658 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[83].z, _648);
    if (_390)
    {
        float _660 = _492 ? as_type<float>(_626) : _418;
        _650 = _660;
    }
    float _662 = _650;
    float _664 = _576 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _666 = _404 > 0.5;
    float _668 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].y, _604);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _672 = _442 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _676 = _470 + _674;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_422)
    {
        float _680 = _666 ? _532 : _448;
        _556 = _680;
    }
    float _682 = _556;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _686 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].z, _654);
    float _688 = -_678;
    float _690 = fma(_664, 2.0, _688);
    float _692 = fma(_506, _564, _634);
    float _694 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[83].w, _684);
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _698 = _672 + _696;
    float _700 = fma(_528, _564, _668);
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _704 = _560 + _702;
    float _706 = _652 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _710 = _670 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _712 = _698 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _714 = -_122;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[81].x, _690);
    float _718 = fma(_706, -2.0, _708);
    float _720 = fma(_710, _662, -0.5);
    float _722 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[28].x, _712);
    float _724 = in.m_51.x;
    float _726 = in.m_51.y;
    float _728 = in.m_51.z;
    float _730 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _718);
    float _732 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _658);
    float _734 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[28].z, _722);
    float _736 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _694);
    float _738 = _682 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _740 = fma(_732, _720, _716);
    float _742 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].x, _692);
    bool _744 = _734 >= 0.0;
    float _746 = -_730;
    float _748 = fma(_736, _628, _746);
    float _750 = _642 * _384;
    float _752 = _698 * _698;
    float _754 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].y, _700);
    float _756 = _748 + 0.5;
    float _758 = fma(_704, _704, _752);
    float _760 = _742 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _762 = fma(_676, _676, _758);
    float _764 = _738 * _578;
    float _766 = _752;
    int _768 = as_type<int>(_758);
    float _770 = _686;
    if (_744)
    {
        _766 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _772 = _766;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _778 = _724 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _780 = rsqrt(_762);
    if (_744)
    {
        float _782 = _772 * 5.0;
        _768 = as_type<int>(_782);
    }
    int _784 = _768;
    float _786 = _350 * _778;
    float _788 = _740 + 0.5;
    float _790 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_744)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_784);
        out.gl_Position.z = _2901;
    }
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _794 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _796 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _750;
    out.m_59.y = _764;
    out.m_59.z = _788;
    out.m_59.w = _756;
    float _798 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _794 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_744)
    {
        out.m_45.x = 0.0;
    }
    float _802 = _800 * _780;
    float _804 = _754 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _806 = _686 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _808 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _790;
    out.m_61.y = _798;
    out.m_61.z = _796;
    float _810 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _704 * _802;
    float _816 = _698 * _802;
    out.m_63.x = _808;
    out.m_63.y = _810;
    out.m_63.z = _812;
    if (_744)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _818 = -_816;
    float _820 = _672 + _818;
    float _822 = _676 * _802;
    float _824 = -_814;
    float _826 = _560 + _824;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _830 = _820 + _828;
    float _832 = -_822;
    float _834 = _470 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _826 + _836;
    float _840 = _830 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _844 = _834 + _842;
    float _846 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    float _848 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[28].z, _846);
    bool _850 = _848 >= 0.0;
    if (_850)
    {
        _770 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _852 = _770;
    int _854 = as_type<int>(_852);
    if (_850)
    {
        out.m_45.x = 0.0;
    }
    if (_850)
    {
        float _856 = _852 * 5.0;
        _854 = as_type<int>(_856);
    }
    int _858 = _854;
    if (_850)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3059 = as_type<float>(_858);
        out.gl_Position.z = _3059;
    }
    if (_850)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _860 = -_672;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _864 = -_560;
    float _866 = _864 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _868 = -_470;
    float _870 = _868 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = -_816;
    float _874 = _698 + _872;
    float _876 = _862 * _862;
    float _878 = -_814;
    float _880 = _704 + _878;
    float _882 = -_822;
    float _884 = _676 + _882;
    float _886 = _874 * _874;
    float _888 = fma(_866, _866, _876);
    float _890 = _728 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _892 = fma(_880, _880, _886);
    float _894 = fma(_870, _870, _888);
    float _896 = fma(_884, _884, _892);
    float _898 = rsqrt(_894);
    float _900 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _902 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _900;
    float _904 = sqrt(_896);
    float _906 = _866 * _898;
    float _908 = _870 * _898;
    float _910 = _862 * _898;
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _914 = _906 * _912;
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _918 = _908 * _916;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _922 = _910 * _920;
    float _924 = in.m_65.x;
    float _926 = in.m_65.y;
    float _928 = in.m_65.z;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _932 = -_914;
    float _934 = fma(_908, _930, _932);
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _938 = -_918;
    float _940 = fma(_910, _936, _938);
    float _942 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _944 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _942;
    float _946 = _902 * _902;
    float _948 = _934 * _934;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _952 = -_922;
    float _954 = fma(_906, _950, _952);
    float _956 = _780 * _904;
    float _958 = fma(_944, _944, _946);
    float _960 = fma(_940, _940, _948);
    float _962 = _794 * _956;
    float _964 = fma(_954, _954, _960);
    float _966 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _968 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _966;
    float _970 = fma(_968, _968, _958);
    float _972 = rsqrt(_964);
    float _974 = _726 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _976 = _350 * _974;
    float _978 = _350 * _890;
    float _980 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _926);
    float _982 = sqrt(_970);
    float _984 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _928);
    float _988 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _990 = _956 * _984;
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _924);
    float _994 = _820 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _996 = _940 * _972;
    float _998 = _980 * _990;
    float _1000 = _934 * _972;
    float _1002 = _954 * _972;
    float _1004 = _910 * _996;
    float _1006 = _992 * _962;
    float _1008 = _908 * _1000;
    float _1010 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[11].x, _994);
    float _1012 = -_1004;
    float _1014 = fma(_906, _1000, _1012);
    float _1016 = fma(_982, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1018 = _956 * _988;
    float _1020 = -_1008;
    float _1022 = fma(_910, _1002, _1020);
    float _1024 = _998 * _1014;
    float _1026 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1010);
    float _1028 = _986 * _1018;
    float _1030 = precise::max(_1016, 1.0);
    float _1032 = _998 * _1022;
    float _1034 = fma(_1006, _1002, _1024);
    float _1036 = precise::min(_1030, 1.89999997615814208984375);
    float _1038 = fma(_1006, _996, _1032);
    float _1040 = fma(_1028, _908, _1034);
    float _1042 = fma(_1028, _906, _1038);
    float _1044 = fma(_1040, _1036, _470);
    float _1046 = _906 * _1002;
    float _1048 = fma(_1042, _1036, _560);
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1044 + _1050;
    float _1054 = -_1046;
    float _1056 = fma(_908, _996, _1054);
    bool _1058 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.5);
    bool _1066 = _1062 || _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1070 = _1048 + _1068;
    float _1072 = _1052 * _1052;
    float _1074 = _998 * _1056;
    float _1076 = _820 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1078 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1080 = fma(_1070, _1070, _1072);
    float _1082 = fma(_1006, _1000, _1074);
    float _1084 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1076);
    float _1086 = 1.0 / _1078;
    float _1088 = fma(_1028, _910, _1082);
    float _1090 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1084);
    bool _1092 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.5);
    bool _1100 = _1096 || _1098;
    float _1102 = fma(_1088, _1036, _672);
    float _1104 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1106 = sqrt(_1080);
    float _1108 = _1104 + _1078;
    bool _1110 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1088;
    float _1114 = _996;
    float _1116 = _1074;
    float _1118 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1120 = _956;
    if (!_1110)
    {
        _1112 = _1048;
    }
    float _1122 = _1112;
    float _1124 = _1122;
    if (!_1110)
    {
        _1114 = _1044;
    }
    float _1126 = _1114;
    float _1128 = _1126;
    if (!_1110)
    {
        _1116 = _1102;
    }
    float _1130 = _1116;
    bool _1132 = !_1110;
    float _1134 = _1130;
    if (!_1132)
    {
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1140 = _1106 + _1138;
        float _1142 = rsqrt(_1080);
        float _1144 = _1140 * _1136;
        float _1146 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = _1144 * 0.15915493667125701904296875;
        float _1150 = _1148 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        float _1154 = _1148 * 6.283185482025146484375;
        float _1156 = sin(_1154);
        float _1158 = _1152 + (-1.0);
        float _1160 = fma(_1156, _1146, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1162 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1164 = _1142 * _1160;
        float _1166 = fma(_1102, _1152, _1162);
        float _1168 = fma(_1070, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1170 = fma(_1052, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1124 = _1168;
        _1134 = _1166;
        _1128 = _1170;
        _1118 = _1162;
    }
    float _1172 = _1124;
    float _1174 = _1134;
    float _1176 = _1128;
    float _1178 = _1118;
    float _1180 = -_814;
    float _1182 = _1180 + _1172;
    float _1184 = -_816;
    float _1186 = _1184 + _1174;
    float _1188 = -_822;
    float _1190 = _1188 + _1176;
    float _1192 = _1108 * _1086;
    float _1194 = _1192 * 0.5;
    float _1196 = _1178;
    float _1198 = _1186;
    float _1200 = _1182;
    float _1202 = _1190;
    float _1204 = _1174;
    if (_1100)
    {
        _1196 = 1.0;
    }
    float _1206 = _1196;
    float _1208 = _1206;
    if (!_1066)
    {
        float _1210 = _830 * _830;
        float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1214 = -_470;
        float _1216 = _1214 + _1176;
        float _1218 = -_560;
        float _1220 = _1218 + _1172;
        float _1222 = fma(_838, _838, _1210);
        float _1224 = -_672;
        float _1226 = _1224 + _1174;
        float _1228 = fma(_844, _844, _1222);
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1232 = sqrt(_1228);
        float _1234 = 1.0 / _956;
        float _1236 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1238 = precise::min(_1232, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1240 = _1238 * _1212;
        float _1242 = _1240 * _1234;
        float _1244 = _1236 * _1242;
        float _1246 = _1216 * _1242;
        float _1248 = fma(_1220, _1244, _826);
        float _1250 = fma(_1226, _1244, _820);
        float _1252 = fma(_1236, _1246, _834);
        _1198 = _1250;
        _1200 = _1248;
        _1202 = _1252;
    }
    float _1254 = _1198;
    float _1256 = _1200;
    float _1258 = _1202;
    if (!_1100)
    {
        float _1260 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1264 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1262);
        float _1266 = _1260 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1274 = _1272 * 0.15915493667125701904296875;
        float _1276 = _1266 * 6.283185482025146484375;
        float _1278 = sin(_1276);
        float _1280 = 1.0 / _1270;
        float _1282 = _1274 * 6.283185482025146484375;
        float _1284 = cos(_1282);
        float _1286 = _1278 * _1280;
        float _1288 = 1.0 / _1264;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1292 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1290;
        float _1294 = _1284 * _1286;
        float _1296 = _1274 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = 1.0 / _1294;
        float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1304 = _1288 * _1302;
        float _1306 = 1.0 / _1292;
        float _1308 = _1298 * _1300;
        float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1312 = fma(_1308, _1304, _1310);
        float _1314 = _1312 * _1306;
        float _1316 = precise::clamp(_1314, 0.0, 1.0);
        _1204 = _1306;
        _1208 = _1316;
    }
    float _1318 = _1204;
    float _1320 = _1208;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1324 = _1254 + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1328 = _1256 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1332 = _1258 + _1330;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = _1324 * _1324;
    float _1338 = fma(_1328, _1328, _1336);
    float _1340 = fma(_1332, _1332, _1338);
    float _1342 = rsqrt(_1340);
    float _1344 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1346 = _1328 * _1344;
    float _1348 = _1332 * _1344;
    float _1350 = _1346 * _1346;
    float _1352 = _1348 * _1348;
    float _1354 = _1350 + _1352;
    float _1356 = sqrt(_1354);
    bool _1358 = _1356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = _1356 + _1360;
    float _1364 = _1332;
    float _1366 = _1338;
    float _1368 = _1362;
    float _1370 = _1318;
    float _1372 = _1334;
    float _1374 = _1324;
    if (_1358)
    {
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1376;
    }
    float _1378 = _1364;
    if (_1358)
    {
        float _1380 = rsqrt(_1354);
        _1366 = _1380;
    }
    float _1382 = _1366;
    float _1384 = _1382;
    if (_1358)
    {
        float _1386 = _1362 * _1378;
        _1368 = _1386;
    }
    float _1388 = _1368;
    if (_1358)
    {
        float _1390 = _1388 * 0.15915493667125701904296875;
        _1370 = _1390;
    }
    float _1392 = _1370;
    float _1394 = precise::max(0.0, _1334);
    float _1396 = _1394;
    if (!_1358)
    {
        _1372 = _1346;
    }
    float _1398 = _1372;
    float _1400 = _1342;
    float _1402 = _1398;
    if (_1358)
    {
        float _1404 = _1392 * 6.283185482025146484375;
        float _1406 = sin(_1404);
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = -_1344;
    float _1412 = -_1394;
    float _1414 = fma(_1324, _1410, _1412);
    float _1416 = _1414;
    if (!_1358)
    {
        _1374 = _1352;
    }
    float _1418 = _1374;
    float _1420 = _1418;
    if (_1358)
    {
        float _1422 = _1414 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1396 = _1422;
    }
    float _1424 = _1396;
    float _1426 = _1378;
    float _1428 = _1424;
    if (_1358)
    {
        float _1430 = _1392 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        _1426 = _1432;
    }
    float _1434 = _1426;
    float _1436 = _1408;
    if (_1358)
    {
        float _1438 = fma(_1408, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = sqrt(_1340);
    float _1444 = _1440;
    if (_1358)
    {
        float _1446 = _1382 * _1440;
        _1120 = _1446;
    }
    float _1448 = _1120;
    if (!_1358)
    {
        _1444 = _1348;
    }
    float _1450 = _1444;
    float _1452 = _1450;
    if (_1358)
    {
        float _1454 = _1434 + (-1.0);
        _1428 = _1454;
    }
    float _1456 = _1428;
    float _1458 = _1456;
    if (_1358)
    {
        float _1460 = _1346 * _1448;
        _1402 = _1460;
    }
    float _1462 = _1402;
    if (_1358)
    {
        float _1464 = _1348 * _1448;
        _1452 = _1464;
    }
    float _1466 = _1452;
    if (_1358)
    {
        float _1468 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1468;
    }
    float _1470 = _1384;
    if (!_1358)
    {
        _1458 = _1350;
    }
    float _1472 = _1458;
    float _1474 = _1472;
    if (_1358)
    {
        float _1476 = _1462 * _1462;
        _1474 = _1476;
    }
    float _1478 = _1474;
    if (_1358)
    {
        float _1480 = _1466 * _1466;
        _1420 = _1480;
    }
    float _1482 = _1420;
    if (_1358)
    {
        float _1484 = fma(_1414, _1434, _1470);
        _1416 = _1484;
    }
    float _1486 = _1416;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1490 = fma(_1442, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1488);
    float _1492 = precise::clamp(_1490, 0.0, 1.0);
    float _1494 = fma(_1486, _1486, _1478);
    float _1496 = -_1492;
    float _1498 = _1496 + 1.0;
    float _1500 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1502 = _1494 + _1482;
    float _1504 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1506 = rsqrt(_1502);
    float _1508 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1504);
    float _1510 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1512 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1508);
    float _1514 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1510);
    float _1518 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1520 = abs(_1498);
    float _1522 = log2(_1520);
    float _1524 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1514);
    float _1526 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1516);
    float _1528 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1518);
    float _1530 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1524);
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1536 = _1506 * _1462;
    float _1538 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1528);
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1544 = _1506 * _1486;
    float _1546 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = _1506 * _1466;
    float _1552 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1542);
    float _1554 = -_1546;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = -_1548;
    float _1560 = fma(_1558, _1500, 1.0);
    float _1562 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1564 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1566 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1552);
    float _1568 = -_1550;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1572 = exp2(_1562);
    float _1574 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1576 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1566);
    float _1578 = fma(_1570, -0.5, 0.5);
    float _1580 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1582 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1574);
    float _1584 = fma(_1570, 0.5, 0.5);
    float _1586 = _1544 + 1.0;
    float _1588 = log2(_1560);
    float _1590 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1580);
    float _1592 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1582);
    float _1594 = fma(_1584, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1596 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1590);
    float _1598 = fma(_1584, _1594, -0.212114393711090087890625);
    float _1600 = 1.0 / _1576;
    float _1602 = -_1544;
    float _1604 = fma(_1572, _1586, _1602);
    float _1606 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1592);
    float _1608 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1596);
    float _1610 = fma(_1584, _1598, 1.570728778839111328125);
    float _1612 = fma(_1604, 0.5, 0.5);
    float _1614 = sqrt(_1578);
    float _1616 = _1588 * 0.693147182464599609375;
    float _1618 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1620 = _1606 * _1600;
    float _1622 = _1608 * _1600;
    float _1624 = fma(_1620, 0.5, 0.5);
    float _1626 = fma(_1622, -0.5, 0.5);
    float _1628 = _1614 * 0.636619746685028076171875;
    float3 _4275 = float3(_1624, _1626, _1618);
    float _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4275, float3(0.0), isnan(_4275)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4275, float3(0.0), isnan(_4275)), level(0.0)).x;
    float3 _4286 = float3(_1624, _1626, _1618);
    float4 _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4286, float3(0.0), isnan(_4286)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4286, float3(0.0), isnan(_4286)), level(0.0)).xyzw;
    float _1635 = _1633.x;
    float _1637 = _1633.y;
    float _1639 = _1633.z;
    float _1641 = _1633.w;
    float _1643 = -_1610;
    float _1645 = fma(_1628, _1643, 1.0);
    float2 _4308 = float2(_1645, _1612);
    float3 _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4308, float2(0.0), isnan(_4308)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4308, float2(0.0), isnan(_4308)), level(0.0)).xyz;
    float _1651 = _1649.x;
    float _1653 = _1649.y;
    float _1655 = _1649.z;
    float _1657 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1659 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1661 = _1320 > 0.0;
    bool _1663 = isnan(_1320);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.0);
    bool _1669 = _1665 || _1667;
    out.m_63.x = _808;
    out.m_63.y = _810;
    out.m_63.z = _812;
    float _1671 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1673 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1659);
    float _1675 = exp2(_1657);
    float _1677 = _1671 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1679 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1673);
    out.m_61.x = _790;
    out.m_61.y = _798;
    out.m_61.z = _796;
    float _1681 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1679);
    out.m_45.x = _1677;
    float _1683 = _1681 + _1576;
    out.gl_Position.x = _1606;
    out.gl_Position.y = _1608;
    out.gl_Position.z = _1681;
    out.gl_Position.w = _1576;
    float _1685 = _1683 * 0.5;
    float _1687 = -_1675;
    float _1689 = _1687 + 1.0;
    float _1691 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1685;
    out.m_67.w = _1576;
    float _1693 = -_1691;
    float _1695 = _1693 + 1.0;
    float _1697 = _1691 * _1630;
    float _1699 = _1641 * _1697;
    float _1701 = _1641 * _1695;
    float _1703 = _1655 * _1697;
    float _1705 = fma(_1651, _1699, _1635);
    float _1707 = fma(_1653, _1699, _1637);
    float _1709 = fma(_1641, _1703, _1639);
    out.m_69.x = _1705;
    out.m_69.y = _1707;
    out.m_69.z = _1709;
    out.m_69.w = _1701;
    if (_1669)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1711;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _372 = false;
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
        float _1768 = as_type<float>(_104);
        out.gl_Position.z = _1768;
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
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1836 = as_type<float>(_140);
        out.gl_Position.z = _1836;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_49.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _146 * _144;
    float _166 = 0.0;
    float _168 = _148;
    if (!_158)
    {
        float _170 = _148 * _148;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _178 = _174;
    if (!_158)
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
    bool _204 = !_158;
    float _206 = _182;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _148 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _148);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_158;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _148 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _168 = _260;
    }
    float _262 = _168;
    float _264 = in.m_51.w;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _272 = _270 != 0;
    float _274 = in.m_42.x;
    float _276 = in.m_42.y;
    float _278 = in.m_42.z;
    bool _280 = _202 < 0.5;
    float _282 = float(_280);
    float _284 = fma(_198, 0.5, 0.5);
    bool _286 = !_268;
    int _288 = _286 ? 0 : 1;
    float _290 = -_202;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _294 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _296 = -_282;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _300 = abs(_288);
    float _302 = -_284;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = fma(_262, _184, _294);
    bool _308 = !_162;
    int _310 = _308 ? 0 : 1;
    float _312 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _314 = !_272;
    int _316 = _314 ? 0 : 1;
    float _318 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _322 = fma(_262, _186, _312);
    int _324 = abs(_310);
    float _326 = fma(_262, _188, _318);
    int _328 = abs(_316);
    float _330 = float(_300);
    float _332 = float(_324);
    float _334 = abs(_292);
    float _336 = _330 * _334;
    float _338 = fma(_326, _264, _278);
    float _340 = float(_328);
    float _342 = fma(_332, _304, _336);
    float _344 = fma(_306, _264, _274);
    float _346 = fma(_322, _264, _276);
    float _348 = abs(_298);
    float _350 = fma(_340, _348, _342);
    bool _352 = !_320;
    bool _354 = false;
    float _370;
    if (!_352)
    {
        float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _358 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _362 = _360 * _356;
        float _364 = floor(_362);
        float _366 = -_364;
        float _368 = _362 + _366;
        _370 = _368;
        _372 = true;
    }
    else
    {
        float _374 = float(_88);
        float _376 = 1.0 / _374;
        float _378 = _122 * _376;
        _370 = _378;
    }
    _372 = false;
    float _380 = _370;
    float _382 = in.m_49.w;
    float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _386 = in.m_53.w;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _390 = _388 != 0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _402 = _400 != 0;
    float _404 = in.m_49.y;
    float _406 = 1.0 / _394;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _410 = _408 != 0;
    float _412 = _346 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _416 = _414 != 0;
    float _418 = in.m_55.x;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _422 = _420 != 0;
    float _424 = _346 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _426 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _412);
    float _428 = _326;
    if (_390)
    {
        float _430 = in.m_49.z;
        _428 = _430;
    }
    float _432 = _428;
    float _434 = 1.0 / _398;
    float _436 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _424);
    bool _438 = _382 > 0.5;
    float _440 = _346 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _442 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _444;
    float _448 = in.m_55.y;
    float _450 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _454 = _380 + _452;
    float _456 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
    out.m_57.w = _386;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _458;
    float _462 = _454 * _406;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _466 = _380 + _464;
    float _468 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].z, _450);
    float _470 = _456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = _466 * _434;
    float _474 = fma(_446, _462, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].x;
    bool _486 = _438;
    int _488 = as_type<int>(_474);
    if (_390)
    {
        bool _490 = _432 > 0.5;
        _354 = _490;
    }
    bool _492 = _354;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _498 = fma(_478, _462, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _500 = fma(_460, _462, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _506 = fma(_482, _472, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _508 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _510 = isnan(_380);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _478;
    float _522 = _498;
    if (!_410)
    {
        float _524 = in.m_49.z;
        _520 = _524;
    }
    float _526 = _520;
    float _528 = fma(_504, _472, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _530 = -_448;
    float _532 = _530 + 1.0;
    float _534 = fma(_496, _472, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _536 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _538 = isnan(_380);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -_518;
    float _550 = _548 + 1.0;
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _554 = _550;
    float _556 = _448;
    if (!_410)
    {
        _484 = _404;
    }
    float _558 = _484;
    float _560 = _468 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _562 = _438 ? as_type<int>(_532) : as_type<int>(_448);
    float _564 = _546 * _550;
    float _566 = _558;
    if (_402)
    {
        bool _568 = _142 > 0.5;
        _486 = _568;
    }
    bool _570 = _486;
    float _572 = -_546;
    float _574 = _572 + 1.0;
    if (_410)
    {
        _566 = _142;
    }
    float _576 = _566;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _580 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _582 = isnan(_380);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _416 ? as_type<float>(_562) : _448;
    if (!_402)
    {
        _554 = _418;
    }
    float _594 = _554;
    float _596 = _590 * _574;
    float _598 = -_590;
    float _600 = _598 + 1.0;
    float _602 = _552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _604 = _474 * _596;
    int _606 = as_type<int>(_596);
    float _608 = _594;
    float _610 = _602;
    if (_402)
    {
        float _612 = -_418;
        float _614 = _612 + 1.0;
        _488 = as_type<int>(_614);
    }
    int _616 = _488;
    float _618 = _498 * _596;
    float _620 = _500 * _596;
    if (_390)
    {
        float _622 = -_418;
        float _624 = _622 + 1.0;
        _606 = as_type<int>(_624);
    }
    int _626 = _606;
    float _628 = fma(_602, _592, -0.5);
    if (_402)
    {
        float _630 = _570 ? as_type<float>(_616) : _418;
        _608 = _630;
    }
    float _632 = _608;
    float _634 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].x, _618);
    float _636 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].z, _620);
    float _638 = _526;
    if (!_410)
    {
        _610 = _526;
    }
    float _640 = _610;
    float _642 = _632 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _644 = _640;
    if (!_390)
    {
        _522 = _418;
    }
    float _646 = _522;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _650 = _646;
    if (_410)
    {
        _644 = _404;
    }
    float _652 = _644;
    float _654 = fma(_534, _564, _636);
    if (_410)
    {
        _638 = _404;
    }
    float _656 = _638;
    float _658 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[83].z, _648);
    if (_390)
    {
        float _660 = _492 ? as_type<float>(_626) : _418;
        _650 = _660;
    }
    float _662 = _650;
    float _664 = _576 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _666 = _404 > 0.5;
    float _668 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].y, _604);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _672 = _442 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _676 = _470 + _674;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_422)
    {
        float _680 = _666 ? _532 : _448;
        _556 = _680;
    }
    float _682 = _556;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _686 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].z, _654);
    float _688 = -_678;
    float _690 = fma(_664, 2.0, _688);
    float _692 = fma(_506, _564, _634);
    float _694 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[83].w, _684);
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _698 = _672 + _696;
    float _700 = fma(_528, _564, _668);
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _704 = _560 + _702;
    float _706 = _652 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _710 = _670 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _712 = _698 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _714 = -_122;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[81].x, _690);
    float _718 = fma(_706, -2.0, _708);
    float _720 = fma(_710, _662, -0.5);
    float _722 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[28].x, _712);
    float _724 = in.m_51.x;
    float _726 = in.m_51.y;
    float _728 = in.m_51.z;
    float _730 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _718);
    float _732 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _658);
    float _734 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[28].z, _722);
    float _736 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _694);
    float _738 = _682 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _740 = fma(_732, _720, _716);
    float _742 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].x, _692);
    bool _744 = _734 >= 0.0;
    float _746 = -_730;
    float _748 = fma(_736, _628, _746);
    float _750 = _642 * _384;
    float _752 = _698 * _698;
    float _754 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].y, _700);
    float _756 = _748 + 0.5;
    float _758 = fma(_704, _704, _752);
    float _760 = _742 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _762 = fma(_676, _676, _758);
    float _764 = _738 * _578;
    float _766 = _752;
    int _768 = as_type<int>(_758);
    float _770 = _686;
    if (_744)
    {
        _766 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _772 = _766;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _778 = _724 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _780 = rsqrt(_762);
    if (_744)
    {
        float _782 = _772 * 5.0;
        _768 = as_type<int>(_782);
    }
    int _784 = _768;
    float _786 = _350 * _778;
    float _788 = _740 + 0.5;
    float _790 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_744)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_784);
        out.gl_Position.z = _2901;
    }
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _794 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _796 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _750;
    out.m_59.y = _764;
    out.m_59.z = _788;
    out.m_59.w = _756;
    float _798 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _794 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_744)
    {
        out.m_45.x = 0.0;
    }
    float _802 = _800 * _780;
    float _804 = _754 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _806 = _686 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _808 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _790;
    out.m_61.y = _798;
    out.m_61.z = _796;
    float _810 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _704 * _802;
    float _816 = _698 * _802;
    out.m_63.x = _808;
    out.m_63.y = _810;
    out.m_63.z = _812;
    if (_744)
    {
        return out;
    }
    float _818 = -_816;
    float _820 = _672 + _818;
    float _822 = _676 * _802;
    float _824 = -_814;
    float _826 = _560 + _824;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _830 = _820 + _828;
    float _832 = -_822;
    float _834 = _470 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _826 + _836;
    float _840 = _830 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _844 = _834 + _842;
    float _846 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    float _848 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[28].z, _846);
    bool _850 = _848 >= 0.0;
    if (_850)
    {
        _770 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _852 = _770;
    int _854 = as_type<int>(_852);
    if (_850)
    {
        out.m_45.x = 0.0;
    }
    if (_850)
    {
        float _856 = _852 * 5.0;
        _854 = as_type<int>(_856);
    }
    int _858 = _854;
    if (_850)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3059 = as_type<float>(_858);
        out.gl_Position.z = _3059;
    }
    if (_850)
    {
        return out;
    }
    float _860 = -_672;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _864 = -_560;
    float _866 = _864 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _868 = -_470;
    float _870 = _868 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = -_816;
    float _874 = _698 + _872;
    float _876 = _862 * _862;
    float _878 = -_814;
    float _880 = _704 + _878;
    float _882 = -_822;
    float _884 = _676 + _882;
    float _886 = _874 * _874;
    float _888 = fma(_866, _866, _876);
    float _890 = _728 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _892 = fma(_880, _880, _886);
    float _894 = fma(_870, _870, _888);
    float _896 = fma(_884, _884, _892);
    float _898 = rsqrt(_894);
    float _900 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _902 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _900;
    float _904 = sqrt(_896);
    float _906 = _866 * _898;
    float _908 = _870 * _898;
    float _910 = _862 * _898;
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _914 = _906 * _912;
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _918 = _908 * _916;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _922 = _910 * _920;
    float _924 = in.m_65.x;
    float _926 = in.m_65.y;
    float _928 = in.m_65.z;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _932 = -_914;
    float _934 = fma(_908, _930, _932);
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _938 = -_918;
    float _940 = fma(_910, _936, _938);
    float _942 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _944 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _942;
    float _946 = _902 * _902;
    float _948 = _934 * _934;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _952 = -_922;
    float _954 = fma(_906, _950, _952);
    float _956 = _780 * _904;
    float _958 = fma(_944, _944, _946);
    float _960 = fma(_940, _940, _948);
    float _962 = _794 * _956;
    float _964 = fma(_954, _954, _960);
    float _966 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _968 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _966;
    float _970 = fma(_968, _968, _958);
    float _972 = rsqrt(_964);
    float _974 = _726 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _976 = _350 * _974;
    float _978 = _350 * _890;
    float _980 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _926);
    float _982 = sqrt(_970);
    float _984 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _928);
    float _988 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _990 = _956 * _984;
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _924);
    float _994 = _820 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _996 = _940 * _972;
    float _998 = _980 * _990;
    float _1000 = _934 * _972;
    float _1002 = _954 * _972;
    float _1004 = _910 * _996;
    float _1006 = _992 * _962;
    float _1008 = _908 * _1000;
    float _1010 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[11].x, _994);
    float _1012 = -_1004;
    float _1014 = fma(_906, _1000, _1012);
    float _1016 = fma(_982, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1018 = _956 * _988;
    float _1020 = -_1008;
    float _1022 = fma(_910, _1002, _1020);
    float _1024 = _998 * _1014;
    float _1026 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1010);
    float _1028 = _986 * _1018;
    float _1030 = precise::max(_1016, 1.0);
    float _1032 = _998 * _1022;
    float _1034 = fma(_1006, _1002, _1024);
    float _1036 = precise::min(_1030, 1.89999997615814208984375);
    float _1038 = fma(_1006, _996, _1032);
    float _1040 = fma(_1028, _908, _1034);
    float _1042 = fma(_1028, _906, _1038);
    float _1044 = fma(_1040, _1036, _470);
    float _1046 = _906 * _1002;
    float _1048 = fma(_1042, _1036, _560);
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1044 + _1050;
    float _1054 = -_1046;
    float _1056 = fma(_908, _996, _1054);
    bool _1058 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.5);
    bool _1066 = _1062 || _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1070 = _1048 + _1068;
    float _1072 = _1052 * _1052;
    float _1074 = _998 * _1056;
    float _1076 = _820 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1078 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1080 = fma(_1070, _1070, _1072);
    float _1082 = fma(_1006, _1000, _1074);
    float _1084 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1076);
    float _1086 = 1.0 / _1078;
    float _1088 = fma(_1028, _910, _1082);
    float _1090 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1084);
    bool _1092 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.5);
    bool _1100 = _1096 || _1098;
    float _1102 = fma(_1088, _1036, _672);
    float _1104 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1106 = sqrt(_1080);
    float _1108 = _1104 + _1078;
    bool _1110 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1088;
    float _1114 = _996;
    float _1116 = _1074;
    float _1118 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1120 = _956;
    if (!_1110)
    {
        _1112 = _1048;
    }
    float _1122 = _1112;
    float _1124 = _1122;
    if (!_1110)
    {
        _1114 = _1044;
    }
    float _1126 = _1114;
    float _1128 = _1126;
    if (!_1110)
    {
        _1116 = _1102;
    }
    float _1130 = _1116;
    bool _1132 = !_1110;
    float _1134 = _1130;
    if (!_1132)
    {
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1140 = _1106 + _1138;
        float _1142 = rsqrt(_1080);
        float _1144 = _1140 * _1136;
        float _1146 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = _1144 * 0.15915493667125701904296875;
        float _1150 = _1148 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        float _1154 = _1148 * 6.283185482025146484375;
        float _1156 = sin(_1154);
        float _1158 = _1152 + (-1.0);
        float _1160 = fma(_1156, _1146, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1162 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1164 = _1142 * _1160;
        float _1166 = fma(_1102, _1152, _1162);
        float _1168 = fma(_1070, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1170 = fma(_1052, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1124 = _1168;
        _1134 = _1166;
        _1128 = _1170;
        _1118 = _1162;
    }
    float _1172 = _1124;
    float _1174 = _1134;
    float _1176 = _1128;
    float _1178 = _1118;
    float _1180 = -_814;
    float _1182 = _1180 + _1172;
    float _1184 = -_816;
    float _1186 = _1184 + _1174;
    float _1188 = -_822;
    float _1190 = _1188 + _1176;
    float _1192 = _1108 * _1086;
    float _1194 = _1192 * 0.5;
    float _1196 = _1178;
    float _1198 = _1186;
    float _1200 = _1182;
    float _1202 = _1190;
    float _1204 = _1174;
    if (_1100)
    {
        _1196 = 1.0;
    }
    float _1206 = _1196;
    float _1208 = _1206;
    if (!_1066)
    {
        float _1210 = _830 * _830;
        float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1214 = -_470;
        float _1216 = _1214 + _1176;
        float _1218 = -_560;
        float _1220 = _1218 + _1172;
        float _1222 = fma(_838, _838, _1210);
        float _1224 = -_672;
        float _1226 = _1224 + _1174;
        float _1228 = fma(_844, _844, _1222);
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1232 = sqrt(_1228);
        float _1234 = 1.0 / _956;
        float _1236 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1238 = precise::min(_1232, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1240 = _1238 * _1212;
        float _1242 = _1240 * _1234;
        float _1244 = _1236 * _1242;
        float _1246 = _1216 * _1242;
        float _1248 = fma(_1220, _1244, _826);
        float _1250 = fma(_1226, _1244, _820);
        float _1252 = fma(_1236, _1246, _834);
        _1198 = _1250;
        _1200 = _1248;
        _1202 = _1252;
    }
    float _1254 = _1198;
    float _1256 = _1200;
    float _1258 = _1202;
    if (!_1100)
    {
        float _1260 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1264 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1262);
        float _1266 = _1260 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1274 = _1272 * 0.15915493667125701904296875;
        float _1276 = _1266 * 6.283185482025146484375;
        float _1278 = sin(_1276);
        float _1280 = 1.0 / _1270;
        float _1282 = _1274 * 6.283185482025146484375;
        float _1284 = cos(_1282);
        float _1286 = _1278 * _1280;
        float _1288 = 1.0 / _1264;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1292 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1290;
        float _1294 = _1284 * _1286;
        float _1296 = _1274 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = 1.0 / _1294;
        float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1304 = _1288 * _1302;
        float _1306 = 1.0 / _1292;
        float _1308 = _1298 * _1300;
        float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1312 = fma(_1308, _1304, _1310);
        float _1314 = _1312 * _1306;
        float _1316 = precise::clamp(_1314, 0.0, 1.0);
        _1204 = _1306;
        _1208 = _1316;
    }
    float _1318 = _1204;
    float _1320 = _1208;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1324 = _1254 + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1328 = _1256 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1332 = _1258 + _1330;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = _1324 * _1324;
    float _1338 = fma(_1328, _1328, _1336);
    float _1340 = fma(_1332, _1332, _1338);
    float _1342 = rsqrt(_1340);
    float _1344 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1346 = _1328 * _1344;
    float _1348 = _1332 * _1344;
    float _1350 = _1346 * _1346;
    float _1352 = _1348 * _1348;
    float _1354 = _1350 + _1352;
    float _1356 = sqrt(_1354);
    bool _1358 = _1356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = _1356 + _1360;
    float _1364 = _1332;
    float _1366 = _1338;
    float _1368 = _1362;
    float _1370 = _1318;
    float _1372 = _1334;
    float _1374 = _1324;
    if (_1358)
    {
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1376;
    }
    float _1378 = _1364;
    if (_1358)
    {
        float _1380 = rsqrt(_1354);
        _1366 = _1380;
    }
    float _1382 = _1366;
    float _1384 = _1382;
    if (_1358)
    {
        float _1386 = _1362 * _1378;
        _1368 = _1386;
    }
    float _1388 = _1368;
    if (_1358)
    {
        float _1390 = _1388 * 0.15915493667125701904296875;
        _1370 = _1390;
    }
    float _1392 = _1370;
    float _1394 = precise::max(0.0, _1334);
    float _1396 = _1394;
    if (!_1358)
    {
        _1372 = _1346;
    }
    float _1398 = _1372;
    float _1400 = _1342;
    float _1402 = _1398;
    if (_1358)
    {
        float _1404 = _1392 * 6.283185482025146484375;
        float _1406 = sin(_1404);
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = -_1344;
    float _1412 = -_1394;
    float _1414 = fma(_1324, _1410, _1412);
    float _1416 = _1414;
    if (!_1358)
    {
        _1374 = _1352;
    }
    float _1418 = _1374;
    float _1420 = _1418;
    if (_1358)
    {
        float _1422 = _1414 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1396 = _1422;
    }
    float _1424 = _1396;
    float _1426 = _1378;
    float _1428 = _1424;
    if (_1358)
    {
        float _1430 = _1392 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        _1426 = _1432;
    }
    float _1434 = _1426;
    float _1436 = _1408;
    if (_1358)
    {
        float _1438 = fma(_1408, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = sqrt(_1340);
    float _1444 = _1440;
    if (_1358)
    {
        float _1446 = _1382 * _1440;
        _1120 = _1446;
    }
    float _1448 = _1120;
    if (!_1358)
    {
        _1444 = _1348;
    }
    float _1450 = _1444;
    float _1452 = _1450;
    if (_1358)
    {
        float _1454 = _1434 + (-1.0);
        _1428 = _1454;
    }
    float _1456 = _1428;
    float _1458 = _1456;
    if (_1358)
    {
        float _1460 = _1346 * _1448;
        _1402 = _1460;
    }
    float _1462 = _1402;
    if (_1358)
    {
        float _1464 = _1348 * _1448;
        _1452 = _1464;
    }
    float _1466 = _1452;
    if (_1358)
    {
        float _1468 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1468;
    }
    float _1470 = _1384;
    if (!_1358)
    {
        _1458 = _1350;
    }
    float _1472 = _1458;
    float _1474 = _1472;
    if (_1358)
    {
        float _1476 = _1462 * _1462;
        _1474 = _1476;
    }
    float _1478 = _1474;
    if (_1358)
    {
        float _1480 = _1466 * _1466;
        _1420 = _1480;
    }
    float _1482 = _1420;
    if (_1358)
    {
        float _1484 = fma(_1414, _1434, _1470);
        _1416 = _1484;
    }
    float _1486 = _1416;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1490 = fma(_1442, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1488);
    float _1492 = precise::clamp(_1490, 0.0, 1.0);
    float _1494 = fma(_1486, _1486, _1478);
    float _1496 = -_1492;
    float _1498 = _1496 + 1.0;
    float _1500 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1502 = _1494 + _1482;
    float _1504 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1506 = rsqrt(_1502);
    float _1508 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1504);
    float _1510 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1512 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1508);
    float _1514 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1510);
    float _1518 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1520 = abs(_1498);
    float _1522 = log2(_1520);
    float _1524 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1514);
    float _1526 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1516);
    float _1528 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1518);
    float _1530 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1524);
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1536 = _1506 * _1462;
    float _1538 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1528);
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1544 = _1506 * _1486;
    float _1546 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = _1506 * _1466;
    float _1552 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1542);
    float _1554 = -_1546;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = -_1548;
    float _1560 = fma(_1558, _1500, 1.0);
    float _1562 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1564 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1566 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1552);
    float _1568 = -_1550;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1572 = exp2(_1562);
    float _1574 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1576 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1566);
    float _1578 = fma(_1570, -0.5, 0.5);
    float _1580 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1582 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1574);
    float _1584 = fma(_1570, 0.5, 0.5);
    float _1586 = _1544 + 1.0;
    float _1588 = log2(_1560);
    float _1590 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1580);
    float _1592 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1582);
    float _1594 = fma(_1584, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1596 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1590);
    float _1598 = fma(_1584, _1594, -0.212114393711090087890625);
    float _1600 = 1.0 / _1576;
    float _1602 = -_1544;
    float _1604 = fma(_1572, _1586, _1602);
    float _1606 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1592);
    float _1608 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1596);
    float _1610 = fma(_1584, _1598, 1.570728778839111328125);
    float _1612 = fma(_1604, 0.5, 0.5);
    float _1614 = sqrt(_1578);
    float _1616 = _1588 * 0.693147182464599609375;
    float _1618 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1620 = _1606 * _1600;
    float _1622 = _1608 * _1600;
    float _1624 = fma(_1620, 0.5, 0.5);
    float _1626 = fma(_1622, -0.5, 0.5);
    float _1628 = _1614 * 0.636619746685028076171875;
    float3 _4275 = float3(_1624, _1626, _1618);
    float _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4275, float3(0.0), isnan(_4275)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4275, float3(0.0), isnan(_4275)), level(0.0)).x;
    float3 _4286 = float3(_1624, _1626, _1618);
    float4 _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4286, float3(0.0), isnan(_4286)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4286, float3(0.0), isnan(_4286)), level(0.0)).xyzw;
    float _1635 = _1633.x;
    float _1637 = _1633.y;
    float _1639 = _1633.z;
    float _1641 = _1633.w;
    float _1643 = -_1610;
    float _1645 = fma(_1628, _1643, 1.0);
    float2 _4308 = float2(_1645, _1612);
    float3 _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4308, float2(0.0), isnan(_4308)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4308, float2(0.0), isnan(_4308)), level(0.0)).xyz;
    float _1651 = _1649.x;
    float _1653 = _1649.y;
    float _1655 = _1649.z;
    float _1657 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1659 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1661 = _1320 > 0.0;
    bool _1663 = isnan(_1320);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.0);
    bool _1669 = _1665 || _1667;
    out.m_63.x = _808;
    out.m_63.y = _810;
    out.m_63.z = _812;
    float _1671 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1673 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1659);
    float _1675 = exp2(_1657);
    float _1677 = _1671 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1679 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1673);
    out.m_61.x = _790;
    out.m_61.y = _798;
    out.m_61.z = _796;
    float _1681 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1679);
    out.m_45.x = _1677;
    float _1683 = _1681 + _1576;
    out.gl_Position.x = _1606;
    out.gl_Position.y = _1608;
    out.gl_Position.z = _1681;
    out.gl_Position.w = _1576;
    float _1685 = _1683 * 0.5;
    float _1687 = -_1675;
    float _1689 = _1687 + 1.0;
    float _1691 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1685;
    out.m_67.w = _1576;
    float _1693 = -_1691;
    float _1695 = _1693 + 1.0;
    float _1697 = _1691 * _1630;
    float _1699 = _1641 * _1697;
    float _1701 = _1641 * _1695;
    float _1703 = _1655 * _1697;
    float _1705 = fma(_1651, _1699, _1635);
    float _1707 = fma(_1653, _1699, _1637);
    float _1709 = fma(_1641, _1703, _1639);
    out.m_69.x = _1705;
    out.m_69.y = _1707;
    out.m_69.z = _1709;
    out.m_69.w = _1701;
    if (_1669)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1711;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _372 = false;
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
        float _1768 = as_type<float>(_104);
        out.gl_Position.z = _1768;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1836 = as_type<float>(_140);
        out.gl_Position.z = _1836;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    int _160 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _162 = _160 != 0;
    float _164 = _146 * _144;
    float _166 = 0.0;
    float _168 = _148;
    if (!_158)
    {
        float _170 = _148 * _148;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _164);
    float _178 = _174;
    if (!_158)
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
    bool _204 = !_158;
    float _206 = _182;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _148 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _148);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_158;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _148 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _168 = _260;
    }
    float _262 = _168;
    float _264 = in.m_51.w;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _272 = _270 != 0;
    float _274 = in.m_42.x;
    float _276 = in.m_42.y;
    float _278 = in.m_42.z;
    bool _280 = _202 < 0.5;
    float _282 = float(_280);
    float _284 = fma(_198, 0.5, 0.5);
    bool _286 = !_268;
    int _288 = _286 ? 0 : 1;
    float _290 = -_202;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _294 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _296 = -_282;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _300 = abs(_288);
    float _302 = -_284;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = fma(_262, _184, _294);
    bool _308 = !_162;
    int _310 = _308 ? 0 : 1;
    float _312 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _314 = !_272;
    int _316 = _314 ? 0 : 1;
    float _318 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _322 = fma(_262, _186, _312);
    int _324 = abs(_310);
    float _326 = fma(_262, _188, _318);
    int _328 = abs(_316);
    float _330 = float(_300);
    float _332 = float(_324);
    float _334 = abs(_292);
    float _336 = _330 * _334;
    float _338 = fma(_326, _264, _278);
    float _340 = float(_328);
    float _342 = fma(_332, _304, _336);
    float _344 = fma(_306, _264, _274);
    float _346 = fma(_322, _264, _276);
    float _348 = abs(_298);
    float _350 = fma(_340, _348, _342);
    bool _352 = !_320;
    bool _354 = false;
    float _370;
    if (!_352)
    {
        float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _358 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _362 = _360 * _356;
        float _364 = floor(_362);
        float _366 = -_364;
        float _368 = _362 + _366;
        _370 = _368;
        _372 = true;
    }
    else
    {
        float _374 = float(_88);
        float _376 = 1.0 / _374;
        float _378 = _122 * _376;
        _370 = _378;
    }
    _372 = false;
    float _380 = _370;
    float _382 = in.m_49.w;
    float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _386 = in.m_53.w;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _390 = _388 != 0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _402 = _400 != 0;
    float _404 = in.m_49.y;
    float _406 = 1.0 / _394;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _410 = _408 != 0;
    float _412 = _346 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _416 = _414 != 0;
    float _418 = in.m_55.x;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _422 = _420 != 0;
    float _424 = _346 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _426 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _412);
    float _428 = _326;
    if (_390)
    {
        float _430 = in.m_49.z;
        _428 = _430;
    }
    float _432 = _428;
    float _434 = 1.0 / _398;
    float _436 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _424);
    bool _438 = _382 > 0.5;
    float _440 = _346 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _442 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _444;
    float _448 = in.m_55.y;
    float _450 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _454 = _380 + _452;
    float _456 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
    out.m_57.w = _386;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _458;
    float _462 = _454 * _406;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _466 = _380 + _464;
    float _468 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].z, _450);
    float _470 = _456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = _466 * _434;
    float _474 = fma(_446, _462, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].x;
    bool _486 = _438;
    int _488 = as_type<int>(_474);
    if (_390)
    {
        bool _490 = _432 > 0.5;
        _354 = _490;
    }
    bool _492 = _354;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _498 = fma(_478, _462, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _500 = fma(_460, _462, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _506 = fma(_482, _472, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _508 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _510 = isnan(_380);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _478;
    float _522 = _498;
    if (!_410)
    {
        float _524 = in.m_49.z;
        _520 = _524;
    }
    float _526 = _520;
    float _528 = fma(_504, _472, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _530 = -_448;
    float _532 = _530 + 1.0;
    float _534 = fma(_496, _472, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _536 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _538 = isnan(_380);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -_518;
    float _550 = _548 + 1.0;
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _554 = _550;
    float _556 = _448;
    if (!_410)
    {
        _484 = _404;
    }
    float _558 = _484;
    float _560 = _468 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _562 = _438 ? as_type<int>(_532) : as_type<int>(_448);
    float _564 = _546 * _550;
    float _566 = _558;
    if (_402)
    {
        bool _568 = _142 > 0.5;
        _486 = _568;
    }
    bool _570 = _486;
    float _572 = -_546;
    float _574 = _572 + 1.0;
    if (_410)
    {
        _566 = _142;
    }
    float _576 = _566;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _580 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _582 = isnan(_380);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _416 ? as_type<float>(_562) : _448;
    if (!_402)
    {
        _554 = _418;
    }
    float _594 = _554;
    float _596 = _590 * _574;
    float _598 = -_590;
    float _600 = _598 + 1.0;
    float _602 = _552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _604 = _474 * _596;
    int _606 = as_type<int>(_596);
    float _608 = _594;
    float _610 = _602;
    if (_402)
    {
        float _612 = -_418;
        float _614 = _612 + 1.0;
        _488 = as_type<int>(_614);
    }
    int _616 = _488;
    float _618 = _498 * _596;
    float _620 = _500 * _596;
    if (_390)
    {
        float _622 = -_418;
        float _624 = _622 + 1.0;
        _606 = as_type<int>(_624);
    }
    int _626 = _606;
    float _628 = fma(_602, _592, -0.5);
    if (_402)
    {
        float _630 = _570 ? as_type<float>(_616) : _418;
        _608 = _630;
    }
    float _632 = _608;
    float _634 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].x, _618);
    float _636 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].z, _620);
    float _638 = _526;
    if (!_410)
    {
        _610 = _526;
    }
    float _640 = _610;
    float _642 = _632 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _644 = _640;
    if (!_390)
    {
        _522 = _418;
    }
    float _646 = _522;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _650 = _646;
    if (_410)
    {
        _644 = _404;
    }
    float _652 = _644;
    float _654 = fma(_534, _564, _636);
    if (_410)
    {
        _638 = _404;
    }
    float _656 = _638;
    float _658 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[83].z, _648);
    if (_390)
    {
        float _660 = _492 ? as_type<float>(_626) : _418;
        _650 = _660;
    }
    float _662 = _650;
    float _664 = _576 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _666 = _404 > 0.5;
    float _668 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].y, _604);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _672 = _442 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _676 = _470 + _674;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_422)
    {
        float _680 = _666 ? _532 : _448;
        _556 = _680;
    }
    float _682 = _556;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _686 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].z, _654);
    float _688 = -_678;
    float _690 = fma(_664, 2.0, _688);
    float _692 = fma(_506, _564, _634);
    float _694 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[83].w, _684);
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _698 = _672 + _696;
    float _700 = fma(_528, _564, _668);
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _704 = _560 + _702;
    float _706 = _652 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _710 = _670 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _712 = _698 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _714 = -_122;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[81].x, _690);
    float _718 = fma(_706, -2.0, _708);
    float _720 = fma(_710, _662, -0.5);
    float _722 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[28].x, _712);
    float _724 = in.m_51.x;
    float _726 = in.m_51.y;
    float _728 = in.m_51.z;
    float _730 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _718);
    float _732 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _658);
    float _734 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[28].z, _722);
    float _736 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _694);
    float _738 = _682 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _740 = fma(_732, _720, _716);
    float _742 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].x, _692);
    bool _744 = _734 >= 0.0;
    float _746 = -_730;
    float _748 = fma(_736, _628, _746);
    float _750 = _642 * _384;
    float _752 = _698 * _698;
    float _754 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[109].y, _700);
    float _756 = _748 + 0.5;
    float _758 = fma(_704, _704, _752);
    float _760 = _742 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _762 = fma(_676, _676, _758);
    float _764 = _738 * _578;
    float _766 = _752;
    int _768 = as_type<int>(_758);
    float _770 = _686;
    if (_744)
    {
        _766 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _772 = _766;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _778 = _724 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _780 = rsqrt(_762);
    if (_744)
    {
        float _782 = _772 * 5.0;
        _768 = as_type<int>(_782);
    }
    int _784 = _768;
    float _786 = _350 * _778;
    float _788 = _740 + 0.5;
    float _790 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_744)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_784);
        out.gl_Position.z = _2901;
    }
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _794 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _796 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _750;
    out.m_59.y = _764;
    out.m_59.z = _788;
    out.m_59.w = _756;
    float _798 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _794 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_744)
    {
        out.m_45.x = 0.0;
    }
    float _802 = _800 * _780;
    float _804 = _754 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _806 = _686 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _808 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _790;
    out.m_61.y = _798;
    out.m_61.z = _796;
    float _810 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _704 * _802;
    float _816 = _698 * _802;
    out.m_63.x = _808;
    out.m_63.y = _810;
    out.m_63.z = _812;
    if (_744)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _818 = -_816;
    float _820 = _672 + _818;
    float _822 = _676 * _802;
    float _824 = -_814;
    float _826 = _560 + _824;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _830 = _820 + _828;
    float _832 = -_822;
    float _834 = _470 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _826 + _836;
    float _840 = _830 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _844 = _834 + _842;
    float _846 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    float _848 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[28].z, _846);
    bool _850 = _848 >= 0.0;
    if (_850)
    {
        _770 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _852 = _770;
    int _854 = as_type<int>(_852);
    if (_850)
    {
        out.m_45.x = 0.0;
    }
    if (_850)
    {
        float _856 = _852 * 5.0;
        _854 = as_type<int>(_856);
    }
    int _858 = _854;
    if (_850)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3059 = as_type<float>(_858);
        out.gl_Position.z = _3059;
    }
    if (_850)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _860 = -_672;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _864 = -_560;
    float _866 = _864 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _868 = -_470;
    float _870 = _868 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = -_816;
    float _874 = _698 + _872;
    float _876 = _862 * _862;
    float _878 = -_814;
    float _880 = _704 + _878;
    float _882 = -_822;
    float _884 = _676 + _882;
    float _886 = _874 * _874;
    float _888 = fma(_866, _866, _876);
    float _890 = _728 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _892 = fma(_880, _880, _886);
    float _894 = fma(_870, _870, _888);
    float _896 = fma(_884, _884, _892);
    float _898 = rsqrt(_894);
    float _900 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _902 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _900;
    float _904 = sqrt(_896);
    float _906 = _866 * _898;
    float _908 = _870 * _898;
    float _910 = _862 * _898;
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _914 = _906 * _912;
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _918 = _908 * _916;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _922 = _910 * _920;
    float _924 = in.m_65.x;
    float _926 = in.m_65.y;
    float _928 = in.m_65.z;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _932 = -_914;
    float _934 = fma(_908, _930, _932);
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _938 = -_918;
    float _940 = fma(_910, _936, _938);
    float _942 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _944 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _942;
    float _946 = _902 * _902;
    float _948 = _934 * _934;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _952 = -_922;
    float _954 = fma(_906, _950, _952);
    float _956 = _780 * _904;
    float _958 = fma(_944, _944, _946);
    float _960 = fma(_940, _940, _948);
    float _962 = _794 * _956;
    float _964 = fma(_954, _954, _960);
    float _966 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _968 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _966;
    float _970 = fma(_968, _968, _958);
    float _972 = rsqrt(_964);
    float _974 = _726 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _976 = _350 * _974;
    float _978 = _350 * _890;
    float _980 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _926);
    float _982 = sqrt(_970);
    float _984 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _928);
    float _988 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _990 = _956 * _984;
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _924);
    float _994 = _820 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _996 = _940 * _972;
    float _998 = _980 * _990;
    float _1000 = _934 * _972;
    float _1002 = _954 * _972;
    float _1004 = _910 * _996;
    float _1006 = _992 * _962;
    float _1008 = _908 * _1000;
    float _1010 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[11].x, _994);
    float _1012 = -_1004;
    float _1014 = fma(_906, _1000, _1012);
    float _1016 = fma(_982, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1018 = _956 * _988;
    float _1020 = -_1008;
    float _1022 = fma(_910, _1002, _1020);
    float _1024 = _998 * _1014;
    float _1026 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1010);
    float _1028 = _986 * _1018;
    float _1030 = precise::max(_1016, 1.0);
    float _1032 = _998 * _1022;
    float _1034 = fma(_1006, _1002, _1024);
    float _1036 = precise::min(_1030, 1.89999997615814208984375);
    float _1038 = fma(_1006, _996, _1032);
    float _1040 = fma(_1028, _908, _1034);
    float _1042 = fma(_1028, _906, _1038);
    float _1044 = fma(_1040, _1036, _470);
    float _1046 = _906 * _1002;
    float _1048 = fma(_1042, _1036, _560);
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1044 + _1050;
    float _1054 = -_1046;
    float _1056 = fma(_908, _996, _1054);
    bool _1058 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.5);
    bool _1066 = _1062 || _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1070 = _1048 + _1068;
    float _1072 = _1052 * _1052;
    float _1074 = _998 * _1056;
    float _1076 = _820 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1078 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1080 = fma(_1070, _1070, _1072);
    float _1082 = fma(_1006, _1000, _1074);
    float _1084 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1076);
    float _1086 = 1.0 / _1078;
    float _1088 = fma(_1028, _910, _1082);
    float _1090 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1084);
    bool _1092 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.5);
    bool _1100 = _1096 || _1098;
    float _1102 = fma(_1088, _1036, _672);
    float _1104 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1106 = sqrt(_1080);
    float _1108 = _1104 + _1078;
    bool _1110 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1088;
    float _1114 = _996;
    float _1116 = _1074;
    float _1118 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1120 = _956;
    if (!_1110)
    {
        _1112 = _1048;
    }
    float _1122 = _1112;
    float _1124 = _1122;
    if (!_1110)
    {
        _1114 = _1044;
    }
    float _1126 = _1114;
    float _1128 = _1126;
    if (!_1110)
    {
        _1116 = _1102;
    }
    float _1130 = _1116;
    bool _1132 = !_1110;
    float _1134 = _1130;
    if (!_1132)
    {
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1140 = _1106 + _1138;
        float _1142 = rsqrt(_1080);
        float _1144 = _1140 * _1136;
        float _1146 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = _1144 * 0.15915493667125701904296875;
        float _1150 = _1148 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        float _1154 = _1148 * 6.283185482025146484375;
        float _1156 = sin(_1154);
        float _1158 = _1152 + (-1.0);
        float _1160 = fma(_1156, _1146, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1162 = _1158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1164 = _1142 * _1160;
        float _1166 = fma(_1102, _1152, _1162);
        float _1168 = fma(_1070, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1170 = fma(_1052, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1124 = _1168;
        _1134 = _1166;
        _1128 = _1170;
        _1118 = _1162;
    }
    float _1172 = _1124;
    float _1174 = _1134;
    float _1176 = _1128;
    float _1178 = _1118;
    float _1180 = -_814;
    float _1182 = _1180 + _1172;
    float _1184 = -_816;
    float _1186 = _1184 + _1174;
    float _1188 = -_822;
    float _1190 = _1188 + _1176;
    float _1192 = _1108 * _1086;
    float _1194 = _1192 * 0.5;
    float _1196 = _1178;
    float _1198 = _1186;
    float _1200 = _1182;
    float _1202 = _1190;
    float _1204 = _1174;
    if (_1100)
    {
        _1196 = 1.0;
    }
    float _1206 = _1196;
    float _1208 = _1206;
    if (!_1066)
    {
        float _1210 = _830 * _830;
        float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1214 = -_470;
        float _1216 = _1214 + _1176;
        float _1218 = -_560;
        float _1220 = _1218 + _1172;
        float _1222 = fma(_838, _838, _1210);
        float _1224 = -_672;
        float _1226 = _1224 + _1174;
        float _1228 = fma(_844, _844, _1222);
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1232 = sqrt(_1228);
        float _1234 = 1.0 / _956;
        float _1236 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1238 = precise::min(_1232, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1240 = _1238 * _1212;
        float _1242 = _1240 * _1234;
        float _1244 = _1236 * _1242;
        float _1246 = _1216 * _1242;
        float _1248 = fma(_1220, _1244, _826);
        float _1250 = fma(_1226, _1244, _820);
        float _1252 = fma(_1236, _1246, _834);
        _1198 = _1250;
        _1200 = _1248;
        _1202 = _1252;
    }
    float _1254 = _1198;
    float _1256 = _1200;
    float _1258 = _1202;
    if (!_1100)
    {
        float _1260 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1264 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1262);
        float _1266 = _1260 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1274 = _1272 * 0.15915493667125701904296875;
        float _1276 = _1266 * 6.283185482025146484375;
        float _1278 = sin(_1276);
        float _1280 = 1.0 / _1270;
        float _1282 = _1274 * 6.283185482025146484375;
        float _1284 = cos(_1282);
        float _1286 = _1278 * _1280;
        float _1288 = 1.0 / _1264;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1292 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1290;
        float _1294 = _1284 * _1286;
        float _1296 = _1274 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = 1.0 / _1294;
        float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1304 = _1288 * _1302;
        float _1306 = 1.0 / _1292;
        float _1308 = _1298 * _1300;
        float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1312 = fma(_1308, _1304, _1310);
        float _1314 = _1312 * _1306;
        float _1316 = precise::clamp(_1314, 0.0, 1.0);
        _1204 = _1306;
        _1208 = _1316;
    }
    float _1318 = _1204;
    float _1320 = _1208;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1324 = _1254 + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1328 = _1256 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1332 = _1258 + _1330;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = _1324 * _1324;
    float _1338 = fma(_1328, _1328, _1336);
    float _1340 = fma(_1332, _1332, _1338);
    float _1342 = rsqrt(_1340);
    float _1344 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1346 = _1328 * _1344;
    float _1348 = _1332 * _1344;
    float _1350 = _1346 * _1346;
    float _1352 = _1348 * _1348;
    float _1354 = _1350 + _1352;
    float _1356 = sqrt(_1354);
    bool _1358 = _1356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = _1356 + _1360;
    float _1364 = _1332;
    float _1366 = _1338;
    float _1368 = _1362;
    float _1370 = _1318;
    float _1372 = _1334;
    float _1374 = _1324;
    if (_1358)
    {
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1376;
    }
    float _1378 = _1364;
    if (_1358)
    {
        float _1380 = rsqrt(_1354);
        _1366 = _1380;
    }
    float _1382 = _1366;
    float _1384 = _1382;
    if (_1358)
    {
        float _1386 = _1362 * _1378;
        _1368 = _1386;
    }
    float _1388 = _1368;
    if (_1358)
    {
        float _1390 = _1388 * 0.15915493667125701904296875;
        _1370 = _1390;
    }
    float _1392 = _1370;
    float _1394 = precise::max(0.0, _1334);
    float _1396 = _1394;
    if (!_1358)
    {
        _1372 = _1346;
    }
    float _1398 = _1372;
    float _1400 = _1342;
    float _1402 = _1398;
    if (_1358)
    {
        float _1404 = _1392 * 6.283185482025146484375;
        float _1406 = sin(_1404);
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = -_1344;
    float _1412 = -_1394;
    float _1414 = fma(_1324, _1410, _1412);
    float _1416 = _1414;
    if (!_1358)
    {
        _1374 = _1352;
    }
    float _1418 = _1374;
    float _1420 = _1418;
    if (_1358)
    {
        float _1422 = _1414 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1396 = _1422;
    }
    float _1424 = _1396;
    float _1426 = _1378;
    float _1428 = _1424;
    if (_1358)
    {
        float _1430 = _1392 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        _1426 = _1432;
    }
    float _1434 = _1426;
    float _1436 = _1408;
    if (_1358)
    {
        float _1438 = fma(_1408, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = sqrt(_1340);
    float _1444 = _1440;
    if (_1358)
    {
        float _1446 = _1382 * _1440;
        _1120 = _1446;
    }
    float _1448 = _1120;
    if (!_1358)
    {
        _1444 = _1348;
    }
    float _1450 = _1444;
    float _1452 = _1450;
    if (_1358)
    {
        float _1454 = _1434 + (-1.0);
        _1428 = _1454;
    }
    float _1456 = _1428;
    float _1458 = _1456;
    if (_1358)
    {
        float _1460 = _1346 * _1448;
        _1402 = _1460;
    }
    float _1462 = _1402;
    if (_1358)
    {
        float _1464 = _1348 * _1448;
        _1452 = _1464;
    }
    float _1466 = _1452;
    if (_1358)
    {
        float _1468 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1468;
    }
    float _1470 = _1384;
    if (!_1358)
    {
        _1458 = _1350;
    }
    float _1472 = _1458;
    float _1474 = _1472;
    if (_1358)
    {
        float _1476 = _1462 * _1462;
        _1474 = _1476;
    }
    float _1478 = _1474;
    if (_1358)
    {
        float _1480 = _1466 * _1466;
        _1420 = _1480;
    }
    float _1482 = _1420;
    if (_1358)
    {
        float _1484 = fma(_1414, _1434, _1470);
        _1416 = _1484;
    }
    float _1486 = _1416;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1490 = fma(_1442, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1488);
    float _1492 = precise::clamp(_1490, 0.0, 1.0);
    float _1494 = fma(_1486, _1486, _1478);
    float _1496 = -_1492;
    float _1498 = _1496 + 1.0;
    float _1500 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1502 = _1494 + _1482;
    float _1504 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1506 = rsqrt(_1502);
    float _1508 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1504);
    float _1510 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1512 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1508);
    float _1514 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1510);
    float _1518 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1520 = abs(_1498);
    float _1522 = log2(_1520);
    float _1524 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1514);
    float _1526 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1516);
    float _1528 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1518);
    float _1530 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1524);
    float _1534 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1536 = _1506 * _1462;
    float _1538 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1528);
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1544 = _1506 * _1486;
    float _1546 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = _1506 * _1466;
    float _1552 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1542);
    float _1554 = -_1546;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1554);
    float _1558 = -_1548;
    float _1560 = fma(_1558, _1500, 1.0);
    float _1562 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1564 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1566 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1552);
    float _1568 = -_1550;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1556);
    float _1572 = exp2(_1562);
    float _1574 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1576 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1566);
    float _1578 = fma(_1570, -0.5, 0.5);
    float _1580 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1582 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1574);
    float _1584 = fma(_1570, 0.5, 0.5);
    float _1586 = _1544 + 1.0;
    float _1588 = log2(_1560);
    float _1590 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1580);
    float _1592 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1582);
    float _1594 = fma(_1584, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1596 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1590);
    float _1598 = fma(_1584, _1594, -0.212114393711090087890625);
    float _1600 = 1.0 / _1576;
    float _1602 = -_1544;
    float _1604 = fma(_1572, _1586, _1602);
    float _1606 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1592);
    float _1608 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1596);
    float _1610 = fma(_1584, _1598, 1.570728778839111328125);
    float _1612 = fma(_1604, 0.5, 0.5);
    float _1614 = sqrt(_1578);
    float _1616 = _1588 * 0.693147182464599609375;
    float _1618 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1620 = _1606 * _1600;
    float _1622 = _1608 * _1600;
    float _1624 = fma(_1620, 0.5, 0.5);
    float _1626 = fma(_1622, -0.5, 0.5);
    float _1628 = _1614 * 0.636619746685028076171875;
    float3 _4275 = float3(_1624, _1626, _1618);
    float _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4275, float3(0.0), isnan(_4275)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4275, float3(0.0), isnan(_4275)), level(0.0)).x;
    float3 _4286 = float3(_1624, _1626, _1618);
    float4 _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4286, float3(0.0), isnan(_4286)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4286, float3(0.0), isnan(_4286)), level(0.0)).xyzw;
    float _1635 = _1633.x;
    float _1637 = _1633.y;
    float _1639 = _1633.z;
    float _1641 = _1633.w;
    float _1643 = -_1610;
    float _1645 = fma(_1628, _1643, 1.0);
    float2 _4308 = float2(_1645, _1612);
    float3 _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4308, float2(0.0), isnan(_4308)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4308, float2(0.0), isnan(_4308)), level(0.0)).xyz;
    float _1651 = _1649.x;
    float _1653 = _1649.y;
    float _1655 = _1649.z;
    float _1657 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1659 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1661 = _1320 > 0.0;
    bool _1663 = isnan(_1320);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.0);
    bool _1669 = _1665 || _1667;
    out.m_63.x = _808;
    out.m_63.y = _810;
    out.m_63.z = _812;
    float _1671 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1673 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1659);
    float _1675 = exp2(_1657);
    float _1677 = _1671 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1679 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1673);
    out.m_61.x = _790;
    out.m_61.y = _798;
    out.m_61.z = _796;
    float _1681 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1679);
    out.m_45.x = _1677;
    float _1683 = _1681 + _1576;
    out.gl_Position.x = _1606;
    out.gl_Position.y = _1608;
    out.gl_Position.z = _1681;
    out.gl_Position.w = _1576;
    float _1685 = _1683 * 0.5;
    float _1687 = -_1675;
    float _1689 = _1687 + 1.0;
    float _1691 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1685;
    out.m_67.w = _1576;
    float _1693 = -_1691;
    float _1695 = _1693 + 1.0;
    float _1697 = _1691 * _1630;
    float _1699 = _1641 * _1697;
    float _1701 = _1641 * _1695;
    float _1703 = _1655 * _1697;
    float _1705 = fma(_1651, _1699, _1635);
    float _1707 = fma(_1653, _1699, _1637);
    float _1709 = fma(_1641, _1703, _1639);
    out.m_69.x = _1705;
    out.m_69.y = _1707;
    out.m_69.z = _1709;
    out.m_69.w = _1701;
    if (_1669)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1711;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

