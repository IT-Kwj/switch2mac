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
    float4 m_45 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_65 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _252 = false;
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
        float _2028 = as_type<float>(_104);
        out.gl_Position.z = _2028;
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
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2097 = as_type<float>(_142);
        out.gl_Position.z = _2097;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _156 = _154 != 0;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _148 * _146;
    float _164 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _166 = _164 * 6.283185482025146484375;
    float _168 = floor(_164);
    float _170 = _166 * 0.15915493667125701904296875;
    bool _172 = !_152;
    int _174 = _172 ? 0 : 1;
    int _176 = abs(_174);
    float _178 = _170 * 6.283185482025146484375;
    float _180 = cos(_178);
    bool _182 = !_160;
    int _184 = _182 ? 0 : 1;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _188 = abs(_184);
    float _190 = -_168;
    float _192 = _164 + _190;
    bool _194 = !_156;
    int _196 = _194 ? 0 : 1;
    float _198 = float(_176);
    int _200 = abs(_196);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _206 = fma(_180, 0.5, 0.5);
    float _208 = abs(_204);
    float _210 = _198 * _208;
    bool _212 = _192 < 0.5;
    float _214 = float(_212);
    float _216 = float(_188);
    float _218 = -_206;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _222 = float(_200);
    float _224 = -_214;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _228 = fma(_216, _220, _210);
    float _230 = abs(_226);
    float _232 = fma(_222, _230, _228);
    bool _234 = !_186;
    float _250;
    if (!_234)
    {
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_88);
        float _256 = 1.0 / _254;
        float _258 = _122 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = in.m_42.x;
    float _264 = in.m_42.y;
    float _266 = in.m_42.z;
    float _268 = _144 * 2.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _260 + _270;
    float _274 = in.m_49.y;
    float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _278 = log2(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = in.m_49.z;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _296 = _294 != 0;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = floor(_268);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = _260 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _318 = _260 + _316;
    float _320 = 1.0 / _282;
    float _322 = _278 * _122;
    float _324 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _328 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _330 = isnan(_260);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _326);
    float _342 = 1.0 / _300;
    bool _344 = _310 > 0.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _346;
    bool _350 = _310 >= 0.0;
    bool _352 = isnan(_310);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    float _360 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _368 = 1.0 / _304;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _372 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = _260 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _260 + _378;
    float _382 = _370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _384 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _372);
    float _386 = _376 * _320;
    float _388 = 1.0 / _308;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _392 = _144 + _274;
    float _394 = _380 * _342;
    float _396 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _398 = _392 + (-1.0);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _400;
    float _404 = 1.0 / _348;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _412 = _260 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _418 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _384 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _422 = _272 * _388;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _424;
    out.m_51.x = _382;
    out.m_51.y = _396;
    out.m_51.z = _418;
    float _428 = 1.0 / _366;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _432 = _260 + _430;
    float _434 = _274 + (-0.5);
    float _436 = _314 * _404;
    float _438 = _432 * _368;
    float _440 = 1.0 / _426;
    int _442 = _358 ? 0 : 1;
    float _444 = _274 * 2.0;
    float _446 = _284 * 2.0;
    float _448 = _144 + _284;
    float _450 = floor(_444);
    float _452 = _274 + _284;
    float _454 = _448 + (-1.0);
    float _456 = _318 * _428;
    bool _458 = !_288;
    int _460 = _458 ? 0 : 1;
    float _462 = _452 + (-1.0);
    float _464 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _466 = floor(_446);
    float _468 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _470 = _412 * _440;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _472;
    int _476 = ~_442;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _482;
    int _486 = _480;
    if (!_344)
    {
        int _488 = ~_442;
        int _490 = _488 + 1;
        _486 = _490;
    }
    int _492 = _486;
    float _494 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _362);
    float _496 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _340);
    bool _498 = _450 > 0.0;
    float _500 = fma(_484, _386, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _502 = _450 >= 0.0;
    bool _504 = isnan(_450);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _528;
    bool _532 = _466 > 0.0;
    float _534 = fma(_474, _386, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _536 = _466 >= 0.0;
    bool _538 = isnan(_466);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    float _546 = fma(_514, _386, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _548 = fma(_518, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _550 = fma(_522, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _552 = fma(_526, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _554 = fma(_530, _438, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _556 = exp2(_322);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _586 = fma(_564, _422, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _588 = fma(_568, _422, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _590 = fma(_560, _438, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _592 = fma(_416, _422, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _594 = fma(_572, _436, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _596 = fma(_576, _436, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _598 = fma(_402, _438, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_580, _436, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    bool _602 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _604 = isnan(_260);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_584, _456, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _616 = -_338;
    float _618 = _616 + 1.0;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    bool _628 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _630 = isnan(_260);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = _612 * _618;
    float _642 = fma(_622, _456, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _644 = -_612;
    float _646 = _644 + 1.0;
    float _648 = fma(_626, _456, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _652 = 1.0 + _650;
    bool _654 = !_292;
    int _656 = _654 ? 0 : 1;
    float _658 = -_556;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = _638 * _646;
    bool _674 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _676 = isnan(_260);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -_638;
    float _688 = _686 + 1.0;
    float _690 = 1.0 / _652;
    float _692 = _670 ? _660 : 0.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _694;
    bool _698 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _700 = isnan(1.0);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _706 = _702 || _704;
    float _708 = _684 * _688;
    bool _710 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _712 = isnan(_260);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _730;
    bool _734 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _736 = isnan(_260);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = _720 * _724;
    float _748 = fma(_728, _470, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _750 = _494 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _752 = -_720;
    float _754 = _752 + 1.0;
    float _756 = fma(_696, _470, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    bool _758 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _760 = isnan(_260);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = fma(_732, _470, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _774 = _750 + _772;
    float _776 = _744 * _754;
    float _778 = -_744;
    float _780 = _778 + 1.0;
    bool _782 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _784 = isnan(_260);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = _548;
    if (_706)
    {
        float _796 = _692 * _690;
        _126 = _796;
    }
    float _798 = _126;
    float _800 = -_768;
    float _802 = _800 + 1.0;
    float _804 = _496 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _420 + _806;
    float _810 = _774 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _812 = _768 * _780;
    float _814 = _792 * _802;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _818 = _804 + _816;
    float _820 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[28].x, _810);
    float _822 = -_792;
    float _824 = _822 + 1.0;
    float _826 = _534 * _814;
    float _828 = _500 * _814;
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[28].z, _820);
    float _832 = _546 * _814;
    float _834 = _774 * _774;
    float _836 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].y, _828);
    int _838 = _510 ? 0 : 1;
    float _840 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].x, _826);
    bool _842 = _830 >= 0.0;
    float _844 = fma(_808, _808, _834);
    float _846 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].z, _832);
    float _848 = fma(_550, _812, _836);
    float _850 = in.m_53.x;
    float _852 = in.m_53.y;
    float _854 = in.m_53.z;
    int _856 = abs(_656);
    float _858 = fma(_818, _818, _844);
    float _860 = float(_492);
    float _862 = fma(_548, _812, _840);
    float _864 = float(_856);
    float _866 = fma(_552, _812, _846);
    int _868 = ~_838;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    float _874 = rsqrt(_858);
    int _876 = _872;
    if (_842)
    {
        _794 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _878 = _794;
    float _880 = _864 * _860;
    int _882 = as_type<int>(_878);
    if (!_498)
    {
        int _884 = ~_838;
        int _886 = _884 + 1;
        _876 = _886;
    }
    int _888 = _876;
    float _890 = fma(_590, _776, _848);
    int _892 = _544 ? 0 : 1;
    float _894 = _880 * (-2.0);
    if (_842)
    {
        float _896 = _878 * 5.0;
        _882 = as_type<int>(_896);
    }
    int _898 = _882;
    int _900 = ~_892;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    float _906 = fma(_468, _894, _468);
    bool _908 = !_296;
    int _910 = _908 ? 0 : 1;
    int _912 = _904;
    if (_842)
    {
        out.m_45.x = 0.0;
    }
    if (!_532)
    {
        int _914 = ~_892;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = fma(_554, _776, _862);
    float _922 = fma(_598, _776, _866);
    if (_842)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3328 = as_type<float>(_898);
        out.gl_Position.z = _3328;
    }
    float _924 = fma(_894, _852, _852);
    int _926 = abs(_910);
    float _928 = _774 * _874;
    float _930 = _808 * _874;
    if (_842)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _932 = -_928;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    int _936 = abs(_460);
    float _938 = _818 * _874;
    float _940 = -_930;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[18].w, _420);
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _934 + _944;
    float _948 = float(_936);
    float _950 = -_938;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _804);
    float _954 = float(_918);
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _958 = _942 + _956;
    float _960 = _946 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _964 = _952 + _962;
    float _966 = _144 + (-0.5);
    float _968 = _948 * _954;
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[28].x, _960);
    float _972 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[196].y, _924);
    float _974 = _968 * (-2.0);
    float _976 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[28].z, _970);
    float _978 = float(_888);
    float _980 = fma(_906, _798, _972);
    float _982 = fma(_974, _850, _850);
    float _984 = fma(_408, _974, _408);
    bool _986 = _976 >= 0.0;
    float _988 = fma(_586, _746, _920);
    float _990 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _982);
    float _992 = fma(_588, _746, _890);
    float _994 = fma(_592, _746, _922);
    float _996 = _980 * 0.15915493667125701904296875;
    float _998 = fma(_984, _798, _990);
    float _1000 = float(_926);
    float _1002 = -_928;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    float _1006 = _996 * 6.283185482025146484375;
    float _1008 = sin(_1006);
    float _1010 = _998 * 0.15915493667125701904296875;
    float _1012 = -_930;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _1016 = _1000 * _978;
    float _1018 = _976;
    if (_986)
    {
        _1018 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1020 = _1018;
    float _1022 = _1004 * _1004;
    int _1024 = as_type<int>(_1020);
    if (_986)
    {
        out.m_45.x = 0.0;
    }
    float _1026 = _996 * 6.283185482025146484375;
    float _1028 = cos(_1026);
    if (_986)
    {
        float _1030 = _1020 * 5.0;
        _1024 = as_type<int>(_1030);
    }
    int _1032 = _1024;
    float _1034 = fma(_594, _708, _988);
    float _1036 = fma(_1014, _1014, _1022);
    float _1038 = -_938;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    if (_986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3534 = as_type<float>(_1032);
        out.gl_Position.z = _3534;
    }
    float _1042 = _1010 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    if (_986)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1046 = -_750;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1050 = in.m_55.x;
    float _1052 = in.m_55.y;
    float _1054 = in.m_55.z;
    float _1056 = fma(_1040, _1040, _1036);
    float _1058 = -_420;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1048 * _1048;
    float _1064 = _1016 * (-2.0);
    float _1066 = -_804;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1070 = fma(_596, _708, _992);
    float _1072 = fma(_1060, _1060, _1062);
    float _1074 = fma(_600, _708, _994);
    float _1076 = fma(_464, _1064, _464);
    float _1078 = fma(_1064, _854, _854);
    float _1080 = fma(_1068, _1068, _1072);
    float _1082 = _284 + (-0.5);
    float _1084 = fma(_614, _672, _1034);
    float _1086 = fma(_642, _672, _1070);
    float _1088 = fma(_648, _672, _1074);
    float _1090 = sqrt(_1056);
    float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1078);
    float _1094 = fma(_748, _640, _1084);
    float _1096 = fma(_756, _640, _1086);
    float _1098 = fma(_770, _640, _1088);
    float _1100 = fma(_1076, _798, _1092);
    float _1102 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1094);
    float _1104 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1096);
    float _1106 = rsqrt(_1080);
    float _1108 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[150].z, _1098);
    float _1110 = _1102 * _1050;
    float _1112 = _1104 * _1052;
    float _1114 = _1100 * 0.15915493667125701904296875;
    float _1116 = _1108 * _1054;
    float _1118 = _232 * _1110;
    float _1120 = _232 * _1112;
    float _1122 = _1010 * 6.283185482025146484375;
    float _1124 = cos(_1122);
    float _1126 = _232 * _1116;
    float _1128 = _874 * _1090;
    float _1130 = _1044 * _1008;
    float _1132 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1136 = isnan(0.5);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1142 = _1138 || _1140;
    float _1144 = _1060 * _1106;
    float _1146 = _1068 * _1106;
    float _1148 = _1048 * _1106;
    float _1150 = in.m_57.x;
    float _1152 = in.m_57.y;
    float _1154 = in.m_57.z;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1158 = _1144 * _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1162 = _1146 * _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1166 = _1148 * _1164;
    float _1168 = _1114 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1174 = -_1158;
    float _1176 = fma(_1146, _1172, _1174);
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1180 = -_1162;
    float _1182 = fma(_1148, _1178, _1180);
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1186 = -_1166;
    float _1188 = fma(_1144, _1184, _1186);
    float _1190 = _1124 * _1028;
    float _1192 = _1176 * _1176;
    float _1194 = _1128 * _1132;
    float _1196 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1198 = _1114 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = fma(_1182, _1182, _1192);
    float _1204 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1206 = _1128 * _1196;
    float _1208 = fma(_1188, _1188, _1202);
    float _1210 = _1124 * _1008;
    float _1212 = _1128 * _1204;
    float _1214 = fma(_1170, _1190, _1130);
    float _1216 = rsqrt(_1208);
    float _1218 = fma(_1170, _1130, _1190);
    float _1220 = _1044 * _1028;
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1152);
    float _1224 = -_1210;
    float _1226 = fma(_1170, _1220, _1224);
    float _1228 = _1124 * _1200;
    float _1230 = _1028 * _1200;
    float _1232 = _1044 * _1200;
    float _1234 = _1008 * _1200;
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1150);
    float _1238 = _1222 * _1194;
    float _1240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1154);
    float _1242 = -_1220;
    float _1244 = fma(_1170, _1210, _1242);
    float _1246 = _1236 * _1212;
    float _1248 = _1228 * _1238;
    float _1250 = _1182 * _1216;
    float _1252 = _1240 * _1206;
    float _1254 = _1176 * _1216;
    float _1256 = _1188 * _1216;
    float _1258 = -_1238;
    float _1260 = _1170 * _1258;
    float _1262 = fma(_1214, _1246, _1248);
    float _1264 = _1148 * _1250;
    float _1266 = _1232 * _1238;
    float _1268 = fma(_1230, _1246, _1260);
    float _1270 = fma(_1244, _1252, _1262);
    float _1272 = _1146 * _1254;
    float _1274 = -_1264;
    float _1276 = fma(_1144, _1254, _1274);
    float _1278 = fma(_1226, _1246, _1266);
    float _1280 = fma(_1234, _1252, _1268);
    float _1282 = -_1272;
    float _1284 = fma(_1148, _1256, _1282);
    float _1286 = _1276 * _1270;
    float _1288 = fma(_1218, _1252, _1278);
    float _1290 = _1144 * _1256;
    float _1292 = _1284 * _1270;
    float _1294 = fma(_1256, _1280, _1286);
    float _1296 = -_1290;
    float _1298 = fma(_1146, _1250, _1296);
    float _1300 = fma(_1250, _1280, _1292);
    float _1302 = fma(_1146, _1288, _1294);
    float _1304 = _1298 * _1270;
    float _1306 = fma(_1144, _1288, _1300);
    float _1308 = _804 + _1302;
    float _1310 = fma(_1254, _1280, _1304);
    float _1312 = _420 + _1306;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1316 = _1308 + _1314;
    float _1318 = fma(_1148, _1288, _1310);
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1322 = _1312 + _1320;
    float _1324 = _1316 * _1316;
    float _1326 = _750 + _1318;
    float _1328 = fma(_1322, _1322, _1324);
    float _1330 = sqrt(_1328);
    bool _1332 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1318;
    float _1336 = _1310;
    float _1338 = _1308;
    float _1340 = _1330;
    if (!_1332)
    {
        _1334 = _1312;
    }
    float _1342 = _1334;
    float _1344 = _1342;
    if (!_1332)
    {
        _1336 = _1326;
    }
    float _1346 = _1336;
    bool _1348 = !_1332;
    float _1350 = _1346;
    if (!_1348)
    {
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1356 = _1330 + _1354;
        float _1358 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1360 = rsqrt(_1328);
        float _1362 = _1356 * _1352;
        float _1364 = _1362 * 0.15915493667125701904296875;
        float _1366 = _1364 * 6.283185482025146484375;
        float _1368 = cos(_1366);
        float _1370 = _1364 * 6.283185482025146484375;
        float _1372 = sin(_1370);
        float _1374 = _1368 + (-1.0);
        float _1376 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1378 = fma(_1372, _1358, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1380 = fma(_1326, _1368, _1376);
        float _1382 = _1360 * _1378;
        float _1384 = fma(_1322, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1386 = fma(_1316, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1344 = _1384;
        _1350 = _1380;
        _1338 = _1386;
        _1340 = _1376;
    }
    float _1388 = _1344;
    float _1390 = _1350;
    float _1392 = _1338;
    float _1394 = _1340;
    float _1396 = -_930;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1388);
    float _1400 = -_928;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1404 = -_938;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1392);
    float _1408 = _1402;
    float _1410 = _1398;
    float _1412 = _1406;
    float _1414 = _1394;
    if (!_1142)
    {
        float _1416 = _946 * _946;
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1420 = -_804;
        float _1422 = _1420 + _1392;
        float _1424 = fma(_958, _958, _1416);
        float _1426 = fma(_964, _964, _1424);
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1430 = sqrt(_1426);
        float _1432 = 1.0 / _1128;
        float _1434 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1436 = precise::min(_1430, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1438 = _1436 * _1418;
        float _1440 = _1438 * _1432;
        float _1442 = -_420;
        float _1444 = _1442 + _1388;
        float _1446 = -_750;
        float _1448 = _1446 + _1390;
        float _1450 = _1434 * _1440;
        float _1452 = _1422 * _1440;
        float _1454 = fma(_1444, _1450, _942);
        float _1456 = fma(_1448, _1450, _934);
        float _1458 = fma(_1434, _1452, _952);
        _1408 = _1456;
        _1410 = _1454;
        _1412 = _1458;
        _1414 = _1440;
    }
    float _1460 = _1408;
    float _1462 = _1410;
    float _1464 = _1412;
    float _1466 = _1414;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1470 = _1460 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1462 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1478 = _1464 + _1476;
    float _1480 = _1470 * _1470;
    float _1482 = fma(_1474, _1474, _1480);
    float _1484 = fma(_1478, _1478, _1482);
    float _1486 = rsqrt(_1484);
    float _1488 = sqrt(_1484);
    float _1490 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1492 = _1474 * _1490;
    float _1494 = _1478 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 + _1498;
    float _1502 = sqrt(_1500);
    bool _1504 = _1502 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = _1502 + _1506;
    float _1510 = _1486;
    float _1512 = _1508;
    float _1514 = _1466;
    float _1516 = _1470;
    float _1518 = _1490;
    if (_1504)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1520;
    }
    float _1522 = _1510;
    float _1524 = _1522;
    if (_1504)
    {
        float _1526 = _1508 * _1522;
        _1512 = _1526;
    }
    float _1528 = _1512;
    if (_1504)
    {
        float _1530 = rsqrt(_1500);
        _1524 = _1530;
    }
    float _1532 = _1524;
    float _1534 = _1532;
    if (_1504)
    {
        float _1536 = _1528 * 0.15915493667125701904296875;
        _1514 = _1536;
    }
    float _1538 = _1514;
    float _1540 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1542 = _1478;
    float _1544 = _1538;
    if (_1504)
    {
        float _1546 = _1538 * 6.283185482025146484375;
        float _1548 = sin(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    float _1552 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1554 = precise::max(0.0, _1540);
    float _1556 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1552);
    float _1558 = _1128;
    float _1560 = _1554;
    if (_1504)
    {
        float _1562 = _1538 * 6.283185482025146484375;
        float _1564 = cos(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = -_1490;
    float _1570 = -_1554;
    float _1572 = fma(_1470, _1568, _1570);
    if (_1504)
    {
        float _1574 = _1572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1574;
    }
    float _1576 = _1516;
    float _1578 = _1550;
    float _1580 = _1576;
    if (_1504)
    {
        float _1582 = fma(_1550, _1576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1578 = _1582;
    }
    float _1584 = _1578;
    float _1586 = _1584;
    if (!_1504)
    {
        _1580 = _1572;
    }
    float _1588 = _1580;
    float _1590 = _1588;
    if (_1504)
    {
        float _1592 = _1532 * _1584;
        _1518 = _1592;
    }
    float _1594 = _1518;
    if (!_1504)
    {
        _1534 = _1492;
    }
    float _1596 = _1534;
    float _1598 = _1596;
    float _1600 = _1566;
    if (_1504)
    {
        float _1602 = _1566 + (-1.0);
        _1560 = _1602;
    }
    float _1604 = _1560;
    float _1606 = _1604;
    if (_1504)
    {
        float _1608 = _1492 * _1594;
        _1598 = _1608;
    }
    float _1610 = _1598;
    if (!_1504)
    {
        _1586 = _1496;
    }
    float _1612 = _1586;
    float _1614 = _1612;
    if (_1504)
    {
        float _1616 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1616;
    }
    float _1618 = _1544;
    if (!_1504)
    {
        _1606 = _1494;
    }
    float _1620 = _1606;
    float _1622 = _1620;
    if (_1504)
    {
        float _1624 = _1494 * _1594;
        _1622 = _1624;
    }
    float _1626 = _1622;
    if (_1504)
    {
        float _1628 = _1610 * _1610;
        _1614 = _1628;
    }
    float _1630 = _1614;
    if (_1504)
    {
        float _1632 = fma(_1572, _1566, _1618);
        _1590 = _1632;
    }
    float _1634 = _1590;
    if (!_1504)
    {
        _1600 = _1498;
    }
    float _1636 = _1600;
    float _1638 = _1636;
    if (_1504)
    {
        float _1640 = _1626 * _1626;
        _1638 = _1640;
    }
    float _1642 = _1638;
    float _1644 = fma(_1634, _1634, _1630);
    float _1646 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1648 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1650 = _1644 + _1642;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1654 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1652);
    float _1656 = precise::clamp(_1654, 0.0, 1.0);
    float _1658 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1646);
    float _1660 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1662 = rsqrt(_1650);
    float _1664 = -_1656;
    float _1666 = _1664 + 1.0;
    float _1668 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1658);
    float _1670 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1660);
    float _1674 = _1668 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1676 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1670);
    float _1678 = abs(_1666);
    float _1680 = log2(_1678);
    float _1682 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1672);
    float _1684 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1686 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1676);
    float _1688 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1690 = -_1684;
    float _1692 = fma(_1690, _1648, 1.0);
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1696 = _1662 * _1610;
    float _1698 = _1662 * _1634;
    float _1700 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1702 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1556);
    float _1704 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1706 = _1662 * _1626;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1700);
    float _1710 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1712 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1714 = -_1704;
    float _1716 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1714);
    float _1718 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1708);
    float _1720 = log2(_1692);
    float _1722 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1724 = -_1706;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1716);
    float _1728 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1718);
    float _1730 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1732 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1722);
    float _1734 = fma(_1726, -0.5, 0.5);
    float _1736 = exp2(_1712);
    float _1738 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1730);
    float _1740 = fma(_1726, 0.5, 0.5);
    float _1742 = _1698 + 1.0;
    float _1744 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1732);
    float _1746 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1738);
    float _1748 = fma(_1740, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1750 = 1.0 / _1728;
    float _1752 = fma(_1740, _1748, -0.212114393711090087890625);
    float _1754 = fma(_1740, _1752, 1.570728778839111328125);
    float _1756 = sqrt(_1734);
    float _1758 = -_1698;
    float _1760 = fma(_1736, _1742, _1758);
    float _1762 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1746);
    float _1764 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1744);
    float _1766 = _1720 * 0.693147182464599609375;
    float _1768 = _1762 * _1750;
    float _1770 = _1764 * _1750;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1774 = fma(_1760, 0.5, 0.5);
    float _1776 = fma(_1768, 0.5, 0.5);
    float _1778 = fma(_1770, -0.5, 0.5);
    float _1780 = _1756 * 0.636619746685028076171875;
    float3 _4716 = float3(_1776, _1778, _1772);
    float _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4716, float3(0.0), isnan(_4716)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4716, float3(0.0), isnan(_4716)), level(0.0)).x;
    float _1784 = -_1754;
    float _1786 = fma(_1780, _1784, 1.0);
    float3 _4732 = float3(_1776, _1778, _1772);
    float4 _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4732, float3(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4732, float3(0.0), isnan(_4732)), level(0.0)).xyzw;
    float _1791 = _1789.x;
    float _1793 = _1789.y;
    float _1795 = _1789.z;
    float _1797 = _1789.w;
    float2 _4749 = float2(_1786, _1774);
    float3 _1801 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4749, float2(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4749, float2(0.0), isnan(_4749)), level(0.0)).xyz;
    float _1803 = _1801.x;
    float _1805 = _1801.y;
    float _1807 = _1801.z;
    float _1809 = in.m_59.x;
    float _1811 = in.m_59.y;
    float _1813 = in.m_59.z;
    bool _1815 = _1152 != 0.0;
    bool _1817 = isnan(_1152);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    float _1825 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1827 = _1228 * _1298;
    float _1829 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1831 = _1150 == 0.0;
    bool _1833 = !_1823;
    bool _1835 = _1831 && _1833;
    out.m_61.x = _1462;
    out.m_61.y = _1460;
    out.m_61.z = _1464;
    float _1837 = -_1170;
    float _1839 = fma(_1837, _1254, _1827);
    float _1841 = exp2(_1825);
    bool _1843 = _1154 == 0.0;
    bool _1845 = _1843 && _1835;
    float _1847 = _1228 * _1276;
    float _1849 = fma(_1232, _1148, _1839);
    float _1851 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1829);
    out.m_45.x = 1.0;
    float _1853 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1855 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1857 = _1811;
    float _1859 = _1809;
    float _1861 = _1813;
    if (!_1845)
    {
        float _1863 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1811);
        _1857 = _1863;
    }
    float _1865 = _1857;
    float _1867 = _1228 * _1284;
    if (!_1845)
    {
        float _1869 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1809);
        _1859 = _1869;
    }
    float _1871 = _1859;
    if (!_1845)
    {
        float _1873 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1813);
        _1861 = _1873;
    }
    float _1875 = _1861;
    float _1877 = _1214 * _1284;
    float _1879 = _1214 * _1298;
    float _1881 = -_1170;
    float _1883 = fma(_1881, _1250, _1867);
    float _1885 = _1214 * _1276;
    float _1887 = -_1170;
    float _1889 = fma(_1887, _1256, _1847);
    float _1891 = _1244 * _1284;
    float _1893 = _1244 * _1298;
    float _1895 = fma(_1230, _1250, _1877);
    float _1897 = fma(_1230, _1254, _1879);
    float _1899 = fma(_1232, _1144, _1883);
    float _1901 = _1244 * _1276;
    float _1903 = fma(_1230, _1256, _1885);
    float _1905 = fma(_1232, _1146, _1889);
    float _1907 = fma(_1234, _1250, _1891);
    float _1909 = fma(_1234, _1254, _1893);
    float _1911 = fma(_1226, _1144, _1895);
    float _1913 = fma(_1226, _1148, _1897);
    float _1915 = _1899 * _1865;
    float _1917 = _1849 * _1865;
    float _1919 = -_1841;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1234, _1256, _1901);
    float _1925 = fma(_1226, _1146, _1903);
    float _1927 = _1905 * _1865;
    float _1929 = fma(_1218, _1144, _1907);
    float _1931 = fma(_1218, _1148, _1909);
    float _1933 = fma(_1911, _1871, _1915);
    float _1935 = fma(_1913, _1871, _1917);
    float _1937 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = fma(_1218, _1146, _1923);
    float _1941 = fma(_1925, _1871, _1927);
    float _1943 = fma(_1929, _1875, _1933);
    float _1945 = fma(_1931, _1875, _1935);
    float _1947 = _1855 + _1728;
    float _1949 = fma(_1939, _1875, _1941);
    out.gl_Position.x = _1762;
    out.gl_Position.y = _1764;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1728;
    float _1951 = _1947 * 0.5;
    float _1953 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1943;
    out.m_63.y = _1945;
    out.m_63.z = _1949;
    out.m_65.z = _1951;
    out.m_65.w = _1728;
    out.m_67.w = _1953;
    float _1955 = _1937 * _1782;
    float _1957 = -_1937;
    float _1959 = _1957 + 1.0;
    float _1961 = _1797 * _1955;
    float _1963 = _1797 * _1959;
    float _1965 = _1807 * _1955;
    float _1967 = fma(_1803, _1961, _1791);
    float _1969 = fma(_1805, _1961, _1793);
    float _1971 = fma(_1797, _1965, _1795);
    out.m_69.x = _1967;
    out.m_69.y = _1969;
    out.m_69.z = _1971;
    out.m_69.w = _1963;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _252 = false;
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
        float _2028 = as_type<float>(_104);
        out.gl_Position.z = _2028;
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
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2097 = as_type<float>(_142);
        out.gl_Position.z = _2097;
    }
    if (_136)
    {
        return out;
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _156 = _154 != 0;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _148 * _146;
    float _164 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _166 = _164 * 6.283185482025146484375;
    float _168 = floor(_164);
    float _170 = _166 * 0.15915493667125701904296875;
    bool _172 = !_152;
    int _174 = _172 ? 0 : 1;
    int _176 = abs(_174);
    float _178 = _170 * 6.283185482025146484375;
    float _180 = cos(_178);
    bool _182 = !_160;
    int _184 = _182 ? 0 : 1;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _188 = abs(_184);
    float _190 = -_168;
    float _192 = _164 + _190;
    bool _194 = !_156;
    int _196 = _194 ? 0 : 1;
    float _198 = float(_176);
    int _200 = abs(_196);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _206 = fma(_180, 0.5, 0.5);
    float _208 = abs(_204);
    float _210 = _198 * _208;
    bool _212 = _192 < 0.5;
    float _214 = float(_212);
    float _216 = float(_188);
    float _218 = -_206;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _222 = float(_200);
    float _224 = -_214;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _228 = fma(_216, _220, _210);
    float _230 = abs(_226);
    float _232 = fma(_222, _230, _228);
    bool _234 = !_186;
    float _250;
    if (!_234)
    {
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_88);
        float _256 = 1.0 / _254;
        float _258 = _122 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = in.m_42.x;
    float _264 = in.m_42.y;
    float _266 = in.m_42.z;
    float _268 = _144 * 2.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _260 + _270;
    float _274 = in.m_49.y;
    float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _278 = log2(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = in.m_49.z;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _296 = _294 != 0;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = floor(_268);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = _260 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _318 = _260 + _316;
    float _320 = 1.0 / _282;
    float _322 = _278 * _122;
    float _324 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _328 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _330 = isnan(_260);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _326);
    float _342 = 1.0 / _300;
    bool _344 = _310 > 0.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _346;
    bool _350 = _310 >= 0.0;
    bool _352 = isnan(_310);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    float _360 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _368 = 1.0 / _304;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _372 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = _260 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _260 + _378;
    float _382 = _370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _384 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _372);
    float _386 = _376 * _320;
    float _388 = 1.0 / _308;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _392 = _144 + _274;
    float _394 = _380 * _342;
    float _396 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _398 = _392 + (-1.0);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _400;
    float _404 = 1.0 / _348;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _412 = _260 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _418 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _384 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _422 = _272 * _388;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _424;
    out.m_51.x = _382;
    out.m_51.y = _396;
    out.m_51.z = _418;
    float _428 = 1.0 / _366;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _432 = _260 + _430;
    float _434 = _274 + (-0.5);
    float _436 = _314 * _404;
    float _438 = _432 * _368;
    float _440 = 1.0 / _426;
    int _442 = _358 ? 0 : 1;
    float _444 = _274 * 2.0;
    float _446 = _284 * 2.0;
    float _448 = _144 + _284;
    float _450 = floor(_444);
    float _452 = _274 + _284;
    float _454 = _448 + (-1.0);
    float _456 = _318 * _428;
    bool _458 = !_288;
    int _460 = _458 ? 0 : 1;
    float _462 = _452 + (-1.0);
    float _464 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _466 = floor(_446);
    float _468 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _470 = _412 * _440;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _472;
    int _476 = ~_442;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _482;
    int _486 = _480;
    if (!_344)
    {
        int _488 = ~_442;
        int _490 = _488 + 1;
        _486 = _490;
    }
    int _492 = _486;
    float _494 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _362);
    float _496 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _340);
    bool _498 = _450 > 0.0;
    float _500 = fma(_484, _386, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _502 = _450 >= 0.0;
    bool _504 = isnan(_450);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _528;
    bool _532 = _466 > 0.0;
    float _534 = fma(_474, _386, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _536 = _466 >= 0.0;
    bool _538 = isnan(_466);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    float _546 = fma(_514, _386, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _548 = fma(_518, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _550 = fma(_522, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _552 = fma(_526, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _554 = fma(_530, _438, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _556 = exp2(_322);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _586 = fma(_564, _422, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _588 = fma(_568, _422, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _590 = fma(_560, _438, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _592 = fma(_416, _422, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _594 = fma(_572, _436, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _596 = fma(_576, _436, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _598 = fma(_402, _438, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_580, _436, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    bool _602 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _604 = isnan(_260);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_584, _456, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _616 = -_338;
    float _618 = _616 + 1.0;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    bool _628 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _630 = isnan(_260);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = _612 * _618;
    float _642 = fma(_622, _456, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _644 = -_612;
    float _646 = _644 + 1.0;
    float _648 = fma(_626, _456, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _652 = 1.0 + _650;
    bool _654 = !_292;
    int _656 = _654 ? 0 : 1;
    float _658 = -_556;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = _638 * _646;
    bool _674 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _676 = isnan(_260);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -_638;
    float _688 = _686 + 1.0;
    float _690 = 1.0 / _652;
    float _692 = _670 ? _660 : 0.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _694;
    bool _698 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _700 = isnan(1.0);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _706 = _702 || _704;
    float _708 = _684 * _688;
    bool _710 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _712 = isnan(_260);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _730;
    bool _734 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _736 = isnan(_260);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = _720 * _724;
    float _748 = fma(_728, _470, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _750 = _494 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _752 = -_720;
    float _754 = _752 + 1.0;
    float _756 = fma(_696, _470, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    bool _758 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _760 = isnan(_260);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = fma(_732, _470, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _774 = _750 + _772;
    float _776 = _744 * _754;
    float _778 = -_744;
    float _780 = _778 + 1.0;
    bool _782 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _784 = isnan(_260);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = _548;
    if (_706)
    {
        float _796 = _692 * _690;
        _126 = _796;
    }
    float _798 = _126;
    float _800 = -_768;
    float _802 = _800 + 1.0;
    float _804 = _496 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _420 + _806;
    float _810 = _774 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _812 = _768 * _780;
    float _814 = _792 * _802;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _818 = _804 + _816;
    float _820 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[28].x, _810);
    float _822 = -_792;
    float _824 = _822 + 1.0;
    float _826 = _534 * _814;
    float _828 = _500 * _814;
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[28].z, _820);
    float _832 = _546 * _814;
    float _834 = _774 * _774;
    float _836 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].y, _828);
    int _838 = _510 ? 0 : 1;
    float _840 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].x, _826);
    bool _842 = _830 >= 0.0;
    float _844 = fma(_808, _808, _834);
    float _846 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].z, _832);
    float _848 = fma(_550, _812, _836);
    float _850 = in.m_53.x;
    float _852 = in.m_53.y;
    float _854 = in.m_53.z;
    int _856 = abs(_656);
    float _858 = fma(_818, _818, _844);
    float _860 = float(_492);
    float _862 = fma(_548, _812, _840);
    float _864 = float(_856);
    float _866 = fma(_552, _812, _846);
    int _868 = ~_838;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    float _874 = rsqrt(_858);
    int _876 = _872;
    if (_842)
    {
        _794 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _878 = _794;
    float _880 = _864 * _860;
    int _882 = as_type<int>(_878);
    if (!_498)
    {
        int _884 = ~_838;
        int _886 = _884 + 1;
        _876 = _886;
    }
    int _888 = _876;
    float _890 = fma(_590, _776, _848);
    int _892 = _544 ? 0 : 1;
    float _894 = _880 * (-2.0);
    if (_842)
    {
        float _896 = _878 * 5.0;
        _882 = as_type<int>(_896);
    }
    int _898 = _882;
    int _900 = ~_892;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    float _906 = fma(_468, _894, _468);
    bool _908 = !_296;
    int _910 = _908 ? 0 : 1;
    int _912 = _904;
    if (_842)
    {
        out.m_45.x = 0.0;
    }
    if (!_532)
    {
        int _914 = ~_892;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = fma(_554, _776, _862);
    float _922 = fma(_598, _776, _866);
    if (_842)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3328 = as_type<float>(_898);
        out.gl_Position.z = _3328;
    }
    float _924 = fma(_894, _852, _852);
    int _926 = abs(_910);
    float _928 = _774 * _874;
    float _930 = _808 * _874;
    if (_842)
    {
        return out;
    }
    float _932 = -_928;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    int _936 = abs(_460);
    float _938 = _818 * _874;
    float _940 = -_930;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[18].w, _420);
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _934 + _944;
    float _948 = float(_936);
    float _950 = -_938;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _804);
    float _954 = float(_918);
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _958 = _942 + _956;
    float _960 = _946 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _964 = _952 + _962;
    float _966 = _144 + (-0.5);
    float _968 = _948 * _954;
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[28].x, _960);
    float _972 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[196].y, _924);
    float _974 = _968 * (-2.0);
    float _976 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[28].z, _970);
    float _978 = float(_888);
    float _980 = fma(_906, _798, _972);
    float _982 = fma(_974, _850, _850);
    float _984 = fma(_408, _974, _408);
    bool _986 = _976 >= 0.0;
    float _988 = fma(_586, _746, _920);
    float _990 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _982);
    float _992 = fma(_588, _746, _890);
    float _994 = fma(_592, _746, _922);
    float _996 = _980 * 0.15915493667125701904296875;
    float _998 = fma(_984, _798, _990);
    float _1000 = float(_926);
    float _1002 = -_928;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    float _1006 = _996 * 6.283185482025146484375;
    float _1008 = sin(_1006);
    float _1010 = _998 * 0.15915493667125701904296875;
    float _1012 = -_930;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _1016 = _1000 * _978;
    float _1018 = _976;
    if (_986)
    {
        _1018 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1020 = _1018;
    float _1022 = _1004 * _1004;
    int _1024 = as_type<int>(_1020);
    if (_986)
    {
        out.m_45.x = 0.0;
    }
    float _1026 = _996 * 6.283185482025146484375;
    float _1028 = cos(_1026);
    if (_986)
    {
        float _1030 = _1020 * 5.0;
        _1024 = as_type<int>(_1030);
    }
    int _1032 = _1024;
    float _1034 = fma(_594, _708, _988);
    float _1036 = fma(_1014, _1014, _1022);
    float _1038 = -_938;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    if (_986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3534 = as_type<float>(_1032);
        out.gl_Position.z = _3534;
    }
    float _1042 = _1010 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    if (_986)
    {
        return out;
    }
    float _1046 = -_750;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1050 = in.m_55.x;
    float _1052 = in.m_55.y;
    float _1054 = in.m_55.z;
    float _1056 = fma(_1040, _1040, _1036);
    float _1058 = -_420;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1048 * _1048;
    float _1064 = _1016 * (-2.0);
    float _1066 = -_804;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1070 = fma(_596, _708, _992);
    float _1072 = fma(_1060, _1060, _1062);
    float _1074 = fma(_600, _708, _994);
    float _1076 = fma(_464, _1064, _464);
    float _1078 = fma(_1064, _854, _854);
    float _1080 = fma(_1068, _1068, _1072);
    float _1082 = _284 + (-0.5);
    float _1084 = fma(_614, _672, _1034);
    float _1086 = fma(_642, _672, _1070);
    float _1088 = fma(_648, _672, _1074);
    float _1090 = sqrt(_1056);
    float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1078);
    float _1094 = fma(_748, _640, _1084);
    float _1096 = fma(_756, _640, _1086);
    float _1098 = fma(_770, _640, _1088);
    float _1100 = fma(_1076, _798, _1092);
    float _1102 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1094);
    float _1104 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1096);
    float _1106 = rsqrt(_1080);
    float _1108 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[150].z, _1098);
    float _1110 = _1102 * _1050;
    float _1112 = _1104 * _1052;
    float _1114 = _1100 * 0.15915493667125701904296875;
    float _1116 = _1108 * _1054;
    float _1118 = _232 * _1110;
    float _1120 = _232 * _1112;
    float _1122 = _1010 * 6.283185482025146484375;
    float _1124 = cos(_1122);
    float _1126 = _232 * _1116;
    float _1128 = _874 * _1090;
    float _1130 = _1044 * _1008;
    float _1132 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1136 = isnan(0.5);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1142 = _1138 || _1140;
    float _1144 = _1060 * _1106;
    float _1146 = _1068 * _1106;
    float _1148 = _1048 * _1106;
    float _1150 = in.m_57.x;
    float _1152 = in.m_57.y;
    float _1154 = in.m_57.z;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1158 = _1144 * _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1162 = _1146 * _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1166 = _1148 * _1164;
    float _1168 = _1114 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1174 = -_1158;
    float _1176 = fma(_1146, _1172, _1174);
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1180 = -_1162;
    float _1182 = fma(_1148, _1178, _1180);
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1186 = -_1166;
    float _1188 = fma(_1144, _1184, _1186);
    float _1190 = _1124 * _1028;
    float _1192 = _1176 * _1176;
    float _1194 = _1128 * _1132;
    float _1196 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1198 = _1114 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = fma(_1182, _1182, _1192);
    float _1204 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1206 = _1128 * _1196;
    float _1208 = fma(_1188, _1188, _1202);
    float _1210 = _1124 * _1008;
    float _1212 = _1128 * _1204;
    float _1214 = fma(_1170, _1190, _1130);
    float _1216 = rsqrt(_1208);
    float _1218 = fma(_1170, _1130, _1190);
    float _1220 = _1044 * _1028;
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1152);
    float _1224 = -_1210;
    float _1226 = fma(_1170, _1220, _1224);
    float _1228 = _1124 * _1200;
    float _1230 = _1028 * _1200;
    float _1232 = _1044 * _1200;
    float _1234 = _1008 * _1200;
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1150);
    float _1238 = _1222 * _1194;
    float _1240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1154);
    float _1242 = -_1220;
    float _1244 = fma(_1170, _1210, _1242);
    float _1246 = _1236 * _1212;
    float _1248 = _1228 * _1238;
    float _1250 = _1182 * _1216;
    float _1252 = _1240 * _1206;
    float _1254 = _1176 * _1216;
    float _1256 = _1188 * _1216;
    float _1258 = -_1238;
    float _1260 = _1170 * _1258;
    float _1262 = fma(_1214, _1246, _1248);
    float _1264 = _1148 * _1250;
    float _1266 = _1232 * _1238;
    float _1268 = fma(_1230, _1246, _1260);
    float _1270 = fma(_1244, _1252, _1262);
    float _1272 = _1146 * _1254;
    float _1274 = -_1264;
    float _1276 = fma(_1144, _1254, _1274);
    float _1278 = fma(_1226, _1246, _1266);
    float _1280 = fma(_1234, _1252, _1268);
    float _1282 = -_1272;
    float _1284 = fma(_1148, _1256, _1282);
    float _1286 = _1276 * _1270;
    float _1288 = fma(_1218, _1252, _1278);
    float _1290 = _1144 * _1256;
    float _1292 = _1284 * _1270;
    float _1294 = fma(_1256, _1280, _1286);
    float _1296 = -_1290;
    float _1298 = fma(_1146, _1250, _1296);
    float _1300 = fma(_1250, _1280, _1292);
    float _1302 = fma(_1146, _1288, _1294);
    float _1304 = _1298 * _1270;
    float _1306 = fma(_1144, _1288, _1300);
    float _1308 = _804 + _1302;
    float _1310 = fma(_1254, _1280, _1304);
    float _1312 = _420 + _1306;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1316 = _1308 + _1314;
    float _1318 = fma(_1148, _1288, _1310);
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1322 = _1312 + _1320;
    float _1324 = _1316 * _1316;
    float _1326 = _750 + _1318;
    float _1328 = fma(_1322, _1322, _1324);
    float _1330 = sqrt(_1328);
    bool _1332 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1318;
    float _1336 = _1310;
    float _1338 = _1308;
    float _1340 = _1330;
    if (!_1332)
    {
        _1334 = _1312;
    }
    float _1342 = _1334;
    float _1344 = _1342;
    if (!_1332)
    {
        _1336 = _1326;
    }
    float _1346 = _1336;
    bool _1348 = !_1332;
    float _1350 = _1346;
    if (!_1348)
    {
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1356 = _1330 + _1354;
        float _1358 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1360 = rsqrt(_1328);
        float _1362 = _1356 * _1352;
        float _1364 = _1362 * 0.15915493667125701904296875;
        float _1366 = _1364 * 6.283185482025146484375;
        float _1368 = cos(_1366);
        float _1370 = _1364 * 6.283185482025146484375;
        float _1372 = sin(_1370);
        float _1374 = _1368 + (-1.0);
        float _1376 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1378 = fma(_1372, _1358, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1380 = fma(_1326, _1368, _1376);
        float _1382 = _1360 * _1378;
        float _1384 = fma(_1322, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1386 = fma(_1316, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1344 = _1384;
        _1350 = _1380;
        _1338 = _1386;
        _1340 = _1376;
    }
    float _1388 = _1344;
    float _1390 = _1350;
    float _1392 = _1338;
    float _1394 = _1340;
    float _1396 = -_930;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1388);
    float _1400 = -_928;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1404 = -_938;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1392);
    float _1408 = _1402;
    float _1410 = _1398;
    float _1412 = _1406;
    float _1414 = _1394;
    if (!_1142)
    {
        float _1416 = _946 * _946;
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1420 = -_804;
        float _1422 = _1420 + _1392;
        float _1424 = fma(_958, _958, _1416);
        float _1426 = fma(_964, _964, _1424);
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1430 = sqrt(_1426);
        float _1432 = 1.0 / _1128;
        float _1434 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1436 = precise::min(_1430, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1438 = _1436 * _1418;
        float _1440 = _1438 * _1432;
        float _1442 = -_420;
        float _1444 = _1442 + _1388;
        float _1446 = -_750;
        float _1448 = _1446 + _1390;
        float _1450 = _1434 * _1440;
        float _1452 = _1422 * _1440;
        float _1454 = fma(_1444, _1450, _942);
        float _1456 = fma(_1448, _1450, _934);
        float _1458 = fma(_1434, _1452, _952);
        _1408 = _1456;
        _1410 = _1454;
        _1412 = _1458;
        _1414 = _1440;
    }
    float _1460 = _1408;
    float _1462 = _1410;
    float _1464 = _1412;
    float _1466 = _1414;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1470 = _1460 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1462 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1478 = _1464 + _1476;
    float _1480 = _1470 * _1470;
    float _1482 = fma(_1474, _1474, _1480);
    float _1484 = fma(_1478, _1478, _1482);
    float _1486 = rsqrt(_1484);
    float _1488 = sqrt(_1484);
    float _1490 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1492 = _1474 * _1490;
    float _1494 = _1478 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 + _1498;
    float _1502 = sqrt(_1500);
    bool _1504 = _1502 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = _1502 + _1506;
    float _1510 = _1486;
    float _1512 = _1508;
    float _1514 = _1466;
    float _1516 = _1470;
    float _1518 = _1490;
    if (_1504)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1520;
    }
    float _1522 = _1510;
    float _1524 = _1522;
    if (_1504)
    {
        float _1526 = _1508 * _1522;
        _1512 = _1526;
    }
    float _1528 = _1512;
    if (_1504)
    {
        float _1530 = rsqrt(_1500);
        _1524 = _1530;
    }
    float _1532 = _1524;
    float _1534 = _1532;
    if (_1504)
    {
        float _1536 = _1528 * 0.15915493667125701904296875;
        _1514 = _1536;
    }
    float _1538 = _1514;
    float _1540 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1542 = _1478;
    float _1544 = _1538;
    if (_1504)
    {
        float _1546 = _1538 * 6.283185482025146484375;
        float _1548 = sin(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    float _1552 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1554 = precise::max(0.0, _1540);
    float _1556 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1552);
    float _1558 = _1128;
    float _1560 = _1554;
    if (_1504)
    {
        float _1562 = _1538 * 6.283185482025146484375;
        float _1564 = cos(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = -_1490;
    float _1570 = -_1554;
    float _1572 = fma(_1470, _1568, _1570);
    if (_1504)
    {
        float _1574 = _1572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1574;
    }
    float _1576 = _1516;
    float _1578 = _1550;
    float _1580 = _1576;
    if (_1504)
    {
        float _1582 = fma(_1550, _1576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1578 = _1582;
    }
    float _1584 = _1578;
    float _1586 = _1584;
    if (!_1504)
    {
        _1580 = _1572;
    }
    float _1588 = _1580;
    float _1590 = _1588;
    if (_1504)
    {
        float _1592 = _1532 * _1584;
        _1518 = _1592;
    }
    float _1594 = _1518;
    if (!_1504)
    {
        _1534 = _1492;
    }
    float _1596 = _1534;
    float _1598 = _1596;
    float _1600 = _1566;
    if (_1504)
    {
        float _1602 = _1566 + (-1.0);
        _1560 = _1602;
    }
    float _1604 = _1560;
    float _1606 = _1604;
    if (_1504)
    {
        float _1608 = _1492 * _1594;
        _1598 = _1608;
    }
    float _1610 = _1598;
    if (!_1504)
    {
        _1586 = _1496;
    }
    float _1612 = _1586;
    float _1614 = _1612;
    if (_1504)
    {
        float _1616 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1616;
    }
    float _1618 = _1544;
    if (!_1504)
    {
        _1606 = _1494;
    }
    float _1620 = _1606;
    float _1622 = _1620;
    if (_1504)
    {
        float _1624 = _1494 * _1594;
        _1622 = _1624;
    }
    float _1626 = _1622;
    if (_1504)
    {
        float _1628 = _1610 * _1610;
        _1614 = _1628;
    }
    float _1630 = _1614;
    if (_1504)
    {
        float _1632 = fma(_1572, _1566, _1618);
        _1590 = _1632;
    }
    float _1634 = _1590;
    if (!_1504)
    {
        _1600 = _1498;
    }
    float _1636 = _1600;
    float _1638 = _1636;
    if (_1504)
    {
        float _1640 = _1626 * _1626;
        _1638 = _1640;
    }
    float _1642 = _1638;
    float _1644 = fma(_1634, _1634, _1630);
    float _1646 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1648 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1650 = _1644 + _1642;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1654 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1652);
    float _1656 = precise::clamp(_1654, 0.0, 1.0);
    float _1658 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1646);
    float _1660 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1662 = rsqrt(_1650);
    float _1664 = -_1656;
    float _1666 = _1664 + 1.0;
    float _1668 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1658);
    float _1670 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1660);
    float _1674 = _1668 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1676 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1670);
    float _1678 = abs(_1666);
    float _1680 = log2(_1678);
    float _1682 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1672);
    float _1684 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1686 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1676);
    float _1688 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1690 = -_1684;
    float _1692 = fma(_1690, _1648, 1.0);
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1696 = _1662 * _1610;
    float _1698 = _1662 * _1634;
    float _1700 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1702 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1556);
    float _1704 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1706 = _1662 * _1626;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1700);
    float _1710 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1712 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1714 = -_1704;
    float _1716 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1714);
    float _1718 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1708);
    float _1720 = log2(_1692);
    float _1722 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1724 = -_1706;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1716);
    float _1728 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1718);
    float _1730 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1732 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1722);
    float _1734 = fma(_1726, -0.5, 0.5);
    float _1736 = exp2(_1712);
    float _1738 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1730);
    float _1740 = fma(_1726, 0.5, 0.5);
    float _1742 = _1698 + 1.0;
    float _1744 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1732);
    float _1746 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1738);
    float _1748 = fma(_1740, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1750 = 1.0 / _1728;
    float _1752 = fma(_1740, _1748, -0.212114393711090087890625);
    float _1754 = fma(_1740, _1752, 1.570728778839111328125);
    float _1756 = sqrt(_1734);
    float _1758 = -_1698;
    float _1760 = fma(_1736, _1742, _1758);
    float _1762 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1746);
    float _1764 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1744);
    float _1766 = _1720 * 0.693147182464599609375;
    float _1768 = _1762 * _1750;
    float _1770 = _1764 * _1750;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1774 = fma(_1760, 0.5, 0.5);
    float _1776 = fma(_1768, 0.5, 0.5);
    float _1778 = fma(_1770, -0.5, 0.5);
    float _1780 = _1756 * 0.636619746685028076171875;
    float3 _4716 = float3(_1776, _1778, _1772);
    float _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4716, float3(0.0), isnan(_4716)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4716, float3(0.0), isnan(_4716)), level(0.0)).x;
    float _1784 = -_1754;
    float _1786 = fma(_1780, _1784, 1.0);
    float3 _4732 = float3(_1776, _1778, _1772);
    float4 _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4732, float3(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4732, float3(0.0), isnan(_4732)), level(0.0)).xyzw;
    float _1791 = _1789.x;
    float _1793 = _1789.y;
    float _1795 = _1789.z;
    float _1797 = _1789.w;
    float2 _4749 = float2(_1786, _1774);
    float3 _1801 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4749, float2(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4749, float2(0.0), isnan(_4749)), level(0.0)).xyz;
    float _1803 = _1801.x;
    float _1805 = _1801.y;
    float _1807 = _1801.z;
    float _1809 = in.m_59.x;
    float _1811 = in.m_59.y;
    float _1813 = in.m_59.z;
    bool _1815 = _1152 != 0.0;
    bool _1817 = isnan(_1152);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    float _1825 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1827 = _1228 * _1298;
    float _1829 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1831 = _1150 == 0.0;
    bool _1833 = !_1823;
    bool _1835 = _1831 && _1833;
    out.m_61.x = _1462;
    out.m_61.y = _1460;
    out.m_61.z = _1464;
    float _1837 = -_1170;
    float _1839 = fma(_1837, _1254, _1827);
    float _1841 = exp2(_1825);
    bool _1843 = _1154 == 0.0;
    bool _1845 = _1843 && _1835;
    float _1847 = _1228 * _1276;
    float _1849 = fma(_1232, _1148, _1839);
    float _1851 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1829);
    out.m_45.x = 1.0;
    float _1853 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1855 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1857 = _1811;
    float _1859 = _1809;
    float _1861 = _1813;
    if (!_1845)
    {
        float _1863 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1811);
        _1857 = _1863;
    }
    float _1865 = _1857;
    float _1867 = _1228 * _1284;
    if (!_1845)
    {
        float _1869 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1809);
        _1859 = _1869;
    }
    float _1871 = _1859;
    if (!_1845)
    {
        float _1873 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1813);
        _1861 = _1873;
    }
    float _1875 = _1861;
    float _1877 = _1214 * _1284;
    float _1879 = _1214 * _1298;
    float _1881 = -_1170;
    float _1883 = fma(_1881, _1250, _1867);
    float _1885 = _1214 * _1276;
    float _1887 = -_1170;
    float _1889 = fma(_1887, _1256, _1847);
    float _1891 = _1244 * _1284;
    float _1893 = _1244 * _1298;
    float _1895 = fma(_1230, _1250, _1877);
    float _1897 = fma(_1230, _1254, _1879);
    float _1899 = fma(_1232, _1144, _1883);
    float _1901 = _1244 * _1276;
    float _1903 = fma(_1230, _1256, _1885);
    float _1905 = fma(_1232, _1146, _1889);
    float _1907 = fma(_1234, _1250, _1891);
    float _1909 = fma(_1234, _1254, _1893);
    float _1911 = fma(_1226, _1144, _1895);
    float _1913 = fma(_1226, _1148, _1897);
    float _1915 = _1899 * _1865;
    float _1917 = _1849 * _1865;
    float _1919 = -_1841;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1234, _1256, _1901);
    float _1925 = fma(_1226, _1146, _1903);
    float _1927 = _1905 * _1865;
    float _1929 = fma(_1218, _1144, _1907);
    float _1931 = fma(_1218, _1148, _1909);
    float _1933 = fma(_1911, _1871, _1915);
    float _1935 = fma(_1913, _1871, _1917);
    float _1937 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = fma(_1218, _1146, _1923);
    float _1941 = fma(_1925, _1871, _1927);
    float _1943 = fma(_1929, _1875, _1933);
    float _1945 = fma(_1931, _1875, _1935);
    float _1947 = _1855 + _1728;
    float _1949 = fma(_1939, _1875, _1941);
    out.gl_Position.x = _1762;
    out.gl_Position.y = _1764;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1728;
    float _1951 = _1947 * 0.5;
    float _1953 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1943;
    out.m_63.y = _1945;
    out.m_63.z = _1949;
    out.m_65.z = _1951;
    out.m_65.w = _1728;
    out.m_67.w = _1953;
    float _1955 = _1937 * _1782;
    float _1957 = -_1937;
    float _1959 = _1957 + 1.0;
    float _1961 = _1797 * _1955;
    float _1963 = _1797 * _1959;
    float _1965 = _1807 * _1955;
    float _1967 = fma(_1803, _1961, _1791);
    float _1969 = fma(_1805, _1961, _1793);
    float _1971 = fma(_1797, _1965, _1795);
    out.m_69.x = _1967;
    out.m_69.y = _1969;
    out.m_69.z = _1971;
    out.m_69.w = _1963;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _252 = false;
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
        float _2028 = as_type<float>(_104);
        out.gl_Position.z = _2028;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_88);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2097 = as_type<float>(_142);
        out.gl_Position.z = _2097;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _152 = _150 != 0;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _156 = _154 != 0;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _148 * _146;
    float _164 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _166 = _164 * 6.283185482025146484375;
    float _168 = floor(_164);
    float _170 = _166 * 0.15915493667125701904296875;
    bool _172 = !_152;
    int _174 = _172 ? 0 : 1;
    int _176 = abs(_174);
    float _178 = _170 * 6.283185482025146484375;
    float _180 = cos(_178);
    bool _182 = !_160;
    int _184 = _182 ? 0 : 1;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _188 = abs(_184);
    float _190 = -_168;
    float _192 = _164 + _190;
    bool _194 = !_156;
    int _196 = _194 ? 0 : 1;
    float _198 = float(_176);
    int _200 = abs(_196);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _206 = fma(_180, 0.5, 0.5);
    float _208 = abs(_204);
    float _210 = _198 * _208;
    bool _212 = _192 < 0.5;
    float _214 = float(_212);
    float _216 = float(_188);
    float _218 = -_206;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _222 = float(_200);
    float _224 = -_214;
    float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _228 = fma(_216, _220, _210);
    float _230 = abs(_226);
    float _232 = fma(_222, _230, _228);
    bool _234 = !_186;
    float _250;
    if (!_234)
    {
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_88);
        float _256 = 1.0 / _254;
        float _258 = _122 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = in.m_42.x;
    float _264 = in.m_42.y;
    float _266 = in.m_42.z;
    float _268 = _144 * 2.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _260 + _270;
    float _274 = in.m_49.y;
    float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _278 = log2(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = in.m_49.z;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _296 = _294 != 0;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = floor(_268);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _314 = _260 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _318 = _260 + _316;
    float _320 = 1.0 / _282;
    float _322 = _278 * _122;
    float _324 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _328 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _330 = isnan(_260);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _326);
    float _342 = 1.0 / _300;
    bool _344 = _310 > 0.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _346;
    bool _350 = _310 >= 0.0;
    bool _352 = isnan(_310);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    float _360 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _368 = 1.0 / _304;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _372 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = _260 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _260 + _378;
    float _382 = _370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _384 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _372);
    float _386 = _376 * _320;
    float _388 = 1.0 / _308;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _392 = _144 + _274;
    float _394 = _380 * _342;
    float _396 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _398 = _392 + (-1.0);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _400;
    float _404 = 1.0 / _348;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _412 = _260 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _418 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _384 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _422 = _272 * _388;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _424;
    out.m_51.x = _382;
    out.m_51.y = _396;
    out.m_51.z = _418;
    float _428 = 1.0 / _366;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _432 = _260 + _430;
    float _434 = _274 + (-0.5);
    float _436 = _314 * _404;
    float _438 = _432 * _368;
    float _440 = 1.0 / _426;
    int _442 = _358 ? 0 : 1;
    float _444 = _274 * 2.0;
    float _446 = _284 * 2.0;
    float _448 = _144 + _284;
    float _450 = floor(_444);
    float _452 = _274 + _284;
    float _454 = _448 + (-1.0);
    float _456 = _318 * _428;
    bool _458 = !_288;
    int _460 = _458 ? 0 : 1;
    float _462 = _452 + (-1.0);
    float _464 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _466 = floor(_446);
    float _468 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _470 = _412 * _440;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _472;
    int _476 = ~_442;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _482;
    int _486 = _480;
    if (!_344)
    {
        int _488 = ~_442;
        int _490 = _488 + 1;
        _486 = _490;
    }
    int _492 = _486;
    float _494 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _362);
    float _496 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _340);
    bool _498 = _450 > 0.0;
    float _500 = fma(_484, _386, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _502 = _450 >= 0.0;
    bool _504 = isnan(_450);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _528;
    bool _532 = _466 > 0.0;
    float _534 = fma(_474, _386, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _536 = _466 >= 0.0;
    bool _538 = isnan(_466);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    float _546 = fma(_514, _386, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _548 = fma(_518, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _550 = fma(_522, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _552 = fma(_526, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _554 = fma(_530, _438, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _556 = exp2(_322);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _586 = fma(_564, _422, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _588 = fma(_568, _422, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _590 = fma(_560, _438, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _592 = fma(_416, _422, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _594 = fma(_572, _436, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _596 = fma(_576, _436, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _598 = fma(_402, _438, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_580, _436, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    bool _602 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _604 = isnan(_260);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_584, _456, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _616 = -_338;
    float _618 = _616 + 1.0;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    bool _628 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _630 = isnan(_260);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = _612 * _618;
    float _642 = fma(_622, _456, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _644 = -_612;
    float _646 = _644 + 1.0;
    float _648 = fma(_626, _456, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _652 = 1.0 + _650;
    bool _654 = !_292;
    int _656 = _654 ? 0 : 1;
    float _658 = -_556;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = _638 * _646;
    bool _674 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _676 = isnan(_260);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -_638;
    float _688 = _686 + 1.0;
    float _690 = 1.0 / _652;
    float _692 = _670 ? _660 : 0.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _694;
    bool _698 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _700 = isnan(1.0);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _706 = _702 || _704;
    float _708 = _684 * _688;
    bool _710 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _712 = isnan(_260);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _730;
    bool _734 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _736 = isnan(_260);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = _720 * _724;
    float _748 = fma(_728, _470, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _750 = _494 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _752 = -_720;
    float _754 = _752 + 1.0;
    float _756 = fma(_696, _470, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    bool _758 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _760 = isnan(_260);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = fma(_732, _470, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _774 = _750 + _772;
    float _776 = _744 * _754;
    float _778 = -_744;
    float _780 = _778 + 1.0;
    bool _782 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _784 = isnan(_260);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = _548;
    if (_706)
    {
        float _796 = _692 * _690;
        _126 = _796;
    }
    float _798 = _126;
    float _800 = -_768;
    float _802 = _800 + 1.0;
    float _804 = _496 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _420 + _806;
    float _810 = _774 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _812 = _768 * _780;
    float _814 = _792 * _802;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _818 = _804 + _816;
    float _820 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[28].x, _810);
    float _822 = -_792;
    float _824 = _822 + 1.0;
    float _826 = _534 * _814;
    float _828 = _500 * _814;
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[28].z, _820);
    float _832 = _546 * _814;
    float _834 = _774 * _774;
    float _836 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].y, _828);
    int _838 = _510 ? 0 : 1;
    float _840 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].x, _826);
    bool _842 = _830 >= 0.0;
    float _844 = fma(_808, _808, _834);
    float _846 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].z, _832);
    float _848 = fma(_550, _812, _836);
    float _850 = in.m_53.x;
    float _852 = in.m_53.y;
    float _854 = in.m_53.z;
    int _856 = abs(_656);
    float _858 = fma(_818, _818, _844);
    float _860 = float(_492);
    float _862 = fma(_548, _812, _840);
    float _864 = float(_856);
    float _866 = fma(_552, _812, _846);
    int _868 = ~_838;
    int _870 = _868 + 1;
    int _872 = _870 + 1;
    float _874 = rsqrt(_858);
    int _876 = _872;
    if (_842)
    {
        _794 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _878 = _794;
    float _880 = _864 * _860;
    int _882 = as_type<int>(_878);
    if (!_498)
    {
        int _884 = ~_838;
        int _886 = _884 + 1;
        _876 = _886;
    }
    int _888 = _876;
    float _890 = fma(_590, _776, _848);
    int _892 = _544 ? 0 : 1;
    float _894 = _880 * (-2.0);
    if (_842)
    {
        float _896 = _878 * 5.0;
        _882 = as_type<int>(_896);
    }
    int _898 = _882;
    int _900 = ~_892;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    float _906 = fma(_468, _894, _468);
    bool _908 = !_296;
    int _910 = _908 ? 0 : 1;
    int _912 = _904;
    if (_842)
    {
        out.m_45.x = 0.0;
    }
    if (!_532)
    {
        int _914 = ~_892;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = fma(_554, _776, _862);
    float _922 = fma(_598, _776, _866);
    if (_842)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3328 = as_type<float>(_898);
        out.gl_Position.z = _3328;
    }
    float _924 = fma(_894, _852, _852);
    int _926 = abs(_910);
    float _928 = _774 * _874;
    float _930 = _808 * _874;
    if (_842)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _932 = -_928;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    int _936 = abs(_460);
    float _938 = _818 * _874;
    float _940 = -_930;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[18].w, _420);
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _934 + _944;
    float _948 = float(_936);
    float _950 = -_938;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _804);
    float _954 = float(_918);
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _958 = _942 + _956;
    float _960 = _946 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _964 = _952 + _962;
    float _966 = _144 + (-0.5);
    float _968 = _948 * _954;
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[28].x, _960);
    float _972 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[196].y, _924);
    float _974 = _968 * (-2.0);
    float _976 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[28].z, _970);
    float _978 = float(_888);
    float _980 = fma(_906, _798, _972);
    float _982 = fma(_974, _850, _850);
    float _984 = fma(_408, _974, _408);
    bool _986 = _976 >= 0.0;
    float _988 = fma(_586, _746, _920);
    float _990 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _982);
    float _992 = fma(_588, _746, _890);
    float _994 = fma(_592, _746, _922);
    float _996 = _980 * 0.15915493667125701904296875;
    float _998 = fma(_984, _798, _990);
    float _1000 = float(_926);
    float _1002 = -_928;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    float _1006 = _996 * 6.283185482025146484375;
    float _1008 = sin(_1006);
    float _1010 = _998 * 0.15915493667125701904296875;
    float _1012 = -_930;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _808);
    float _1016 = _1000 * _978;
    float _1018 = _976;
    if (_986)
    {
        _1018 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1020 = _1018;
    float _1022 = _1004 * _1004;
    int _1024 = as_type<int>(_1020);
    if (_986)
    {
        out.m_45.x = 0.0;
    }
    float _1026 = _996 * 6.283185482025146484375;
    float _1028 = cos(_1026);
    if (_986)
    {
        float _1030 = _1020 * 5.0;
        _1024 = as_type<int>(_1030);
    }
    int _1032 = _1024;
    float _1034 = fma(_594, _708, _988);
    float _1036 = fma(_1014, _1014, _1022);
    float _1038 = -_938;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    if (_986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3534 = as_type<float>(_1032);
        out.gl_Position.z = _3534;
    }
    float _1042 = _1010 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    if (_986)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1046 = -_750;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1050 = in.m_55.x;
    float _1052 = in.m_55.y;
    float _1054 = in.m_55.z;
    float _1056 = fma(_1040, _1040, _1036);
    float _1058 = -_420;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1048 * _1048;
    float _1064 = _1016 * (-2.0);
    float _1066 = -_804;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1070 = fma(_596, _708, _992);
    float _1072 = fma(_1060, _1060, _1062);
    float _1074 = fma(_600, _708, _994);
    float _1076 = fma(_464, _1064, _464);
    float _1078 = fma(_1064, _854, _854);
    float _1080 = fma(_1068, _1068, _1072);
    float _1082 = _284 + (-0.5);
    float _1084 = fma(_614, _672, _1034);
    float _1086 = fma(_642, _672, _1070);
    float _1088 = fma(_648, _672, _1074);
    float _1090 = sqrt(_1056);
    float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1078);
    float _1094 = fma(_748, _640, _1084);
    float _1096 = fma(_756, _640, _1086);
    float _1098 = fma(_770, _640, _1088);
    float _1100 = fma(_1076, _798, _1092);
    float _1102 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1094);
    float _1104 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1096);
    float _1106 = rsqrt(_1080);
    float _1108 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[150].z, _1098);
    float _1110 = _1102 * _1050;
    float _1112 = _1104 * _1052;
    float _1114 = _1100 * 0.15915493667125701904296875;
    float _1116 = _1108 * _1054;
    float _1118 = _232 * _1110;
    float _1120 = _232 * _1112;
    float _1122 = _1010 * 6.283185482025146484375;
    float _1124 = cos(_1122);
    float _1126 = _232 * _1116;
    float _1128 = _874 * _1090;
    float _1130 = _1044 * _1008;
    float _1132 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1136 = isnan(0.5);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1142 = _1138 || _1140;
    float _1144 = _1060 * _1106;
    float _1146 = _1068 * _1106;
    float _1148 = _1048 * _1106;
    float _1150 = in.m_57.x;
    float _1152 = in.m_57.y;
    float _1154 = in.m_57.z;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1158 = _1144 * _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1162 = _1146 * _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1166 = _1148 * _1164;
    float _1168 = _1114 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1174 = -_1158;
    float _1176 = fma(_1146, _1172, _1174);
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1180 = -_1162;
    float _1182 = fma(_1148, _1178, _1180);
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1186 = -_1166;
    float _1188 = fma(_1144, _1184, _1186);
    float _1190 = _1124 * _1028;
    float _1192 = _1176 * _1176;
    float _1194 = _1128 * _1132;
    float _1196 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1198 = _1114 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = fma(_1182, _1182, _1192);
    float _1204 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1206 = _1128 * _1196;
    float _1208 = fma(_1188, _1188, _1202);
    float _1210 = _1124 * _1008;
    float _1212 = _1128 * _1204;
    float _1214 = fma(_1170, _1190, _1130);
    float _1216 = rsqrt(_1208);
    float _1218 = fma(_1170, _1130, _1190);
    float _1220 = _1044 * _1028;
    float _1222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1152);
    float _1224 = -_1210;
    float _1226 = fma(_1170, _1220, _1224);
    float _1228 = _1124 * _1200;
    float _1230 = _1028 * _1200;
    float _1232 = _1044 * _1200;
    float _1234 = _1008 * _1200;
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1150);
    float _1238 = _1222 * _1194;
    float _1240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1154);
    float _1242 = -_1220;
    float _1244 = fma(_1170, _1210, _1242);
    float _1246 = _1236 * _1212;
    float _1248 = _1228 * _1238;
    float _1250 = _1182 * _1216;
    float _1252 = _1240 * _1206;
    float _1254 = _1176 * _1216;
    float _1256 = _1188 * _1216;
    float _1258 = -_1238;
    float _1260 = _1170 * _1258;
    float _1262 = fma(_1214, _1246, _1248);
    float _1264 = _1148 * _1250;
    float _1266 = _1232 * _1238;
    float _1268 = fma(_1230, _1246, _1260);
    float _1270 = fma(_1244, _1252, _1262);
    float _1272 = _1146 * _1254;
    float _1274 = -_1264;
    float _1276 = fma(_1144, _1254, _1274);
    float _1278 = fma(_1226, _1246, _1266);
    float _1280 = fma(_1234, _1252, _1268);
    float _1282 = -_1272;
    float _1284 = fma(_1148, _1256, _1282);
    float _1286 = _1276 * _1270;
    float _1288 = fma(_1218, _1252, _1278);
    float _1290 = _1144 * _1256;
    float _1292 = _1284 * _1270;
    float _1294 = fma(_1256, _1280, _1286);
    float _1296 = -_1290;
    float _1298 = fma(_1146, _1250, _1296);
    float _1300 = fma(_1250, _1280, _1292);
    float _1302 = fma(_1146, _1288, _1294);
    float _1304 = _1298 * _1270;
    float _1306 = fma(_1144, _1288, _1300);
    float _1308 = _804 + _1302;
    float _1310 = fma(_1254, _1280, _1304);
    float _1312 = _420 + _1306;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1316 = _1308 + _1314;
    float _1318 = fma(_1148, _1288, _1310);
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1322 = _1312 + _1320;
    float _1324 = _1316 * _1316;
    float _1326 = _750 + _1318;
    float _1328 = fma(_1322, _1322, _1324);
    float _1330 = sqrt(_1328);
    bool _1332 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1318;
    float _1336 = _1310;
    float _1338 = _1308;
    float _1340 = _1330;
    if (!_1332)
    {
        _1334 = _1312;
    }
    float _1342 = _1334;
    float _1344 = _1342;
    if (!_1332)
    {
        _1336 = _1326;
    }
    float _1346 = _1336;
    bool _1348 = !_1332;
    float _1350 = _1346;
    if (!_1348)
    {
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1356 = _1330 + _1354;
        float _1358 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1360 = rsqrt(_1328);
        float _1362 = _1356 * _1352;
        float _1364 = _1362 * 0.15915493667125701904296875;
        float _1366 = _1364 * 6.283185482025146484375;
        float _1368 = cos(_1366);
        float _1370 = _1364 * 6.283185482025146484375;
        float _1372 = sin(_1370);
        float _1374 = _1368 + (-1.0);
        float _1376 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1378 = fma(_1372, _1358, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1380 = fma(_1326, _1368, _1376);
        float _1382 = _1360 * _1378;
        float _1384 = fma(_1322, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1386 = fma(_1316, _1382, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1344 = _1384;
        _1350 = _1380;
        _1338 = _1386;
        _1340 = _1376;
    }
    float _1388 = _1344;
    float _1390 = _1350;
    float _1392 = _1338;
    float _1394 = _1340;
    float _1396 = -_930;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1388);
    float _1400 = -_928;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1404 = -_938;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1392);
    float _1408 = _1402;
    float _1410 = _1398;
    float _1412 = _1406;
    float _1414 = _1394;
    if (!_1142)
    {
        float _1416 = _946 * _946;
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1420 = -_804;
        float _1422 = _1420 + _1392;
        float _1424 = fma(_958, _958, _1416);
        float _1426 = fma(_964, _964, _1424);
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1430 = sqrt(_1426);
        float _1432 = 1.0 / _1128;
        float _1434 = _1428 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1436 = precise::min(_1430, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1438 = _1436 * _1418;
        float _1440 = _1438 * _1432;
        float _1442 = -_420;
        float _1444 = _1442 + _1388;
        float _1446 = -_750;
        float _1448 = _1446 + _1390;
        float _1450 = _1434 * _1440;
        float _1452 = _1422 * _1440;
        float _1454 = fma(_1444, _1450, _942);
        float _1456 = fma(_1448, _1450, _934);
        float _1458 = fma(_1434, _1452, _952);
        _1408 = _1456;
        _1410 = _1454;
        _1412 = _1458;
        _1414 = _1440;
    }
    float _1460 = _1408;
    float _1462 = _1410;
    float _1464 = _1412;
    float _1466 = _1414;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1470 = _1460 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1474 = _1462 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1478 = _1464 + _1476;
    float _1480 = _1470 * _1470;
    float _1482 = fma(_1474, _1474, _1480);
    float _1484 = fma(_1478, _1478, _1482);
    float _1486 = rsqrt(_1484);
    float _1488 = sqrt(_1484);
    float _1490 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1492 = _1474 * _1490;
    float _1494 = _1478 * _1490;
    float _1496 = _1492 * _1492;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 + _1498;
    float _1502 = sqrt(_1500);
    bool _1504 = _1502 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = _1502 + _1506;
    float _1510 = _1486;
    float _1512 = _1508;
    float _1514 = _1466;
    float _1516 = _1470;
    float _1518 = _1490;
    if (_1504)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1520;
    }
    float _1522 = _1510;
    float _1524 = _1522;
    if (_1504)
    {
        float _1526 = _1508 * _1522;
        _1512 = _1526;
    }
    float _1528 = _1512;
    if (_1504)
    {
        float _1530 = rsqrt(_1500);
        _1524 = _1530;
    }
    float _1532 = _1524;
    float _1534 = _1532;
    if (_1504)
    {
        float _1536 = _1528 * 0.15915493667125701904296875;
        _1514 = _1536;
    }
    float _1538 = _1514;
    float _1540 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1542 = _1478;
    float _1544 = _1538;
    if (_1504)
    {
        float _1546 = _1538 * 6.283185482025146484375;
        float _1548 = sin(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    float _1552 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1554 = precise::max(0.0, _1540);
    float _1556 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1552);
    float _1558 = _1128;
    float _1560 = _1554;
    if (_1504)
    {
        float _1562 = _1538 * 6.283185482025146484375;
        float _1564 = cos(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = -_1490;
    float _1570 = -_1554;
    float _1572 = fma(_1470, _1568, _1570);
    if (_1504)
    {
        float _1574 = _1572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1516 = _1574;
    }
    float _1576 = _1516;
    float _1578 = _1550;
    float _1580 = _1576;
    if (_1504)
    {
        float _1582 = fma(_1550, _1576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1578 = _1582;
    }
    float _1584 = _1578;
    float _1586 = _1584;
    if (!_1504)
    {
        _1580 = _1572;
    }
    float _1588 = _1580;
    float _1590 = _1588;
    if (_1504)
    {
        float _1592 = _1532 * _1584;
        _1518 = _1592;
    }
    float _1594 = _1518;
    if (!_1504)
    {
        _1534 = _1492;
    }
    float _1596 = _1534;
    float _1598 = _1596;
    float _1600 = _1566;
    if (_1504)
    {
        float _1602 = _1566 + (-1.0);
        _1560 = _1602;
    }
    float _1604 = _1560;
    float _1606 = _1604;
    if (_1504)
    {
        float _1608 = _1492 * _1594;
        _1598 = _1608;
    }
    float _1610 = _1598;
    if (!_1504)
    {
        _1586 = _1496;
    }
    float _1612 = _1586;
    float _1614 = _1612;
    if (_1504)
    {
        float _1616 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1616;
    }
    float _1618 = _1544;
    if (!_1504)
    {
        _1606 = _1494;
    }
    float _1620 = _1606;
    float _1622 = _1620;
    if (_1504)
    {
        float _1624 = _1494 * _1594;
        _1622 = _1624;
    }
    float _1626 = _1622;
    if (_1504)
    {
        float _1628 = _1610 * _1610;
        _1614 = _1628;
    }
    float _1630 = _1614;
    if (_1504)
    {
        float _1632 = fma(_1572, _1566, _1618);
        _1590 = _1632;
    }
    float _1634 = _1590;
    if (!_1504)
    {
        _1600 = _1498;
    }
    float _1636 = _1600;
    float _1638 = _1636;
    if (_1504)
    {
        float _1640 = _1626 * _1626;
        _1638 = _1640;
    }
    float _1642 = _1638;
    float _1644 = fma(_1634, _1634, _1630);
    float _1646 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1648 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1650 = _1644 + _1642;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1654 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1652);
    float _1656 = precise::clamp(_1654, 0.0, 1.0);
    float _1658 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1646);
    float _1660 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1662 = rsqrt(_1650);
    float _1664 = -_1656;
    float _1666 = _1664 + 1.0;
    float _1668 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1658);
    float _1670 = _1460 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1672 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1660);
    float _1674 = _1668 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1676 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1670);
    float _1678 = abs(_1666);
    float _1680 = log2(_1678);
    float _1682 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1672);
    float _1684 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1686 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1676);
    float _1688 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1690 = -_1684;
    float _1692 = fma(_1690, _1648, 1.0);
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1696 = _1662 * _1610;
    float _1698 = _1662 * _1634;
    float _1700 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1702 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1556);
    float _1704 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1706 = _1662 * _1626;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1700);
    float _1710 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1712 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1714 = -_1704;
    float _1716 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1714);
    float _1718 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1708);
    float _1720 = log2(_1692);
    float _1722 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1724 = -_1706;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1716);
    float _1728 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1718);
    float _1730 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1732 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1722);
    float _1734 = fma(_1726, -0.5, 0.5);
    float _1736 = exp2(_1712);
    float _1738 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1730);
    float _1740 = fma(_1726, 0.5, 0.5);
    float _1742 = _1698 + 1.0;
    float _1744 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1732);
    float _1746 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1738);
    float _1748 = fma(_1740, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1750 = 1.0 / _1728;
    float _1752 = fma(_1740, _1748, -0.212114393711090087890625);
    float _1754 = fma(_1740, _1752, 1.570728778839111328125);
    float _1756 = sqrt(_1734);
    float _1758 = -_1698;
    float _1760 = fma(_1736, _1742, _1758);
    float _1762 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1746);
    float _1764 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1744);
    float _1766 = _1720 * 0.693147182464599609375;
    float _1768 = _1762 * _1750;
    float _1770 = _1764 * _1750;
    float _1772 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1774 = fma(_1760, 0.5, 0.5);
    float _1776 = fma(_1768, 0.5, 0.5);
    float _1778 = fma(_1770, -0.5, 0.5);
    float _1780 = _1756 * 0.636619746685028076171875;
    float3 _4716 = float3(_1776, _1778, _1772);
    float _1782 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4716, float3(0.0), isnan(_4716)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4716, float3(0.0), isnan(_4716)), level(0.0)).x;
    float _1784 = -_1754;
    float _1786 = fma(_1780, _1784, 1.0);
    float3 _4732 = float3(_1776, _1778, _1772);
    float4 _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4732, float3(0.0), isnan(_4732)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4732, float3(0.0), isnan(_4732)), level(0.0)).xyzw;
    float _1791 = _1789.x;
    float _1793 = _1789.y;
    float _1795 = _1789.z;
    float _1797 = _1789.w;
    float2 _4749 = float2(_1786, _1774);
    float3 _1801 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4749, float2(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4749, float2(0.0), isnan(_4749)), level(0.0)).xyz;
    float _1803 = _1801.x;
    float _1805 = _1801.y;
    float _1807 = _1801.z;
    float _1809 = in.m_59.x;
    float _1811 = in.m_59.y;
    float _1813 = in.m_59.z;
    bool _1815 = _1152 != 0.0;
    bool _1817 = isnan(_1152);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    float _1825 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1827 = _1228 * _1298;
    float _1829 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1831 = _1150 == 0.0;
    bool _1833 = !_1823;
    bool _1835 = _1831 && _1833;
    out.m_61.x = _1462;
    out.m_61.y = _1460;
    out.m_61.z = _1464;
    float _1837 = -_1170;
    float _1839 = fma(_1837, _1254, _1827);
    float _1841 = exp2(_1825);
    bool _1843 = _1154 == 0.0;
    bool _1845 = _1843 && _1835;
    float _1847 = _1228 * _1276;
    float _1849 = fma(_1232, _1148, _1839);
    float _1851 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1829);
    out.m_45.x = 1.0;
    float _1853 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1855 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1857 = _1811;
    float _1859 = _1809;
    float _1861 = _1813;
    if (!_1845)
    {
        float _1863 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1811);
        _1857 = _1863;
    }
    float _1865 = _1857;
    float _1867 = _1228 * _1284;
    if (!_1845)
    {
        float _1869 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1809);
        _1859 = _1869;
    }
    float _1871 = _1859;
    if (!_1845)
    {
        float _1873 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1813);
        _1861 = _1873;
    }
    float _1875 = _1861;
    float _1877 = _1214 * _1284;
    float _1879 = _1214 * _1298;
    float _1881 = -_1170;
    float _1883 = fma(_1881, _1250, _1867);
    float _1885 = _1214 * _1276;
    float _1887 = -_1170;
    float _1889 = fma(_1887, _1256, _1847);
    float _1891 = _1244 * _1284;
    float _1893 = _1244 * _1298;
    float _1895 = fma(_1230, _1250, _1877);
    float _1897 = fma(_1230, _1254, _1879);
    float _1899 = fma(_1232, _1144, _1883);
    float _1901 = _1244 * _1276;
    float _1903 = fma(_1230, _1256, _1885);
    float _1905 = fma(_1232, _1146, _1889);
    float _1907 = fma(_1234, _1250, _1891);
    float _1909 = fma(_1234, _1254, _1893);
    float _1911 = fma(_1226, _1144, _1895);
    float _1913 = fma(_1226, _1148, _1897);
    float _1915 = _1899 * _1865;
    float _1917 = _1849 * _1865;
    float _1919 = -_1841;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1234, _1256, _1901);
    float _1925 = fma(_1226, _1146, _1903);
    float _1927 = _1905 * _1865;
    float _1929 = fma(_1218, _1144, _1907);
    float _1931 = fma(_1218, _1148, _1909);
    float _1933 = fma(_1911, _1871, _1915);
    float _1935 = fma(_1913, _1871, _1917);
    float _1937 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = fma(_1218, _1146, _1923);
    float _1941 = fma(_1925, _1871, _1927);
    float _1943 = fma(_1929, _1875, _1933);
    float _1945 = fma(_1931, _1875, _1935);
    float _1947 = _1855 + _1728;
    float _1949 = fma(_1939, _1875, _1941);
    out.gl_Position.x = _1762;
    out.gl_Position.y = _1764;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1728;
    float _1951 = _1947 * 0.5;
    float _1953 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1943;
    out.m_63.y = _1945;
    out.m_63.z = _1949;
    out.m_65.z = _1951;
    out.m_65.w = _1728;
    out.m_67.w = _1953;
    float _1955 = _1937 * _1782;
    float _1957 = -_1937;
    float _1959 = _1957 + 1.0;
    float _1961 = _1797 * _1955;
    float _1963 = _1797 * _1959;
    float _1965 = _1807 * _1955;
    float _1967 = fma(_1803, _1961, _1791);
    float _1969 = fma(_1805, _1961, _1793);
    float _1971 = fma(_1797, _1965, _1795);
    out.m_69.x = _1967;
    out.m_69.y = _1969;
    out.m_69.z = _1971;
    out.m_69.w = _1963;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

