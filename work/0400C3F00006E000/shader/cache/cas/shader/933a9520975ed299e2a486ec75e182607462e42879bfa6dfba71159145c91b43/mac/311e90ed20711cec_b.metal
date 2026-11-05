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
    float4 m_59 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
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
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1010 = false;
    bool _668 = false;
    bool _284 = false;
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
        float _2228 = as_type<float>(_104);
        out.gl_Position.z = _2228;
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
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2297 = as_type<float>(_140);
        out.gl_Position.z = _2297;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = 1.0 / _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _320 = 1.0 / _300;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = _292 + _322;
    bool _326 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_292);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = 1.0 / _304;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _292 + _340;
    float _344 = _324 * _310;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = _292 + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _292 + _350;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _356 = 1.0 / _314;
    float _358 = _342 * _320;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _362 = _292 + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _366 = _292 + _364;
    bool _368 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _370 = isnan(_292);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = 1.0 / _308;
    float _382 = _348 * _338;
    bool _384 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _386 = isnan(_292);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = -_378;
    float _402 = _400 + 1.0;
    float _404 = fma(_398, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = 1.0 / _318;
    float _408 = _362 * _356;
    bool _410 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _412 = isnan(_292);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -_394;
    float _424 = _422 + 1.0;
    float _426 = -_420;
    float _428 = _426 + 1.0;
    float _430 = _352 * _380;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    float _440 = _378 * _424;
    float _442 = fma(_438, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _444 = _420 * _402;
    float _446 = _366 * _406;
    float _448 = fma(_434, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _450 = _336 * _428;
    bool _452 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _454 = isnan(_292);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _468 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _470 = isnan(_292);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -_336;
    float _482 = _480 + 1.0;
    bool _484 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _486 = isnan(_292);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = _462 * _482;
    float _506 = -_462;
    float _508 = _506 + 1.0;
    float _510 = -_494;
    float _512 = _510 + 1.0;
    float _514 = fma(_498, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _516 = fma(_466, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = _478 * _512;
    float _520 = -_478;
    float _522 = _520 + 1.0;
    float _524 = fma(_502, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _494 * _508;
    float _528 = _442 * _518;
    float _530 = _448 * _518;
    float _532 = _404 * _518;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _528);
    float _556 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _530);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _558;
    float _562 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].z, _532);
    float _564 = fma(_544, _430, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _566 = fma(_548, _430, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _568 = fma(_552, _430, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _570 = fma(_536, _382, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _572 = fma(_560, _382, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _574 = fma(_514, _526, _554);
    float _576 = fma(_516, _526, _556);
    float _578 = fma(_524, _526, _562);
    float _580 = fma(_540, _382, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_570, _504, _574);
    float _584 = fma(_572, _504, _578);
    float _586 = fma(_580, _504, _576);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _596;
    float _600 = fma(_564, _450, _582);
    float _602 = fma(_568, _450, _584);
    float _604 = fma(_590, _408, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _606 = fma(_594, _408, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _608 = fma(_566, _450, _586);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _618 = fma(_598, _408, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _624 = fma(_612, _446, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _626 = fma(_616, _446, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _628 = fma(_604, _444, _600);
    float _630 = fma(_622, _446, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _632 = fma(_606, _444, _608);
    float _634 = fma(_618, _444, _602);
    float _636 = fma(_624, _440, _628);
    float _638 = fma(_626, _440, _632);
    float _640 = fma(_630, _440, _634);
    float _642 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[149].x, _636);
    float _644 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[149].y, _638);
    float _646 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[149].z, _640);
    bool _648 = !_354;
    float _666;
    if (!_648)
    {
        float _650 = in.m_51.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_88);
        float _672 = 1.0 / _670;
        float _674 = _122 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    float _678 = in.m_49.x;
    float _680 = in.m_49.y;
    float _682 = in.m_49.z;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _686 = _676 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _704 = 1.0 / _690;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _706;
    float _710 = 1.0 / _694;
    bool _712 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _714 = _644 * _680;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _718 = _676 + _716;
    float _720 = 1.0 / _698;
    float _722 = _686 * _704;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _726 = _676 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _728;
    float _732 = _646 * _682;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _736 = _676 + _734;
    float _738 = 1.0 / _702;
    float _740 = _718 * _710;
    bool _742 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _744 = isnan(_676);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _756 = _676 + _754;
    bool _758 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _760 = isnan(_676);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = fma(_730, _722, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _772 = 1.0 / _708;
    float _774 = -_752;
    float _776 = _774 + 1.0;
    float _778 = _726 * _720;
    bool _780 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _782 = isnan(_676);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _768 * _776;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _794;
    float _798 = -_768;
    float _800 = _798 + 1.0;
    float _802 = _756 * _738;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _804;
    bool _808 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _810 = isnan(_676);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = fma(_796, _722, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _822 = _790 * _800;
    float _824 = fma(_806, _722, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _826 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _828 = isnan(_676);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_818;
    float _840 = _838 + 1.0;
    float _842 = -_790;
    float _844 = _842 + 1.0;
    float _846 = _736 * _772;
    bool _848 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _850 = isnan(_676);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = _836 * _840;
    float _862 = -_836;
    float _864 = _862 + 1.0;
    float _866 = _818 * _844;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _880 = _858 * _864;
    float _882 = fma(_870, _740, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _884 = fma(_874, _740, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _886 = fma(_878, _740, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _888 = _820 * _880;
    float _890 = _824 * _880;
    float _892 = _770 * _880;
    float _894 = -_858;
    float _896 = _894 + 1.0;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _898;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _902;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _906;
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[107].x, _888);
    float _912 = fma(_900, _778, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _914 = fma(_904, _778, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _916 = fma(_908, _778, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _922 = fma(_882, _860, _910);
    float _924 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[107].y, _890);
    float _926 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[107].z, _892);
    float _928 = fma(_920, _802, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _930 = fma(_914, _866, _922);
    float _932 = fma(_884, _860, _924);
    float _934 = fma(_886, _860, _926);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _944 = fma(_916, _866, _934);
    float _946 = fma(_938, _802, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _948 = fma(_912, _866, _932);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _954;
    float _958 = fma(_942, _802, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _960;
    float _964 = fma(_928, _822, _930);
    float _966 = fma(_952, _846, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _968 = fma(_956, _846, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _970 = fma(_946, _822, _948);
    float _972 = fma(_962, _846, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _974 = fma(_958, _822, _944);
    float _976 = fma(_966, _792, _964);
    float _978 = fma(_968, _792, _970);
    float _980 = fma(_972, _792, _974);
    float _982 = _642 * _678;
    float _984 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[112].x, _976);
    float _986 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[112].y, _978);
    float _988 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[112].z, _980);
    bool _990 = !_712;
    float _1008;
    if (!_990)
    {
        float _992 = in.m_51.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _1008 = _1006;
        _1010 = true;
    }
    else
    {
        float _1012 = float(_88);
        float _1014 = 1.0 / _1012;
        float _1016 = _122 * _1014;
        _1008 = _1016;
    }
    _1010 = false;
    float _1018 = _1008;
    float _1020 = in.m_51.w;
    float _1022 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1024 = in.m_53.x;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1028 = _1026 != 0;
    float _1030 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1022);
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1034 = _1032 != 0;
    float _1036 = in.m_53.y;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1040 = _1038 != 0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1044 = _1018 + _1042;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1048 = _1046 != 0;
    float _1050 = in.m_51.y;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1054 = _1052 != 0;
    float _1056 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1058 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1060 = in.m_51.x;
    float _1062 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1056);
    float _1064 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1058);
    float _1066 = in.m_53.z;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1072 = in.m_55.y;
    bool _1074 = _1020 > 0.5;
    float _1076 = 1.0 / _1070;
    float _1078 = _942;
    bool _1080 = _1074;
    float _1082 = _1062;
    float _1084 = _1072;
    if (_1034)
    {
        float _1086 = in.m_51.z;
        _1078 = _1086;
    }
    float _1088 = _1078;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1092 = _1018 + _1090;
    float _1094 = _986 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_57.x = _1024;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1102 = 1.0 / _1098;
    float _1104 = in.m_55.x;
    float _1106 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_57.y = _1036;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1116;
    out.m_57.z = _1066;
    float _1120 = -_1114;
    float _1122 = fma(_1106, 2.0, _1120);
    float _1124 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1126 = 1.0 / _1112;
    bool _1128 = false;
    float _1130 = _1088;
    float _1132 = _1094;
    if (_1034)
    {
        bool _1134 = _1088 > 0.5;
        _1128 = _1134;
    }
    bool _1136 = _1128;
    float _1138 = fma(_1124, -2.0, _1100);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1144;
    float _1148 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1030);
    float _1150 = _1118 * _1102;
    float _1152 = _1030;
    if (!_1054)
    {
        float _1154 = in.m_51.z;
        _1152 = _1154;
    }
    float _1156 = _1152;
    float _1158 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    float _1160 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1064);
    float _1162 = -_1072;
    float _1164 = _1162 + 1.0;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1054)
    {
        _1130 = _1050;
    }
    float _1168 = _1130;
    float _1170 = _1142 * _1076;
    float _1172 = _1168;
    if (_1054)
    {
        _1172 = _1060;
    }
    float _1174 = _1172;
    float _1176 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1166);
    int _1178 = _1074 ? as_type<int>(_1164) : as_type<int>(_1072);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1182 = _1018 + _1180;
    int _1184 = as_type<int>(_1174);
    if (_1028)
    {
        bool _1186 = _1060 > 0.5;
        _1080 = _1186;
    }
    bool _1188 = _1080;
    float _1190 = fma(_1170, _1044, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1192 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1194 = isnan(_1018);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = _1146 * _1126;
    float _1206 = _1040 ? as_type<float>(_1178) : _1072;
    float _1208 = fma(_1150, _1182, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1210 = _1050 > 0.5;
    float _1212 = -_1202;
    float _1214 = _1212 + 1.0;
    bool _1216 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1218 = isnan(_1018);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = fma(_1204, _1092, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1230 = _1204;
    if (!_1028)
    {
        _1082 = _1104;
    }
    float _1232 = _1082;
    float _1234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1236 = _1232;
    if (_1048)
    {
        float _1238 = _1210 ? _1164 : _1072;
        _1084 = _1238;
    }
    float _1240 = _1084;
    float _1242 = _1226 * _1214;
    bool _1244 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1246 = isnan(_1018);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = -_1226;
    float _1258 = _1256 + 1.0;
    float _1260 = _1254;
    float _1262 = _1240;
    if (!_1028)
    {
        _1230 = _1232;
    }
    float _1264 = _1230;
    float _1266 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1268 = _1264;
    if (_1028)
    {
        _1236 = _1104;
    }
    float _1270 = _1236;
    float _1272 = -_1254;
    float _1274 = _1272 + 1.0;
    bool _1276 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1278 = isnan(_1018);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = _1254 * _1258;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1292 = _1156;
    if (!_1054)
    {
        _1260 = _1156;
    }
    float _1294 = _1260;
    float _1296 = _1286 * _1274;
    float _1298 = _1294;
    if (_1054)
    {
        _1298 = _1050;
    }
    float _1300 = _1298;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1304 = _1208 * _1296;
    float _1306 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1302);
    int _1308 = as_type<int>(_1306);
    if (_1054)
    {
        _1292 = _1050;
    }
    float _1310 = _1292;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1314 = fma(_1206, _1266, -0.5);
    float _1316 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1320 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1312);
    float _1322 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1028)
    {
        float _1324 = -_1270;
        float _1326 = _1324 + 1.0;
        _1184 = as_type<int>(_1326);
    }
    int _1328 = _1184;
    float _1330 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1318);
    float _1332 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1306);
    if (_1034)
    {
        float _1334 = -_1270;
        float _1336 = _1334 + 1.0;
        _1308 = as_type<int>(_1336);
    }
    int _1338 = _1308;
    float _1340 = -_1286;
    float _1342 = _1340 + 1.0;
    if (_1028)
    {
        float _1344 = _1188 ? as_type<float>(_1328) : _1270;
        _1268 = _1344;
    }
    float _1346 = _1268;
    float _1348 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1350 = fma(_1316, _1240, -0.5);
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1354 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1138);
    if (!_1034)
    {
        _1262 = _1270;
    }
    float _1356 = _1262;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1360 = _1356;
    if (_1034)
    {
        float _1362 = _1136 ? as_type<float>(_1338) : _1270;
        _1360 = _1362;
    }
    float _1364 = _1360;
    float _1366 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1304);
    float _1368 = -_1354;
    float _1370 = fma(_1332, _1350, _1368);
    float _1372 = fma(_1348, -2.0, _1358);
    float _1374 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1376 = _1148 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1378 = fma(_1190, _1288, _1366);
    float _1380 = fma(_1374, _1346, -0.5);
    float _1382 = _1158 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1386 = _1376 + _1384;
    float _1388 = _1160 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1382 + _1392;
    float _1396 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1398 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1400 = -_1390;
    float _1402 = fma(_1322, 2.0, _1400);
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1406 = _1388 + _1404;
    float _1408 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1396);
    float _1410 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1330);
    float _1412 = fma(_1398, _1364, -0.5);
    float _1414 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1372);
    float _1416 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1176);
    float _1418 = -_122;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1122);
    float _1422 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1320);
    float _1424 = -_122;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1402);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1408);
    float _1430 = fma(_1228, _1242, _1378);
    float _1432 = _1386 * _1386;
    float _1434 = -_1414;
    float _1436 = fma(_1410, _1314, _1434);
    float _1438 = fma(_1422, _1412, _1426);
    float _1440 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1430);
    float _1442 = in.m_53.w;
    bool _1444 = _1428 >= 0.0;
    float _1446 = fma(_1394, _1394, _1432);
    float _1448 = fma(_1416, _1380, _1420);
    float _1450 = fma(_1406, _1406, _1446);
    float _1452 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = _984 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1456 = _988 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1458 = rsqrt(_1450);
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1444)
    {
        _1132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1462 = _1132;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1468 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1474 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1480 = _1370 + 0.5;
    float _1482 = _1448 + 0.5;
    float _1484 = _1438 + 0.5;
    float _1486 = _1436 + 0.5;
    float _1488 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1490 = as_type<int>(_1462);
    int _1492 = as_type<int>(_1478);
    if (_1444)
    {
        float _1494 = _1462 * 5.0;
        _1490 = as_type<int>(_1494);
    }
    int _1496 = _1490;
    out.m_57.w = _1442;
    float _1498 = _1386 * _1458;
    float _1500 = _1394 * _1458;
    out.m_59.x = _1474;
    out.m_59.y = _1476;
    out.m_59.z = _1478;
    out.m_59.w = _1472;
    out.m_61.x = _1482;
    out.m_61.y = _1480;
    out.m_61.z = _1484;
    out.m_61.w = _1486;
    out.m_63.x = _1468;
    out.m_63.y = _1452;
    out.m_63.z = _1470;
    out.m_63.w = _1488;
    if (_1444)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4598 = as_type<float>(_1496);
        out.gl_Position.z = _4598;
    }
    if (_1444)
    {
        out.m_45.x = 0.0;
    }
    if (_1444)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1502 = -_1498;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1376);
    float _1506 = _1406 * _1458;
    float _1508 = -_1500;
    float _1510 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1382);
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1514 = _1504 + _1512;
    float _1516 = -_1506;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1388);
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1510 + _1520;
    float _1524 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1518 + _1526;
    float _1530 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1524);
    float _1532 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1530);
    bool _1534 = _1532 >= 0.0;
    float _1536 = _1522;
    if (_1534)
    {
        _1536 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1538 = _1536;
    if (_1534)
    {
        out.m_45.x = 0.0;
    }
    if (_1534)
    {
        float _1540 = _1538 * 5.0;
        _1492 = as_type<int>(_1540);
    }
    int _1542 = _1492;
    if (_1534)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4691 = as_type<float>(_1542);
        out.gl_Position.z = _4691;
    }
    if (_1534)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1544 = -_1376;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1548 = -_1382;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1552 = -_1388;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1556 = -_1498;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1386);
    float _1560 = _1546 * _1546;
    float _1562 = -_1500;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1566 = -_1506;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1570 = _982 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1572 = fma(_1550, _1550, _1560);
    float _1574 = fma(_1554, _1554, _1572);
    float _1576 = _1558 * _1558;
    float _1578 = fma(_1564, _1564, _1576);
    float _1580 = rsqrt(_1574);
    float _1582 = fma(_1568, _1568, _1578);
    float _1584 = sqrt(_1582);
    float _1586 = _1550 * _1580;
    float _1588 = _1554 * _1580;
    float _1590 = _1546 * _1580;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1594 = _1586 * _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1598 = _1588 * _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1602 = _1590 * _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1606 = -_1594;
    float _1608 = fma(_1588, _1604, _1606);
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1612 = -_1598;
    float _1614 = fma(_1590, _1610, _1612);
    float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1618 = -_1602;
    float _1620 = fma(_1586, _1616, _1618);
    float _1622 = in.m_65.x;
    float _1624 = in.m_65.y;
    float _1626 = in.m_65.z;
    float _1628 = _1608 * _1608;
    float _1630 = _1458 * _1584;
    float _1632 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1634 = fma(_1614, _1614, _1628);
    float _1636 = _1630 * _1570;
    float _1638 = _1630 * _1632;
    float _1640 = fma(_1620, _1620, _1634);
    float _1642 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1644 = rsqrt(_1640);
    float _1646 = _1630 * _1642;
    float _1648 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1624);
    float _1650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1622);
    float _1652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1626);
    float _1654 = _1646 * _1648;
    float _1656 = _1614 * _1644;
    float _1658 = _1608 * _1644;
    float _1660 = _1620 * _1644;
    float _1662 = _1636 * _1650;
    float _1664 = _1590 * _1656;
    float _1666 = _1588 * _1658;
    float _1668 = _1638 * _1652;
    float _1670 = -_1664;
    float _1672 = fma(_1586, _1658, _1670);
    float _1674 = -_1666;
    float _1676 = fma(_1590, _1660, _1674);
    float _1678 = _1654 * _1672;
    float _1680 = _1654 * _1676;
    float _1682 = fma(_1662, _1660, _1678);
    float _1684 = fma(_1662, _1656, _1680);
    float _1686 = fma(_1668, _1588, _1682);
    float _1688 = fma(_1668, _1586, _1684);
    float _1690 = _1586 * _1660;
    float _1692 = _1388 + _1686;
    float _1694 = _1382 + _1688;
    float _1696 = -_1690;
    float _1698 = fma(_1588, _1656, _1696);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1702 = _1692 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1706 = _1694 + _1704;
    float _1708 = _1654 * _1698;
    float _1710 = _1702 * _1702;
    float _1712 = fma(_1662, _1658, _1708);
    float _1714 = fma(_1706, _1706, _1710);
    float _1716 = fma(_1668, _1590, _1712);
    float _1718 = sqrt(_1714);
    float _1720 = _1376 + _1716;
    bool _1722 = _1718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1716;
    float _1726 = _1656;
    float _1728 = _1710;
    float _1730 = _1698;
    float _1732 = _1720;
    if (!_1722)
    {
        _1724 = _1694;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (!_1722)
    {
        _1726 = _1692;
    }
    float _1738 = _1726;
    float _1740 = _1738;
    if (!_1722)
    {
        _1728 = _1720;
    }
    float _1742 = _1728;
    bool _1744 = !_1722;
    float _1746 = _1742;
    if (!_1744)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1752 = _1718 + _1750;
        float _1754 = rsqrt(_1714);
        float _1756 = _1752 * _1748;
        float _1758 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1760 = _1756 * 0.15915493667125701904296875;
        float _1762 = _1760 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = _1760 * 6.283185482025146484375;
        float _1768 = sin(_1766);
        float _1770 = _1764 + (-1.0);
        float _1772 = fma(_1768, _1758, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1774 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1776 = _1754 * _1772;
        float _1778 = fma(_1720, _1764, _1774);
        float _1780 = fma(_1706, _1776, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1782 = fma(_1702, _1776, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1746 = _1778;
        _1736 = _1780;
        _1740 = _1782;
    }
    float _1784 = _1746;
    float _1786 = _1736;
    float _1788 = _1740;
    float _1790 = -_1498;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1784);
    float _1794 = -_1500;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1786);
    float _1798 = -_1506;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1804 = _1792 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1808 = _1796 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1812 = _1800 + _1810;
    float _1814 = _1804 * _1804;
    float _1816 = fma(_1808, _1808, _1814);
    float _1818 = fma(_1812, _1812, _1816);
    float _1820 = rsqrt(_1818);
    float _1822 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1824 = _1808 * _1822;
    float _1826 = _1812 * _1822;
    float _1828 = _1824 * _1824;
    float _1830 = _1826 * _1826;
    float _1832 = _1828 + _1830;
    float _1834 = sqrt(_1832);
    bool _1836 = _1834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1840 = _1834 + _1838;
    float _1842 = _1812;
    float _1844 = _1832;
    float _1846 = _1840;
    float _1848 = _1804;
    float _1850 = _1824;
    if (_1836)
    {
        float _1852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1842 = _1852;
    }
    float _1854 = _1842;
    if (_1836)
    {
        float _1856 = rsqrt(_1832);
        _1844 = _1856;
    }
    float _1858 = _1844;
    if (_1836)
    {
        float _1860 = _1840 * _1854;
        _1846 = _1860;
    }
    float _1862 = _1846;
    if (_1836)
    {
        float _1864 = _1862 * 0.15915493667125701904296875;
        _1730 = _1864;
    }
    float _1866 = _1730;
    float _1868 = _1814;
    if (_1836)
    {
        float _1870 = _1866 * 6.283185482025146484375;
        float _1872 = sin(_1870);
        _1868 = _1872;
    }
    float _1874 = _1868;
    float _1876 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1878 = precise::max(0.0, _1876);
    float _1880 = _1820;
    float _1882 = _1876;
    float _1884 = _1878;
    if (_1836)
    {
        float _1886 = _1866 * 6.283185482025146484375;
        float _1888 = cos(_1886);
        _1880 = _1888;
    }
    float _1890 = _1880;
    float _1892 = -_1822;
    float _1894 = -_1878;
    float _1896 = fma(_1804, _1892, _1894);
    float _1898 = _1896;
    if (!_1836)
    {
        _1848 = _1830;
    }
    float _1900 = _1848;
    float _1902 = _1900;
    if (_1836)
    {
        float _1904 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1904;
    }
    float _1906 = _1882;
    float _1908 = _1874;
    float _1910 = _1906;
    if (_1836)
    {
        float _1912 = fma(_1874, _1906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1908 = _1912;
    }
    float _1914 = _1908;
    float _1916 = _1914;
    if (_1836)
    {
        float _1918 = _1890 + (-1.0);
        _1910 = _1918;
    }
    float _1920 = _1910;
    float _1922 = _1920;
    if (_1836)
    {
        float _1924 = _1858 * _1914;
        _1732 = _1924;
    }
    float _1926 = _1732;
    if (!_1836)
    {
        _1916 = _1826;
    }
    float _1928 = _1916;
    float _1930 = sqrt(_1818);
    float _1932 = _1928;
    if (_1836)
    {
        float _1934 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1884 = _1934;
    }
    float _1936 = _1884;
    if (_1836)
    {
        float _1938 = _1824 * _1926;
        _1850 = _1938;
    }
    float _1940 = _1850;
    if (!_1836)
    {
        _1922 = _1828;
    }
    float _1942 = _1922;
    float _1944 = _1942;
    if (_1836)
    {
        float _1946 = _1826 * _1926;
        _1932 = _1946;
    }
    float _1948 = _1932;
    if (_1836)
    {
        float _1950 = fma(_1896, _1890, _1936);
        _1898 = _1950;
    }
    float _1952 = _1898;
    if (_1836)
    {
        float _1954 = _1940 * _1940;
        _1944 = _1954;
    }
    float _1956 = _1944;
    if (_1836)
    {
        float _1958 = _1948 * _1948;
        _1902 = _1958;
    }
    float _1960 = _1902;
    float _1962 = fma(_1952, _1952, _1956);
    float _1964 = _1962 + _1960;
    float _1966 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1930, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1976 = rsqrt(_1964);
    float _1978 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1966);
    float _1980 = -_1972;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1974);
    float _1986 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1988 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1978);
    float _1990 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1992 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1984);
    float _1994 = abs(_1982);
    float _1996 = log2(_1994);
    float _1998 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2000 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1990);
    float _2002 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2004 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2006 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2000);
    float _2008 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2010 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2002);
    float _2012 = _1976 * _1940;
    float _2014 = -_2004;
    float _2016 = fma(_2014, _1986, 1.0);
    float _2018 = _2006 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2022 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2010);
    float _2024 = _1976 * _1952;
    float _2026 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2020);
    float _2030 = _1976 * _1948;
    float _2032 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2034 = -_2026;
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2034);
    float _2038 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2040 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2028);
    float _2042 = log2(_2016);
    float _2044 = -_2030;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2036);
    float _2048 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2050 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2040);
    float _2052 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2054 = fma(_2046, -0.5, 0.5);
    float _2056 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2048);
    float _2058 = exp2(_2032);
    float _2060 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2052);
    float _2062 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2056);
    float _2064 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2060);
    float _2066 = 1.0 / _2050;
    float _2068 = fma(_2046, 0.5, 0.5);
    float _2070 = _2024 + 1.0;
    float _2072 = _2042 * 0.693147182464599609375;
    float _2074 = fma(_2068, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2076 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2078 = sqrt(_2054);
    float _2080 = -_2024;
    float _2082 = fma(_2058, _2070, _2080);
    float _2084 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2062);
    float _2086 = fma(_2068, _2074, -0.212114393711090087890625);
    float _2088 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2064);
    float _2090 = fma(_2082, 0.5, 0.5);
    float _2092 = fma(_2068, _2086, 1.570728778839111328125);
    float _2094 = _2084 * _2066;
    float _2096 = _2088 * _2066;
    float _2098 = fma(_2094, 0.5, 0.5);
    float _2100 = fma(_2096, -0.5, 0.5);
    float _2102 = _2078 * 0.636619746685028076171875;
    float3 _5605 = float3(_2098, _2100, _2076);
    float _2104 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5605, float3(0.0), isnan(_5605)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5605, float3(0.0), isnan(_5605)), level(0.0)).x;
    float _2106 = -_2092;
    float _2108 = fma(_2102, _2106, 1.0);
    float3 _5621 = float3(_2098, _2100, _2076);
    float4 _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5621, float3(0.0), isnan(_5621)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5621, float3(0.0), isnan(_5621)), level(0.0)).xyzw;
    float _2113 = _2111.x;
    float _2115 = _2111.y;
    float _2117 = _2111.z;
    float _2119 = _2111.w;
    float2 _5638 = float2(_2108, _2090);
    float3 _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5638, float2(0.0), isnan(_5638)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5638, float2(0.0), isnan(_5638)), level(0.0)).xyz;
    float _2125 = _2123.x;
    float _2127 = _2123.y;
    float _2129 = _2123.z;
    float _2131 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2133 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2135 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2133);
    float _2137 = exp2(_2131);
    float _2139 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2135);
    float _2141 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2139);
    float _2143 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = _2141 + _2050;
    out.gl_Position.x = _2084;
    out.gl_Position.y = _2088;
    out.gl_Position.z = _2141;
    out.gl_Position.w = _2050;
    float _2147 = _2145 * 0.5;
    float _2149 = -_2137;
    float _2151 = _2149 + 1.0;
    out.m_45.x = _2143;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2147;
    out.m_67.w = _2050;
    float _2155 = -_2153;
    float _2157 = _2155 + 1.0;
    float _2159 = _2153 * _2104;
    float _2161 = _2119 * _2159;
    float _2163 = _2129 * _2159;
    float _2165 = fma(_2125, _2161, _2113);
    float _2167 = fma(_2127, _2161, _2115);
    float _2169 = _2119 * _2157;
    float _2171 = fma(_2119, _2163, _2117);
    out.m_69.x = _2165;
    out.m_69.y = _2167;
    out.m_69.z = _2171;
    out.m_69.w = _2169;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1010 = false;
    bool _668 = false;
    bool _284 = false;
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
        float _2228 = as_type<float>(_104);
        out.gl_Position.z = _2228;
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
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2297 = as_type<float>(_140);
        out.gl_Position.z = _2297;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = 1.0 / _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _320 = 1.0 / _300;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = _292 + _322;
    bool _326 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_292);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = 1.0 / _304;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _292 + _340;
    float _344 = _324 * _310;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = _292 + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _292 + _350;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _356 = 1.0 / _314;
    float _358 = _342 * _320;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _362 = _292 + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _366 = _292 + _364;
    bool _368 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _370 = isnan(_292);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = 1.0 / _308;
    float _382 = _348 * _338;
    bool _384 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _386 = isnan(_292);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = -_378;
    float _402 = _400 + 1.0;
    float _404 = fma(_398, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = 1.0 / _318;
    float _408 = _362 * _356;
    bool _410 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _412 = isnan(_292);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -_394;
    float _424 = _422 + 1.0;
    float _426 = -_420;
    float _428 = _426 + 1.0;
    float _430 = _352 * _380;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    float _440 = _378 * _424;
    float _442 = fma(_438, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _444 = _420 * _402;
    float _446 = _366 * _406;
    float _448 = fma(_434, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _450 = _336 * _428;
    bool _452 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _454 = isnan(_292);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _468 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _470 = isnan(_292);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -_336;
    float _482 = _480 + 1.0;
    bool _484 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _486 = isnan(_292);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = _462 * _482;
    float _506 = -_462;
    float _508 = _506 + 1.0;
    float _510 = -_494;
    float _512 = _510 + 1.0;
    float _514 = fma(_498, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _516 = fma(_466, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = _478 * _512;
    float _520 = -_478;
    float _522 = _520 + 1.0;
    float _524 = fma(_502, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _494 * _508;
    float _528 = _442 * _518;
    float _530 = _448 * _518;
    float _532 = _404 * _518;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _528);
    float _556 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _530);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _558;
    float _562 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].z, _532);
    float _564 = fma(_544, _430, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _566 = fma(_548, _430, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _568 = fma(_552, _430, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _570 = fma(_536, _382, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _572 = fma(_560, _382, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _574 = fma(_514, _526, _554);
    float _576 = fma(_516, _526, _556);
    float _578 = fma(_524, _526, _562);
    float _580 = fma(_540, _382, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_570, _504, _574);
    float _584 = fma(_572, _504, _578);
    float _586 = fma(_580, _504, _576);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _596;
    float _600 = fma(_564, _450, _582);
    float _602 = fma(_568, _450, _584);
    float _604 = fma(_590, _408, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _606 = fma(_594, _408, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _608 = fma(_566, _450, _586);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _618 = fma(_598, _408, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _624 = fma(_612, _446, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _626 = fma(_616, _446, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _628 = fma(_604, _444, _600);
    float _630 = fma(_622, _446, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _632 = fma(_606, _444, _608);
    float _634 = fma(_618, _444, _602);
    float _636 = fma(_624, _440, _628);
    float _638 = fma(_626, _440, _632);
    float _640 = fma(_630, _440, _634);
    float _642 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[149].x, _636);
    float _644 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[149].y, _638);
    float _646 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[149].z, _640);
    bool _648 = !_354;
    float _666;
    if (!_648)
    {
        float _650 = in.m_51.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_88);
        float _672 = 1.0 / _670;
        float _674 = _122 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    float _678 = in.m_49.x;
    float _680 = in.m_49.y;
    float _682 = in.m_49.z;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _686 = _676 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _704 = 1.0 / _690;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _706;
    float _710 = 1.0 / _694;
    bool _712 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _714 = _644 * _680;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _718 = _676 + _716;
    float _720 = 1.0 / _698;
    float _722 = _686 * _704;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _726 = _676 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _728;
    float _732 = _646 * _682;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _736 = _676 + _734;
    float _738 = 1.0 / _702;
    float _740 = _718 * _710;
    bool _742 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _744 = isnan(_676);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _756 = _676 + _754;
    bool _758 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _760 = isnan(_676);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = fma(_730, _722, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _772 = 1.0 / _708;
    float _774 = -_752;
    float _776 = _774 + 1.0;
    float _778 = _726 * _720;
    bool _780 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _782 = isnan(_676);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _768 * _776;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _794;
    float _798 = -_768;
    float _800 = _798 + 1.0;
    float _802 = _756 * _738;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _804;
    bool _808 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _810 = isnan(_676);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = fma(_796, _722, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _822 = _790 * _800;
    float _824 = fma(_806, _722, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _826 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _828 = isnan(_676);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_818;
    float _840 = _838 + 1.0;
    float _842 = -_790;
    float _844 = _842 + 1.0;
    float _846 = _736 * _772;
    bool _848 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _850 = isnan(_676);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = _836 * _840;
    float _862 = -_836;
    float _864 = _862 + 1.0;
    float _866 = _818 * _844;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _880 = _858 * _864;
    float _882 = fma(_870, _740, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _884 = fma(_874, _740, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _886 = fma(_878, _740, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _888 = _820 * _880;
    float _890 = _824 * _880;
    float _892 = _770 * _880;
    float _894 = -_858;
    float _896 = _894 + 1.0;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _898;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _902;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _906;
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[107].x, _888);
    float _912 = fma(_900, _778, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _914 = fma(_904, _778, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _916 = fma(_908, _778, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _922 = fma(_882, _860, _910);
    float _924 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[107].y, _890);
    float _926 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[107].z, _892);
    float _928 = fma(_920, _802, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _930 = fma(_914, _866, _922);
    float _932 = fma(_884, _860, _924);
    float _934 = fma(_886, _860, _926);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _944 = fma(_916, _866, _934);
    float _946 = fma(_938, _802, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _948 = fma(_912, _866, _932);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _954;
    float _958 = fma(_942, _802, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _960;
    float _964 = fma(_928, _822, _930);
    float _966 = fma(_952, _846, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _968 = fma(_956, _846, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _970 = fma(_946, _822, _948);
    float _972 = fma(_962, _846, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _974 = fma(_958, _822, _944);
    float _976 = fma(_966, _792, _964);
    float _978 = fma(_968, _792, _970);
    float _980 = fma(_972, _792, _974);
    float _982 = _642 * _678;
    float _984 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[112].x, _976);
    float _986 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[112].y, _978);
    float _988 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[112].z, _980);
    bool _990 = !_712;
    float _1008;
    if (!_990)
    {
        float _992 = in.m_51.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _1008 = _1006;
        _1010 = true;
    }
    else
    {
        float _1012 = float(_88);
        float _1014 = 1.0 / _1012;
        float _1016 = _122 * _1014;
        _1008 = _1016;
    }
    _1010 = false;
    float _1018 = _1008;
    float _1020 = in.m_51.w;
    float _1022 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1024 = in.m_53.x;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1028 = _1026 != 0;
    float _1030 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1022);
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1034 = _1032 != 0;
    float _1036 = in.m_53.y;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1040 = _1038 != 0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1044 = _1018 + _1042;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1048 = _1046 != 0;
    float _1050 = in.m_51.y;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1054 = _1052 != 0;
    float _1056 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1058 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1060 = in.m_51.x;
    float _1062 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1056);
    float _1064 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1058);
    float _1066 = in.m_53.z;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1072 = in.m_55.y;
    bool _1074 = _1020 > 0.5;
    float _1076 = 1.0 / _1070;
    float _1078 = _942;
    bool _1080 = _1074;
    float _1082 = _1062;
    float _1084 = _1072;
    if (_1034)
    {
        float _1086 = in.m_51.z;
        _1078 = _1086;
    }
    float _1088 = _1078;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1092 = _1018 + _1090;
    float _1094 = _986 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_57.x = _1024;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1102 = 1.0 / _1098;
    float _1104 = in.m_55.x;
    float _1106 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_57.y = _1036;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1116;
    out.m_57.z = _1066;
    float _1120 = -_1114;
    float _1122 = fma(_1106, 2.0, _1120);
    float _1124 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1126 = 1.0 / _1112;
    bool _1128 = false;
    float _1130 = _1088;
    float _1132 = _1094;
    if (_1034)
    {
        bool _1134 = _1088 > 0.5;
        _1128 = _1134;
    }
    bool _1136 = _1128;
    float _1138 = fma(_1124, -2.0, _1100);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1144;
    float _1148 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1030);
    float _1150 = _1118 * _1102;
    float _1152 = _1030;
    if (!_1054)
    {
        float _1154 = in.m_51.z;
        _1152 = _1154;
    }
    float _1156 = _1152;
    float _1158 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    float _1160 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1064);
    float _1162 = -_1072;
    float _1164 = _1162 + 1.0;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1054)
    {
        _1130 = _1050;
    }
    float _1168 = _1130;
    float _1170 = _1142 * _1076;
    float _1172 = _1168;
    if (_1054)
    {
        _1172 = _1060;
    }
    float _1174 = _1172;
    float _1176 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1166);
    int _1178 = _1074 ? as_type<int>(_1164) : as_type<int>(_1072);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1182 = _1018 + _1180;
    int _1184 = as_type<int>(_1174);
    if (_1028)
    {
        bool _1186 = _1060 > 0.5;
        _1080 = _1186;
    }
    bool _1188 = _1080;
    float _1190 = fma(_1170, _1044, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1192 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1194 = isnan(_1018);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = _1146 * _1126;
    float _1206 = _1040 ? as_type<float>(_1178) : _1072;
    float _1208 = fma(_1150, _1182, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1210 = _1050 > 0.5;
    float _1212 = -_1202;
    float _1214 = _1212 + 1.0;
    bool _1216 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1218 = isnan(_1018);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = fma(_1204, _1092, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1230 = _1204;
    if (!_1028)
    {
        _1082 = _1104;
    }
    float _1232 = _1082;
    float _1234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1236 = _1232;
    if (_1048)
    {
        float _1238 = _1210 ? _1164 : _1072;
        _1084 = _1238;
    }
    float _1240 = _1084;
    float _1242 = _1226 * _1214;
    bool _1244 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1246 = isnan(_1018);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = -_1226;
    float _1258 = _1256 + 1.0;
    float _1260 = _1254;
    float _1262 = _1240;
    if (!_1028)
    {
        _1230 = _1232;
    }
    float _1264 = _1230;
    float _1266 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1268 = _1264;
    if (_1028)
    {
        _1236 = _1104;
    }
    float _1270 = _1236;
    float _1272 = -_1254;
    float _1274 = _1272 + 1.0;
    bool _1276 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1278 = isnan(_1018);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = _1254 * _1258;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1292 = _1156;
    if (!_1054)
    {
        _1260 = _1156;
    }
    float _1294 = _1260;
    float _1296 = _1286 * _1274;
    float _1298 = _1294;
    if (_1054)
    {
        _1298 = _1050;
    }
    float _1300 = _1298;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1304 = _1208 * _1296;
    float _1306 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1302);
    int _1308 = as_type<int>(_1306);
    if (_1054)
    {
        _1292 = _1050;
    }
    float _1310 = _1292;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1314 = fma(_1206, _1266, -0.5);
    float _1316 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1320 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1312);
    float _1322 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1028)
    {
        float _1324 = -_1270;
        float _1326 = _1324 + 1.0;
        _1184 = as_type<int>(_1326);
    }
    int _1328 = _1184;
    float _1330 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1318);
    float _1332 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1306);
    if (_1034)
    {
        float _1334 = -_1270;
        float _1336 = _1334 + 1.0;
        _1308 = as_type<int>(_1336);
    }
    int _1338 = _1308;
    float _1340 = -_1286;
    float _1342 = _1340 + 1.0;
    if (_1028)
    {
        float _1344 = _1188 ? as_type<float>(_1328) : _1270;
        _1268 = _1344;
    }
    float _1346 = _1268;
    float _1348 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1350 = fma(_1316, _1240, -0.5);
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1354 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1138);
    if (!_1034)
    {
        _1262 = _1270;
    }
    float _1356 = _1262;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1360 = _1356;
    if (_1034)
    {
        float _1362 = _1136 ? as_type<float>(_1338) : _1270;
        _1360 = _1362;
    }
    float _1364 = _1360;
    float _1366 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1304);
    float _1368 = -_1354;
    float _1370 = fma(_1332, _1350, _1368);
    float _1372 = fma(_1348, -2.0, _1358);
    float _1374 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1376 = _1148 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1378 = fma(_1190, _1288, _1366);
    float _1380 = fma(_1374, _1346, -0.5);
    float _1382 = _1158 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1386 = _1376 + _1384;
    float _1388 = _1160 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1382 + _1392;
    float _1396 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1398 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1400 = -_1390;
    float _1402 = fma(_1322, 2.0, _1400);
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1406 = _1388 + _1404;
    float _1408 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1396);
    float _1410 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1330);
    float _1412 = fma(_1398, _1364, -0.5);
    float _1414 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1372);
    float _1416 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1176);
    float _1418 = -_122;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1122);
    float _1422 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1320);
    float _1424 = -_122;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1402);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1408);
    float _1430 = fma(_1228, _1242, _1378);
    float _1432 = _1386 * _1386;
    float _1434 = -_1414;
    float _1436 = fma(_1410, _1314, _1434);
    float _1438 = fma(_1422, _1412, _1426);
    float _1440 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1430);
    float _1442 = in.m_53.w;
    bool _1444 = _1428 >= 0.0;
    float _1446 = fma(_1394, _1394, _1432);
    float _1448 = fma(_1416, _1380, _1420);
    float _1450 = fma(_1406, _1406, _1446);
    float _1452 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = _984 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1456 = _988 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1458 = rsqrt(_1450);
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1444)
    {
        _1132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1462 = _1132;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1468 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1474 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1480 = _1370 + 0.5;
    float _1482 = _1448 + 0.5;
    float _1484 = _1438 + 0.5;
    float _1486 = _1436 + 0.5;
    float _1488 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1490 = as_type<int>(_1462);
    int _1492 = as_type<int>(_1478);
    if (_1444)
    {
        float _1494 = _1462 * 5.0;
        _1490 = as_type<int>(_1494);
    }
    int _1496 = _1490;
    out.m_57.w = _1442;
    float _1498 = _1386 * _1458;
    float _1500 = _1394 * _1458;
    out.m_59.x = _1474;
    out.m_59.y = _1476;
    out.m_59.z = _1478;
    out.m_59.w = _1472;
    out.m_61.x = _1482;
    out.m_61.y = _1480;
    out.m_61.z = _1484;
    out.m_61.w = _1486;
    out.m_63.x = _1468;
    out.m_63.y = _1452;
    out.m_63.z = _1470;
    out.m_63.w = _1488;
    if (_1444)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4598 = as_type<float>(_1496);
        out.gl_Position.z = _4598;
    }
    if (_1444)
    {
        out.m_45.x = 0.0;
    }
    if (_1444)
    {
        return out;
    }
    float _1502 = -_1498;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1376);
    float _1506 = _1406 * _1458;
    float _1508 = -_1500;
    float _1510 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1382);
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1514 = _1504 + _1512;
    float _1516 = -_1506;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1388);
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1510 + _1520;
    float _1524 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1518 + _1526;
    float _1530 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1524);
    float _1532 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1530);
    bool _1534 = _1532 >= 0.0;
    float _1536 = _1522;
    if (_1534)
    {
        _1536 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1538 = _1536;
    if (_1534)
    {
        out.m_45.x = 0.0;
    }
    if (_1534)
    {
        float _1540 = _1538 * 5.0;
        _1492 = as_type<int>(_1540);
    }
    int _1542 = _1492;
    if (_1534)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4691 = as_type<float>(_1542);
        out.gl_Position.z = _4691;
    }
    if (_1534)
    {
        return out;
    }
    float _1544 = -_1376;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1548 = -_1382;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1552 = -_1388;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1556 = -_1498;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1386);
    float _1560 = _1546 * _1546;
    float _1562 = -_1500;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1566 = -_1506;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1570 = _982 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1572 = fma(_1550, _1550, _1560);
    float _1574 = fma(_1554, _1554, _1572);
    float _1576 = _1558 * _1558;
    float _1578 = fma(_1564, _1564, _1576);
    float _1580 = rsqrt(_1574);
    float _1582 = fma(_1568, _1568, _1578);
    float _1584 = sqrt(_1582);
    float _1586 = _1550 * _1580;
    float _1588 = _1554 * _1580;
    float _1590 = _1546 * _1580;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1594 = _1586 * _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1598 = _1588 * _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1602 = _1590 * _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1606 = -_1594;
    float _1608 = fma(_1588, _1604, _1606);
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1612 = -_1598;
    float _1614 = fma(_1590, _1610, _1612);
    float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1618 = -_1602;
    float _1620 = fma(_1586, _1616, _1618);
    float _1622 = in.m_65.x;
    float _1624 = in.m_65.y;
    float _1626 = in.m_65.z;
    float _1628 = _1608 * _1608;
    float _1630 = _1458 * _1584;
    float _1632 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1634 = fma(_1614, _1614, _1628);
    float _1636 = _1630 * _1570;
    float _1638 = _1630 * _1632;
    float _1640 = fma(_1620, _1620, _1634);
    float _1642 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1644 = rsqrt(_1640);
    float _1646 = _1630 * _1642;
    float _1648 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1624);
    float _1650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1622);
    float _1652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1626);
    float _1654 = _1646 * _1648;
    float _1656 = _1614 * _1644;
    float _1658 = _1608 * _1644;
    float _1660 = _1620 * _1644;
    float _1662 = _1636 * _1650;
    float _1664 = _1590 * _1656;
    float _1666 = _1588 * _1658;
    float _1668 = _1638 * _1652;
    float _1670 = -_1664;
    float _1672 = fma(_1586, _1658, _1670);
    float _1674 = -_1666;
    float _1676 = fma(_1590, _1660, _1674);
    float _1678 = _1654 * _1672;
    float _1680 = _1654 * _1676;
    float _1682 = fma(_1662, _1660, _1678);
    float _1684 = fma(_1662, _1656, _1680);
    float _1686 = fma(_1668, _1588, _1682);
    float _1688 = fma(_1668, _1586, _1684);
    float _1690 = _1586 * _1660;
    float _1692 = _1388 + _1686;
    float _1694 = _1382 + _1688;
    float _1696 = -_1690;
    float _1698 = fma(_1588, _1656, _1696);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1702 = _1692 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1706 = _1694 + _1704;
    float _1708 = _1654 * _1698;
    float _1710 = _1702 * _1702;
    float _1712 = fma(_1662, _1658, _1708);
    float _1714 = fma(_1706, _1706, _1710);
    float _1716 = fma(_1668, _1590, _1712);
    float _1718 = sqrt(_1714);
    float _1720 = _1376 + _1716;
    bool _1722 = _1718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1716;
    float _1726 = _1656;
    float _1728 = _1710;
    float _1730 = _1698;
    float _1732 = _1720;
    if (!_1722)
    {
        _1724 = _1694;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (!_1722)
    {
        _1726 = _1692;
    }
    float _1738 = _1726;
    float _1740 = _1738;
    if (!_1722)
    {
        _1728 = _1720;
    }
    float _1742 = _1728;
    bool _1744 = !_1722;
    float _1746 = _1742;
    if (!_1744)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1752 = _1718 + _1750;
        float _1754 = rsqrt(_1714);
        float _1756 = _1752 * _1748;
        float _1758 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1760 = _1756 * 0.15915493667125701904296875;
        float _1762 = _1760 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = _1760 * 6.283185482025146484375;
        float _1768 = sin(_1766);
        float _1770 = _1764 + (-1.0);
        float _1772 = fma(_1768, _1758, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1774 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1776 = _1754 * _1772;
        float _1778 = fma(_1720, _1764, _1774);
        float _1780 = fma(_1706, _1776, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1782 = fma(_1702, _1776, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1746 = _1778;
        _1736 = _1780;
        _1740 = _1782;
    }
    float _1784 = _1746;
    float _1786 = _1736;
    float _1788 = _1740;
    float _1790 = -_1498;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1784);
    float _1794 = -_1500;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1786);
    float _1798 = -_1506;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1804 = _1792 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1808 = _1796 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1812 = _1800 + _1810;
    float _1814 = _1804 * _1804;
    float _1816 = fma(_1808, _1808, _1814);
    float _1818 = fma(_1812, _1812, _1816);
    float _1820 = rsqrt(_1818);
    float _1822 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1824 = _1808 * _1822;
    float _1826 = _1812 * _1822;
    float _1828 = _1824 * _1824;
    float _1830 = _1826 * _1826;
    float _1832 = _1828 + _1830;
    float _1834 = sqrt(_1832);
    bool _1836 = _1834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1840 = _1834 + _1838;
    float _1842 = _1812;
    float _1844 = _1832;
    float _1846 = _1840;
    float _1848 = _1804;
    float _1850 = _1824;
    if (_1836)
    {
        float _1852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1842 = _1852;
    }
    float _1854 = _1842;
    if (_1836)
    {
        float _1856 = rsqrt(_1832);
        _1844 = _1856;
    }
    float _1858 = _1844;
    if (_1836)
    {
        float _1860 = _1840 * _1854;
        _1846 = _1860;
    }
    float _1862 = _1846;
    if (_1836)
    {
        float _1864 = _1862 * 0.15915493667125701904296875;
        _1730 = _1864;
    }
    float _1866 = _1730;
    float _1868 = _1814;
    if (_1836)
    {
        float _1870 = _1866 * 6.283185482025146484375;
        float _1872 = sin(_1870);
        _1868 = _1872;
    }
    float _1874 = _1868;
    float _1876 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1878 = precise::max(0.0, _1876);
    float _1880 = _1820;
    float _1882 = _1876;
    float _1884 = _1878;
    if (_1836)
    {
        float _1886 = _1866 * 6.283185482025146484375;
        float _1888 = cos(_1886);
        _1880 = _1888;
    }
    float _1890 = _1880;
    float _1892 = -_1822;
    float _1894 = -_1878;
    float _1896 = fma(_1804, _1892, _1894);
    float _1898 = _1896;
    if (!_1836)
    {
        _1848 = _1830;
    }
    float _1900 = _1848;
    float _1902 = _1900;
    if (_1836)
    {
        float _1904 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1904;
    }
    float _1906 = _1882;
    float _1908 = _1874;
    float _1910 = _1906;
    if (_1836)
    {
        float _1912 = fma(_1874, _1906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1908 = _1912;
    }
    float _1914 = _1908;
    float _1916 = _1914;
    if (_1836)
    {
        float _1918 = _1890 + (-1.0);
        _1910 = _1918;
    }
    float _1920 = _1910;
    float _1922 = _1920;
    if (_1836)
    {
        float _1924 = _1858 * _1914;
        _1732 = _1924;
    }
    float _1926 = _1732;
    if (!_1836)
    {
        _1916 = _1826;
    }
    float _1928 = _1916;
    float _1930 = sqrt(_1818);
    float _1932 = _1928;
    if (_1836)
    {
        float _1934 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1884 = _1934;
    }
    float _1936 = _1884;
    if (_1836)
    {
        float _1938 = _1824 * _1926;
        _1850 = _1938;
    }
    float _1940 = _1850;
    if (!_1836)
    {
        _1922 = _1828;
    }
    float _1942 = _1922;
    float _1944 = _1942;
    if (_1836)
    {
        float _1946 = _1826 * _1926;
        _1932 = _1946;
    }
    float _1948 = _1932;
    if (_1836)
    {
        float _1950 = fma(_1896, _1890, _1936);
        _1898 = _1950;
    }
    float _1952 = _1898;
    if (_1836)
    {
        float _1954 = _1940 * _1940;
        _1944 = _1954;
    }
    float _1956 = _1944;
    if (_1836)
    {
        float _1958 = _1948 * _1948;
        _1902 = _1958;
    }
    float _1960 = _1902;
    float _1962 = fma(_1952, _1952, _1956);
    float _1964 = _1962 + _1960;
    float _1966 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1930, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1976 = rsqrt(_1964);
    float _1978 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1966);
    float _1980 = -_1972;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1974);
    float _1986 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1988 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1978);
    float _1990 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1992 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1984);
    float _1994 = abs(_1982);
    float _1996 = log2(_1994);
    float _1998 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2000 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1990);
    float _2002 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2004 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2006 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2000);
    float _2008 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2010 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2002);
    float _2012 = _1976 * _1940;
    float _2014 = -_2004;
    float _2016 = fma(_2014, _1986, 1.0);
    float _2018 = _2006 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2022 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2010);
    float _2024 = _1976 * _1952;
    float _2026 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2020);
    float _2030 = _1976 * _1948;
    float _2032 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2034 = -_2026;
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2034);
    float _2038 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2040 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2028);
    float _2042 = log2(_2016);
    float _2044 = -_2030;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2036);
    float _2048 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2050 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2040);
    float _2052 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2054 = fma(_2046, -0.5, 0.5);
    float _2056 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2048);
    float _2058 = exp2(_2032);
    float _2060 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2052);
    float _2062 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2056);
    float _2064 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2060);
    float _2066 = 1.0 / _2050;
    float _2068 = fma(_2046, 0.5, 0.5);
    float _2070 = _2024 + 1.0;
    float _2072 = _2042 * 0.693147182464599609375;
    float _2074 = fma(_2068, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2076 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2078 = sqrt(_2054);
    float _2080 = -_2024;
    float _2082 = fma(_2058, _2070, _2080);
    float _2084 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2062);
    float _2086 = fma(_2068, _2074, -0.212114393711090087890625);
    float _2088 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2064);
    float _2090 = fma(_2082, 0.5, 0.5);
    float _2092 = fma(_2068, _2086, 1.570728778839111328125);
    float _2094 = _2084 * _2066;
    float _2096 = _2088 * _2066;
    float _2098 = fma(_2094, 0.5, 0.5);
    float _2100 = fma(_2096, -0.5, 0.5);
    float _2102 = _2078 * 0.636619746685028076171875;
    float3 _5605 = float3(_2098, _2100, _2076);
    float _2104 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5605, float3(0.0), isnan(_5605)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5605, float3(0.0), isnan(_5605)), level(0.0)).x;
    float _2106 = -_2092;
    float _2108 = fma(_2102, _2106, 1.0);
    float3 _5621 = float3(_2098, _2100, _2076);
    float4 _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5621, float3(0.0), isnan(_5621)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5621, float3(0.0), isnan(_5621)), level(0.0)).xyzw;
    float _2113 = _2111.x;
    float _2115 = _2111.y;
    float _2117 = _2111.z;
    float _2119 = _2111.w;
    float2 _5638 = float2(_2108, _2090);
    float3 _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5638, float2(0.0), isnan(_5638)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5638, float2(0.0), isnan(_5638)), level(0.0)).xyz;
    float _2125 = _2123.x;
    float _2127 = _2123.y;
    float _2129 = _2123.z;
    float _2131 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2133 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2135 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2133);
    float _2137 = exp2(_2131);
    float _2139 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2135);
    float _2141 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2139);
    float _2143 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = _2141 + _2050;
    out.gl_Position.x = _2084;
    out.gl_Position.y = _2088;
    out.gl_Position.z = _2141;
    out.gl_Position.w = _2050;
    float _2147 = _2145 * 0.5;
    float _2149 = -_2137;
    float _2151 = _2149 + 1.0;
    out.m_45.x = _2143;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2147;
    out.m_67.w = _2050;
    float _2155 = -_2153;
    float _2157 = _2155 + 1.0;
    float _2159 = _2153 * _2104;
    float _2161 = _2119 * _2159;
    float _2163 = _2129 * _2159;
    float _2165 = fma(_2125, _2161, _2113);
    float _2167 = fma(_2127, _2161, _2115);
    float _2169 = _2119 * _2157;
    float _2171 = fma(_2119, _2163, _2117);
    out.m_69.x = _2165;
    out.m_69.y = _2167;
    out.m_69.z = _2171;
    out.m_69.w = _2169;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1010 = false;
    bool _668 = false;
    bool _284 = false;
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
        float _2228 = as_type<float>(_104);
        out.gl_Position.z = _2228;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2297 = as_type<float>(_140);
        out.gl_Position.z = _2297;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = 1.0 / _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _320 = 1.0 / _300;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = _292 + _322;
    bool _326 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_292);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = 1.0 / _304;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _292 + _340;
    float _344 = _324 * _310;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = _292 + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _292 + _350;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _356 = 1.0 / _314;
    float _358 = _342 * _320;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _362 = _292 + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _366 = _292 + _364;
    bool _368 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _370 = isnan(_292);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = 1.0 / _308;
    float _382 = _348 * _338;
    bool _384 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _386 = isnan(_292);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = -_378;
    float _402 = _400 + 1.0;
    float _404 = fma(_398, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = 1.0 / _318;
    float _408 = _362 * _356;
    bool _410 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _412 = isnan(_292);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -_394;
    float _424 = _422 + 1.0;
    float _426 = -_420;
    float _428 = _426 + 1.0;
    float _430 = _352 * _380;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    float _440 = _378 * _424;
    float _442 = fma(_438, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _444 = _420 * _402;
    float _446 = _366 * _406;
    float _448 = fma(_434, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _450 = _336 * _428;
    bool _452 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _454 = isnan(_292);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _468 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _470 = isnan(_292);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -_336;
    float _482 = _480 + 1.0;
    bool _484 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _486 = isnan(_292);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = _462 * _482;
    float _506 = -_462;
    float _508 = _506 + 1.0;
    float _510 = -_494;
    float _512 = _510 + 1.0;
    float _514 = fma(_498, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _516 = fma(_466, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = _478 * _512;
    float _520 = -_478;
    float _522 = _520 + 1.0;
    float _524 = fma(_502, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _494 * _508;
    float _528 = _442 * _518;
    float _530 = _448 * _518;
    float _532 = _404 * _518;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _554 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _528);
    float _556 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _530);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _558;
    float _562 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].z, _532);
    float _564 = fma(_544, _430, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _566 = fma(_548, _430, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _568 = fma(_552, _430, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _570 = fma(_536, _382, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _572 = fma(_560, _382, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _574 = fma(_514, _526, _554);
    float _576 = fma(_516, _526, _556);
    float _578 = fma(_524, _526, _562);
    float _580 = fma(_540, _382, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_570, _504, _574);
    float _584 = fma(_572, _504, _578);
    float _586 = fma(_580, _504, _576);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _596;
    float _600 = fma(_564, _450, _582);
    float _602 = fma(_568, _450, _584);
    float _604 = fma(_590, _408, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _606 = fma(_594, _408, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _608 = fma(_566, _450, _586);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _618 = fma(_598, _408, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _624 = fma(_612, _446, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _626 = fma(_616, _446, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _628 = fma(_604, _444, _600);
    float _630 = fma(_622, _446, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _632 = fma(_606, _444, _608);
    float _634 = fma(_618, _444, _602);
    float _636 = fma(_624, _440, _628);
    float _638 = fma(_626, _440, _632);
    float _640 = fma(_630, _440, _634);
    float _642 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[149].x, _636);
    float _644 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[149].y, _638);
    float _646 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[149].z, _640);
    bool _648 = !_354;
    float _666;
    if (!_648)
    {
        float _650 = in.m_51.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_88);
        float _672 = 1.0 / _670;
        float _674 = _122 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    float _678 = in.m_49.x;
    float _680 = in.m_49.y;
    float _682 = in.m_49.z;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _686 = _676 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _704 = 1.0 / _690;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _706;
    float _710 = 1.0 / _694;
    bool _712 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _714 = _644 * _680;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _718 = _676 + _716;
    float _720 = 1.0 / _698;
    float _722 = _686 * _704;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _726 = _676 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _728;
    float _732 = _646 * _682;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _736 = _676 + _734;
    float _738 = 1.0 / _702;
    float _740 = _718 * _710;
    bool _742 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _744 = isnan(_676);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _756 = _676 + _754;
    bool _758 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _760 = isnan(_676);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = fma(_730, _722, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _772 = 1.0 / _708;
    float _774 = -_752;
    float _776 = _774 + 1.0;
    float _778 = _726 * _720;
    bool _780 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _782 = isnan(_676);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _768 * _776;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _794;
    float _798 = -_768;
    float _800 = _798 + 1.0;
    float _802 = _756 * _738;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _804;
    bool _808 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _810 = isnan(_676);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = fma(_796, _722, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _822 = _790 * _800;
    float _824 = fma(_806, _722, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _826 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _828 = isnan(_676);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_818;
    float _840 = _838 + 1.0;
    float _842 = -_790;
    float _844 = _842 + 1.0;
    float _846 = _736 * _772;
    bool _848 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _850 = isnan(_676);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = _836 * _840;
    float _862 = -_836;
    float _864 = _862 + 1.0;
    float _866 = _818 * _844;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _880 = _858 * _864;
    float _882 = fma(_870, _740, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _884 = fma(_874, _740, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _886 = fma(_878, _740, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _888 = _820 * _880;
    float _890 = _824 * _880;
    float _892 = _770 * _880;
    float _894 = -_858;
    float _896 = _894 + 1.0;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _898;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _902;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _906;
    float _910 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[107].x, _888);
    float _912 = fma(_900, _778, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _914 = fma(_904, _778, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _916 = fma(_908, _778, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _922 = fma(_882, _860, _910);
    float _924 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[107].y, _890);
    float _926 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[107].z, _892);
    float _928 = fma(_920, _802, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _930 = fma(_914, _866, _922);
    float _932 = fma(_884, _860, _924);
    float _934 = fma(_886, _860, _926);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _944 = fma(_916, _866, _934);
    float _946 = fma(_938, _802, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _948 = fma(_912, _866, _932);
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _954;
    float _958 = fma(_942, _802, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _960;
    float _964 = fma(_928, _822, _930);
    float _966 = fma(_952, _846, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _968 = fma(_956, _846, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _970 = fma(_946, _822, _948);
    float _972 = fma(_962, _846, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _974 = fma(_958, _822, _944);
    float _976 = fma(_966, _792, _964);
    float _978 = fma(_968, _792, _970);
    float _980 = fma(_972, _792, _974);
    float _982 = _642 * _678;
    float _984 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[112].x, _976);
    float _986 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[112].y, _978);
    float _988 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[112].z, _980);
    bool _990 = !_712;
    float _1008;
    if (!_990)
    {
        float _992 = in.m_51.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _1008 = _1006;
        _1010 = true;
    }
    else
    {
        float _1012 = float(_88);
        float _1014 = 1.0 / _1012;
        float _1016 = _122 * _1014;
        _1008 = _1016;
    }
    _1010 = false;
    float _1018 = _1008;
    float _1020 = in.m_51.w;
    float _1022 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1024 = in.m_53.x;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1028 = _1026 != 0;
    float _1030 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1022);
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1034 = _1032 != 0;
    float _1036 = in.m_53.y;
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1040 = _1038 != 0;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1044 = _1018 + _1042;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1048 = _1046 != 0;
    float _1050 = in.m_51.y;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1054 = _1052 != 0;
    float _1056 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1058 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1060 = in.m_51.x;
    float _1062 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1056);
    float _1064 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1058);
    float _1066 = in.m_53.z;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1072 = in.m_55.y;
    bool _1074 = _1020 > 0.5;
    float _1076 = 1.0 / _1070;
    float _1078 = _942;
    bool _1080 = _1074;
    float _1082 = _1062;
    float _1084 = _1072;
    if (_1034)
    {
        float _1086 = in.m_51.z;
        _1078 = _1086;
    }
    float _1088 = _1078;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1092 = _1018 + _1090;
    float _1094 = _986 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_57.x = _1024;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1102 = 1.0 / _1098;
    float _1104 = in.m_55.x;
    float _1106 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_57.y = _1036;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1116;
    out.m_57.z = _1066;
    float _1120 = -_1114;
    float _1122 = fma(_1106, 2.0, _1120);
    float _1124 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1126 = 1.0 / _1112;
    bool _1128 = false;
    float _1130 = _1088;
    float _1132 = _1094;
    if (_1034)
    {
        bool _1134 = _1088 > 0.5;
        _1128 = _1134;
    }
    bool _1136 = _1128;
    float _1138 = fma(_1124, -2.0, _1100);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1144;
    float _1148 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1030);
    float _1150 = _1118 * _1102;
    float _1152 = _1030;
    if (!_1054)
    {
        float _1154 = in.m_51.z;
        _1152 = _1154;
    }
    float _1156 = _1152;
    float _1158 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    float _1160 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1064);
    float _1162 = -_1072;
    float _1164 = _1162 + 1.0;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1054)
    {
        _1130 = _1050;
    }
    float _1168 = _1130;
    float _1170 = _1142 * _1076;
    float _1172 = _1168;
    if (_1054)
    {
        _1172 = _1060;
    }
    float _1174 = _1172;
    float _1176 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1166);
    int _1178 = _1074 ? as_type<int>(_1164) : as_type<int>(_1072);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1182 = _1018 + _1180;
    int _1184 = as_type<int>(_1174);
    if (_1028)
    {
        bool _1186 = _1060 > 0.5;
        _1080 = _1186;
    }
    bool _1188 = _1080;
    float _1190 = fma(_1170, _1044, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1192 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1194 = isnan(_1018);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = _1146 * _1126;
    float _1206 = _1040 ? as_type<float>(_1178) : _1072;
    float _1208 = fma(_1150, _1182, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1210 = _1050 > 0.5;
    float _1212 = -_1202;
    float _1214 = _1212 + 1.0;
    bool _1216 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1218 = isnan(_1018);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = fma(_1204, _1092, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1230 = _1204;
    if (!_1028)
    {
        _1082 = _1104;
    }
    float _1232 = _1082;
    float _1234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1236 = _1232;
    if (_1048)
    {
        float _1238 = _1210 ? _1164 : _1072;
        _1084 = _1238;
    }
    float _1240 = _1084;
    float _1242 = _1226 * _1214;
    bool _1244 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1246 = isnan(_1018);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = -_1226;
    float _1258 = _1256 + 1.0;
    float _1260 = _1254;
    float _1262 = _1240;
    if (!_1028)
    {
        _1230 = _1232;
    }
    float _1264 = _1230;
    float _1266 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1268 = _1264;
    if (_1028)
    {
        _1236 = _1104;
    }
    float _1270 = _1236;
    float _1272 = -_1254;
    float _1274 = _1272 + 1.0;
    bool _1276 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1278 = isnan(_1018);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = _1254 * _1258;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1292 = _1156;
    if (!_1054)
    {
        _1260 = _1156;
    }
    float _1294 = _1260;
    float _1296 = _1286 * _1274;
    float _1298 = _1294;
    if (_1054)
    {
        _1298 = _1050;
    }
    float _1300 = _1298;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1304 = _1208 * _1296;
    float _1306 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1302);
    int _1308 = as_type<int>(_1306);
    if (_1054)
    {
        _1292 = _1050;
    }
    float _1310 = _1292;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1314 = fma(_1206, _1266, -0.5);
    float _1316 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1320 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1312);
    float _1322 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1028)
    {
        float _1324 = -_1270;
        float _1326 = _1324 + 1.0;
        _1184 = as_type<int>(_1326);
    }
    int _1328 = _1184;
    float _1330 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1318);
    float _1332 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1306);
    if (_1034)
    {
        float _1334 = -_1270;
        float _1336 = _1334 + 1.0;
        _1308 = as_type<int>(_1336);
    }
    int _1338 = _1308;
    float _1340 = -_1286;
    float _1342 = _1340 + 1.0;
    if (_1028)
    {
        float _1344 = _1188 ? as_type<float>(_1328) : _1270;
        _1268 = _1344;
    }
    float _1346 = _1268;
    float _1348 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1350 = fma(_1316, _1240, -0.5);
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1354 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1138);
    if (!_1034)
    {
        _1262 = _1270;
    }
    float _1356 = _1262;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1360 = _1356;
    if (_1034)
    {
        float _1362 = _1136 ? as_type<float>(_1338) : _1270;
        _1360 = _1362;
    }
    float _1364 = _1360;
    float _1366 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1304);
    float _1368 = -_1354;
    float _1370 = fma(_1332, _1350, _1368);
    float _1372 = fma(_1348, -2.0, _1358);
    float _1374 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1376 = _1148 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1378 = fma(_1190, _1288, _1366);
    float _1380 = fma(_1374, _1346, -0.5);
    float _1382 = _1158 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1386 = _1376 + _1384;
    float _1388 = _1160 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1382 + _1392;
    float _1396 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1398 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1400 = -_1390;
    float _1402 = fma(_1322, 2.0, _1400);
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1406 = _1388 + _1404;
    float _1408 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1396);
    float _1410 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1330);
    float _1412 = fma(_1398, _1364, -0.5);
    float _1414 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1372);
    float _1416 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1176);
    float _1418 = -_122;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1122);
    float _1422 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1320);
    float _1424 = -_122;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1402);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1408);
    float _1430 = fma(_1228, _1242, _1378);
    float _1432 = _1386 * _1386;
    float _1434 = -_1414;
    float _1436 = fma(_1410, _1314, _1434);
    float _1438 = fma(_1422, _1412, _1426);
    float _1440 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1430);
    float _1442 = in.m_53.w;
    bool _1444 = _1428 >= 0.0;
    float _1446 = fma(_1394, _1394, _1432);
    float _1448 = fma(_1416, _1380, _1420);
    float _1450 = fma(_1406, _1406, _1446);
    float _1452 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = _984 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1456 = _988 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1458 = rsqrt(_1450);
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_1444)
    {
        _1132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1462 = _1132;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1468 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1474 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1480 = _1370 + 0.5;
    float _1482 = _1448 + 0.5;
    float _1484 = _1438 + 0.5;
    float _1486 = _1436 + 0.5;
    float _1488 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1490 = as_type<int>(_1462);
    int _1492 = as_type<int>(_1478);
    if (_1444)
    {
        float _1494 = _1462 * 5.0;
        _1490 = as_type<int>(_1494);
    }
    int _1496 = _1490;
    out.m_57.w = _1442;
    float _1498 = _1386 * _1458;
    float _1500 = _1394 * _1458;
    out.m_59.x = _1474;
    out.m_59.y = _1476;
    out.m_59.z = _1478;
    out.m_59.w = _1472;
    out.m_61.x = _1482;
    out.m_61.y = _1480;
    out.m_61.z = _1484;
    out.m_61.w = _1486;
    out.m_63.x = _1468;
    out.m_63.y = _1452;
    out.m_63.z = _1470;
    out.m_63.w = _1488;
    if (_1444)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4598 = as_type<float>(_1496);
        out.gl_Position.z = _4598;
    }
    if (_1444)
    {
        out.m_45.x = 0.0;
    }
    if (_1444)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1502 = -_1498;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1376);
    float _1506 = _1406 * _1458;
    float _1508 = -_1500;
    float _1510 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1382);
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1514 = _1504 + _1512;
    float _1516 = -_1506;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1388);
    float _1520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1510 + _1520;
    float _1524 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1518 + _1526;
    float _1530 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1524);
    float _1532 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1530);
    bool _1534 = _1532 >= 0.0;
    float _1536 = _1522;
    if (_1534)
    {
        _1536 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1538 = _1536;
    if (_1534)
    {
        out.m_45.x = 0.0;
    }
    if (_1534)
    {
        float _1540 = _1538 * 5.0;
        _1492 = as_type<int>(_1540);
    }
    int _1542 = _1492;
    if (_1534)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4691 = as_type<float>(_1542);
        out.gl_Position.z = _4691;
    }
    if (_1534)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1544 = -_1376;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1548 = -_1382;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1552 = -_1388;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1556 = -_1498;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1386);
    float _1560 = _1546 * _1546;
    float _1562 = -_1500;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1566 = -_1506;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1570 = _982 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1572 = fma(_1550, _1550, _1560);
    float _1574 = fma(_1554, _1554, _1572);
    float _1576 = _1558 * _1558;
    float _1578 = fma(_1564, _1564, _1576);
    float _1580 = rsqrt(_1574);
    float _1582 = fma(_1568, _1568, _1578);
    float _1584 = sqrt(_1582);
    float _1586 = _1550 * _1580;
    float _1588 = _1554 * _1580;
    float _1590 = _1546 * _1580;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1594 = _1586 * _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1598 = _1588 * _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1602 = _1590 * _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1606 = -_1594;
    float _1608 = fma(_1588, _1604, _1606);
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1612 = -_1598;
    float _1614 = fma(_1590, _1610, _1612);
    float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1618 = -_1602;
    float _1620 = fma(_1586, _1616, _1618);
    float _1622 = in.m_65.x;
    float _1624 = in.m_65.y;
    float _1626 = in.m_65.z;
    float _1628 = _1608 * _1608;
    float _1630 = _1458 * _1584;
    float _1632 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1634 = fma(_1614, _1614, _1628);
    float _1636 = _1630 * _1570;
    float _1638 = _1630 * _1632;
    float _1640 = fma(_1620, _1620, _1634);
    float _1642 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1644 = rsqrt(_1640);
    float _1646 = _1630 * _1642;
    float _1648 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1624);
    float _1650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1622);
    float _1652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1626);
    float _1654 = _1646 * _1648;
    float _1656 = _1614 * _1644;
    float _1658 = _1608 * _1644;
    float _1660 = _1620 * _1644;
    float _1662 = _1636 * _1650;
    float _1664 = _1590 * _1656;
    float _1666 = _1588 * _1658;
    float _1668 = _1638 * _1652;
    float _1670 = -_1664;
    float _1672 = fma(_1586, _1658, _1670);
    float _1674 = -_1666;
    float _1676 = fma(_1590, _1660, _1674);
    float _1678 = _1654 * _1672;
    float _1680 = _1654 * _1676;
    float _1682 = fma(_1662, _1660, _1678);
    float _1684 = fma(_1662, _1656, _1680);
    float _1686 = fma(_1668, _1588, _1682);
    float _1688 = fma(_1668, _1586, _1684);
    float _1690 = _1586 * _1660;
    float _1692 = _1388 + _1686;
    float _1694 = _1382 + _1688;
    float _1696 = -_1690;
    float _1698 = fma(_1588, _1656, _1696);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1702 = _1692 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1706 = _1694 + _1704;
    float _1708 = _1654 * _1698;
    float _1710 = _1702 * _1702;
    float _1712 = fma(_1662, _1658, _1708);
    float _1714 = fma(_1706, _1706, _1710);
    float _1716 = fma(_1668, _1590, _1712);
    float _1718 = sqrt(_1714);
    float _1720 = _1376 + _1716;
    bool _1722 = _1718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1716;
    float _1726 = _1656;
    float _1728 = _1710;
    float _1730 = _1698;
    float _1732 = _1720;
    if (!_1722)
    {
        _1724 = _1694;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (!_1722)
    {
        _1726 = _1692;
    }
    float _1738 = _1726;
    float _1740 = _1738;
    if (!_1722)
    {
        _1728 = _1720;
    }
    float _1742 = _1728;
    bool _1744 = !_1722;
    float _1746 = _1742;
    if (!_1744)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1752 = _1718 + _1750;
        float _1754 = rsqrt(_1714);
        float _1756 = _1752 * _1748;
        float _1758 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1760 = _1756 * 0.15915493667125701904296875;
        float _1762 = _1760 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = _1760 * 6.283185482025146484375;
        float _1768 = sin(_1766);
        float _1770 = _1764 + (-1.0);
        float _1772 = fma(_1768, _1758, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1774 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1776 = _1754 * _1772;
        float _1778 = fma(_1720, _1764, _1774);
        float _1780 = fma(_1706, _1776, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1782 = fma(_1702, _1776, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1746 = _1778;
        _1736 = _1780;
        _1740 = _1782;
    }
    float _1784 = _1746;
    float _1786 = _1736;
    float _1788 = _1740;
    float _1790 = -_1498;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1784);
    float _1794 = -_1500;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1786);
    float _1798 = -_1506;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1804 = _1792 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1808 = _1796 + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1812 = _1800 + _1810;
    float _1814 = _1804 * _1804;
    float _1816 = fma(_1808, _1808, _1814);
    float _1818 = fma(_1812, _1812, _1816);
    float _1820 = rsqrt(_1818);
    float _1822 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1824 = _1808 * _1822;
    float _1826 = _1812 * _1822;
    float _1828 = _1824 * _1824;
    float _1830 = _1826 * _1826;
    float _1832 = _1828 + _1830;
    float _1834 = sqrt(_1832);
    bool _1836 = _1834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1840 = _1834 + _1838;
    float _1842 = _1812;
    float _1844 = _1832;
    float _1846 = _1840;
    float _1848 = _1804;
    float _1850 = _1824;
    if (_1836)
    {
        float _1852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1842 = _1852;
    }
    float _1854 = _1842;
    if (_1836)
    {
        float _1856 = rsqrt(_1832);
        _1844 = _1856;
    }
    float _1858 = _1844;
    if (_1836)
    {
        float _1860 = _1840 * _1854;
        _1846 = _1860;
    }
    float _1862 = _1846;
    if (_1836)
    {
        float _1864 = _1862 * 0.15915493667125701904296875;
        _1730 = _1864;
    }
    float _1866 = _1730;
    float _1868 = _1814;
    if (_1836)
    {
        float _1870 = _1866 * 6.283185482025146484375;
        float _1872 = sin(_1870);
        _1868 = _1872;
    }
    float _1874 = _1868;
    float _1876 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1878 = precise::max(0.0, _1876);
    float _1880 = _1820;
    float _1882 = _1876;
    float _1884 = _1878;
    if (_1836)
    {
        float _1886 = _1866 * 6.283185482025146484375;
        float _1888 = cos(_1886);
        _1880 = _1888;
    }
    float _1890 = _1880;
    float _1892 = -_1822;
    float _1894 = -_1878;
    float _1896 = fma(_1804, _1892, _1894);
    float _1898 = _1896;
    if (!_1836)
    {
        _1848 = _1830;
    }
    float _1900 = _1848;
    float _1902 = _1900;
    if (_1836)
    {
        float _1904 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1904;
    }
    float _1906 = _1882;
    float _1908 = _1874;
    float _1910 = _1906;
    if (_1836)
    {
        float _1912 = fma(_1874, _1906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1908 = _1912;
    }
    float _1914 = _1908;
    float _1916 = _1914;
    if (_1836)
    {
        float _1918 = _1890 + (-1.0);
        _1910 = _1918;
    }
    float _1920 = _1910;
    float _1922 = _1920;
    if (_1836)
    {
        float _1924 = _1858 * _1914;
        _1732 = _1924;
    }
    float _1926 = _1732;
    if (!_1836)
    {
        _1916 = _1826;
    }
    float _1928 = _1916;
    float _1930 = sqrt(_1818);
    float _1932 = _1928;
    if (_1836)
    {
        float _1934 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1884 = _1934;
    }
    float _1936 = _1884;
    if (_1836)
    {
        float _1938 = _1824 * _1926;
        _1850 = _1938;
    }
    float _1940 = _1850;
    if (!_1836)
    {
        _1922 = _1828;
    }
    float _1942 = _1922;
    float _1944 = _1942;
    if (_1836)
    {
        float _1946 = _1826 * _1926;
        _1932 = _1946;
    }
    float _1948 = _1932;
    if (_1836)
    {
        float _1950 = fma(_1896, _1890, _1936);
        _1898 = _1950;
    }
    float _1952 = _1898;
    if (_1836)
    {
        float _1954 = _1940 * _1940;
        _1944 = _1954;
    }
    float _1956 = _1944;
    if (_1836)
    {
        float _1958 = _1948 * _1948;
        _1902 = _1958;
    }
    float _1960 = _1902;
    float _1962 = fma(_1952, _1952, _1956);
    float _1964 = _1962 + _1960;
    float _1966 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1970 = fma(_1930, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1968);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1976 = rsqrt(_1964);
    float _1978 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1966);
    float _1980 = -_1972;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1974);
    float _1986 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1988 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1978);
    float _1990 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1992 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1984);
    float _1994 = abs(_1982);
    float _1996 = log2(_1994);
    float _1998 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2000 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1990);
    float _2002 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2004 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2006 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2000);
    float _2008 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2010 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2002);
    float _2012 = _1976 * _1940;
    float _2014 = -_2004;
    float _2016 = fma(_2014, _1986, 1.0);
    float _2018 = _2006 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2022 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2010);
    float _2024 = _1976 * _1952;
    float _2026 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2020);
    float _2030 = _1976 * _1948;
    float _2032 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2034 = -_2026;
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2034);
    float _2038 = _2022 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2040 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2028);
    float _2042 = log2(_2016);
    float _2044 = -_2030;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2036);
    float _2048 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2050 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2040);
    float _2052 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2054 = fma(_2046, -0.5, 0.5);
    float _2056 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2048);
    float _2058 = exp2(_2032);
    float _2060 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2052);
    float _2062 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2056);
    float _2064 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2060);
    float _2066 = 1.0 / _2050;
    float _2068 = fma(_2046, 0.5, 0.5);
    float _2070 = _2024 + 1.0;
    float _2072 = _2042 * 0.693147182464599609375;
    float _2074 = fma(_2068, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2076 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2078 = sqrt(_2054);
    float _2080 = -_2024;
    float _2082 = fma(_2058, _2070, _2080);
    float _2084 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2062);
    float _2086 = fma(_2068, _2074, -0.212114393711090087890625);
    float _2088 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2064);
    float _2090 = fma(_2082, 0.5, 0.5);
    float _2092 = fma(_2068, _2086, 1.570728778839111328125);
    float _2094 = _2084 * _2066;
    float _2096 = _2088 * _2066;
    float _2098 = fma(_2094, 0.5, 0.5);
    float _2100 = fma(_2096, -0.5, 0.5);
    float _2102 = _2078 * 0.636619746685028076171875;
    float3 _5605 = float3(_2098, _2100, _2076);
    float _2104 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5605, float3(0.0), isnan(_5605)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5605, float3(0.0), isnan(_5605)), level(0.0)).x;
    float _2106 = -_2092;
    float _2108 = fma(_2102, _2106, 1.0);
    float3 _5621 = float3(_2098, _2100, _2076);
    float4 _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5621, float3(0.0), isnan(_5621)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5621, float3(0.0), isnan(_5621)), level(0.0)).xyzw;
    float _2113 = _2111.x;
    float _2115 = _2111.y;
    float _2117 = _2111.z;
    float _2119 = _2111.w;
    float2 _5638 = float2(_2108, _2090);
    float3 _2123 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5638, float2(0.0), isnan(_5638)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5638, float2(0.0), isnan(_5638)), level(0.0)).xyz;
    float _2125 = _2123.x;
    float _2127 = _2123.y;
    float _2129 = _2123.z;
    float _2131 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2133 = _2008 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2135 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2133);
    float _2137 = exp2(_2131);
    float _2139 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2135);
    float _2141 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2139);
    float _2143 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = _2141 + _2050;
    out.gl_Position.x = _2084;
    out.gl_Position.y = _2088;
    out.gl_Position.z = _2141;
    out.gl_Position.w = _2050;
    float _2147 = _2145 * 0.5;
    float _2149 = -_2137;
    float _2151 = _2149 + 1.0;
    out.m_45.x = _2143;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2147;
    out.m_67.w = _2050;
    float _2155 = -_2153;
    float _2157 = _2155 + 1.0;
    float _2159 = _2153 * _2104;
    float _2161 = _2119 * _2159;
    float _2163 = _2129 * _2159;
    float _2165 = fma(_2125, _2161, _2113);
    float _2167 = fma(_2127, _2161, _2115);
    float _2169 = _2119 * _2157;
    float _2171 = fma(_2119, _2163, _2117);
    out.m_69.x = _2165;
    out.m_69.y = _2167;
    out.m_69.z = _2171;
    out.m_69.w = _2169;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

