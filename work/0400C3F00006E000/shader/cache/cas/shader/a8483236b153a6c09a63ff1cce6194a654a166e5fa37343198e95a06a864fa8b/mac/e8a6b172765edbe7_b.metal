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
        float _1894 = as_type<float>(_104);
        out.gl_Position.z = _1894;
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
        float _1962 = as_type<float>(_140);
        out.gl_Position.z = _1962;
    }
    if (_134)
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
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _310 = 1.0 / _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _300;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = _292 + _322;
    bool _326 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_292);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = 1.0 / _304;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _292 + _344;
    float _348 = _324 * _310;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = _292 + _350;
    bool _354 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _356 = isnan(_292);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = fma(_340, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _370 = 1.0 / _308;
    float _372 = _346 * _320;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _376 = _292 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _380 = _292 + _378;
    float _382 = -_364;
    float _384 = _382 + 1.0;
    float _386 = 1.0 / _314;
    float _388 = _376 * _342;
    float _390 = 1.0 / _318;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _394 = _292 + _392;
    float _396 = _394 * _370;
    bool _398 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _400 = isnan(_292);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _410;
    float _414 = _352 * _386;
    bool _416 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _418 = isnan(_292);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -_408;
    float _430 = _428 + 1.0;
    float _432 = fma(_412, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _434 = -_426;
    float _436 = _434 + 1.0;
    float _438 = _364 * _430;
    float _440 = _380 * _390;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _442;
    float _446 = _336 * _436;
    bool _448 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _450 = isnan(_292);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -_336;
    float _462 = _460 + 1.0;
    float _464 = fma(_444, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _466 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _468 = isnan(_292);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = _426 * _384;
    bool _480 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _482 = isnan(_292);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = _476 * _462;
    float _506 = -_490;
    float _508 = _506 + 1.0;
    float _510 = -_476;
    float _512 = _510 + 1.0;
    float _514 = fma(_498, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _516 = _458 * _508;
    float _518 = -_458;
    float _520 = _518 + 1.0;
    float _522 = fma(_494, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _524 = fma(_502, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _464 * _516;
    float _528 = _432 * _516;
    float _530 = _366 * _516;
    float _532 = _490 * _512;
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
    float _554 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].x, _526);
    float _556 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].y, _528);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _558;
    float _562 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _564 = fma(_544, _440, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _566 = fma(_548, _440, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _568 = fma(_552, _440, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _570 = fma(_536, _414, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _572 = fma(_560, _414, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _574 = fma(_514, _532, _554);
    float _576 = fma(_522, _532, _556);
    float _578 = fma(_524, _532, _562);
    float _580 = fma(_540, _414, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_570, _504, _574);
    float _584 = fma(_572, _504, _578);
    float _586 = fma(_580, _504, _576);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _596;
    float _600 = fma(_564, _446, _582);
    float _602 = fma(_568, _446, _584);
    float _604 = fma(_590, _388, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _606 = fma(_594, _388, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _608 = fma(_566, _446, _586);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _618 = fma(_598, _388, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _624 = fma(_604, _478, _600);
    float _626 = fma(_612, _396, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _628 = fma(_616, _396, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _630 = fma(_606, _478, _608);
    float _632 = fma(_622, _396, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _634 = fma(_618, _478, _602);
    float _636 = fma(_626, _438, _624);
    float _638 = fma(_628, _438, _630);
    float _640 = fma(_632, _438, _634);
    float _642 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[149].x, _636);
    float _644 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[149].y, _638);
    float _646 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[149].z, _640);
    bool _648 = !_368;
    float _666;
    if (!_648)
    {
        float _650 = in.m_51.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
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
    float _678 = in.m_51.w;
    float _680 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _682 = in.m_53.x;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _686 = _684 != 0;
    float _688 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _680);
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _692 = _690 != 0;
    float _694 = in.m_51.x;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _698 = _696 != 0;
    float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _704 = _702 != 0;
    float _706 = in.m_53.y;
    float _708 = in.m_51.y;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _712 = _710 != 0;
    float _714 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _716 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _718 = in.m_53.z;
    float _720 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _714);
    float _722 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _716);
    bool _724 = _678 > 0.5;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _730 = in.m_55.y;
    float _732 = 1.0 / _728;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _738 = in.m_55.x;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _748 = _602;
    float _750 = _722;
    bool _752 = _724;
    if (_692)
    {
        float _754 = in.m_51.z;
        _748 = _754;
    }
    float _756 = _748;
    float _758 = 1.0 / _736;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _760;
    out.m_57.x = _682;
    float _764 = _700 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_57.y = _706;
    float _766 = 1.0 / _742;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _768;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _774 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_57.z = _718;
    float _776 = -_730;
    float _778 = _776 + 1.0;
    float _780 = _708 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _782 = -_746;
    float _784 = fma(_774, 2.0, _782);
    float _786 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _688);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _792 = _688;
    float _794 = _766;
    float _796 = _730;
    if (!_712)
    {
        float _798 = in.m_51.z;
        _792 = _798;
    }
    float _800 = _792;
    float _802 = fma(_780, -2.0, _744);
    float _804 = _770 * _758;
    float _806 = _790 * _732;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _810 = _676 + _808;
    float _812 = _762 * _766;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _816 = _676 + _814;
    int _818 = _724 ? as_type<int>(_778) : as_type<int>(_730);
    float _820 = fma(_804, _810, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _822 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _824 = isnan(_676);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _836 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _720);
    float _838 = fma(_812, _816, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _840 = _698 ? as_type<float>(_818) : _730;
    float _842 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _722);
    bool _844 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _846 = isnan(_676);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _858 = _676 + _856;
    bool _860 = _708 > 0.5;
    float _862 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].z, _834);
    float _864 = _812;
    if (!_712)
    {
        _750 = _708;
    }
    float _866 = _750;
    float _868 = fma(_806, _858, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _870 = _866;
    if (_686)
    {
        bool _872 = _694 > 0.5;
        _752 = _872;
    }
    bool _874 = _752;
    float _876 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[78].w, _772);
    if (_712)
    {
        _870 = _694;
    }
    float _878 = _870;
    float _880 = -_832;
    float _882 = _880 + 1.0;
    int _884 = as_type<int>(_878);
    if (!_686)
    {
        _794 = _738;
    }
    float _886 = _794;
    float _888 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _802);
    bool _890 = false;
    float _892 = _886;
    if (_692)
    {
        bool _894 = _756 > 0.5;
        _890 = _894;
    }
    bool _896 = _890;
    float _898 = _854 * _882;
    if (_704)
    {
        float _900 = _860 ? _778 : _730;
        _796 = _900;
    }
    float _902 = _796;
    float _904 = -_854;
    float _906 = _904 + 1.0;
    bool _908 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = isnan(_676);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _786 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _922 = _918;
    if (!_686)
    {
        _864 = _886;
    }
    float _924 = _864;
    float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _928 = _924;
    if (_686)
    {
        _892 = _738;
    }
    float _930 = _892;
    float _932 = -_918;
    float _934 = _932 + 1.0;
    bool _936 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _938 = isnan(_676);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _918 * _906;
    float _950 = _800;
    float _952 = _930;
    if (!_712)
    {
        _922 = _800;
    }
    float _954 = _922;
    float _956 = -_122;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[76].x, _784);
    float _960 = _954;
    if (_712)
    {
        _960 = _708;
    }
    float _962 = _960;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_712)
    {
        _950 = _708;
    }
    float _966 = _950;
    float _968 = fma(_840, _764, -0.5);
    float _970 = _946 * _934;
    float _972 = _962 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _976 = _820 * _970;
    float _978 = -_946;
    float _980 = _978 + 1.0;
    float _982 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[83].z, _974);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _988 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[115].x, _976);
    float _990 = _964 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _994 = _878 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _996 = _992;
    if (_686)
    {
        float _998 = -_930;
        float _1000 = _998 + 1.0;
        _884 = as_type<int>(_1000);
    }
    int _1002 = _884;
    float _1004 = fma(_990, _902, -0.5);
    float _1006 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[83].w, _992);
    float _1008 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _876);
    int _1010 = _1002;
    if (_686)
    {
        float _1012 = _874 ? as_type<float>(_1002) : _930;
        _928 = _1012;
    }
    float _1014 = _928;
    if (_692)
    {
        float _1016 = -_930;
        float _1018 = _1016 + 1.0;
        _1010 = as_type<int>(_1018);
    }
    int _1020 = _1010;
    float _1022 = -_984;
    float _1024 = fma(_994, 2.0, _1022);
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1028 = fma(_868, _948, _988);
    float _1030 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1006);
    if (_692)
    {
        float _1032 = _896 ? as_type<float>(_1020) : _930;
        _952 = _1032;
    }
    float _1034 = _952;
    float _1036 = fma(_972, -2.0, _1026);
    float _1038 = -_888;
    float _1040 = fma(_1008, _1004, _1038);
    float _1042 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1044 = _836 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = _920 + _1046;
    float _1050 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _862);
    float _1052 = fma(_1042, _1034, -0.5);
    float _1054 = _842 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1058 = _1044 + _1056;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1062 = fma(_838, _898, _1028);
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1054 + _1064;
    float _1068 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _982);
    float _1070 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1060);
    float _1072 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1062);
    float _1074 = -_122;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1024);
    float _1078 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1036);
    float _1080 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1070);
    float _1082 = _1048 * _1048;
    float _1084 = in.m_53.w;
    float _1086 = _926 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1088 = fma(_1068, _1052, _1076);
    bool _1090 = _1080 >= 0.0;
    float _1092 = fma(_1058, _1058, _1082);
    float _1094 = fma(_1086, _1014, -0.5);
    float _1096 = -_1078;
    float _1098 = fma(_1030, _968, _1096);
    float _1100 = fma(_1066, _1066, _1092);
    float _1102 = fma(_1050, _1094, _958);
    float _1104 = rsqrt(_1100);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1114 = as_type<int>(_1088);
    int _1116 = as_type<int>(_1072);
    if (_1090)
    {
        _996 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1118 = _996;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1124 = _1102 + 0.5;
    float _1126 = _1088 + 0.5;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1130 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1142 = _1040 + 0.5;
    float _1144 = _1098 + 0.5;
    float _1146 = _1072 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1090)
    {
        float _1148 = _1118 * 5.0;
        _1114 = as_type<int>(_1148);
    }
    int _1150 = _1114;
    out.m_57.w = _1084;
    float _1152 = _1048 * _1104;
    float _1154 = _1058 * _1104;
    out.m_59.x = _1136;
    out.m_59.y = _1138;
    out.m_59.z = _1140;
    out.m_59.w = _1128;
    out.m_61.x = _1124;
    out.m_61.y = _1142;
    out.m_61.z = _1126;
    out.m_61.w = _1144;
    out.m_63.x = _1130;
    out.m_63.y = _1132;
    out.m_63.z = _1134;
    out.m_63.w = _1146;
    if (_1090)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3696 = as_type<float>(_1150);
        out.gl_Position.z = _3696;
    }
    if (_1090)
    {
        out.m_45.x = 0.0;
    }
    if (_1090)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1156 = -_1152;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _920);
    float _1160 = _1066 * _1104;
    float _1162 = -_1154;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1168 = _1158 + _1166;
    float _1170 = -_1160;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1176 = _1164 + _1174;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _1172 + _1180;
    float _1184 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1178);
    float _1186 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1184);
    bool _1188 = _1186 >= 0.0;
    float _1190 = _1176;
    if (_1188)
    {
        _1190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1192 = _1190;
    if (_1188)
    {
        out.m_45.x = 0.0;
    }
    if (_1188)
    {
        float _1194 = _1192 * 5.0;
        _1116 = as_type<int>(_1194);
    }
    int _1196 = _1116;
    if (_1188)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3789 = as_type<float>(_1196);
        out.gl_Position.z = _3789;
    }
    if (_1188)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1198 = -_920;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = -_1044;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = -_1054;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = -_1152;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1214 = _1200 * _1200;
    float _1216 = -_1154;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    float _1220 = -_1160;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1066);
    float _1224 = _1212 * _1212;
    float _1226 = fma(_1204, _1204, _1214);
    float _1228 = fma(_1218, _1218, _1224);
    float _1230 = fma(_1208, _1208, _1226);
    float _1232 = in.m_49.x;
    float _1234 = in.m_49.y;
    float _1236 = in.m_49.z;
    float _1238 = fma(_1222, _1222, _1228);
    float _1240 = rsqrt(_1230);
    float _1242 = sqrt(_1238);
    float _1244 = _1204 * _1240;
    float _1246 = _1208 * _1240;
    float _1248 = _1200 * _1240;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1252 = _1244 * _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1256 = _1246 * _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1260 = _1248 * _1258;
    float _1262 = _644 * _1234;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1266 = -_1252;
    float _1268 = fma(_1246, _1264, _1266);
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1272 = -_1256;
    float _1274 = fma(_1248, _1270, _1272);
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1278 = -_1260;
    float _1280 = fma(_1244, _1276, _1278);
    float _1282 = in.m_65.x;
    float _1284 = in.m_65.y;
    float _1286 = in.m_65.z;
    float _1288 = _1268 * _1268;
    float _1290 = _646 * _1236;
    float _1292 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1294 = _642 * _1232;
    float _1296 = fma(_1274, _1274, _1288);
    float _1298 = _1104 * _1242;
    float _1300 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1302 = fma(_1280, _1280, _1296);
    float _1304 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1306 = _1298 * _1292;
    float _1308 = _1298 * _1300;
    float _1310 = _1298 * _1304;
    float _1312 = rsqrt(_1302);
    float _1314 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1284);
    float _1316 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1282);
    float _1318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1286);
    float _1320 = _1306 * _1314;
    float _1322 = _1310 * _1316;
    float _1324 = _1308 * _1318;
    float _1326 = _1274 * _1312;
    float _1328 = _1268 * _1312;
    float _1330 = _1280 * _1312;
    float _1332 = _1248 * _1326;
    float _1334 = _1246 * _1328;
    float _1336 = -_1332;
    float _1338 = fma(_1244, _1328, _1336);
    float _1340 = -_1334;
    float _1342 = fma(_1248, _1330, _1340);
    float _1344 = _1320 * _1338;
    float _1346 = _1320 * _1342;
    float _1348 = fma(_1322, _1330, _1344);
    float _1350 = fma(_1322, _1326, _1346);
    float _1352 = fma(_1324, _1246, _1348);
    float _1354 = fma(_1324, _1244, _1350);
    float _1356 = _1244 * _1330;
    float _1358 = _1054 + _1352;
    float _1360 = _1044 + _1354;
    float _1362 = -_1356;
    float _1364 = fma(_1246, _1326, _1362);
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1368 = _1358 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1372 = _1360 + _1370;
    float _1374 = _1320 * _1364;
    float _1376 = _1368 * _1368;
    float _1378 = fma(_1322, _1328, _1374);
    float _1380 = fma(_1372, _1372, _1376);
    float _1382 = fma(_1324, _1248, _1378);
    float _1384 = sqrt(_1380);
    float _1386 = _920 + _1382;
    bool _1388 = _1384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1390 = _1376;
    float _1392 = _1328;
    float _1394 = _1378;
    float _1396 = _1386;
    float _1398 = _1248;
    if (!_1388)
    {
        _1390 = _1360;
    }
    float _1400 = _1390;
    float _1402 = _1400;
    if (!_1388)
    {
        _1392 = _1358;
    }
    float _1404 = _1392;
    float _1406 = _1404;
    if (!_1388)
    {
        _1394 = _1386;
    }
    float _1408 = _1394;
    bool _1410 = !_1388;
    float _1412 = _1408;
    if (!_1410)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1418 = _1384 + _1416;
        float _1420 = rsqrt(_1380);
        float _1422 = _1418 * _1414;
        float _1424 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = _1422 * 0.15915493667125701904296875;
        float _1428 = _1426 * 6.283185482025146484375;
        float _1430 = sin(_1428);
        float _1432 = _1426 * 6.283185482025146484375;
        float _1434 = cos(_1432);
        float _1436 = fma(_1430, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1438 = _1420 * _1436;
        float _1440 = _1434 + (-1.0);
        float _1442 = fma(_1372, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1444 = fma(_1368, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1446 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = fma(_1386, _1434, _1446);
        _1412 = _1448;
        _1402 = _1442;
        _1406 = _1444;
    }
    float _1450 = _1412;
    float _1452 = _1402;
    float _1454 = _1406;
    float _1456 = -_1152;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1450);
    float _1460 = -_1154;
    float _1462 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1452);
    float _1464 = -_1160;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1454);
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1470 = _1458 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1462 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1478 = _1466 + _1476;
    float _1480 = _1470 * _1470;
    float _1482 = fma(_1474, _1474, _1480);
    float _1484 = fma(_1478, _1478, _1482);
    float _1486 = rsqrt(_1484);
    float _1488 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1490 = _1474 * _1488;
    float _1492 = _1478 * _1488;
    float _1494 = _1490 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 + _1496;
    float _1500 = sqrt(_1498);
    bool _1502 = _1500 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _1500 + _1504;
    float _1508 = _1478;
    float _1510 = _1498;
    float _1512 = _1506;
    float _1514 = _1470;
    float _1516 = _1490;
    if (_1502)
    {
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1508 = _1518;
    }
    float _1520 = _1508;
    if (_1502)
    {
        float _1522 = rsqrt(_1498);
        _1510 = _1522;
    }
    float _1524 = _1510;
    if (_1502)
    {
        float _1526 = _1506 * _1520;
        _1512 = _1526;
    }
    float _1528 = _1512;
    if (_1502)
    {
        float _1530 = _1528 * 0.15915493667125701904296875;
        _1396 = _1530;
    }
    float _1532 = _1396;
    float _1534 = _1480;
    if (_1502)
    {
        float _1536 = _1532 * 6.283185482025146484375;
        float _1538 = sin(_1536);
        _1534 = _1538;
    }
    float _1540 = _1534;
    float _1542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1544 = precise::max(0.0, _1542);
    float _1546 = _1486;
    float _1548 = _1542;
    float _1550 = _1544;
    if (_1502)
    {
        float _1552 = _1532 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        _1546 = _1554;
    }
    float _1556 = _1546;
    float _1558 = -_1488;
    float _1560 = -_1544;
    float _1562 = fma(_1470, _1558, _1560);
    float _1564 = _1562;
    if (!_1502)
    {
        _1514 = _1496;
    }
    float _1566 = _1514;
    float _1568 = _1566;
    if (_1502)
    {
        float _1570 = _1562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1570;
    }
    float _1572 = _1548;
    float _1574 = sqrt(_1484);
    float _1576 = _1540;
    float _1578 = _1572;
    if (_1502)
    {
        float _1580 = fma(_1540, _1572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1576 = _1580;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (_1502)
    {
        float _1586 = _1556 + (-1.0);
        _1578 = _1586;
    }
    float _1588 = _1578;
    float _1590 = _1588;
    if (_1502)
    {
        float _1592 = _1524 * _1582;
        _1398 = _1592;
    }
    float _1594 = _1398;
    if (!_1502)
    {
        _1584 = _1492;
    }
    float _1596 = _1584;
    float _1598 = _1596;
    if (_1502)
    {
        float _1600 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1600;
    }
    float _1602 = _1550;
    if (_1502)
    {
        float _1604 = _1490 * _1594;
        _1516 = _1604;
    }
    float _1606 = _1516;
    if (!_1502)
    {
        _1590 = _1494;
    }
    float _1608 = _1590;
    float _1610 = _1608;
    if (_1502)
    {
        float _1612 = _1492 * _1594;
        _1598 = _1612;
    }
    float _1614 = _1598;
    if (_1502)
    {
        float _1616 = fma(_1562, _1556, _1602);
        _1564 = _1616;
    }
    float _1618 = _1564;
    if (_1502)
    {
        float _1620 = _1606 * _1606;
        _1610 = _1620;
    }
    float _1622 = _1610;
    if (_1502)
    {
        float _1624 = _1614 * _1614;
        _1568 = _1624;
    }
    float _1626 = _1568;
    float _1628 = fma(_1618, _1618, _1622);
    float _1630 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1640 = _1628 + _1626;
    float _1642 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1630);
    float _1644 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1646 = -_1636;
    float _1648 = _1646 + 1.0;
    float _1650 = rsqrt(_1640);
    float _1652 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1642);
    float _1654 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1644);
    float _1656 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1660 = _1652 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1662 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1638);
    float _1664 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1654);
    float _1666 = abs(_1648);
    float _1668 = log2(_1666);
    float _1670 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1656);
    float _1674 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1662);
    float _1676 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1678 = -_1670;
    float _1680 = fma(_1678, _1658, 1.0);
    float _1682 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1672);
    float _1684 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1686 = _1650 * _1606;
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1690 = _1650 * _1618;
    float _1692 = _1650 * _1614;
    float _1694 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1696 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1688);
    float _1698 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1700 = log2(_1680);
    float _1702 = -_1694;
    float _1704 = fma(_1690, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1696);
    float _1708 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1710 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1712 = -_1692;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1716 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1706);
    float _1718 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1720 = exp2(_1708);
    float _1722 = fma(_1714, -0.5, 0.5);
    float _1724 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1710);
    float _1726 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1718);
    float _1728 = fma(_1714, 0.5, 0.5);
    float _1730 = _1690 + 1.0;
    float _1732 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1724);
    float _1734 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1726);
    float _1736 = 1.0 / _1716;
    float _1738 = fma(_1728, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1740 = _1700 * 0.693147182464599609375;
    float _1742 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1734);
    float _1744 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1732);
    float _1746 = fma(_1728, _1738, -0.212114393711090087890625);
    float _1748 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1750 = sqrt(_1722);
    float _1752 = -_1690;
    float _1754 = fma(_1720, _1730, _1752);
    float _1756 = fma(_1728, _1746, 1.570728778839111328125);
    float _1758 = fma(_1754, 0.5, 0.5);
    float _1760 = _1742 * _1736;
    float _1762 = _1744 * _1736;
    float _1764 = fma(_1760, 0.5, 0.5);
    float _1766 = fma(_1762, -0.5, 0.5);
    float _1768 = _1750 * 0.636619746685028076171875;
    float _1770 = -_1756;
    float _1772 = fma(_1768, _1770, 1.0);
    float3 _4723 = float3(_1764, _1766, _1748);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4723, float3(0.0), isnan(_4723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4723, float3(0.0), isnan(_4723)), level(0.0)).x;
    float3 _4734 = float3(_1764, _1766, _1748);
    float4 _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4734, float3(0.0), isnan(_4734)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4734, float3(0.0), isnan(_4734)), level(0.0)).xyzw;
    float _1779 = _1777.x;
    float _1781 = _1777.y;
    float _1783 = _1777.z;
    float _1785 = _1777.w;
    float2 _4751 = float2(_1772, _1758);
    float3 _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4751, float2(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4751, float2(0.0), isnan(_4751)), level(0.0)).xyz;
    float _1791 = _1789.x;
    float _1793 = _1789.y;
    float _1795 = _1789.z;
    float _1797 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1799 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1801 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1799);
    float _1803 = exp2(_1797);
    float _1805 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1801);
    float _1807 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1805);
    float _1809 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1811 = _1807 + _1716;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1744;
    out.gl_Position.z = _1807;
    out.gl_Position.w = _1716;
    float _1813 = _1811 * 0.5;
    float _1815 = -_1803;
    float _1817 = _1815 + 1.0;
    out.m_45.x = _1809;
    float _1819 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1813;
    out.m_67.w = _1716;
    float _1821 = -_1819;
    float _1823 = _1821 + 1.0;
    float _1825 = _1819 * _1774;
    float _1827 = _1785 * _1825;
    float _1829 = _1795 * _1825;
    float _1831 = _1785 * _1823;
    float _1833 = fma(_1791, _1827, _1779);
    float _1835 = fma(_1793, _1827, _1781);
    float _1837 = fma(_1785, _1829, _1783);
    out.m_69.x = _1833;
    out.m_69.y = _1835;
    out.m_69.z = _1837;
    out.m_69.w = _1831;
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
        float _1894 = as_type<float>(_104);
        out.gl_Position.z = _1894;
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
        float _1962 = as_type<float>(_140);
        out.gl_Position.z = _1962;
    }
    if (_134)
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
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _310 = 1.0 / _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _300;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = _292 + _322;
    bool _326 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_292);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = 1.0 / _304;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _292 + _344;
    float _348 = _324 * _310;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = _292 + _350;
    bool _354 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _356 = isnan(_292);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = fma(_340, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _370 = 1.0 / _308;
    float _372 = _346 * _320;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _376 = _292 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _380 = _292 + _378;
    float _382 = -_364;
    float _384 = _382 + 1.0;
    float _386 = 1.0 / _314;
    float _388 = _376 * _342;
    float _390 = 1.0 / _318;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _394 = _292 + _392;
    float _396 = _394 * _370;
    bool _398 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _400 = isnan(_292);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _410;
    float _414 = _352 * _386;
    bool _416 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _418 = isnan(_292);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -_408;
    float _430 = _428 + 1.0;
    float _432 = fma(_412, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _434 = -_426;
    float _436 = _434 + 1.0;
    float _438 = _364 * _430;
    float _440 = _380 * _390;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _442;
    float _446 = _336 * _436;
    bool _448 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _450 = isnan(_292);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -_336;
    float _462 = _460 + 1.0;
    float _464 = fma(_444, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _466 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _468 = isnan(_292);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = _426 * _384;
    bool _480 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _482 = isnan(_292);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = _476 * _462;
    float _506 = -_490;
    float _508 = _506 + 1.0;
    float _510 = -_476;
    float _512 = _510 + 1.0;
    float _514 = fma(_498, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _516 = _458 * _508;
    float _518 = -_458;
    float _520 = _518 + 1.0;
    float _522 = fma(_494, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _524 = fma(_502, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _464 * _516;
    float _528 = _432 * _516;
    float _530 = _366 * _516;
    float _532 = _490 * _512;
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
    float _554 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].x, _526);
    float _556 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].y, _528);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _558;
    float _562 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _564 = fma(_544, _440, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _566 = fma(_548, _440, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _568 = fma(_552, _440, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _570 = fma(_536, _414, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _572 = fma(_560, _414, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _574 = fma(_514, _532, _554);
    float _576 = fma(_522, _532, _556);
    float _578 = fma(_524, _532, _562);
    float _580 = fma(_540, _414, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_570, _504, _574);
    float _584 = fma(_572, _504, _578);
    float _586 = fma(_580, _504, _576);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _596;
    float _600 = fma(_564, _446, _582);
    float _602 = fma(_568, _446, _584);
    float _604 = fma(_590, _388, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _606 = fma(_594, _388, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _608 = fma(_566, _446, _586);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _618 = fma(_598, _388, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _624 = fma(_604, _478, _600);
    float _626 = fma(_612, _396, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _628 = fma(_616, _396, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _630 = fma(_606, _478, _608);
    float _632 = fma(_622, _396, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _634 = fma(_618, _478, _602);
    float _636 = fma(_626, _438, _624);
    float _638 = fma(_628, _438, _630);
    float _640 = fma(_632, _438, _634);
    float _642 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[149].x, _636);
    float _644 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[149].y, _638);
    float _646 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[149].z, _640);
    bool _648 = !_368;
    float _666;
    if (!_648)
    {
        float _650 = in.m_51.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
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
    float _678 = in.m_51.w;
    float _680 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _682 = in.m_53.x;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _686 = _684 != 0;
    float _688 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _680);
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _692 = _690 != 0;
    float _694 = in.m_51.x;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _698 = _696 != 0;
    float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _704 = _702 != 0;
    float _706 = in.m_53.y;
    float _708 = in.m_51.y;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _712 = _710 != 0;
    float _714 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _716 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _718 = in.m_53.z;
    float _720 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _714);
    float _722 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _716);
    bool _724 = _678 > 0.5;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _730 = in.m_55.y;
    float _732 = 1.0 / _728;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _738 = in.m_55.x;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _748 = _602;
    float _750 = _722;
    bool _752 = _724;
    if (_692)
    {
        float _754 = in.m_51.z;
        _748 = _754;
    }
    float _756 = _748;
    float _758 = 1.0 / _736;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _760;
    out.m_57.x = _682;
    float _764 = _700 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_57.y = _706;
    float _766 = 1.0 / _742;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _768;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _774 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_57.z = _718;
    float _776 = -_730;
    float _778 = _776 + 1.0;
    float _780 = _708 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _782 = -_746;
    float _784 = fma(_774, 2.0, _782);
    float _786 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _688);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _792 = _688;
    float _794 = _766;
    float _796 = _730;
    if (!_712)
    {
        float _798 = in.m_51.z;
        _792 = _798;
    }
    float _800 = _792;
    float _802 = fma(_780, -2.0, _744);
    float _804 = _770 * _758;
    float _806 = _790 * _732;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _810 = _676 + _808;
    float _812 = _762 * _766;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _816 = _676 + _814;
    int _818 = _724 ? as_type<int>(_778) : as_type<int>(_730);
    float _820 = fma(_804, _810, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _822 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _824 = isnan(_676);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _836 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _720);
    float _838 = fma(_812, _816, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _840 = _698 ? as_type<float>(_818) : _730;
    float _842 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _722);
    bool _844 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _846 = isnan(_676);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _858 = _676 + _856;
    bool _860 = _708 > 0.5;
    float _862 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].z, _834);
    float _864 = _812;
    if (!_712)
    {
        _750 = _708;
    }
    float _866 = _750;
    float _868 = fma(_806, _858, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _870 = _866;
    if (_686)
    {
        bool _872 = _694 > 0.5;
        _752 = _872;
    }
    bool _874 = _752;
    float _876 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[78].w, _772);
    if (_712)
    {
        _870 = _694;
    }
    float _878 = _870;
    float _880 = -_832;
    float _882 = _880 + 1.0;
    int _884 = as_type<int>(_878);
    if (!_686)
    {
        _794 = _738;
    }
    float _886 = _794;
    float _888 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _802);
    bool _890 = false;
    float _892 = _886;
    if (_692)
    {
        bool _894 = _756 > 0.5;
        _890 = _894;
    }
    bool _896 = _890;
    float _898 = _854 * _882;
    if (_704)
    {
        float _900 = _860 ? _778 : _730;
        _796 = _900;
    }
    float _902 = _796;
    float _904 = -_854;
    float _906 = _904 + 1.0;
    bool _908 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = isnan(_676);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _786 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _922 = _918;
    if (!_686)
    {
        _864 = _886;
    }
    float _924 = _864;
    float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _928 = _924;
    if (_686)
    {
        _892 = _738;
    }
    float _930 = _892;
    float _932 = -_918;
    float _934 = _932 + 1.0;
    bool _936 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _938 = isnan(_676);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _918 * _906;
    float _950 = _800;
    float _952 = _930;
    if (!_712)
    {
        _922 = _800;
    }
    float _954 = _922;
    float _956 = -_122;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[76].x, _784);
    float _960 = _954;
    if (_712)
    {
        _960 = _708;
    }
    float _962 = _960;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_712)
    {
        _950 = _708;
    }
    float _966 = _950;
    float _968 = fma(_840, _764, -0.5);
    float _970 = _946 * _934;
    float _972 = _962 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _976 = _820 * _970;
    float _978 = -_946;
    float _980 = _978 + 1.0;
    float _982 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[83].z, _974);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _988 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[115].x, _976);
    float _990 = _964 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _994 = _878 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _996 = _992;
    if (_686)
    {
        float _998 = -_930;
        float _1000 = _998 + 1.0;
        _884 = as_type<int>(_1000);
    }
    int _1002 = _884;
    float _1004 = fma(_990, _902, -0.5);
    float _1006 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[83].w, _992);
    float _1008 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _876);
    int _1010 = _1002;
    if (_686)
    {
        float _1012 = _874 ? as_type<float>(_1002) : _930;
        _928 = _1012;
    }
    float _1014 = _928;
    if (_692)
    {
        float _1016 = -_930;
        float _1018 = _1016 + 1.0;
        _1010 = as_type<int>(_1018);
    }
    int _1020 = _1010;
    float _1022 = -_984;
    float _1024 = fma(_994, 2.0, _1022);
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1028 = fma(_868, _948, _988);
    float _1030 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1006);
    if (_692)
    {
        float _1032 = _896 ? as_type<float>(_1020) : _930;
        _952 = _1032;
    }
    float _1034 = _952;
    float _1036 = fma(_972, -2.0, _1026);
    float _1038 = -_888;
    float _1040 = fma(_1008, _1004, _1038);
    float _1042 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1044 = _836 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = _920 + _1046;
    float _1050 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _862);
    float _1052 = fma(_1042, _1034, -0.5);
    float _1054 = _842 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1058 = _1044 + _1056;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1062 = fma(_838, _898, _1028);
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1054 + _1064;
    float _1068 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _982);
    float _1070 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1060);
    float _1072 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1062);
    float _1074 = -_122;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1024);
    float _1078 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1036);
    float _1080 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1070);
    float _1082 = _1048 * _1048;
    float _1084 = in.m_53.w;
    float _1086 = _926 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1088 = fma(_1068, _1052, _1076);
    bool _1090 = _1080 >= 0.0;
    float _1092 = fma(_1058, _1058, _1082);
    float _1094 = fma(_1086, _1014, -0.5);
    float _1096 = -_1078;
    float _1098 = fma(_1030, _968, _1096);
    float _1100 = fma(_1066, _1066, _1092);
    float _1102 = fma(_1050, _1094, _958);
    float _1104 = rsqrt(_1100);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1114 = as_type<int>(_1088);
    int _1116 = as_type<int>(_1072);
    if (_1090)
    {
        _996 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1118 = _996;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1124 = _1102 + 0.5;
    float _1126 = _1088 + 0.5;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1130 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1142 = _1040 + 0.5;
    float _1144 = _1098 + 0.5;
    float _1146 = _1072 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1090)
    {
        float _1148 = _1118 * 5.0;
        _1114 = as_type<int>(_1148);
    }
    int _1150 = _1114;
    out.m_57.w = _1084;
    float _1152 = _1048 * _1104;
    float _1154 = _1058 * _1104;
    out.m_59.x = _1136;
    out.m_59.y = _1138;
    out.m_59.z = _1140;
    out.m_59.w = _1128;
    out.m_61.x = _1124;
    out.m_61.y = _1142;
    out.m_61.z = _1126;
    out.m_61.w = _1144;
    out.m_63.x = _1130;
    out.m_63.y = _1132;
    out.m_63.z = _1134;
    out.m_63.w = _1146;
    if (_1090)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3696 = as_type<float>(_1150);
        out.gl_Position.z = _3696;
    }
    if (_1090)
    {
        out.m_45.x = 0.0;
    }
    if (_1090)
    {
        return out;
    }
    float _1156 = -_1152;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _920);
    float _1160 = _1066 * _1104;
    float _1162 = -_1154;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1168 = _1158 + _1166;
    float _1170 = -_1160;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1176 = _1164 + _1174;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _1172 + _1180;
    float _1184 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1178);
    float _1186 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1184);
    bool _1188 = _1186 >= 0.0;
    float _1190 = _1176;
    if (_1188)
    {
        _1190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1192 = _1190;
    if (_1188)
    {
        out.m_45.x = 0.0;
    }
    if (_1188)
    {
        float _1194 = _1192 * 5.0;
        _1116 = as_type<int>(_1194);
    }
    int _1196 = _1116;
    if (_1188)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3789 = as_type<float>(_1196);
        out.gl_Position.z = _3789;
    }
    if (_1188)
    {
        return out;
    }
    float _1198 = -_920;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = -_1044;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = -_1054;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = -_1152;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1214 = _1200 * _1200;
    float _1216 = -_1154;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    float _1220 = -_1160;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1066);
    float _1224 = _1212 * _1212;
    float _1226 = fma(_1204, _1204, _1214);
    float _1228 = fma(_1218, _1218, _1224);
    float _1230 = fma(_1208, _1208, _1226);
    float _1232 = in.m_49.x;
    float _1234 = in.m_49.y;
    float _1236 = in.m_49.z;
    float _1238 = fma(_1222, _1222, _1228);
    float _1240 = rsqrt(_1230);
    float _1242 = sqrt(_1238);
    float _1244 = _1204 * _1240;
    float _1246 = _1208 * _1240;
    float _1248 = _1200 * _1240;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1252 = _1244 * _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1256 = _1246 * _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1260 = _1248 * _1258;
    float _1262 = _644 * _1234;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1266 = -_1252;
    float _1268 = fma(_1246, _1264, _1266);
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1272 = -_1256;
    float _1274 = fma(_1248, _1270, _1272);
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1278 = -_1260;
    float _1280 = fma(_1244, _1276, _1278);
    float _1282 = in.m_65.x;
    float _1284 = in.m_65.y;
    float _1286 = in.m_65.z;
    float _1288 = _1268 * _1268;
    float _1290 = _646 * _1236;
    float _1292 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1294 = _642 * _1232;
    float _1296 = fma(_1274, _1274, _1288);
    float _1298 = _1104 * _1242;
    float _1300 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1302 = fma(_1280, _1280, _1296);
    float _1304 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1306 = _1298 * _1292;
    float _1308 = _1298 * _1300;
    float _1310 = _1298 * _1304;
    float _1312 = rsqrt(_1302);
    float _1314 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1284);
    float _1316 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1282);
    float _1318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1286);
    float _1320 = _1306 * _1314;
    float _1322 = _1310 * _1316;
    float _1324 = _1308 * _1318;
    float _1326 = _1274 * _1312;
    float _1328 = _1268 * _1312;
    float _1330 = _1280 * _1312;
    float _1332 = _1248 * _1326;
    float _1334 = _1246 * _1328;
    float _1336 = -_1332;
    float _1338 = fma(_1244, _1328, _1336);
    float _1340 = -_1334;
    float _1342 = fma(_1248, _1330, _1340);
    float _1344 = _1320 * _1338;
    float _1346 = _1320 * _1342;
    float _1348 = fma(_1322, _1330, _1344);
    float _1350 = fma(_1322, _1326, _1346);
    float _1352 = fma(_1324, _1246, _1348);
    float _1354 = fma(_1324, _1244, _1350);
    float _1356 = _1244 * _1330;
    float _1358 = _1054 + _1352;
    float _1360 = _1044 + _1354;
    float _1362 = -_1356;
    float _1364 = fma(_1246, _1326, _1362);
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1368 = _1358 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1372 = _1360 + _1370;
    float _1374 = _1320 * _1364;
    float _1376 = _1368 * _1368;
    float _1378 = fma(_1322, _1328, _1374);
    float _1380 = fma(_1372, _1372, _1376);
    float _1382 = fma(_1324, _1248, _1378);
    float _1384 = sqrt(_1380);
    float _1386 = _920 + _1382;
    bool _1388 = _1384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1390 = _1376;
    float _1392 = _1328;
    float _1394 = _1378;
    float _1396 = _1386;
    float _1398 = _1248;
    if (!_1388)
    {
        _1390 = _1360;
    }
    float _1400 = _1390;
    float _1402 = _1400;
    if (!_1388)
    {
        _1392 = _1358;
    }
    float _1404 = _1392;
    float _1406 = _1404;
    if (!_1388)
    {
        _1394 = _1386;
    }
    float _1408 = _1394;
    bool _1410 = !_1388;
    float _1412 = _1408;
    if (!_1410)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1418 = _1384 + _1416;
        float _1420 = rsqrt(_1380);
        float _1422 = _1418 * _1414;
        float _1424 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = _1422 * 0.15915493667125701904296875;
        float _1428 = _1426 * 6.283185482025146484375;
        float _1430 = sin(_1428);
        float _1432 = _1426 * 6.283185482025146484375;
        float _1434 = cos(_1432);
        float _1436 = fma(_1430, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1438 = _1420 * _1436;
        float _1440 = _1434 + (-1.0);
        float _1442 = fma(_1372, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1444 = fma(_1368, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1446 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = fma(_1386, _1434, _1446);
        _1412 = _1448;
        _1402 = _1442;
        _1406 = _1444;
    }
    float _1450 = _1412;
    float _1452 = _1402;
    float _1454 = _1406;
    float _1456 = -_1152;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1450);
    float _1460 = -_1154;
    float _1462 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1452);
    float _1464 = -_1160;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1454);
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1470 = _1458 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1462 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1478 = _1466 + _1476;
    float _1480 = _1470 * _1470;
    float _1482 = fma(_1474, _1474, _1480);
    float _1484 = fma(_1478, _1478, _1482);
    float _1486 = rsqrt(_1484);
    float _1488 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1490 = _1474 * _1488;
    float _1492 = _1478 * _1488;
    float _1494 = _1490 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 + _1496;
    float _1500 = sqrt(_1498);
    bool _1502 = _1500 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _1500 + _1504;
    float _1508 = _1478;
    float _1510 = _1498;
    float _1512 = _1506;
    float _1514 = _1470;
    float _1516 = _1490;
    if (_1502)
    {
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1508 = _1518;
    }
    float _1520 = _1508;
    if (_1502)
    {
        float _1522 = rsqrt(_1498);
        _1510 = _1522;
    }
    float _1524 = _1510;
    if (_1502)
    {
        float _1526 = _1506 * _1520;
        _1512 = _1526;
    }
    float _1528 = _1512;
    if (_1502)
    {
        float _1530 = _1528 * 0.15915493667125701904296875;
        _1396 = _1530;
    }
    float _1532 = _1396;
    float _1534 = _1480;
    if (_1502)
    {
        float _1536 = _1532 * 6.283185482025146484375;
        float _1538 = sin(_1536);
        _1534 = _1538;
    }
    float _1540 = _1534;
    float _1542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1544 = precise::max(0.0, _1542);
    float _1546 = _1486;
    float _1548 = _1542;
    float _1550 = _1544;
    if (_1502)
    {
        float _1552 = _1532 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        _1546 = _1554;
    }
    float _1556 = _1546;
    float _1558 = -_1488;
    float _1560 = -_1544;
    float _1562 = fma(_1470, _1558, _1560);
    float _1564 = _1562;
    if (!_1502)
    {
        _1514 = _1496;
    }
    float _1566 = _1514;
    float _1568 = _1566;
    if (_1502)
    {
        float _1570 = _1562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1570;
    }
    float _1572 = _1548;
    float _1574 = sqrt(_1484);
    float _1576 = _1540;
    float _1578 = _1572;
    if (_1502)
    {
        float _1580 = fma(_1540, _1572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1576 = _1580;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (_1502)
    {
        float _1586 = _1556 + (-1.0);
        _1578 = _1586;
    }
    float _1588 = _1578;
    float _1590 = _1588;
    if (_1502)
    {
        float _1592 = _1524 * _1582;
        _1398 = _1592;
    }
    float _1594 = _1398;
    if (!_1502)
    {
        _1584 = _1492;
    }
    float _1596 = _1584;
    float _1598 = _1596;
    if (_1502)
    {
        float _1600 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1600;
    }
    float _1602 = _1550;
    if (_1502)
    {
        float _1604 = _1490 * _1594;
        _1516 = _1604;
    }
    float _1606 = _1516;
    if (!_1502)
    {
        _1590 = _1494;
    }
    float _1608 = _1590;
    float _1610 = _1608;
    if (_1502)
    {
        float _1612 = _1492 * _1594;
        _1598 = _1612;
    }
    float _1614 = _1598;
    if (_1502)
    {
        float _1616 = fma(_1562, _1556, _1602);
        _1564 = _1616;
    }
    float _1618 = _1564;
    if (_1502)
    {
        float _1620 = _1606 * _1606;
        _1610 = _1620;
    }
    float _1622 = _1610;
    if (_1502)
    {
        float _1624 = _1614 * _1614;
        _1568 = _1624;
    }
    float _1626 = _1568;
    float _1628 = fma(_1618, _1618, _1622);
    float _1630 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1640 = _1628 + _1626;
    float _1642 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1630);
    float _1644 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1646 = -_1636;
    float _1648 = _1646 + 1.0;
    float _1650 = rsqrt(_1640);
    float _1652 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1642);
    float _1654 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1644);
    float _1656 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1660 = _1652 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1662 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1638);
    float _1664 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1654);
    float _1666 = abs(_1648);
    float _1668 = log2(_1666);
    float _1670 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1656);
    float _1674 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1662);
    float _1676 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1678 = -_1670;
    float _1680 = fma(_1678, _1658, 1.0);
    float _1682 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1672);
    float _1684 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1686 = _1650 * _1606;
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1690 = _1650 * _1618;
    float _1692 = _1650 * _1614;
    float _1694 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1696 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1688);
    float _1698 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1700 = log2(_1680);
    float _1702 = -_1694;
    float _1704 = fma(_1690, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1696);
    float _1708 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1710 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1712 = -_1692;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1716 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1706);
    float _1718 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1720 = exp2(_1708);
    float _1722 = fma(_1714, -0.5, 0.5);
    float _1724 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1710);
    float _1726 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1718);
    float _1728 = fma(_1714, 0.5, 0.5);
    float _1730 = _1690 + 1.0;
    float _1732 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1724);
    float _1734 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1726);
    float _1736 = 1.0 / _1716;
    float _1738 = fma(_1728, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1740 = _1700 * 0.693147182464599609375;
    float _1742 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1734);
    float _1744 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1732);
    float _1746 = fma(_1728, _1738, -0.212114393711090087890625);
    float _1748 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1750 = sqrt(_1722);
    float _1752 = -_1690;
    float _1754 = fma(_1720, _1730, _1752);
    float _1756 = fma(_1728, _1746, 1.570728778839111328125);
    float _1758 = fma(_1754, 0.5, 0.5);
    float _1760 = _1742 * _1736;
    float _1762 = _1744 * _1736;
    float _1764 = fma(_1760, 0.5, 0.5);
    float _1766 = fma(_1762, -0.5, 0.5);
    float _1768 = _1750 * 0.636619746685028076171875;
    float _1770 = -_1756;
    float _1772 = fma(_1768, _1770, 1.0);
    float3 _4723 = float3(_1764, _1766, _1748);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4723, float3(0.0), isnan(_4723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4723, float3(0.0), isnan(_4723)), level(0.0)).x;
    float3 _4734 = float3(_1764, _1766, _1748);
    float4 _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4734, float3(0.0), isnan(_4734)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4734, float3(0.0), isnan(_4734)), level(0.0)).xyzw;
    float _1779 = _1777.x;
    float _1781 = _1777.y;
    float _1783 = _1777.z;
    float _1785 = _1777.w;
    float2 _4751 = float2(_1772, _1758);
    float3 _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4751, float2(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4751, float2(0.0), isnan(_4751)), level(0.0)).xyz;
    float _1791 = _1789.x;
    float _1793 = _1789.y;
    float _1795 = _1789.z;
    float _1797 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1799 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1801 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1799);
    float _1803 = exp2(_1797);
    float _1805 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1801);
    float _1807 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1805);
    float _1809 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1811 = _1807 + _1716;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1744;
    out.gl_Position.z = _1807;
    out.gl_Position.w = _1716;
    float _1813 = _1811 * 0.5;
    float _1815 = -_1803;
    float _1817 = _1815 + 1.0;
    out.m_45.x = _1809;
    float _1819 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1813;
    out.m_67.w = _1716;
    float _1821 = -_1819;
    float _1823 = _1821 + 1.0;
    float _1825 = _1819 * _1774;
    float _1827 = _1785 * _1825;
    float _1829 = _1795 * _1825;
    float _1831 = _1785 * _1823;
    float _1833 = fma(_1791, _1827, _1779);
    float _1835 = fma(_1793, _1827, _1781);
    float _1837 = fma(_1785, _1829, _1783);
    out.m_69.x = _1833;
    out.m_69.y = _1835;
    out.m_69.z = _1837;
    out.m_69.w = _1831;
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
        float _1894 = as_type<float>(_104);
        out.gl_Position.z = _1894;
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
        float _1962 = as_type<float>(_140);
        out.gl_Position.z = _1962;
    }
    if (_134)
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
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _310 = 1.0 / _296;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _320 = 1.0 / _300;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _324 = _292 + _322;
    bool _326 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_292);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = 1.0 / _304;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _346 = _292 + _344;
    float _348 = _324 * _310;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = _292 + _350;
    bool _354 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _356 = isnan(_292);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = fma(_340, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _370 = 1.0 / _308;
    float _372 = _346 * _320;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _376 = _292 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _380 = _292 + _378;
    float _382 = -_364;
    float _384 = _382 + 1.0;
    float _386 = 1.0 / _314;
    float _388 = _376 * _342;
    float _390 = 1.0 / _318;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _394 = _292 + _392;
    float _396 = _394 * _370;
    bool _398 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _400 = isnan(_292);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _410;
    float _414 = _352 * _386;
    bool _416 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _418 = isnan(_292);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -_408;
    float _430 = _428 + 1.0;
    float _432 = fma(_412, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _434 = -_426;
    float _436 = _434 + 1.0;
    float _438 = _364 * _430;
    float _440 = _380 * _390;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _442;
    float _446 = _336 * _436;
    bool _448 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _450 = isnan(_292);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -_336;
    float _462 = _460 + 1.0;
    float _464 = fma(_444, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _466 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _468 = isnan(_292);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = _426 * _384;
    bool _480 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _482 = isnan(_292);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = _476 * _462;
    float _506 = -_490;
    float _508 = _506 + 1.0;
    float _510 = -_476;
    float _512 = _510 + 1.0;
    float _514 = fma(_498, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _516 = _458 * _508;
    float _518 = -_458;
    float _520 = _518 + 1.0;
    float _522 = fma(_494, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _524 = fma(_502, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _464 * _516;
    float _528 = _432 * _516;
    float _530 = _366 * _516;
    float _532 = _490 * _512;
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
    float _554 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].x, _526);
    float _556 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].y, _528);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _558;
    float _562 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _564 = fma(_544, _440, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _566 = fma(_548, _440, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _568 = fma(_552, _440, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _570 = fma(_536, _414, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _572 = fma(_560, _414, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _574 = fma(_514, _532, _554);
    float _576 = fma(_522, _532, _556);
    float _578 = fma(_524, _532, _562);
    float _580 = fma(_540, _414, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _582 = fma(_570, _504, _574);
    float _584 = fma(_572, _504, _578);
    float _586 = fma(_580, _504, _576);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _596;
    float _600 = fma(_564, _446, _582);
    float _602 = fma(_568, _446, _584);
    float _604 = fma(_590, _388, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _606 = fma(_594, _388, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _608 = fma(_566, _446, _586);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _618 = fma(_598, _388, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _624 = fma(_604, _478, _600);
    float _626 = fma(_612, _396, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _628 = fma(_616, _396, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _630 = fma(_606, _478, _608);
    float _632 = fma(_622, _396, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _634 = fma(_618, _478, _602);
    float _636 = fma(_626, _438, _624);
    float _638 = fma(_628, _438, _630);
    float _640 = fma(_632, _438, _634);
    float _642 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[149].x, _636);
    float _644 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[149].y, _638);
    float _646 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[149].z, _640);
    bool _648 = !_368;
    float _666;
    if (!_648)
    {
        float _650 = in.m_51.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
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
    float _678 = in.m_51.w;
    float _680 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _682 = in.m_53.x;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _686 = _684 != 0;
    float _688 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _680);
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _692 = _690 != 0;
    float _694 = in.m_51.x;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _698 = _696 != 0;
    float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _704 = _702 != 0;
    float _706 = in.m_53.y;
    float _708 = in.m_51.y;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _712 = _710 != 0;
    float _714 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _716 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _718 = in.m_53.z;
    float _720 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _714);
    float _722 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _716);
    bool _724 = _678 > 0.5;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _730 = in.m_55.y;
    float _732 = 1.0 / _728;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _738 = in.m_55.x;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _748 = _602;
    float _750 = _722;
    bool _752 = _724;
    if (_692)
    {
        float _754 = in.m_51.z;
        _748 = _754;
    }
    float _756 = _748;
    float _758 = 1.0 / _736;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _760;
    out.m_57.x = _682;
    float _764 = _700 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_57.y = _706;
    float _766 = 1.0 / _742;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _768;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _774 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_57.z = _718;
    float _776 = -_730;
    float _778 = _776 + 1.0;
    float _780 = _708 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _782 = -_746;
    float _784 = fma(_774, 2.0, _782);
    float _786 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _688);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _792 = _688;
    float _794 = _766;
    float _796 = _730;
    if (!_712)
    {
        float _798 = in.m_51.z;
        _792 = _798;
    }
    float _800 = _792;
    float _802 = fma(_780, -2.0, _744);
    float _804 = _770 * _758;
    float _806 = _790 * _732;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _810 = _676 + _808;
    float _812 = _762 * _766;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _816 = _676 + _814;
    int _818 = _724 ? as_type<int>(_778) : as_type<int>(_730);
    float _820 = fma(_804, _810, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _822 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _824 = isnan(_676);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _836 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _720);
    float _838 = fma(_812, _816, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _840 = _698 ? as_type<float>(_818) : _730;
    float _842 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _722);
    bool _844 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _846 = isnan(_676);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _858 = _676 + _856;
    bool _860 = _708 > 0.5;
    float _862 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].z, _834);
    float _864 = _812;
    if (!_712)
    {
        _750 = _708;
    }
    float _866 = _750;
    float _868 = fma(_806, _858, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _870 = _866;
    if (_686)
    {
        bool _872 = _694 > 0.5;
        _752 = _872;
    }
    bool _874 = _752;
    float _876 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[78].w, _772);
    if (_712)
    {
        _870 = _694;
    }
    float _878 = _870;
    float _880 = -_832;
    float _882 = _880 + 1.0;
    int _884 = as_type<int>(_878);
    if (!_686)
    {
        _794 = _738;
    }
    float _886 = _794;
    float _888 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _802);
    bool _890 = false;
    float _892 = _886;
    if (_692)
    {
        bool _894 = _756 > 0.5;
        _890 = _894;
    }
    bool _896 = _890;
    float _898 = _854 * _882;
    if (_704)
    {
        float _900 = _860 ? _778 : _730;
        _796 = _900;
    }
    float _902 = _796;
    float _904 = -_854;
    float _906 = _904 + 1.0;
    bool _908 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = isnan(_676);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _786 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _922 = _918;
    if (!_686)
    {
        _864 = _886;
    }
    float _924 = _864;
    float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _928 = _924;
    if (_686)
    {
        _892 = _738;
    }
    float _930 = _892;
    float _932 = -_918;
    float _934 = _932 + 1.0;
    bool _936 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _938 = isnan(_676);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _918 * _906;
    float _950 = _800;
    float _952 = _930;
    if (!_712)
    {
        _922 = _800;
    }
    float _954 = _922;
    float _956 = -_122;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[76].x, _784);
    float _960 = _954;
    if (_712)
    {
        _960 = _708;
    }
    float _962 = _960;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_712)
    {
        _950 = _708;
    }
    float _966 = _950;
    float _968 = fma(_840, _764, -0.5);
    float _970 = _946 * _934;
    float _972 = _962 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _976 = _820 * _970;
    float _978 = -_946;
    float _980 = _978 + 1.0;
    float _982 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[83].z, _974);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _988 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[115].x, _976);
    float _990 = _964 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _994 = _878 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _996 = _992;
    if (_686)
    {
        float _998 = -_930;
        float _1000 = _998 + 1.0;
        _884 = as_type<int>(_1000);
    }
    int _1002 = _884;
    float _1004 = fma(_990, _902, -0.5);
    float _1006 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[83].w, _992);
    float _1008 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _876);
    int _1010 = _1002;
    if (_686)
    {
        float _1012 = _874 ? as_type<float>(_1002) : _930;
        _928 = _1012;
    }
    float _1014 = _928;
    if (_692)
    {
        float _1016 = -_930;
        float _1018 = _1016 + 1.0;
        _1010 = as_type<int>(_1018);
    }
    int _1020 = _1010;
    float _1022 = -_984;
    float _1024 = fma(_994, 2.0, _1022);
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1028 = fma(_868, _948, _988);
    float _1030 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1006);
    if (_692)
    {
        float _1032 = _896 ? as_type<float>(_1020) : _930;
        _952 = _1032;
    }
    float _1034 = _952;
    float _1036 = fma(_972, -2.0, _1026);
    float _1038 = -_888;
    float _1040 = fma(_1008, _1004, _1038);
    float _1042 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1044 = _836 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = _920 + _1046;
    float _1050 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _862);
    float _1052 = fma(_1042, _1034, -0.5);
    float _1054 = _842 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1058 = _1044 + _1056;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1062 = fma(_838, _898, _1028);
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1054 + _1064;
    float _1068 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _982);
    float _1070 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1060);
    float _1072 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1062);
    float _1074 = -_122;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1024);
    float _1078 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1036);
    float _1080 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1070);
    float _1082 = _1048 * _1048;
    float _1084 = in.m_53.w;
    float _1086 = _926 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1088 = fma(_1068, _1052, _1076);
    bool _1090 = _1080 >= 0.0;
    float _1092 = fma(_1058, _1058, _1082);
    float _1094 = fma(_1086, _1014, -0.5);
    float _1096 = -_1078;
    float _1098 = fma(_1030, _968, _1096);
    float _1100 = fma(_1066, _1066, _1092);
    float _1102 = fma(_1050, _1094, _958);
    float _1104 = rsqrt(_1100);
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1114 = as_type<int>(_1088);
    int _1116 = as_type<int>(_1072);
    if (_1090)
    {
        _996 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1118 = _996;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1124 = _1102 + 0.5;
    float _1126 = _1088 + 0.5;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1130 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1142 = _1040 + 0.5;
    float _1144 = _1098 + 0.5;
    float _1146 = _1072 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1090)
    {
        float _1148 = _1118 * 5.0;
        _1114 = as_type<int>(_1148);
    }
    int _1150 = _1114;
    out.m_57.w = _1084;
    float _1152 = _1048 * _1104;
    float _1154 = _1058 * _1104;
    out.m_59.x = _1136;
    out.m_59.y = _1138;
    out.m_59.z = _1140;
    out.m_59.w = _1128;
    out.m_61.x = _1124;
    out.m_61.y = _1142;
    out.m_61.z = _1126;
    out.m_61.w = _1144;
    out.m_63.x = _1130;
    out.m_63.y = _1132;
    out.m_63.z = _1134;
    out.m_63.w = _1146;
    if (_1090)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3696 = as_type<float>(_1150);
        out.gl_Position.z = _3696;
    }
    if (_1090)
    {
        out.m_45.x = 0.0;
    }
    if (_1090)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1156 = -_1152;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _920);
    float _1160 = _1066 * _1104;
    float _1162 = -_1154;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1168 = _1158 + _1166;
    float _1170 = -_1160;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1054);
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1176 = _1164 + _1174;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _1172 + _1180;
    float _1184 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1178);
    float _1186 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1184);
    bool _1188 = _1186 >= 0.0;
    float _1190 = _1176;
    if (_1188)
    {
        _1190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1192 = _1190;
    if (_1188)
    {
        out.m_45.x = 0.0;
    }
    if (_1188)
    {
        float _1194 = _1192 * 5.0;
        _1116 = as_type<int>(_1194);
    }
    int _1196 = _1116;
    if (_1188)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3789 = as_type<float>(_1196);
        out.gl_Position.z = _3789;
    }
    if (_1188)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1198 = -_920;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = -_1044;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = -_1054;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = -_1152;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1214 = _1200 * _1200;
    float _1216 = -_1154;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    float _1220 = -_1160;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1066);
    float _1224 = _1212 * _1212;
    float _1226 = fma(_1204, _1204, _1214);
    float _1228 = fma(_1218, _1218, _1224);
    float _1230 = fma(_1208, _1208, _1226);
    float _1232 = in.m_49.x;
    float _1234 = in.m_49.y;
    float _1236 = in.m_49.z;
    float _1238 = fma(_1222, _1222, _1228);
    float _1240 = rsqrt(_1230);
    float _1242 = sqrt(_1238);
    float _1244 = _1204 * _1240;
    float _1246 = _1208 * _1240;
    float _1248 = _1200 * _1240;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1252 = _1244 * _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1256 = _1246 * _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1260 = _1248 * _1258;
    float _1262 = _644 * _1234;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1266 = -_1252;
    float _1268 = fma(_1246, _1264, _1266);
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1272 = -_1256;
    float _1274 = fma(_1248, _1270, _1272);
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1278 = -_1260;
    float _1280 = fma(_1244, _1276, _1278);
    float _1282 = in.m_65.x;
    float _1284 = in.m_65.y;
    float _1286 = in.m_65.z;
    float _1288 = _1268 * _1268;
    float _1290 = _646 * _1236;
    float _1292 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1294 = _642 * _1232;
    float _1296 = fma(_1274, _1274, _1288);
    float _1298 = _1104 * _1242;
    float _1300 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1302 = fma(_1280, _1280, _1296);
    float _1304 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1306 = _1298 * _1292;
    float _1308 = _1298 * _1300;
    float _1310 = _1298 * _1304;
    float _1312 = rsqrt(_1302);
    float _1314 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1284);
    float _1316 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1282);
    float _1318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1286);
    float _1320 = _1306 * _1314;
    float _1322 = _1310 * _1316;
    float _1324 = _1308 * _1318;
    float _1326 = _1274 * _1312;
    float _1328 = _1268 * _1312;
    float _1330 = _1280 * _1312;
    float _1332 = _1248 * _1326;
    float _1334 = _1246 * _1328;
    float _1336 = -_1332;
    float _1338 = fma(_1244, _1328, _1336);
    float _1340 = -_1334;
    float _1342 = fma(_1248, _1330, _1340);
    float _1344 = _1320 * _1338;
    float _1346 = _1320 * _1342;
    float _1348 = fma(_1322, _1330, _1344);
    float _1350 = fma(_1322, _1326, _1346);
    float _1352 = fma(_1324, _1246, _1348);
    float _1354 = fma(_1324, _1244, _1350);
    float _1356 = _1244 * _1330;
    float _1358 = _1054 + _1352;
    float _1360 = _1044 + _1354;
    float _1362 = -_1356;
    float _1364 = fma(_1246, _1326, _1362);
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1368 = _1358 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1372 = _1360 + _1370;
    float _1374 = _1320 * _1364;
    float _1376 = _1368 * _1368;
    float _1378 = fma(_1322, _1328, _1374);
    float _1380 = fma(_1372, _1372, _1376);
    float _1382 = fma(_1324, _1248, _1378);
    float _1384 = sqrt(_1380);
    float _1386 = _920 + _1382;
    bool _1388 = _1384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1390 = _1376;
    float _1392 = _1328;
    float _1394 = _1378;
    float _1396 = _1386;
    float _1398 = _1248;
    if (!_1388)
    {
        _1390 = _1360;
    }
    float _1400 = _1390;
    float _1402 = _1400;
    if (!_1388)
    {
        _1392 = _1358;
    }
    float _1404 = _1392;
    float _1406 = _1404;
    if (!_1388)
    {
        _1394 = _1386;
    }
    float _1408 = _1394;
    bool _1410 = !_1388;
    float _1412 = _1408;
    if (!_1410)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1418 = _1384 + _1416;
        float _1420 = rsqrt(_1380);
        float _1422 = _1418 * _1414;
        float _1424 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = _1422 * 0.15915493667125701904296875;
        float _1428 = _1426 * 6.283185482025146484375;
        float _1430 = sin(_1428);
        float _1432 = _1426 * 6.283185482025146484375;
        float _1434 = cos(_1432);
        float _1436 = fma(_1430, _1424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1438 = _1420 * _1436;
        float _1440 = _1434 + (-1.0);
        float _1442 = fma(_1372, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1444 = fma(_1368, _1438, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1446 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = fma(_1386, _1434, _1446);
        _1412 = _1448;
        _1402 = _1442;
        _1406 = _1444;
    }
    float _1450 = _1412;
    float _1452 = _1402;
    float _1454 = _1406;
    float _1456 = -_1152;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1450);
    float _1460 = -_1154;
    float _1462 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1452);
    float _1464 = -_1160;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1454);
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1470 = _1458 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1462 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1478 = _1466 + _1476;
    float _1480 = _1470 * _1470;
    float _1482 = fma(_1474, _1474, _1480);
    float _1484 = fma(_1478, _1478, _1482);
    float _1486 = rsqrt(_1484);
    float _1488 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1490 = _1474 * _1488;
    float _1492 = _1478 * _1488;
    float _1494 = _1490 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 + _1496;
    float _1500 = sqrt(_1498);
    bool _1502 = _1500 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = _1500 + _1504;
    float _1508 = _1478;
    float _1510 = _1498;
    float _1512 = _1506;
    float _1514 = _1470;
    float _1516 = _1490;
    if (_1502)
    {
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1508 = _1518;
    }
    float _1520 = _1508;
    if (_1502)
    {
        float _1522 = rsqrt(_1498);
        _1510 = _1522;
    }
    float _1524 = _1510;
    if (_1502)
    {
        float _1526 = _1506 * _1520;
        _1512 = _1526;
    }
    float _1528 = _1512;
    if (_1502)
    {
        float _1530 = _1528 * 0.15915493667125701904296875;
        _1396 = _1530;
    }
    float _1532 = _1396;
    float _1534 = _1480;
    if (_1502)
    {
        float _1536 = _1532 * 6.283185482025146484375;
        float _1538 = sin(_1536);
        _1534 = _1538;
    }
    float _1540 = _1534;
    float _1542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1544 = precise::max(0.0, _1542);
    float _1546 = _1486;
    float _1548 = _1542;
    float _1550 = _1544;
    if (_1502)
    {
        float _1552 = _1532 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        _1546 = _1554;
    }
    float _1556 = _1546;
    float _1558 = -_1488;
    float _1560 = -_1544;
    float _1562 = fma(_1470, _1558, _1560);
    float _1564 = _1562;
    if (!_1502)
    {
        _1514 = _1496;
    }
    float _1566 = _1514;
    float _1568 = _1566;
    if (_1502)
    {
        float _1570 = _1562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1570;
    }
    float _1572 = _1548;
    float _1574 = sqrt(_1484);
    float _1576 = _1540;
    float _1578 = _1572;
    if (_1502)
    {
        float _1580 = fma(_1540, _1572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1576 = _1580;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (_1502)
    {
        float _1586 = _1556 + (-1.0);
        _1578 = _1586;
    }
    float _1588 = _1578;
    float _1590 = _1588;
    if (_1502)
    {
        float _1592 = _1524 * _1582;
        _1398 = _1592;
    }
    float _1594 = _1398;
    if (!_1502)
    {
        _1584 = _1492;
    }
    float _1596 = _1584;
    float _1598 = _1596;
    if (_1502)
    {
        float _1600 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1600;
    }
    float _1602 = _1550;
    if (_1502)
    {
        float _1604 = _1490 * _1594;
        _1516 = _1604;
    }
    float _1606 = _1516;
    if (!_1502)
    {
        _1590 = _1494;
    }
    float _1608 = _1590;
    float _1610 = _1608;
    if (_1502)
    {
        float _1612 = _1492 * _1594;
        _1598 = _1612;
    }
    float _1614 = _1598;
    if (_1502)
    {
        float _1616 = fma(_1562, _1556, _1602);
        _1564 = _1616;
    }
    float _1618 = _1564;
    if (_1502)
    {
        float _1620 = _1606 * _1606;
        _1610 = _1620;
    }
    float _1622 = _1610;
    if (_1502)
    {
        float _1624 = _1614 * _1614;
        _1568 = _1624;
    }
    float _1626 = _1568;
    float _1628 = fma(_1618, _1618, _1622);
    float _1630 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1640 = _1628 + _1626;
    float _1642 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1630);
    float _1644 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1646 = -_1636;
    float _1648 = _1646 + 1.0;
    float _1650 = rsqrt(_1640);
    float _1652 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1642);
    float _1654 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1644);
    float _1656 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1660 = _1652 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1662 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1638);
    float _1664 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1654);
    float _1666 = abs(_1648);
    float _1668 = log2(_1666);
    float _1670 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1656);
    float _1674 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1662);
    float _1676 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1678 = -_1670;
    float _1680 = fma(_1678, _1658, 1.0);
    float _1682 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1672);
    float _1684 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1686 = _1650 * _1606;
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1690 = _1650 * _1618;
    float _1692 = _1650 * _1614;
    float _1694 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1696 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1688);
    float _1698 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1700 = log2(_1680);
    float _1702 = -_1694;
    float _1704 = fma(_1690, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1696);
    float _1708 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1710 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1712 = -_1692;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1716 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1706);
    float _1718 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1720 = exp2(_1708);
    float _1722 = fma(_1714, -0.5, 0.5);
    float _1724 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1710);
    float _1726 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1718);
    float _1728 = fma(_1714, 0.5, 0.5);
    float _1730 = _1690 + 1.0;
    float _1732 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1724);
    float _1734 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1726);
    float _1736 = 1.0 / _1716;
    float _1738 = fma(_1728, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1740 = _1700 * 0.693147182464599609375;
    float _1742 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1734);
    float _1744 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1732);
    float _1746 = fma(_1728, _1738, -0.212114393711090087890625);
    float _1748 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1750 = sqrt(_1722);
    float _1752 = -_1690;
    float _1754 = fma(_1720, _1730, _1752);
    float _1756 = fma(_1728, _1746, 1.570728778839111328125);
    float _1758 = fma(_1754, 0.5, 0.5);
    float _1760 = _1742 * _1736;
    float _1762 = _1744 * _1736;
    float _1764 = fma(_1760, 0.5, 0.5);
    float _1766 = fma(_1762, -0.5, 0.5);
    float _1768 = _1750 * 0.636619746685028076171875;
    float _1770 = -_1756;
    float _1772 = fma(_1768, _1770, 1.0);
    float3 _4723 = float3(_1764, _1766, _1748);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4723, float3(0.0), isnan(_4723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4723, float3(0.0), isnan(_4723)), level(0.0)).x;
    float3 _4734 = float3(_1764, _1766, _1748);
    float4 _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4734, float3(0.0), isnan(_4734)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4734, float3(0.0), isnan(_4734)), level(0.0)).xyzw;
    float _1779 = _1777.x;
    float _1781 = _1777.y;
    float _1783 = _1777.z;
    float _1785 = _1777.w;
    float2 _4751 = float2(_1772, _1758);
    float3 _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4751, float2(0.0), isnan(_4751)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4751, float2(0.0), isnan(_4751)), level(0.0)).xyz;
    float _1791 = _1789.x;
    float _1793 = _1789.y;
    float _1795 = _1789.z;
    float _1797 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1799 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1801 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1799);
    float _1803 = exp2(_1797);
    float _1805 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1801);
    float _1807 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1805);
    float _1809 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1811 = _1807 + _1716;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1744;
    out.gl_Position.z = _1807;
    out.gl_Position.w = _1716;
    float _1813 = _1811 * 0.5;
    float _1815 = -_1803;
    float _1817 = _1815 + 1.0;
    out.m_45.x = _1809;
    float _1819 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _1813;
    out.m_67.w = _1716;
    float _1821 = -_1819;
    float _1823 = _1821 + 1.0;
    float _1825 = _1819 * _1774;
    float _1827 = _1785 * _1825;
    float _1829 = _1795 * _1825;
    float _1831 = _1785 * _1823;
    float _1833 = fma(_1791, _1827, _1779);
    float _1835 = fma(_1793, _1827, _1781);
    float _1837 = fma(_1785, _1829, _1783);
    out.m_69.x = _1833;
    out.m_69.y = _1835;
    out.m_69.z = _1837;
    out.m_69.w = _1831;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

